
float Theta = 0;
import processing.video.*;
Capture video;

void setup() {
   size(700, 700, P3D);
   noStroke();
   smooth();
   video = new Capture(this, 700, 700, 15);
}

void draw() {
   background(video);
   ellipse(width/2, height/2, 50, 50);
   translate(width/2, height/2);
   callFigure();
   Theta += radians(1);
   camera(mouseX, mouseY, (height/2.0) / tan(PI*60.0 / 360.0), width/2.0, height/2.0, 0, 0, 1, 0);
   if (video.available()) {
     video.read();
     video.loadPixels();
   }
}

void drawFigure() {
  noFill();
  stroke(0);
  strokeWeight(20);
  line(0, 0, 0, 100);
  noStroke();
  fill(5, 237, 29);
  ellipse(0, 25, 10, 10);
  fill(241, 250, 10);
  ellipse(0, 50, 10, 10);
  fill(242, 10, 25);
  ellipse(0, 75, 10, 10);
  translate(0, 200);
  pushMatrix();
  translate(-60, 0);
  image(video, 0, 0, 140, 100);
  popMatrix();
  fill(10, 100, 225, 60);
  stroke(0);
  strokeWeight(10);
  box(200);
}

void callFigure() {
  pushMatrix();
  rotate(Theta + radians(120));
  drawFigure();
  popMatrix();
}

