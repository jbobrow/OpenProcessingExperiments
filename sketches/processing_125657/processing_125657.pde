
var webrtc = document.createElement("video");
webrtc.setAttribute("style", "display:none;");
webrtc.setAttribute("id", "videoOutput");
webrtc.setAttribute("width", "160px");
webrtc.setAttribute("height", "120px");
webrtc.setAttribute("autoplay", "true");
if(document.body!=null) document.body.appendChild(webrtc);

// var video = document.getElementById("videoOutput");

var getUserMedia = function(t, onsuccess, onerror) {
    if (navigator.getUserMedia) {
        return navigator.getUserMedia(t, onsuccess, onerror);
    } else if (navigator.webkitGetUserMedia) {
        return navigator.webkitGetUserMedia(t, onsuccess, onerror);
    } else if (navigator.mozGetUserMedia) {
        return navigator.mozGetUserMedia(t, onsuccess, onerror);
    } else if (navigator.msGetUserMedia) {
        return navigator.msGetUserMedia(t, onsuccess, onerror);
    } else {
        onerror(new Error("No getUserMedia implementation found."));
    }
};

var URL = window.URL || window.webkitURL;
var createObjectURL = URL.createObjectURL || webkitURL.createObjectURL;
if (!createObjectURL) {
    throw new Error("URL.createObjectURL not found.");
}

getUserMedia({audio:true, video:true},
    function(stream) {
        var url = createObjectURL(stream);
        webrtc.src = url;
    },
    function(error) {
        alert("No webcam access.");
    }
);

var ctx;

PImage video;
PImage prevFrame;
 
float threshold = 10;
int Mx = 0;
int My = 0;
int ave = 0;
 
int ballX = width/2;
int ballY = height/2;
int rsp = 25;
 
void setup() {
  size(480,320);
  ctx = externals.context;
  
  pushMatrix();
  translate(width,0);
  scale(-1,1);//mirror the video
  ctx.drawImage(webrtc, 0, 0, width, height); //video is defined outside processing code
  popMatrix();
  video=get();
  
  prevFrame = createImage(video.width,video.height,RGB);
}
 
void draw() {
  prevFrame.copy(video,0,0,video.width,video.height,0,0,video.width,video.height); 
  prevFrame.updatePixels();

  pushMatrix();
  translate(width,0);
  scale(-1,1);//mirror the video
  ctx.drawImage(webrtc, 0, 0, width, height); //video is defined outside processing code
  popMatrix();
  video=get();
  
  
  
  
  //loadPixels();
  video.loadPixels();
  prevFrame.loadPixels();
  
  Mx = 0;
  My = 0;
  ave = 0;
  
 
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      
      int loc = x + y*video.width;            
      color current = video.pixels[loc];      
      color previous = prevFrame.pixels[loc]; 
      
     
      float r1 = red(current); float g1 = green(current); float b1 = blue(current);
      float r2 = red(previous); float g2 = green(previous); float b2 = blue(previous);
      float diff = dist(r1,g1,b1,r2,g2,b2);
      
      
      if (diff > threshold) { 
        //pixels[loc] = video.pixels[loc];
        Mx += x;
        My += y;
        ave++;
      } else {
        
        //pixels[loc] = video.pixels[loc];
      }
    }
  }
  //fill(255);
  //rect(0,0, width, height);
  if(ave != 0){ 
    Mx = Mx/ave;
    My = My/ave;
  }
  if (Mx > ballX + rsp/2 && Mx > 50){
    ballX+= rsp;
  }else if (Mx < ballX - rsp/2 && Mx > 50){
    ballX-= rsp;
  }
  if (My > ballY + rsp/2 && My > 50){
    ballY+= rsp;
  }else if (My < ballY - rsp/2 && My > 50){
    ballY-= rsp;
  }
    
    //updatePixels();
    noStroke();
    fill(200,0,0);
    ellipse(ballX, ballY, 20, 20);
    
  
}
