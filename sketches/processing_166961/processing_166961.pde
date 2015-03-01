
PImage pizzaImg;


void setup() {
  size(500, 500);
  fill(255);
  noStroke();
  strokeWeight(1);
  pizzaImg=loadImage("pizza__1322067494_5957.jpg");
}
void draw() {

  background(0);

  float s=map(second(), 0, 60, 0, TWO_PI)-HALF_PI;
  float m=map(minute(), 0, 60, 0, TWO_PI)-HALF_PI;
  float h=map(hour()%12, 0, 12, 0, TWO_PI)-HALF_PI;
  
  beginShape();
  for (int i=0; i<500; i+=40) {
    float x = cos(s)*38+i;
    float y = sin(s)*38+i;
    vertex(i, i);
    vertex(x, y);
  }
  vertex(width, height);
  vertex(0, height);
  endShape();
}

