
void setup() {
  size(200, 200, P3D);
  smooth();
  noFill();
  strokeWeight(10);
  theta=0;
  //frameRate(1);
}

float theta;
void draw() {
  background(0, 0, 20, 10);

  translate(width/2, height/2, -100);

  pushMatrix();
  rotateY(theta);
  rotateZ(QUARTER_PI/2);
  noStroke();
  fill(200, 100);
  sphere(50);
  fill(200, 255);
  box(25, 38, 1);
  fill(0, 150);
  sphere(47);
  noFill();
  popMatrix();

  rotateX(theta);
  rotateY(theta);

  pushMatrix();

  stroke(255, 0, 0, 200);
  strokeWeight(15);
  ellipse(0, 0, 150, 150);

  rotateY(PI/2);

  stroke(255, 0, 0, 200);
  strokeWeight(15);
  ellipse(0, 0, 150, 150);
  popMatrix();

  filter(BLUR, 2);

  pushMatrix();
  stroke(255, 0, 0, 200);
  strokeWeight(10);
  ellipse(0, 0, 150, 150);
  stroke(0);
  strokeWeight(5);
  ellipse(0, 0, 150, 150);
  popMatrix();

  pushMatrix();
  rotateX(theta);
  rotateY(PI/2);
  stroke(255, 0, 0, 200);
  strokeWeight(10);
  ellipse(0, 0, 150, 150);
  stroke(0);
  strokeWeight(5);
  ellipse(0, 0, 150, 150);
  popMatrix();
  theta+=PI/45;
  filter(BLUR, 1);
}


