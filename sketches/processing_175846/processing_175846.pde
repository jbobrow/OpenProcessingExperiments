
var video = document.createElement("video");
video.setAttribute("autoplay", "true");
   
var capture;
PImage img;
int cap_w = 900;
int cap_h = 720;
int stepx = 10;
int stepy = 10;
  
  
void setup() {
  size(cap_w, cap_h);
  capture = externals.context;
  initWebCam();
  background(0);
  //noLoop();
}
  
void draw() {
  capture.drawImage(video, 0, 0, 470, 350);
  img = get();

   for (int i = 0; i <= width; i+=stepx) {
    for (int j = 0; j <= height; j+=stepy) {
      color col = img(i, j);
      float value = brightness(col);
      if (value > 220) {
        fill(255);
        ellipse(i, j, 2, 2);
      }
    }
  }
}

 
//Web Cam access only works in chrome?
function initWebCam() {
    if (navigator.webkitGetUserMedia) {
        navigator.webkitGetUserMedia({
            video:true
        }, gotStream, noStream);
    
        function gotStream(stream) {
            video.src = webkitURL.createObjectURL(stream);
            video.onerror = function () {
                stream.stop();
                streamError();
            };
        }
    
        function noStream() {
            alert("No camera available.");
        }
    
        function streamError() {
            alert("Camera error.");
        }
    }
}

