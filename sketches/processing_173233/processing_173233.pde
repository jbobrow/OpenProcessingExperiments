
/* @pjs preload="tv.png"; */
 
var video = document.createElement("video");
video.setAttribute("autoplay", "true");
  
var capture;
PImage tv, img;
 
void setup() {
  size(693, 471);
  tv = loadImage("tv.png");
  capture = externals.context;
  initWebCam();
  //noLoop();
}
 
void draw() {
/*
  noStroke();
  fill(255);
  pushMatrix();
    translate(30, 30);
    rect(0, 0, 470, 350); 
  popMatrix();
  */
  
  pushMatrix();
    //translate (520, 40);
    //scale(-1, 1)
    translate(100, 400);
    scale(1,-1);
    capture.drawImage(video, 0, 0, 470, 350);
  popMatrix();
   
  img = get();
  

  PImage img2 = get(0,0, width/2, height);  // create a copy image of just the left hand side
  PImage img3 = get(0,0, width/2, height);  // create a copy image of just the left hand side

  img.filter(BLUR);
  image(img, 0, 0);
  
  img2.filter(INVERT);
  pushMatrix();
      translate (-40, 400);
      scale(1, -1);
      image(img2, 0, 0);
  popMatrix();
  
  img3.filter(GRAY);
  pushMatrix();
      translate (width+100, 400);
      scale(-1, -1)
      image(img3, 0, 0);
  popMatrix();

  /*
  pushMatrix();
    //translate (520, 40);
    //scale(-1, 1)
    translate(240, 0);
    scale(1,1);
    image(img2,0,0);
  popMatrix();
  */
  image(tv,0,0);
}
 
void addEffects() {

  
  int x = random(0, 470);
  int y = random(0, 350);
  fill(img.get(x, y));
  ellipse(x, y, 20, 20);
   /*
    for(int j=0; j<470; j++) {
        for(int i=0; i<350; i++) {
            fill(img.get(i, j));
            ellipse(i, j, 2, 2);
     
        }
    }
    */
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
