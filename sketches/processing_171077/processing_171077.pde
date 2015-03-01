
import processing.video.*;
int[] xpos = new int[50]; 
int[] ypos = new int[50];
Capture video;
color trackColor;
PImage videoMirror;

void setup() {
  size(1024,768) ;
  video = new Capture(this,width,height,15);
  trackColor = color(255,0,0);
  smooth();
  frameRate(60);
  video.start();
  videoMirror = new PImage(video.width,video.height);
  for (int i = 0; i < xpos.length; i ++ ) {
    xpos[i] = 0; 
    ypos[i] = 0;
  }
}
void draw() {
  if (video.available()) {
    video.read();
  }
  video.loadPixels();
  for(int x = 0; x < video.width; x++) {
    for(int y = 0; y < video.height; y++) {
      videoMirror.pixels[x+y*video.width] = video.pixels[(video.width-(x+1))+y*video.width];
    }
  }
  videoMirror.updatePixels();
  image(videoMirror,0,0);
  for (int i = 0; i < xpos.length-1; i ++ ) {
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }
  float worldRecord = 500;
  int closestX = 0;
  int closestY = 0;
  for (int x = 0; x < videoMirror.height; x++) {
    for (int y = 0; y < videoMirror.height; y++) {
      int loc = x + y*videoMirror.width;
      color currentColor = videoMirror.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);
      float d = dist(r1,g1,b1,r2,g2,b2);
      if (d < worldRecord) {
        worldRecord = d;
        closestX = x;
        closestY = y;
      }
    }
  }
  xpos[xpos.length-1] = closestX; 
  ypos[ypos.length-1] = closestY;
  
  for (int i = 0; i < xpos.length; i ++ ) {
    noStroke();
    fill(255-i*5);
    ellipse(xpos[i],ypos[i],i,i);
  }
}
void mousePressed() {
  int loc = mouseX + mouseY*video.width;
  trackColor = videoMirror.pixels[loc];
}



