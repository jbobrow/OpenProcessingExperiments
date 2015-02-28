
//Final Project
//Garrett Higa
//Intent:  Program takes snapshot using camera, then allows user to paint on image.

import processing.video.*;

Capture myCapture;

//setup
void setup() {
  size(640, 480);
  myCapture = new Capture(this, width, height, 30);
  colorMode(HSB, 360, 100, 100, 100);
  smooth();
  noStroke();
}

//Capture
void captureEvent(Capture myCapture) {
  myCapture.read();
}

//Draw
void draw() {
  myCapture.loadPixels();
  loadPixels();
  for (int i = 0; i < width*height; i++) {
    color cp = myCapture.pixels[i];
    float b = brightness(cp);
    float h = hue(cp);
    float s = saturation(cp);
    if (b > 50) {
      s = 100;
      b = random(75, 100);
    }
    h = 200;
    b += 70;
    pixels[i] = color(h, s, b, 5);//Madison's Method
  }
  myCapture.updatePixels();
  updatePixels();
  
  for(int x= 0; x < width; x+=10){
    for(int y = 0; y < height; y+=10){
      if(mouseX > x && mouseX < x+10 && mouseY > y && mouseY < y+10){
        float speedX = abs(mouseX-pmouseX);
        float speedY = abs(mouseY-pmouseY);
          for(int i = 0;i < speedX; i++){
          ellipse(mouseX,mouseY,i,i);
          fill(255,75);
        }
      }
    }
  }
  
}

//Image Reset
//' ' = spacebar
void keyPressed() {
  if (key == ' ') {
    background(255);
  }
}


