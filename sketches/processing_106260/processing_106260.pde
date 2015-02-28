
float rotation;

void setup(){
  size(500, 500);
  rotation = 0;
  rectMode(CENTER);
}

void draw() {
  background(46, 46, 103);
  pushMatrix();
  translate(width/2, height/2);
  rotate(rotation);
  pushMatrix();
  translate(100, -100);
  rotate(rotation);
  fill(237, 197, 34);
  rect(0, 0, 80, 80);
  popMatrix();
  fill(255);
  rect(0, 0, 200, 200);
  popMatrix();
  rotation += 0.05;
}


