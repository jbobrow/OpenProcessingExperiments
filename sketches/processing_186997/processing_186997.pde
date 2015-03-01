
float circle_x = 100;
float circle_y = 200;
float circle_a = 300;
float circle_b = 400;
float circle_speed_x = 2;
float circle_speed_y = 2.5;
float circle_speed_a = 3.5;
float circle_speed_b = 4.5;
void setup() {
  size(500, 500);
};
void draw() {
  fill(random(250), random(250), random(210));

  circle_x = circle_x + circle_speed_x;
  circle_y = circle_y + circle_speed_y;

  ellipse(circle_x, circle_y, 50, 50);
  fill(random(135), random(206), random(250));

  if (circle_x > width) {
    circle_speed_x = circle_speed_x * -1;
  };
  if (circle_x < 0) {
    circle_speed_x = circle_speed_x * -1;
  };
  if (circle_y > height) {

    circle_speed_y = circle_speed_y * -1;
  };
  if (circle_y < 0) {
    circle_speed_y = circle_speed_y * -1;
  };

  circle_a = circle_a + circle_speed_a;
  circle_b = circle_b + circle_speed_b; 

  ellipse(circle_a, circle_b, 30, 30);
  fill(random(255), random(255), random(224));

  if (circle_a > width - 20) {
    circle_speed_a = circle_speed_a * -1;
  };
  if (circle_a < 0 - 20) {
    circle_speed_a = circle_speed_a * -1;
  };
  if (circle_b > height - 20) {
    circle_speed_b = circle_speed_b * -1;
  };
  if (circle_b < 0 - 20) {
    circle_speed_b = circle_speed_b * -1;
  };
};

void mousePressed() {
  //if mouse is pressed
  //make the circle come back onto the screen
  circle_x = mouseX;
  circle_y = mouseY;
  circle_a = mouseX;
  circle_b = mouseY;
}

