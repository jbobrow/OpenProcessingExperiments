
void setup() {
size(900, 600);
smooth();
PImage b;
b = loadImage("bokeh.jpg");
image(b, 0, 0);
noStroke();
}
void draw() {
PImage b;
b= loadImage("bokeh.jpg");
  image(b, 0, 0);
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  fill(225, 196, 147, 180);
  ellipse(670, 175, s*2, s*2);
  fill(225, 196, 147, 150);
  ellipse(100, 350, m*2, m*2);
  fill(225, 196, 147, 120);
  ellipse(570, 390, h*3, h*3);
}

