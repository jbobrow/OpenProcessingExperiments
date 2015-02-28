
void setup() {
  size(400, 400);
  smooth();
}

void draw() {
  background(255);
  noStroke();
  Art();
  Plus();
  Tech();
}
  
  //A
  void Art() {
  pushMatrix();
  fill(242, 203, 97, 90);
  translate(100, 270);
  scale(6.5);
  quad(-25, 20, -15, 20, 5, -30, -5, -30);
  quad(5, -30, -5, -30, 15, 20, 25, 20);
  rect(-13, 0, 25, 10);
  popMatrix();
  }
  
  //T
  void Tech() {
  pushMatrix();
  fill(242, 203, 97, 90);
  translate(200, -150);
  scale(7.5);
  rect(0, 20, 40, 10);
  rect(15, 20, 10, 50);
  popMatrix();
  }
  
  //+
  void Plus() {
  pushMatrix();
  translate(130, 50);
  scale(5);
  fill(255, 178, 217, 90);
  rect(0, 20, 30, 10);
  fill(209, 178, 255, 90);
  rect(20, 0, 10, 30);
  fill(178, 204, 255, 90);
  rect(20, 20, 30, 10);
  fill(255, 167, 167, 90);
  rect(20, 20, 10, 30);
  popMatrix();
  }
