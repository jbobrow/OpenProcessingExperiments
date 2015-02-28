
//caseydorobek
//creativecomputinghomework_03
//091712

int circle_diameter = 40;
boolean isOverCircle = false;

//int circle_x = 20;
//int circle_y = 30;
//int circle_radius = 40;
//int circle_speed = 7;
//three main variables are int, float, and boolean. floats have decimals.
//booleans have two values to choose from, true OR false.

void setup() {
  size(500, 650);
  smooth();
}

void draw() {
  background(40);
  fill(230, 50, 100);
  if (dist(width * .5, height * .5, mouseX, mouseY) < circle_diameter * .5) {
    fill(20, 20, 50);
    isOverCircle = true;
  } 
  else {
    isOverCircle = false;
  }
  if ((mousePressed == true) && (isOverCircle == true)) {
    rect(width - 10, height - 10, 10, 10);
    rect(width - 20, height - 20, 10, 10);
    rect(width - 30, height - 30, 10, 10);
    rect(width - 40, height - 40, 10, 10);
    rect(width - 50, height - 50, 10, 10);
    rect(width - 60, height - 60, 10, 10);
    rect(width - 70, height - 70, 10, 10);
    rect(width - 80, height - 80, 10, 10);
    rect(width - 90, height - 90, 10, 10);
    rect(width - 100, height - 100, 10, 10);
    rect(width - 110, height - 110, 10, 10);
    rect(width - 120, height - 120, 10, 10);
    rect(width - 130, height - 130, 10, 10);
    fill(10);
    rect(width - 15, height - 15, 10, 10);
    fill(240);
    rect(width - 25, height - 25, 10, 10);
       fill(10);
    rect(width - 35, height - 35, 10, 10);
    fill(240);
    rect(width - 45, height - 45, 10, 10);
       fill(10);
    rect(width - 55, height - 55, 10, 10);
    fill(240);
    rect(width - 65, height - 65, 10, 10);
       fill(10);
    rect(width - 75, height - 75, 10, 10);
    fill(240);
    rect(width - 85, height - 85, 10, 10);
  }

  println(dist(width * .5, height * .5, mouseX, mouseY));
  ellipse(width * .5, height * .5, circle_diameter, circle_diameter);
  if (isOverCircle == false) {
    line(width * .5, height * .5, mouseX, mouseY);
    //multiplying is processed faster than dividing.
  }
}

//void draw() {
//  background(15);
//  smooth();
//  fill(45, 5, 205);
//  noStroke();
//  ellipse(circle_x, circle_y, circle_radius, circle_radius);
//  circle_x = circle_x + circle_speed;
//  circle_radius = circle_radius + 2;
//  if (circle_x >= 500) {
//    circle_speed = circle_speed * -1;
//  }
//  if (circle_x == 500) {
//    circle_radius = circle_radius * -1;
//  }
//  if (circle_x <= 0) {
//    circle_speed = circle_speed * -1;
//  }
//  if (circle_radius >= 1000) {
//    circle_radius = 1000 * -1;
//  }
//}

//putting the background in "void draw" allows you to have a shape that follows your
//cursor around. it draws the rectangle, fills the background, and repeats. that is
//why there is NO trail of rectangles.



