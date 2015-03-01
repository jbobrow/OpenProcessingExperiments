
float circle_x = 150;
float circle_y = 150;
float diameter = 10;
float t = 0;

float rect_x = 150;
float rect_y = 150;
float breadth = 10;
float t_rect = 0;
float t_limit = 300;

void setup() {

  size(300, 300);
  smooth();
  noStroke();
  //strokeWeight(1);
  background(#ffffd8);
  frameRate(1000);
}

void draw() {

  fill(#B6DEAF, 220);
  ellipse(circle_x, circle_y, diameter, diameter);

  if (t<t_limit) {
    t = t + PI/100;
    circle_x = circle_x + 0.01*t*cos(t);
    circle_y = circle_y + 0.01*t*sin(t);
  } else {
    t = t_limit;
  }

  fill(#AEA5E3, 220);
  rectMode(CENTER);
  rect(rect_x, rect_y, breadth, breadth);

  if (t_rect<t_limit) {
    t_rect = t+PI/100;
    rect_x = rect_x + 0.01*t*cos(-t);
    rect_y = rect_y + 0.01*t*sin(-t);
  } else {
    t_rect = t_limit;
  }
}
