
// Jeremy Jalnos

void setup() {
  
  float y = random(255);
  float x = random(100);
  size(640, 360);
  background(y+x);
  strokeWeight(20);
  frameRate(500);
}

void draw() {
  
  for (int i = 1; i < width; i++) {
    float r = random(255);
    float y = random(255);
  float x = random(300);
    stroke(r*x);
     fill(r,y,x);
    line(x, r, y*3, r);
    fill(y,y,x);
  }
  for (int i = 1; i < width; i++) {
    float r = random(255);
    float y = random(255);
  float x = random(100);
    stroke(r);
    ellipse(x*2, r+y, y*2, r+x);
   fill (r,x,y);
    triangle(r*3, x*y, y*4, r*x, y*8, x*3);
  }
}


