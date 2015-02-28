
//PImage img;
int pointillize = 3;
import processing.video.*;

Capture video;
boolean cheatScreen = true;
 
void setup() {
  size(480,480, P2D);
  //img = loadImage("cat.jpg");
  video = new Capture(this, 80, 60, 150);
  background(0);
  smooth();
}
 
 public void captureEvent(Capture c) {
  c.read();
}
 
void draw() {
  // Pick a random point
  int x = int(random(video.width));
  int y = int(random(video.height));
  int loc = x + y*video.width;
  
  float hgap = width / float(video.width);
  float vgap = height / float(video.height);

  scale(max(hgap, vgap) * 1 -2);
  
  if (cheatScreen) {
    set(200, 400, video);
  }
  
  
  
  // Look up the RGB color in the source image
  video.loadPixels();
  float r = red(video.pixels[loc]);
  float g = green(video.pixels[loc]);
  float b = blue(video.pixels[loc]);
  noStroke();
   
  // Draw an ellipse at that location with that color
  fill(r,g,b,255);
  ellipse(x,y,pointillize,pointillize);
}



public void keyPressed() {
  switch (key) {
case 'c': cheatScreen = !cheatScreen; break;
  }
}

