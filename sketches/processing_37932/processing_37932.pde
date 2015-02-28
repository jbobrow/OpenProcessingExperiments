
float incr = 0.02;
float rot = PI/2;
int x = 0;

void setup() {
  size(700, 400);
  background(255);
}

void draw() {
  pushMatrix();
  background(0);
  stroke(255);
  fill(255);
  strokeWeight(5);
  translate(width/2, height/2);
  rotate(rot);
  rectMode(CENTER);  
  rect(0, 0, x, x);
  popMatrix();
  rot = rot + incr;

  incr = dist(mouseX, mouseY, width/2, height/2)/10000;

  rect2();

  if (mousePressed == true) {
    if (x<400) {
      x = x+2;
    }
  }
  else {
    if (x>-400) {
      x = x-2;
    }
  }
}

void rect2() {
  int x = 150;

  pushMatrix();
  stroke(50);
  fill(0, 99);
  strokeWeight(5);
  translate(width/2, height/2);
  rotate(rot);
  rectMode(CENTER);  
  rect(0, 0, x, x);
  popMatrix();
  rot = rot - 0.01;
}

