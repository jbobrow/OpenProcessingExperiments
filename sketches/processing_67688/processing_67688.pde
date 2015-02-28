
import processing.video.*;

MovieMaker mm;  // Declare MovieMaker object
float x;
float y;
float px;
float py;
float easing = 0.05;

PImage s;

void setup() {
  
  size(1920, 1080);
  // Create MovieMaker object with size, filename,
  // compression codec and quality, framerate
  mm = new MovieMaker(this, width, height, "drawing.mov",
                       30, MovieMaker.ANIMATION, MovieMaker.LOSSLESS);
  background(255);
  smooth();
  
s = loadImage("Japón-01.png");
}

void draw() {
  
  stroke (random(55,155),(0),(0),random(55,155));
  float targetX = mouseX;
  x += (targetX - x) * easing;
  float targetY = mouseY;
  y += (targetY - y) * easing;
  float weight = dist(x+50, y+50, px, py);
  strokeWeight(weight);
  line(x, y, px, py);
  py = y;
  px = x;
  mm.addFrame();  // Add window's pixels to movie
  image(s,0,0);
}

void keyPressed() {
  if (key == ' ') {
    mm.finish();  // Finish the movie if space bar is pressed!
  }
}

