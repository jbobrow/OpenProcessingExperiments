
float ellipsX = 250;
float ellipsY = 250;
float ellipsW = 50;
float ellipsH = 50;
float ellipsR = 50;
float ellipsG = 150;
float ellipsB = 200;
float ellipsA = 150;

void setup() {
  size(500, 500);
  smooth();
}

void draw(){
  noStroke();
  fill(ellipsR, ellipsG, ellipsB, ellipsA);
  ellipse(ellipsX, ellipsY, ellipsW, ellipsH);
  ellipsX = random(0,500);
  ellipsY = random(0,500);
  ellipsW = random(10,100);
  ellipsH = ellipsW;
  ellipsR = random(0,50);
  ellipsG = random(0,50);
  ellipsB = random(0,255);
  ellipsA = random(0,100);
}

