
float x = 0;
float y = 0;
float a = 0;
float b = 0;
float c = 0;
float s = random(190);

void setup() {
  noStroke();
  size(600, 600, P3D);
}


void draw() {
  stroke(s, 250);
  rectMode(CENTER);
  x = random(0, 500);
  y = random(0, 500);
  a = random(0, 50);
  fill(frameCount%5, random(255));
  translate(width/4, height/4);
  rotateX(radians(60)*random(1.5));
  rotateY(radians(60)*random(2));
  rotateZ(random(100));
  rect(x, y, a, a*random(2));
  
  b = random(0, 200);
  c = random(0, 5);
  noFill();
  strokeWeight(c);
  stroke(255);
  rect(300, 300, b, b);  
  shearY(PI/4.0);
  //shearX(PI/4.0);
}
