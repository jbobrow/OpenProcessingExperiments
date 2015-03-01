
float slow_circle_x = 0;
float fast_circle_x = 0;


void setup() {
  size(400, 400);
  noStroke();
  
}

void draw() {
  background(#3674EA);
  float slow_circle_size=50;
  if (random(10)>3) {
    slow_circle_size = 60;
  }
  
  fill(#36EAD1);
  ellipse(slow_circle_x, 50, slow_circle_size, slow_circle_size);
  slow_circle_x = slow_circle_x + 1;
  
  fill(#EA367C);
   ellipse(fast_circle_x, 50, 50, 50);
  fast_circle_x = fast_circle_x + 5;
  
  if (slow_circle_x>430) {
    slow_circle_x = 0;
  }
   if (fast_circle_x>430) {
    fast_circle_x = 0;
  }
}

