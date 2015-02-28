
int r;
int g;
int b;
PImage img;

void setup() {
  size(600, 600);
  img = loadImage("freud.png");
  //170x241
  smooth();
  noStroke();
}

void draw() {
  r = int(random(100, 255));
  g = int(random(100, 255));
  b = int(random(100, 255));
  background(r, 0, b);
  pushMatrix();
  translate(width/2, height/2);  // mouse input will go here
  rotate(-(PI * frameCount/40));
  translate(0, 40);
  fill(0, g, b);
  drawStar();
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(TWO_PI * frameCount/40);
  translate(0, 70);
  fill(r, g, 0);
  drawStar2();
  popMatrix();
  
  drawFreud();
  textSize(80);
  fill(255);
  textAlign(CENTER);
  text("PSYCHO", 300, 200);
  textSize(80);
  fill(255);
  textAlign(CENTER);
  text("ANALYSIS", 300, 470);
  
}

void drawStar() {
  int numSpokes = 20;
  for (int i=0; i<numSpokes; i++) {
     float t0 = map(i, 0, numSpokes-1, 0, TWO_PI);
     float t1 = t0 + (TWO_PI/(2*numSpokes));
     arc(0, 0, (frameCount%100)+900, 1000, t0, t1);
  }
}

void drawStar2() {
  int numSpokes = 20;
  for (int i=0; i<numSpokes; i++) {
     float t0 = map(i, 0, numSpokes-1, 0, TWO_PI);
     float t1 = t0 + (TWO_PI/(2*numSpokes));
     arc(0, 0, 1000, (frameCount%100)+900, t0, t1);
  }
}

void drawFreud() {
  image(img, width/2-85, random(height/2-140, height/2-100));
}

