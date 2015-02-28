
import processing.video.*;

//declaring a capture object
Capture video;


void setup() {
  // flexible width and height size, on a 2D drawing
  size(320,240);
  video = new Capture(this, 320,240,15);
  background(0);
  frameRate(25);
  smooth();
}
 void draw() { 
   if(video.available()) {
     video.read();
   }
   loadPixels();
   video.loadPixels();
   for(int x= 0;x<video.width;x++) {
     for (int y = 0; y< video.height; y++) {
       int loc = x + y*video.width;
       float r,g,b;
       r = red (video.pixels[loc]);
       g = green(video.pixels[loc]);
       b = blue (video.pixels[loc]);
       
       float maxdist = 100;
       float d = dist(x,y,mouseX,mouseY);
       float adjustbrightness = (maxdist-d)/maxdist;
       r *= adjustbrightness;
       g *= adjustbrightness;
       b *= adjustbrightness;
       
       r =constrain(r,0,255);
       g = constrain(g,0,255);
       b = constrain(b,0,255);
       color c = color(r,0,0);
       pixels[loc] = c;
     }
   } updatePixels();
 }
 


