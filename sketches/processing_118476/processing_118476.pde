
//refernece classmate:chen-hsin chang...the drawing is so beautiful...


int div =10;
void setup() {
  size(900, 600);
  frameRate(20);
  smooth();
}
void draw() {
  background(50);
  noStroke();
  fill(250, 200, 135, random(0, 100));    
  ellipse(random(width), random(height), random(1, 5), random(1, 5));
  for (int i =1; i<width; i++) {
    waveLine(i, 0, i+random(0, 10), 100);
    waveLine(i, 0, i+random(0, 10), 50);
  }
}

void waveLine(float sx, float sy, float ex, float ey) {
  float xstep = (ex - sx)/div;
  float ystep = (ey - sy)/div;
  float lastx = sx;
  float lasty = sy;
  float y = sy;
  float x = sx;
  for (int i=0; i<div; i++) {
    x= x+ xstep;
    x = x + random(200) -10; 
    y= y+ ystep;
    y = y + random(100) - 10;
    noFill();
    stroke(i*20, mouseX, mouseY, random(0, 100));
    line(x, height-y, lastx, height-lasty);
    lastx = x;
    lasty = y;
    noStroke();
    fill(250, 200, 135, random(0, 70));    
    ellipse(random(width), random(height), random(1, 5), random(1, 10));
  }
}



