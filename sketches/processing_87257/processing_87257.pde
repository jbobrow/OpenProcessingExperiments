
//Homework 4
//Sabrina Li
//Copyright Sabrina Li January 2014 Pittsburgh, PA

float x, y, d, easing_coefficient, c, rgb_value;

boolean increase;

void setup() {
  size(400, 400);
  background(255, 255, 255);
  
  x = width/8;
  y = height/8;
  d = width/6;
  
  easing_coefficient = 0.1;
  
  c = 0;
  
  rgb_value = 1;
  
  increase = true;
  
  smooth();
  noFill();
}

void draw() {
  if (c < 255 & increase == true) {
    c++;
  } else if (c == 255) {
    c--;
    increase = false;
  } else if (c < 255 & c > 0 & increase == false) {
    c--;
  } else if (c == 0) {
    c++;
    increase = true;
  };
  
  stroke(0, 0, c, 160);
  
  float dx = mouseX - x;
  float dy = mouseY - y;
  
  x = x + (dx * easing_coefficient);
  y = y + (dy * easing_coefficient);
  
  frameRate(60);
  ellipse(x, y, d, d);
}

void keyPressed() {
  if (key == 's') {
    d += 2;
  } else if (key == 'a') {
    d -= 2;
  };
}
  
/*void mousePressed() {
  saveFrame("hw4-####.jpg");
}*/

