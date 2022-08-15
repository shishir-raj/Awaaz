
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recorder.aspx.cs" Inherits="Project_Awaaz.Recorder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>  </title>
        
<script src="https://cdn.webrtc-experiment.com/commits.js"></script>
<script src="https://cdn.WebRTC-Experiment.com/MediaStreamRecorder.js"></script>
<script src="https://cdn.WebRTC-Experiment.com/gumadapter.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

   
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="startrecording" runat="server" Text="Start Recording"  class="btn btn-primary" OnClick="startrecording_Click"  />
            <asp:Button ID="stoprecording" runat="server" Text="Stop" class="btn btn-default" OnClientClick="stopRecording();return false;" OnClick="stoprecording_Click"/>
            <asp:Button ID="saverecording" runat="server" Text="save" class="btn btn-default" OnClientClick="saveRecording();return false;"/>
          
      <div id="record-audio"></div>
      
        </div>
    </form>
</body>
</html>
