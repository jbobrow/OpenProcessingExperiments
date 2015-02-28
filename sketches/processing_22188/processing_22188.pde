
// Snowflakes: first steps
// let's draw 500 points at random

void setup() {
  size(300, 300);
  smooth();
  //frameRate(10); // try adjusting the frameRate
}

void draw() {
  background(0, 0, 64);
  stroke(255);
  strokeWeight(4);
  
  for (int i=0; i < 500; i++) {
    // the points are random every time we draw a frame.
    // before we knew about arrays, this is the best we could do!
    float x = random(width);
    float y = random(height);
    point(x, y);    
  }
}
