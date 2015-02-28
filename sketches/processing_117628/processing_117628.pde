
import processing.video.*;
Capture video;
PImage[] imgList = new PImage[30];

void setup() {
  size(1200, 960);
  frameRate(20);
  
  video = new Capture(this, width, height);
  video.start(); 
}

void draw() {
  if( video.available() ) {
    video.read();
    //image( video, 0, 0 );
    for(int i=0; i < imgList.length; i ++){
       imgList[i]= video.get((int)random(width), (int)random(height), (int)random(50, 300), (int)random(50,300));
       image(imgList[i], random(width), random(height));
      
    }
     saveFrame("inside_####.jpg");
    
  } 
  
  
}
