
float p,q;
color c;

void setup() {
  size(900,100);
  colorMode(HSB,100);
  smooth();
  background(99);
//  frameRate(10);
}

void draw() {
  fadeToWhite();

  fill(random(100),80,100);
  noStroke();
  rectMode(CENTER);
  rect(mouseX,50,p,100);

  p=mouseX-pmouseX;
  if(p<0) {
    p=-p;
  }
}

void fadeToWhite() {
  noStroke();
  fill(99,10);
  rectMode(CORNER);
  rect(0, 0, width, height);
}

