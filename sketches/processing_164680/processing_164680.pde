
PImage sw;
int lastSecond;
int lastMinute;
import processing.video.*;
Movie theMov;
void setup() {
  frameRate(1.5);
  size(1100, 550);
  colorMode(HSB, 360, 100, 100);
  background (200, 41, 65);
  sw=loadImage("swan.png");
  theMov = new Movie (this, "swantran1.mov");
  theMov.loop();
  newStart();
}
void newStart() {
  noStroke();
  fill(200, 67, 70);
  rect(0, 0, 1100, 400);
  fill(200, 67, 30, 25);
  rect(0, 0, 1100, 200);
  rect(0, 0, 1100, 150);
  rect(0, 0, 1100, 100);
  rect(0, 0, 1100, 50);
  fill(112, 38, 60);
  rect(0, 270, 1100, 300);
  fill(200, 55, 91);
  rect(0, 300, 1100, 300);
  fill(200, 52, 59, 40);
  ellipse(550, 450, 1500, 300);
  ellipse(550, 475, 1500, 300);
  ellipse(550, 500, 1500, 300);
  ellipse(550, 550, 1500, 300);
  ellipse(550, 600, 1500, 300);
}


void draw() {
  fill(200, 100, 0, 1);
  float s = map (second(), 0, 60, 50, 1050);
  int m = minute();
  ellipse(550, 450, 1500, 300);
  image(sw, s, random(170, 430), 205, 200);
  pushMatrix();
  scale(-1, 1);
  image(sw, -s, random(170, 430), 205, 200);
  popMatrix();
  if (s>=1000) {
    fill(0);
    rect(0, 0, 1100, 550);
    image (theMov, 300, 100);
  }
  if (s >lastSecond) {
    fill(53, random(11, 53), 99, 10);
    ellipse(550, 100, s/2, s/2);
  }

  if (s <=57) {

    newStart();
  }
}
void movieEvent (Movie m) {
  m.read();
}



