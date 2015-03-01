
float slow_circle_x = 0;
float fast_circle_x = 0;

void setup() {
  size(500,500); 
  noStroke();
}

void draw() {
  background(0);
  
  fill(#1982b2);
  ellipse(slow_circle_x,50, 400, 400);
  slow_circle_x = slow_circle_x + 1;

  fill(#FFFFCC);
  ellipse(fast_circle_x,50, 50, 50);
  fast_circle_x = fast_circle_x + 5;

  
  if(slow_circle_x > 400) {
    slow_circle_x = 0;
  }
  if(fast_circle_x > 400) {
    fast_circle_x = 0;
  }
}
