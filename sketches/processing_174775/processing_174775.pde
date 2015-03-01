
void setup(){
  size(200, 200);
  background(0);
}

void draw(){
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  fill(random(0, 255));
  noStroke();
  triangle(20, s, m, 180, 180, h);
}
