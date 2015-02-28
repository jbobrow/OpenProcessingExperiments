
float incr = 0.02;
float rot = PI/2;
int x = 100;
int y = 100;

void setup() {
  size(700, 400);
  background(255);
}

void draw() {
  pushMatrix();
  background(255);
  translate(width/2, height/2);
  rotate(rot);
  rect(-x/2, -y/2, x, y);
  popMatrix();
  rot =  dist(mouseX, mouseY, x, y)/100;

//  if (mousePressed == true) {
//    incr = 0.01;
//  }
//  else {
//    incr = 0;
//  }
}

