<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="Project_Awaaz.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
<!DOCTYPE html>

<html>
<head>
    <title>  </title>
        
<script src="https://cdn.webrtc-experiment.com/commits.js"></script>
<script src="https://cdn.WebRTC-Experiment.com/MediaStreamRecorder.js"></script>
<script src="https://cdn.WebRTC-Experiment.com/gumadapter.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://github.com/padolsey-archive/jquery.lint--old/blob/master/jquery.lint.js"></script>
<script src="https://code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>


   
</head>
<body>

<div id="wrapper">

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
      <button class="button" id="startRecording" onclick="startStopButton();return false;">Start Recording</button>
      <br/><br/><br/>
      <h2 id="playbackHeading"></h2>

      <audio id="recorded-audio"></audio>
      <a id="recorded-audio-a"></a>
      <br/><br/>
      <button class="button" id="submit-recording" style="visibility: hidden;">Submit recording</button>
      <br/><br/>
      <a class="button" id="recordMore" href="/choose" style="visibility: hidden;" >Record More</a>
      <br/><br />


      <!-- <button class="button fb" id="facebook-share" style="visibility: visible;">Share on Facebook</button> -->
     
       
      <h3 id="submissionHeading"></h3>
    </div>
  </section>
</div>

<!--for play the audio-->
<audio id="audioPlay" controls>
    
    <source src="" type="audio/wav">
</audio>

<div id="recordTimer" style="bottom: 0; position: fixed; width: 100%; visibility: hidden;">
  <div style="width: 350px; height:76px; border-radius: 38px; display: block; margin-left: auto; margin-right: auto; background: #383b43; color: #FFF; font-size: 60px; line-height: 75px">
      <img id="recordicon" style="width: 76px; float: left; " src="/static/lyv/images/recordicon.png" /> 
      <div style="display:inline; margin: 5px 0 10px 20px; " id="minutes">00</div>:<div style="display:inline; margin: 5px 0 10px 0px; " id="seconds">00</div>
      <img id="micicon" style="width: 76px; float: right; display:inline;" src="/static/lyv/images/mic.png" /> 
  </div>
</div>

<div class="progress"></div>


        <div>
            <asp:Button ID="startrecording" runat="server" Text="Start Recording"  class="btn btn-primary" OnClick="startrecording_Click"  />
            <asp:Button ID="stoprecording" runat="server" Text="Stop" class="btn btn-default"  OnClick="stoprecording_Click"/>
            <asp:Button ID="saverecording" runat="server" Text="save" class="btn btn-default" />
          
      <div id="record-audio"></div>
      <div id  ="div"></div>
        </div>

</body>
</html>

</asp:Content>
