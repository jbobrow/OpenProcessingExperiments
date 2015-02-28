
int circle_x = 300;
int circle_y = 30;
int the_circle_size = 50;
int circle_speed = 10;
void setup() {
  size(500,400);
  
};

void draw() {
  background(30);
  fill(24,134,8);
  ellipse(circle_x,circle_y, the_circle_size, the_circle_size);
  circle_x = circle_x + circle_speed;
  
// if circle_x is at the screen edge
//if circle_x is equal to 500
//if circle_x == 500
if (circle_x >= 500) {
  circle_speed = circle_speed * -1;
};
if (circle_x <= 0) {
  circle_speed = circle_speed * -1;
}
//move it the other way
};


