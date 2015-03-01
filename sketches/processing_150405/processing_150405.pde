
int x;
int trans = 100;
void setup() {
  size(1000, 1000);
  background(#FFFFFF);
}

void draw() {
  strokeWeight(0);
    fill(255, 10);
  rect(0, 0, 1000, 1000);
  fill(random(255), random(255), random(255), trans);
  ellipse(random(1000), random(1000), random(100), random(100));
  x=x+1;
  frameRate(100);
}

