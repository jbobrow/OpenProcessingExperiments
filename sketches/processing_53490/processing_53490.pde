

void setup() {
  background(200);
  frameRate(100);
  smooth();
  size(500, 500);
}

void draw() {
  float x = random(5);
  float y = random(1000);
  stroke(0);
  strokeWeight(2);
  fill(225, 0, 0, random(225));
  bezier(500, 500, x, y, y, x, 500, 500);
  
  float a = random(200);
  float b = random(200);
  stroke(225, 0, 0);
  strokeWeight(2);
  fill(0, 0, 0, random(225));
  bezier(0, 0, a, b, b, a, 0, 0);
}



