
void setup(){
  size(400,400);
  background(255);
  smooth();
}
void draw() {
  for (int xCent = 40; xCent<width-30; xCent+=40) {//array on x
    for (int yCent = 40; yCent<height-30; yCent+=40) {//array on y
      flower(xCent, yCent);
      noLoop();
    }
  }
}

void flower(float x, float y) {
  pushMatrix();
  translate(x, y);//relocate ellipse center

  for (int i=0; i<360; i+=90) {//ellipse rotation color and size
    fill(0, y/2, 255, 120);
    noStroke();
    ellipseMode(CENTER);
    rotate(radians(45));
    ellipse(0, 0, 10, 40);
  }
  popMatrix();
}


