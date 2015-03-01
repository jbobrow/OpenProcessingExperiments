
void setup() {
  size(800, 320);
}

int a=80;
int b=40;
int s=0;

void draw() {
  background(255);
  if (b>=height-a/2) {
    s=1;
  }
  if (b==a/2) {
    s=0;
  }
  if (s==0) {
    b++;
  }
  else {
    b--;
  }
  //Stripes
  rectMode(CORNER);
  noStroke();
  fill(0);
  if(mousePressed == false) {
  for (int y=0; y<300; y=y+40) {
    rect(0, y, 800, 20);
  }
  }
  //Squares
  rectMode(CENTER);
  fill(0, 0, 30);
  rect(320, b, a, a);
  rect(640, b, a, a);
  fill(255, 255, 0);
  rect(160, b, a, a);
  rect(480, b, a, a);
}
