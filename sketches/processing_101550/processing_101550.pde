
void setup() {
  size(250, 250, P3D);
  background(0, 0, 20);
  smooth();
  noFill();
  strokeWeight(10);
  theta=0;
  cnt=0;
  frameRate(5);
}
int cnt;
float theta;
void draw() {
  background(0, 0, 20, 10);

  translate(width/2, height/2, -100);
  lights();

  pushMatrix();
  rotateY(theta+QUARTER_PI*1.5);
  rotateZ(theta);

  stroke(255, 220, 0, 200);
  strokeWeight(15);
  ellipse(0, 0, 60, 60);
  popMatrix();

  //  rotateX(theta);
  //  rotateY(theta);

  pushMatrix();
  rotateZ(theta);
  stroke(255, 0, 0, 50);
  strokeWeight(1);
  for (float i=180; i<220; i++)
    ellipse(0, 0, i, i);

  stroke(255, 0, 0, 150);
  strokeWeight(18);
  ellipse(0, 0, 210, 210);

  stroke(255, 200, 0, 150);
  strokeWeight(12);
  ellipse(0, 0, 200, 200);

  // rotateY(PI/2);
  popMatrix();

  pushMatrix();
  rotateX(theta);
  stroke(255, 0, 0, 200);
  strokeWeight(22);
  ellipse(0, 0, 140, 140);
  popMatrix();

  filter(BLUR, 3);

  pushMatrix();
  rotateZ(theta);
  stroke(255, 200, 0, 200);
  strokeWeight(10);
  ellipse(0, 0, 200, 200);
  popMatrix();

  pushMatrix();
  rotateY(theta+QUARTER_PI*1.5);
  rotateZ(theta);
  stroke(255, 220, 0, 200);
  strokeWeight(1);
  for (float i=40; i<85; i++)
    ellipse(0, 0, i, i);
  popMatrix();

  pushMatrix();
  rotateX(theta);
  stroke(255, 0, 0, 200);
  strokeWeight(1);
  for (float i=120; i<160; i++)
    ellipse(0, 0, i, i);
  popMatrix();


  if (theta==PI) {
    if (cnt>30) {
      cnt=0;
      theta=0;
    }
    println(cnt++);
  }
  else {
    theta+=PI/5;
  }
  filter(DILATE);
  filter(BLUR, 1);
}


