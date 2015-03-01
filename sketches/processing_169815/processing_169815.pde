
void setup() {
  size(700, 400);
  background(255);
}

void draw () {
  background (0);
  fill(0);
  stroke(random(255), random(255), random(255));
  frameRate(1);
  rect(20, 100, 10+second()*10, 50);
  rect(20, 200, 10+minute()*10, 50);
  rect(20, 300, 10+hour()*10, 50);
}
