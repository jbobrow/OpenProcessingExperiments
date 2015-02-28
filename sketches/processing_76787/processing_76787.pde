
float xPos = 0;
float yPos = 100;
float VekX = 0;
float VekY = 0;

void setup() {
  size (600, 600);
  frameRate(30);
  smooth();
  background(43);
}

void draw() {

  pushMatrix();
  fill(44, 128);
  rect(0, 0, width, height);
  popMatrix();



  VekX -= (VekX - mouseX) * 0.01;
  VekY -= (VekY - mouseY) * 0.01;

  translate(VekX, VekY);

  rotate( map(millis(), 0, 2000, 0, TWO_PI));
  translate(50, 0);

  noStroke();
  fill(255);

  ellipseMode(CENTER);
  ellipse(0, 0, 10, 25);
}



