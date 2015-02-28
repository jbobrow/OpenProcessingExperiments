
// Zoe Bortz
// Code for Circle Bounce Homework
// 9/24/12

//circle 1
int circle_xx = 210;
int circle_yy = 300;//where the circle is onscreen
int circle_radius = 10; //how big is it?
int circle_xx_speed = 2;
int circle_yy_speed = 3;//how fast does it move?

//circle 2
int circle_x = 210;
int circle_y = 120;//where the circle is onscreen
int circl_radius = 70; //how big is it?
int circle_x_speed = 1;
int circle_y_speed = 3;//how fast does it move?
 
void setup() {
  size(500, 400);
};
void draw() {
  background(300, 600, 300); //our giant eraser in the sky
  ellipse(circle_x, circle_y, circle_radius*2, circle_radius*2);
  ellipse(circle_xx, circle_yy, circle_radius*2, circle_radius*2);
  //
  //////  //////  //////  //////  //////  //////  //////  //////  MOVE ON X
  //
  circle_x = circle_x + circle_x_speed; //this is what actually "moves" the circle, but only left or right
  if ((circle_x + circle_radius > width) || (circle_x - circle_radius < 3)) {  //move other way
  //if the circle hits the left side OR right side of the screen
  //(plus the radius, so the edge, not the middle, of the circle bounces off the screen)
    // the: || means OR
    circle_x_speed = circle_x_speed * -1;    //make positive speed negative, or vice versa
  };
  
  
    circle_xx = circle_xx + circle_xx_speed; //this is what actually "moves" the circle, but only left or right
  if ((circle_xx + circle_radius > width) || (circle_xx - circle_radius < 3)) {  //move other way
  //if the circle hits the left side OR right side of the screen
  //(plus the radius, so the edge, not the middle, of the circle bounces off the screen)
    // the: || means OR
    circle_xx_speed = circle_xx_speed * -1;    //make positive speed negative, or vice versa
  };
  
  
  //
  //////  //////  //////  //////  //////  //////  //////  //////  MOVE ON Y
  //
  circle_y = circle_y + circle_y_speed;//this is what actually "moves" the circle, but only up or down
  if ((circle_y + circle_radius > height) || (circle_y - circle_radius < 0)) {
      //if the circle hits the top OR bottom of the screen
    circle_y_speed = circle_y_speed * -1;
    
  }
};

