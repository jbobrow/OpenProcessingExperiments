
int diam=10;
void setup() {
  size(400,400);
  background(40,200,50);
  noFill();
  stroke(0);
}

void draw() {
  diam=frameCount;
  if (diam<width && diam%5==0) {
    //background(40,200,50);
    ellipse(width/2, height/2, diam, diam);
  }
}

