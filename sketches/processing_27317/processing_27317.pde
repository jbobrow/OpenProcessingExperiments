
// Special thanks to:
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

float r = 0;
float theta = 0;

void setup() {
  size(750,750);
  background(0);
  smooth();
  frameRate(190);
}

void draw() {
  float x = r * cos(theta);
  float y = r * sin(theta);


  smooth();
  noFill();
  stroke(r*2 ,255-r/3, 255-r/2, 10);
  ellipse(x+width/2, y+height/2, 60 + y/3, 60 + y/5); 

  theta += 0.01;
  r += 0.05;
}

