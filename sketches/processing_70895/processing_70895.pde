
// Ben Norskov
// Code for Circle Bounce Homework
// 9/18/12
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
