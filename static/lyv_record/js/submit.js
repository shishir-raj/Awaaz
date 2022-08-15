function getCookie(name) {
    var cookieValue = null;
    if (document.cookie && document.cookie != '') {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var cookie = jQuery.trim(cookies[i]);
            // Does this cookie string begin with the name we want?
            if (cookie.substring(0, name.length + 1) == (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}
var csrftoken = getCookie('csrftoken');

function submitToServer(blob) {
	// var request = new XMLHttpRequest();
	// request.open("POST", "https://www.kibo.in/awaaz/record/submit", true);
	// request.setRequestHeader("X-CSRFToken", csrftoken);
	// request.onload = function() {
	// 	console.log(request.response);
	// }
	// request.send(blob);

	var fd = new FormData();
	fd.append('fname', 'recorded.wav');
	fd.append('poem_id', poem_id);
	fd.append('recording', blob);
	$.ajax({
      xhr: function () {
          var xhr = new window.XMLHttpRequest();
          xhr.upload.addEventListener("progress", function (evt) {
              if (evt.lengthComputable) {
                  var percentComplete = evt.loaded / evt.total;
                  console.log(percentComplete);
                  $('.progress').css({
                      width: percentComplete * 100 + '%'
                  });
                  if (percentComplete === 1) {
                      $('.progress').addClass('hide');
                  }
              }
          }, false);
          xhr.addEventListener("progress", function (evt) {
              if (evt.lengthComputable) {
                  var percentComplete = evt.loaded / evt.total;
                  console.log(percentComplete);
                  $('.progress').css({
                      width: percentComplete * 100 + '%'
                  });
              }
          }, false);
          return xhr;
      },
	    type: 'POST',
	    beforeSend: function(request) {
	    	request.setRequestHeader("X-CSRFToken", csrftoken);
	    },
	    url: "https://www.projectawaaz.org/record/submit",
	    data: fd,
	    processData: false,
	    contentType: false
	}).done(function(data) {
       console.log(data);
       document.getElementById('submissionHeading').innerHTML = "Submission Successful. Thank you for your contribution!";
       $("#submit-recording").css("visibility", "hidden");
       $("#recordMore").css("visibility", "visible");
	}).fail( function(xhr, textStatus, errorThrown) {
    	console.log(xhr.responseText);
    	document.getElementById('submissionHeading').innerHTML = "Submission failed. Please try again!";
    });
}


$(document).ready(function(e){
  
function facebookShare() {
  FB.ui({
    method: 'share',
    display: 'popup',
    href: 'https://www.projectawaaz.org',
    quote: 'I just recorded a poem for the visually impaired!',
    hashtag: '#lendyourvoice',
  }, function(response) {
    console.log("Shared!");
  });
}

$('.fb').click(function(){
	facebookShare();
});

});
