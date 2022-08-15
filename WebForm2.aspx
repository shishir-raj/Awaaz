﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Project_Awaaz.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
 <head>
     <meta charset="UTF-8">

     <meta http-equiv="content-type" content="text/html; charset=utf-8" />
     <meta name="description" content="#LendYourVoice for Projectawaaz. Record the literature you pick and be the voice for the visually impaired." />
     <meta name="keywords" content="LendYourVoice,Project,Awaaz,projectawaaz,lend,your,voice,kibo,record,visually,impaired,blind" />
     <!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

     <script src="./static/lyv/js/skel.min.js"></script>
     <script src="./static/lyv/js/skel-layers.min.js"></script>
     <script src="./static/lyv/js/init.js"></script>
     <script src="./static/lyv_record/js/recorder.js"></script>
     <!-- GOOGLE PLUS SCRIPT -->
     <script src="https://apis.google.com/js/platform.js" async defer></script>

     <script type="text/javascript">
      const poem_id = {{ content.id }};
      console.log(poem_id);

      console.log('User: ' + '{{ request.user }}');
      function insertParam(key, value) {
          key = escape(key); value = escape(value);

          var kvp = document.location.search.substr(1).split('&');
          if (kvp == '') {
              document.location.search = '?' + key + '=' + value;
          }
          else {

              var i = kvp.length; var x; while (i--) {
                  x = kvp[i].split('=');

                  if (x[0] == key) {
                      x[1] = value;
                      kvp[i] = x.join('=');
                      break;
                  }
              }

              if (i < 0) { kvp[kvp.length] = [key, value].join('='); }

              //this will reload the page, it's likely better to store this until finished
              document.location.search = kvp.join('&');
          }
      }
     </script>

     <script>
         window.fbAsyncInit = function () {
             FB.init({
                 appId: '1728926937366224',
                 xfbml: true,
                 version: 'v2.5'
             });
         };

         (function (d, s, id) {
             var js, fjs = d.getElementsByTagName(s)[0];
             if (d.getElementById(id)) { return; }
             js = d.createElement(s); js.id = id;
             js.src = "//connect.facebook.net/en_US/sdk.js";
             fjs.parentNode.insertBefore(js, fjs);
         }(document, 'script', 'facebook-jssdk'));
     </script>

     <script src="/static/lyv_record/js/submit.js"></script>

     <noscript>
         <link rel="stylesheet" href="/static/lyv/css/skel.css" />
         <link rel="stylesheet" href="/static/lyv/css/style.css" />
         <link rel="stylesheet" href="/static/lyv/css/style-xlarge.css" />
     </noscript>

     <script>

    $(function(){
      $.get("{{ content.path }}", function(response) {
           var logfile = response;
           var title = response.substr(0,response.indexOf('\n'));
           var author = title.substr(title.indexOf(" / ")+3);
           title = title.substr(0,title.indexOf(' / '));
           var response = response.substr(response.indexOf('\n')+1);
           response = response.replace(/\n/g, " <br />");
           document.getElementById('unread').innerHTML = response;
           document.getElementById('title').innerHTML = "Poem: " + title;
           document.getElementById('author').innerHTML = "Author: " + author;
      });
    });
     </script>
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
     <title>{{ content.title }} - {{ content.author}} Record</title>
 </head>

<script>

  var audio_context;
  var recorder;

  function startUserMedia(stream) {
    var input = audio_context.createMediaStreamSource(stream);
    console.log('Media stream created.');

    // Uncomment if you want the audio to feedback directly
    //input.connect(audio_context.destination);
    //console.log('Input connected to audio context destination.');
    
    recorder = new Recorder(input);
    console.log('Recorder initialised.');
  }

  function startRecording(button) {
    recorder && recorder.record();
    console.log('Recording...');
  }

  function stopRecording(button) {
    recorder && recorder.stop();
    console.log('Stopped recording.');
    
    // create WAV download link using audio data blob
    document.getElementById('playbackHeading').innerHTML = "Playback:";
    createDownloadLink();
    
    recorder.clear();
  }

  function createDownloadLink() {
    recorder && recorder.exportWAV(function(blob) {
      var url = URL.createObjectURL(blob);
      var au = $("#recorded-audio");
      var hf = $("#recorded-audio-a");
      
      au.attr("controls", true);
      au.attr("src", url);
      hf.attr("href", url);
      hf.attr("download", new Date().toISOString() + '.wav');
      hf.attr("innerHTML", hf.download);

      $("#submit-recording").css("visibility", "visible");
      $("#facebook-share").css("visibility", "visible");
      $("#google-share").css("visibility", "visible");
      $("#submit-recording").click(function() {
        submitToServer(blob);
      })
    });
  }

  window.onload = function init() {
    try {
      // webkit shim
      window.AudioContext = window.AudioContext || window.webkitAudioContext;
      navigator.getUserMedia = ( navigator.getUserMedia ||
      navigator.webkitGetUserMedia ||
      navigator.mozGetUserMedia ||
      navigator.msGetUserMedia);
      window.URL = window.URL || window.webkitURL;
      
      audio_context = new AudioContext;
      console.log('Audio context set up.');
      console.log('navigator.getUserMedia ' + (navigator.getUserMedia ? 'available.' : 'not present!'));
    } catch (e) {
      alert('No web audio support in this browser!');
    }
    
    navigator.getUserMedia({audio: true}, startUserMedia, function(e) {
      console.log('No live audio input: ' + e);
    });

    gapi.plus.go('google-share');//, {
    //   'onsuccess': function(a, b) {
    //     console.log(a);
    //     console.log(b);
    //   },
    //   'onerror': function(error) {
    //     console.log(error);
    //   }
    // })

    if (window.location.search.indexOf("re=true") > -1) {
      startStopButton();
    }
  };

  var cue = 0;
  var count = 3;
  var content = "";
  var countdownTimer;
  var isRecording = false;
  var timer = null;
  var onceRecorded = false;

	function startStopButton() {
    /*if ('{{ request.user }}' == 'AnonymousUser') {
      window.location = "{% url 'auth:login' %}?next={{ request.get_full_path }}"
    }*/
    if (!isRecording) {
      if (onceRecorded) {
        insertParam("re","true");
      }
      else {
        isRecording = true;
        $("#submit-recording").css("visibility", "hidden");
        document.getElementById('startRecording').innerHTML = "Stop Recording";
    		content = document.getElementById('unread').innerHTML;
    		cue = 0;
        $('#countdownModal').modal('toggle');
        count = 3;
        document.getElementById('countdownText').innerHTML = "Get Ready to #LendYourVoice!";
        countdownTimer = setInterval(function() { handleCountdownTimer(count); }, 1000);
      }
    }
    else {
      document.getElementById('startRecording').innerHTML = "Record again";
      stopRecordTimer();
      stopRecording();
      // resetCue();
      isRecording = false;
      onceRecorded = true;
    }
	}

  function handleCountdownTimer() {
      if(count === 0) {
        clearInterval(countdownTimer);
        $('#countdownModal').modal('toggle');
         $('html, body').animate({
              scrollTop: $("#title").offset().top
          }, 500);
        startRecordTimer();
        startRecording();
        // setTimeout(highlightText,500);
      } else {
        document.getElementById('countdownText').innerHTML = count;
        count--;
      }
    }

  // function highlightText() {
  //   if (cue<content.lastIndexOf(' ')) {
  //     //console.log(cue);
  //     cue = content.indexOf(' ', cue+1);
  //     document.getElementById('read').innerHTML = content.substr(0,cue);
  //     document.getElementById('unread').innerHTML = content.substr(cue);
  //     timer=setTimeout(highlightText,350);
  //   }
  //   else {
  //     document.getElementById('read').innerHTML = content;
  //     document.getElementById('unread').innerHTML = "";
  //     clearTimeout(timer);
  //   }
  // }

	// function resetCue() {
	// 	  if (timer) { clearTimeout(timer); }
	// 		document.getElementById('unread').innerHTML = content;
	// 		document.getElementById('read').innerHTML = "";
	// }

  
  var totalSeconds = 0;
  var secondsLabel, minutesLabel;

  function startRecordTimer() {

    $("#recordTimer").css("visibility", "visible");

    if (!timer) {
      secondsLabel = document.getElementById('seconds');
      minutesLabel = document.getElementById('minutes');
      timer = setInterval(setTime, 1000);
    }
  };

  function stopRecordTimer() {
    if (timer) {
      clearInterval(timer);
      timer = null;
      totalSeconds = -1;
      setTime();
      $("#recordTimer").css("visibility", "hidden");
    }
  };

  function setTime() {
    totalSeconds++;
    secondsLabel.innerHTML = pad(totalSeconds % 60);
    minutesLabel.innerHTML = pad(parseInt(totalSeconds / 60));
  }

  function pad(val) {
    var valString = val + "";
    if (valString.length < 2) {
      return "0" + valString;
    } else {
      return valString;
    }
  }

</script>



<body>
<div id="wrapper">
 	{% include "lyv/header.html" %}
  <section id="two" class="wrapper style2 special">
    <div class="container">

      <div style="text-align: left;"><b>Instructions: </b>
      <ol>
      <li> Choose a quiet room before you start recording</li>
      <li>Allow access to microphone on prompt from the browser. For best results, use a set of headphones with an attached microphone</li>
      <li>You can choose to record a couple of lines first, listen to the playback, re-adjust your settings and then proceed with the final recording</li>
      </ol>
      <b>Note: </b>This page only works on newer versions of Google Chrome and Mozilla firefox. If you are using Chrome you might have to allow this website to access microphone. If you are on Firefox, you will be prompted to select your microphone device. Please select the correct microphone from the dropdown menu. You can check if it is working, by trying to record and listening to the playback.
      </div>
      <br/>
      <h1 id="title"></h1>
      <h1 id="author"></h1>
      <p id="text" style="font-size: 14pt;">
      	<span id="read" style="color: blue"></span>
      	<span id="unread" style="color: black"></span>
      </p>
      <button class="button" id="startRecording" onclick="startStopButton();">Start Recording</button>
      <br/><br/><br/>
      <h2 id="playbackHeading"></h2>

      <audio id="recorded-audio"></audio>
      <a id="recorded-audio-a"></a>
      <br/><br/>
      <button class="button" id="submit-recording" style="visibility: hidden;">Submit recording</button>
      <br/><br/>
      <a class="button" id="recordMore" href="/choose" style="visibility: hidden;" >Record More</a>
      <br/><br/>
      <!-- <button class="button fb" id="facebook-share" style="visibility: visible;">Share on Facebook</button> -->
      <div class="fb-share-button" id="facebook-share" style="visibility: hidden;" data-href="https://www.projectawaaz.org" data-layout="button_count" data-mobile-iframe="true"><a class="fb-xfbml-parse-ignore" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https://www.projectawaaz.org">Share</a></div>
      <button class="g-plus" id="google-share" style="visibility: hidden;" data-action="share" data-annotation="bubble" data-height="24" data-href="https://www.projectawaaz.org"></button>
      <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://www.projectawaaz.org" data-text="I just recorded a poem for the visually impaired." data-size="large" data-hashtags="LendYourVoice">Tweet</a>
      <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
      <br/><br/>
      <h3 id="submissionHeading"></h3>
    </div>
  </section>
</div>

<div id="recordTimer" style="bottom: 0; position: fixed; width: 100%; visibility: hidden;">
  <div style="width: 350px; height:76px; border-radius: 38px; display: block; margin-left: auto; margin-right: auto; background: #383b43; color: #FFF; font-size: 60px; line-height: 75px">
      <img id="recordicon" style="width: 76px; float: left; " src="/static/lyv/images/recordicon.png" /> 
      <div style="display:inline; margin: 5px 0 10px 20px; " id="minutes">00</div>:<div style="display:inline; margin: 5px 0 10px 0px; " id="seconds">00</div>
      <img id="micicon" style="width: 76px; float: right; display:inline;" src="/static/lyv/images/mic.png" /> 
  </div>
</div>

<div class="progress"></div>



</body>
</html>
 


</asp:Content>
