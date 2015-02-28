

import processing.video.*;
Capture video;
int newx=0;
int newy=0;
int frameCounter=0;

void setup() {


    size(800, 800, P2D);
  video = new Capture(this, 320, 240, 15);
 
  frameRate(24);
  smooth();
  video.crop(0, 0, 240, 240);
}

void draw() {
  

 
  
  if(frameCounter==72){
    int loc=newx + newy * video.width;
    color c=video.pixels[loc];
    background(c);
   
  }
  if(frameCounter !=72){
     frameCounter++;
  }
  
  if(newx < video.width){
    newx++;
  }
    if(newx == video.width){
    newx=0;
    newy++;
  }
   if(newy == video.height){
    newx=0;
    newy=0;
  }
   image(video,0,0);
  strokeWeight(5);
  stroke(255);
  point(newx,newy);
   println(newx+","+newy);
  
 
  
  
}
  
 

  
  
  
  

void captureEvent(Capture c) {
  c.read();
}
 





