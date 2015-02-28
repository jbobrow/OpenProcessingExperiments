
float rot = PI/3;
float width = 20;
float height = 0;

void setup() {
  size(700, 400);
  background(0);
  smooth();
  noStroke();
  fill(255, 30);
}

void draw() {
  if (mousePressed == true) {
    rectMode(CENTER);
    rect(mouseX, 200, width, height);
    rotate(rot);
    if (height<350) {
      height = height + 2;
    }
    rot = rot + 0.01;
  }
}

//void mouseClicked() {
//  rectMode(CENTER);
//  rect(mouseX, 200, width, height);
//  if (height<350) {
//    height = height + 2;
//  }
//}

