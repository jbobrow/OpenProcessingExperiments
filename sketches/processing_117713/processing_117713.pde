
void setup() {
  size(500,500);
  background(0);
}
void draw() {
  noStroke();
  fill(random(255),random(255));
  rect(250,0,250,250);
  fill(random(255),random(255));
  rect(0,0,250,250);
  fill(random(255),random(255));
  rect(0,250,250,250);
  fill(random(255),random(255));
  rect(250,250,250,250);
  frameRate(5);
}
