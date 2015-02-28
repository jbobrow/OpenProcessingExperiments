
// Starting position
float circle_x = 100;
float circle_y = 0;

float r=random(256);
float g=random(256);
float b=random(256);

// Moving step
float move_x = 2;
float move_y = -2;

void setup() {
  size(400, 200);
}

void draw() {
  background(#21EA73);
  smooth();
  fill(r,g,b);
  noStroke();
  ellipse(circle_x, circle_y, 40, 40);
  circle_x = circle_x + move_x;
  circle_y = circle_y + move_y;

  if (circle_x > width-20) {
    circle_x = width-20; // Keep it inside
    move_x = -move_x; // Move it backward
    r=random(256);
    g=random(256);
    b=random(256);
    println("Too far right");
  } 

  if (circle_y > height-20) {
    circle_y = height-20; // Keep it inside
    move_y = -move_y; // Move it backward
    r=random(256);
    g=random(256);
    b=random(256);
    println("Too far bottom");
  }

  if (circle_x < 20) {
    circle_x = 20; // Keep it inside
    move_x = -move_x; // Move it forward
    r=random(256);
    g=random(256);
    b=random(256);
    println("Too far left");
  }

  if (circle_y < 20) {
    circle_y = 20; // Keep it inside
    move_y = -move_y; // Move it forward
    r=random(256);
    g=random(256);
    b=random(256);
    println("Too far top");
  }
}


