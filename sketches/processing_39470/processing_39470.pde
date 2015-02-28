
int px=0;

void setup() {
  background(0);
  size(200,200,P2D);
  smooth();
  noStroke();
  px=0;
}

void draw() {
  px++;
  fill(0,5);
  rect(0,0,width,height);
  fill(255,0,0);
  rect(px,100,20,20);
  fill(0,255,0);
  rect(100,px,20,20);
}

