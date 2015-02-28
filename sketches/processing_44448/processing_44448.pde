



float angle;
void setup() {
  size(500,500);
  ellipseMode(CENTER);
  rectMode(CENTER);
  smooth();
}
void draw() {
  int arms = mouseY;
  int rads = mouseX;
  int space = 200;
  pushMatrix();
  background(255);
  translate(width/2,height/2);
  for (int i = 1; i < arms; i++) {
    rotate(radians(i*rads));
    fill(random(255),random(255),random(255));
    rect(0,0,width/2,height/2);
    ellipse(0,0, arms/2, arms/2);
    ellipse(0,height/8, arms/4, arms/4);
    ellipse(0,height/4, arms/8,arms/8);
    ellipse(0,height/2, arms, arms);
    ellipse(width/4,height/4, arms,arms);

  }
  popMatrix();
}

