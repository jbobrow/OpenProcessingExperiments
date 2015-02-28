
int circle_x = 200;
int circle_y = 120;
int circle_radius= 30;
void setup () {
  size(500, 500);
};

void draw() {
  fill(255);
ellipse (circle_x, circle_y, circle_radius*2, circle_radius*2);  
  if (dist(mouseX, mouseY, circle_x, circle_y) < circle_radius) {
  fill(30, 100, 30);
  rect(100, 200, 100, 100);
};
};

  
//if the mouse is within a circle
//if the distance from the mouse to a circle is less than a circle's radius
// if (dist between mouse and circle < radius)
