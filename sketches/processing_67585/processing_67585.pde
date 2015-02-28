
float slow_circle_x = 250;
float fast_circle_x = 0;

void setup() {
  size(400,400);
  noStroke();
  }
void draw() {
  background(#0C55CE);
  
  fill(0, 255, 0);
  ellipse(slow_circle_x,50, 50, 50);
  slow_circle_x = slow_circle_x + 1;
  
  fill(255,0,0);
  ellipse(fast_circle_x,50, 50, 50);
  fast_circle_x = fast_circle_x + 5;
  
  if(fast_circle_x >= slow_circle_x) {
    slow_circle_x = 0;
    fast_circle_x = 0;
  } 
}

