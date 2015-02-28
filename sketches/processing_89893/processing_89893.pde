
String message = "This dark fog rises again to complete the funeral. From a place empty of life, only dead trees are growing here.";
PFont f;
PImage img;
float r = 330;

void setup() {
  size(750,750);
  img = loadImage("funeral.png");
  f = createFont("Georgia",34,true);
  textFont(f);
  textAlign(CENTER);
  smooth();
}

void draw() {
  image(img,0,0);
  translate(width / 2, height / 2);
  noFill();
  noStroke();
  ellipse(0, 0, r*2, r*2);
  float arclength = 0;
  for (int i = 0; i < message.length(); i++)
  {
    char currentChar = message.charAt(i);
    float w = textWidth(currentChar);
    arclength += w/2;
    float theta = PI + arclength / r;    
    pushMatrix();
    translate(r*cos(theta), r*sin(theta));
    rotate(theta+PI/2);
    fill(0,185,255);
    text(currentChar,0,0);
    popMatrix();
    arclength += w/2;
  }
}


