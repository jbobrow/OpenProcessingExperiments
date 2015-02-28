
import processing.video.*; 

Capture video;
PImage prevFrame; 
float threshold = 50;

void setup() {
  size(400, 400);
  colorMode(HSB, 600, 100, 600);
  video = new Capture(this, width, height, 30);
  prevFrame = createImage(video.width,video.height,RGB);  
}
 void draw() {
   if (video.available()) {
     prevFrame.copy(video,0,0,video.width,video.height,0,0,video.width,video.height);
     prevFrame.updatePixels();
     video.read();
     
   }
   
   loadPixels();
   video.loadPixels();
   prevFrame.loadPixels();
   
   float totalMotion = 0;
   for (int i = 0; i <video.pixels.length; i++) {
     color current = video.pixels[i];
     color previous = prevFrame.pixels[i];
      float r1 = red(current); float g1 = green(current); float b1 = blue(current);
       float r2 = red(previous); float g2 = green(previous); float b2 = blue(previous);
       
       float diff = dist(r1,g1,b1,r2,g2,b2);
       
       totalMotion += diff;
       
   }
   
   float avgMotion = totalMotion /video.pixels.length;
   
   smooth();
   noStroke();
   fill(100+avgMotion*3,100,100);
   float r = avgMotion*3;
   ellipse(r, r, avgMotion, avgMotion);
 }
    
      
       

