
//Author: Herbert Hsu
//Purpose: Using of randomness
//Concept: Cherish our Green Green Grass of Home
//Reference: class-example from Nik,
//Background picture:http://life.mingpao.com/cfm/Album3.cfm?File=20070125/album10/32.txt&NewsLetter

//load background image
PImage b;
void setup() {
  size(515, 362);
  b = loadImage("Taiwan3.jpg");
  smooth();
  background(b);
  frameRate(8);
}

//Press mouse to draw grass
void draw() {
  if (mousePressed == true) {
    grass();
  }
}

//Random grass function with perspective
void grass() {
  float step =random(13)-5;
  float stepx=random(mouseY)/13;
  float blade=random(1.5)+1;
  float r=random(100)+90;
  float x=mouseX;
  float y=mouseY;
  float tipx=x + random(25) - 10;
  float tipy=y -random(10)-5-mouseY*0.2;
  stroke(r, 183, 0, 150);
  strokeWeight(blade);
  curve(x+step, y-step, tipx+step, tipy-step, tipx+2*step, tipy-step-10, tipx+3*step, tipy-step-15);
  line(x+step, y+step, tipx-stepx, tipy-step);
  line(x+step, y-step, tipx+stepx, tipy-step);
  fill(167, 122, 85);
  noStroke();
  ellipse(x+step, y+step, 3, 1);
  ellipse(x+step, y-step, 3, 1);
}

void keyPressed() {
  saveFrame("Green Green.jpg");
}


