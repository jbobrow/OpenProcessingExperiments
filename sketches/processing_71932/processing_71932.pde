
// Ben Norskov
// Code for Circle Bounce Homework
// 9/18/12

//  Circle 1
int circle_x = 210;
int circle_y = 300;//where the circle is onscreen
int circle_radius = 40; //how big is it?
int circle_x_speed = 2;
int circle_y_speed = 4;//how fast does it move?

//Circle 2
int circle_x_2 = 210;
int circle_y_2 = 300;//where the circle is onscreen
int circle_radius_2 = 30; //how big is it?
int circle_x_speed_2 = 4;
int circle_y_speed_2 = 8;

//Circle 3 
int circle_x_3 = 210;
int circle_y_3 = 300;//where the circle is onscreen
int circle_radius_3 = 35; //how big is it?
int circle_x_speed_3 = 6;
int circle_y_speed_3 = 3 ;

//Circle 4 
int circle_x_4 = 210;
int circle_y_4 = 300;//where the circle is onscreen
int circle_radius_4 = 45; //how big is it?
int circle_x_speed_4 = 4;
int circle_y_speed_4 = 6;

//Circle 5 
int circle_x_5 = 200;
int circle_y_5 = 300;//where the circle is onscreen
int circle_radius_5 = 35; //how big is it?
int circle_x_speed_5 = 6;
int circle_y_speed_5 = 3;

PImage img;

void setup() {
  size(700, 490);
  img = loadImage ("dogs.jpg");
 
};
void draw() {
 
  { image (img, 0, 0);
  
  }
  fill(145, 232, 164);
  noStroke();
  ellipse(circle_x, circle_y, circle_radius*2, circle_radius*2); 


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
  
fill(247, 117, 161);
  noStroke();
  ellipse(circle_x_2, circle_y_2, circle_radius_2*2, circle_radius_2*2);
  //
  //////  //////  //////  //////  //////  //////  //////  //////  MOVE ON X
  //
  circle_x_2 = circle_x_2 + circle_x_speed_2; //this is what actually "moves" the circle, but only left or right
  if ((circle_x_2 + circle_radius_2 > width) || (circle_x_2 - circle_radius_2 < 0)) {  //move other way
  //if the circle hits the left side OR right side of the screen
  //(plus the radius, so the edge, not the middle, of the circle bounces off the screen)
    // the: || means OR
    circle_x_speed_2 = circle_x_speed_2 * -1;    //make positive speed negative, or vice versa
  };
  //
  //////  //////  //////  //////  //////  //////  //////  //////  MOVE ON Y
  //
  circle_y_2 = circle_y_2 + circle_y_speed_2;//this is what actually "moves" the circle, but only up or down
  if ((circle_y_2 + circle_radius_2 > height) || (circle_y_2 - circle_radius_2 < 0)) {
      //if the circle hits the top OR bottom of the screen
    circle_y_speed_2 = circle_y_speed_2 * -1;
    //circle_y_speed *= -1; //This line is shorthand for the above line
    
      }
//circle 1
fill(43, 114, 202);
  noStroke();
  ellipse(circle_x_3, circle_y_3, circle_radius_3*2, circle_radius_3*2);

  //////  //////  //////  //////  //////  //////  //////  //////  MOVE ON X
  circle_x_3 = circle_x_3 + circle_x_speed_3; //this is what actually "moves" the circle, but only left or right
  if ((circle_x_3 + circle_radius_3 > width) || (circle_x_3 - circle_radius_3 < 0)) {  //move other way
  //if the circle hits the left side OR right side of the screen
  //(plus the radius, so the edge, not the middle, of the circle bounces off the screen)
    // the: || means OR
    circle_x_speed_3 = circle_x_speed_3 * -1;    //make positive speed negative, or vice versa
  };

  //////  //////  //////  //////  //////  //////  //////  //////  MOVE ON Y
  circle_y_3 = circle_y_3 + circle_y_speed_3;//this is what actually "moves" the circle, but only up or down
  if ((circle_y_3 + circle_radius_3 > height) || (circle_y_3 - circle_radius_3 < 0)) {
      //if the circle hits the top OR bottom of the screen
    circle_y_speed_3 = circle_y_speed_3 * -1;
    //circle_y_speed *= -1; //This line is shorthand for the above line
  }
 //circle 2 
  fill(43, 93, 202);
  noStroke();
  ellipse(circle_x_3, circle_y_3, circle_radius_3*2, circle_radius_3*2);

  //////  //////  //////  //////  //////  //////  //////  //////  MOVE ON X
  circle_x_3 = circle_x_3 + circle_x_speed_3; //this is what actually "moves" the circle, but only left or right
  if ((circle_x_3 + circle_radius_3 > width) || (circle_x_3 - circle_radius_3 < 0)) {  //move other way
  //if the circle hits the left side OR right side of the screen
  //(plus the radius, so the edge, not the middle, of the circle bounces off the screen)
    // the: || means OR
    circle_x_speed_3 = circle_x_speed_3 * -1;    //make positive speed negative, or vice versa
  };

  //////  //////  //////  //////  //////  //////  //////  //////  MOVE ON Y
  circle_y_3 = circle_y_3 + circle_y_speed_3;//this is what actually "moves" the circle, but only up or down
  if ((circle_y_3 + circle_radius_3 > height) || (circle_y_3 - circle_radius_3 < 0)) {
      //if the circle hits the top OR bottom of the screen
    circle_y_speed_3 = circle_y_speed_3 * -1;
    //circle_y_speed *= -1; //This line is shorthand for the above line
  }
  //circle 3
    fill(226, 79, 63);
  noStroke();
  ellipse(circle_x_4, circle_y_4, circle_radius_4*2, circle_radius_4*2);

  //////  //////  //////  //////  //////  //////  //////  //////  MOVE ON X
  circle_x_4 = circle_x_4 + circle_x_speed_4; //this is what actually "moves" the circle, but only left or right
  if ((circle_x_4 + circle_radius_4 > width) || (circle_x_4 - circle_radius_4 < 0)) {  //move other way
  //if the circle hits the left side OR right side of the screen
  //(plus the radius, so the edge, not the middle, of the circle bounces off the screen)
    // the: || means OR
    circle_x_speed_4 = circle_x_speed_4 * -1;    //make positive speed negative, or vice versa
  };

  //////  //////  //////  //////  //////  //////  //////  //////  MOVE ON Y
  circle_y_4 = circle_y_4 + circle_y_speed_4;//this is what actually "moves" the circle, but only up or down
  if ((circle_y_4 + circle_radius_4 > height) || (circle_y_4 - circle_radius_4 < 0)) {
      //if the circle hits the top OR bottom of the screen
    circle_y_speed_4 = circle_y_speed_4 * -1;
    //circle_y_speed *= -1; //This line is shorthand for the above line
  }
  
  // Circle 4
   fill(226, 79, 63);
  noStroke();
  ellipse(circle_x_4, circle_y_4, circle_radius_4*2, circle_radius_4*2);

  //////  //////  //////  //////  //////  //////  //////  //////  MOVE ON X
  circle_x_4 = circle_x_4 + circle_x_speed_4; //this is what actually "moves" the circle, but only left or right
  if ((circle_x_4 + circle_radius_4 > width) || (circle_x_4 - circle_radius_4 < 0)) {  //move other way
  //if the circle hits the left side OR right side of the screen
  //(plus the radius, so the edge, not the middle, of the circle bounces off the screen)
    // the: || means OR
    circle_x_speed_4 = circle_x_speed_4 * -1;    //make positive speed negative, or vice versa
  };

  //////  //////  //////  //////  //////  //////  //////  //////  MOVE ON Y
  circle_y_4 = circle_y_4 + circle_y_speed_4;//this is what actually "moves" the circle, but only up or down
  if ((circle_y_4 + circle_radius_4 > height) || (circle_y_4 - circle_radius_4 < 0)) {
      //if the circle hits the top OR bottom of the screen
    circle_y_speed_4 = circle_y_speed_4 * -1;
    //circle_y_speed *= -1; //This line is shorthand for the above line
    
  }
  
    // Circle 5
   fill(225, 240, 111);
  noStroke();
  ellipse(circle_x_5, circle_y_5, circle_radius_5*2, circle_radius_5*2);

  //////  //////  //////  //////  //////  //////  //////  //////  MOVE ON X
  circle_x_5 = circle_x_5 + circle_x_speed_5; //this is what actually "moves" the circle, but only left or right
  if ((circle_x_5 + circle_radius_5 > width) || (circle_x_5 - circle_radius_5 < 0)) {  //move other way
  //if the circle hits the left side OR right side of the screen
  //(plus the radius, so the edge, not the middle, of the circle bounces off the screen)
    // the: || means OR
    circle_x_speed_5 = circle_x_speed_5 * -1;    //make positive speed negative, or vice versa
  };

  //////  //////  //////  //////  //////  //////  //////  //////  MOVE ON Y
  circle_y_5 = circle_y_5 + circle_y_speed_5;//this is what actually "moves" the circle, but only up or down
  if ((circle_y_5 + circle_radius_5 > height) || (circle_y_5 - circle_radius_5 < 0)) {
      //if the circle hits the top OR bottom of the screen
    circle_y_speed_5 = circle_y_speed_5 * -1;
    //circle_y_speed *= -1; //This line is shorthand for the above line
  }
  
  
  
  
};


