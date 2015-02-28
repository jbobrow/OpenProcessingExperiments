
// Jules Tran
// Code for Circle Bounce Homework
// 9/23/12
int circle_x = 210;
int circle_y = 300;//where the circle is onscreen
int circle_radius = 100; //how big is it?
int circle_x_speed = 2;
int circle_y_speed = 2;//how fast does it move?=
//circle 2
int circle_xx = 200;
int circle_yy = 300;
int circle_one_radius = 100;
int circle_xx_speed = 4;
int circle_yy_speed = 4;
//circle 3
int circle_xxx = 100;
int circle_yyy = 320;
int circle_two_radius = 30;
int circle_xxx_speed = 3;
int circle_yyy_speed = 3;
//circle 4
int circle_xxxx = 160;
int circle_yyyy = 250;
int circle_three_radius = 10;
int circle_xxxx_speed = 5;
int circle_yyyy_speed = 5;

void setup() {
  size(500, 400);
};
void draw() {
  background(0, 0, 0); //our giant eraser in the sky
  fill(0,0,255);
  noStroke();
  triangle(250, 0, 500, 400, 0, 400);
  fill(255,0,0,63);
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
  };
  
  /// circle two
    fill(255,0,0,191);
    ellipse(circle_xx, circle_yy, circle_one_radius*2, circle_one_radius*2);
    circle_xx = circle_xx + circle_xx_speed;
    if ((circle_xx + circle_one_radius > width) || (circle_xx - circle_one_radius < 0)) {
    circle_xx_speed = circle_xx_speed * -1;
  };
  
    circle_yy = circle_yy + circle_yy_speed;
  if ((circle_yy + circle_one_radius > height) || (circle_yy - circle_one_radius < 0)) {
    circle_yy_speed = circle_yy_speed * -1;
  };   
  
/// circle three
  
  fill(255,0,0,127);
  ellipse(circle_xxx, circle_yyy, circle_two_radius*2, circle_two_radius*2);
  circle_xxx = circle_xxx + circle_xxx_speed;
  if ((circle_xxx + circle_two_radius > width) || (circle_xxx - circle_two_radius < 0)) {
    circle_xxx_speed = circle_xxx_speed * -1;
 };
  
   circle_yyy = circle_yyy + circle_yyy_speed;
  if ((circle_yyy + circle_two_radius > height) || (circle_yyy - circle_two_radius < 0)) {
   circle_yyy_speed = circle_yyy_speed * -1;
 }; 

/// circle four
  fill(255,0,0,255);
  ellipse(circle_xxxx, circle_yyyy, circle_three_radius*2, circle_three_radius*2);
  circle_xxxx = circle_xxxx + circle_xxxx_speed;
  if ((circle_xxxx + circle_three_radius > width) || (circle_xxxx - circle_three_radius < 0)) {
    circle_xxxx_speed = circle_xxxx_speed* -1;
    
 };
   
   circle_yyyy = circle_yyyy + circle_yyyy_speed;
   if ((circle_yyyy + circle_three_radius > height) || (circle_yyyy - circle_three_radius < 0)) {
     circle_yyyy_speed = circle_yyyy_speed * -1;
     
   
 };
  
    

  
  
 };



