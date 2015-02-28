
//void setup() {
//  size(900, 1200);
//  smooth();
//  frameRate(5);
//}
//void draw() {
//  background(240);
//  for (int counter = 0; counter < 30; counter = counter+1 /*add one*/) {
//    noStroke();
//    ellipse(random(width), random(height), 40, 40);
//  }
//
//  for (int line_x = 0; line_x<width; line_x+=20) {
//    line(line_x, 0, line_x, height);
//    strokeWeight(3);
//    stroke(random(250), random(15), random(80), random(255));
//  }
//}



int circle_x = 210;
int circle_y = 300;//where the circle is onscreen
int circle_radius = 30; //how big is it?
int circle_x_speed = 2;
int circle_y_speed = 2;//how fast does it move?
 
void setup() {
  size(500, 400);
};
void draw() {
  background(140, 40, 200); //our giant eraser in the sky
  ellipse(circle_x, circle_y, circle_radius*2, circle_radius*2);
  //
  //////  //////  //////  //////  //////  //////  //////  //////  MOVE ON X
  //
  circle_x = circle_x + circle_x_speed; //this is what actually "moves" the circle, but only left or right
  if ((circle_x + circle_radius > width) || (circle_x - circle_radius < 0)) {  //move other way
  //if the circle hits the left side OR right side of the screen
  //(plus the radius, so the edge, not the middle, of the circle bounces off the screen)
    // the: || means OR
    circle_x_speed = circle_x_speed * -1;    //make positive speed negative, or vice versa
  };
  //
  //////  //////  //////  //////  //////  //////  //////  //////  MOVE ON Y
  //
  circle_y = circle_y + circle_y_speed;//this is what actually "moves" the circle, but only up or down
  if ((circle_y + circle_radius > height) || (circle_y - circle_radius < 0)) {
      //if the circle hits the top OR bottom of the screen
    circle_y_speed = circle_y_speed * -1;
    //circle_y_speed *= -1; //This line is shorthand for the above line
  }
};
