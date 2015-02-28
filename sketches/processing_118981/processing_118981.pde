
void setup() {
  size(500, 500,P2D);
  background(255);
}

void draw() {
  pushMatrix();
  translate(250, 400);
  rotate(radians(frameCount * 10  % 360));
  fill(0, 0, 255, 10);
  arc(50, 55, 60, 30, 0, HALF_PI);
  popMatrix();

  pushMatrix();
  translate(100, 100);
  rotate(radians(frameCount * 10  % 360));
  stroke(255);
  fill(100, 0, 255, 30);
   arc(30, 30, 70, 70, PI+QUARTER_PI, TWO_PI);
  popMatrix();

  pushMatrix();
  translate(200, 250);
  rotate(radians(frameCount * 10  % 360));
  fill(255, 100, 0, 30);
  arc(10, 15, 30, 30, PI+QUARTER_PI, TWO_PI);
  popMatrix();


  pushMatrix();
  translate(100, 300);
  rotate(radians(frameCount * 10  % 360));
  fill(0, 255, 0, 20);
  arc(25, 25, 40, 10, 0, PI+QUARTER_PI, OPEN);
  popMatrix();

  pushMatrix();
  translate(400, 300);
  rotate(radians(frameCount * 10  % 360));
  fill(0, 255, 255, 20);
  arc(20, 30, 80, 30, HALF_PI, PI);
  popMatrix();

  pushMatrix();
  translate(300, 100);
  rotate(radians(frameCount * 10  % 360));
  fill(255, 0, 255, 30);
  arc(50, 55, 70, 70, PI, PI+QUARTER_PI);
  popMatrix();
}


