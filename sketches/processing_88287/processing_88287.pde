
PImage star;

void setup() {
  size(500, 500, P3D);
  star = loadImage("star.png");
  smooth();
  background(0);
}

float nx = 0.0;
float a = 0.02;

void draw() {
  frameRate(60);
  translate(250, 250);
  //fill(255, 10);
  rotateY(a*PI);
  noStroke();
  //rect(0, 0, 500, 500);
  nx = nx + .01;
  float n = noise(nx) * 250;
  tint(random(255), random(255), random(0), 50);
  image(star, n, n);
  
  pushMatrix();
  //rotate(HALF_PI);
  image(star, n, n);
  popMatrix();
  
  pushMatrix();
  rotateX(PI);
  image(star, n, n);
  popMatrix();
  a += 0.02;
}


