
<html>

    <head>
        
        <title>Video Test</title>
        <link rel="stylesheet" href="screen.css" type="text/css" />
    [removed][removed]
     
        [removed]
        function pauseVideo(){
          $("#videotag")[0].pause();
        }
        
        function videoIsReady(){
          return $("#videotag")[0].readyState == 4;
        }
        
        function goToTime(time){
          $("#videotag")[0].currentTime = time;
        }
 
        [removed]
        [removed][removed]

    </head>
    
    <body>
        <video id="videotag" class="hvideo" src="roll.mov" width="848" height="480" autoplay>
            your browser does not support the video tag
        </video>
        
        <canvas id="canvastag" datasrc="processing.js" width="848" height="480"></canvas>
        
    </body>

</html>
