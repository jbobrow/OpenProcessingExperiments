

void setup() {
 size(400,400);
  rectMode(CENTER);
  smooth();
}
 
void draw() {
  smooth();
  stroke(5);
  fill(random(255));
  rect(random(200,200), (random(400)), random(200), random(0,300));
  rect(random(100), (random(0,400)), random(10), random(10));
  rect(random(300,400), (random(0,400)), random(10), random(10));
 
}



