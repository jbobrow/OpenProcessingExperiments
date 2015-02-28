
//Alicia Chen
//Bouncing circle
//Sept.24.2012
int circle_x = 210;//circle
int circle_y = 300;
int circle_radius = 30; 
int circle_x_speed = 4;
int circle_y_speed = 4;

int circle_1_x = 300;//circle_1
int circle_1_y = 300;
int circle_1_radius = 60; 
int circle_1_x_speed = 1;
int circle_1_y_speed = 1;
 
int circle_2_x = 200;//circle_2
int circle_2_y = 500;
int circle_2_radius = 10; 
int circle_2_x_speed = 6;
int circle_2_y_speed = 6;


void setup() {
  size(400, 600);
};
void draw() {
  background(16,35,67); 
  fill(24,53,102);
  rect(20,20,360,560);
  fill(32,72,138);
  rect(40,40,320,520);
  fill(255,0,0);
  noStroke();
  ellipse(circle_x, circle_y, circle_radius*2, circle_radius*2);
  //
  //////  //////  //////  //////  //////  //////  //////  //////  MOVE ON X
  //
  circle_x = circle_x + circle_x_speed; 
  if ((circle_x + circle_radius > width) || (circle_x - circle_radius < 0)) { 
    circle_x_speed = circle_x_speed * -1; 
  };
  //
  //////  //////  //////  //////  //////  //////  //////  //////  MOVE ON Y
  //
  circle_y = circle_y + circle_y_speed;
  if ((circle_y + circle_radius > height) || (circle_y - circle_radius < 0)) {
    circle_y_speed = circle_y_speed * -1;
  }




  //25% opacity
  fill(255,100,100,63);
  noStroke();
  ellipse(circle_1_x, circle_1_y, circle_1_radius*2, circle_1_radius*2);
  //
  //////  //////  //////  //////  //////  //////  //////  //////  MOVE ON X
  //
  circle_1_x = circle_1_x + circle_1_x_speed; 
  if ((circle_1_x + circle_1_radius > width) || (circle_1_x - circle_1_radius < 0)) { 
    circle_1_x_speed = circle_1_x_speed * -1; 
  };
  //
  //////  //////  //////  //////  //////  //////  //////  //////  MOVE ON Y
  //
  circle_1_y = circle_1_y + circle_1_y_speed;
  if ((circle_1_y + circle_1_radius > height) || (circle_1_y - circle_1_radius < 0)) {
    circle_1_y_speed = circle_1_y_speed * -1;
  }
  
  
  
  
  
  fill(255,200,200);
  noStroke();
  ellipse(circle_2_x, circle_2_y, circle_2_radius*2, circle_2_radius*2);
  //
  //////  //////  //////  //////  //////  //////  //////  //////  MOVE ON X
  //
  circle_2_x = circle_2_x + circle_2_x_speed; 
  if ((circle_2_x + circle_2_radius > width) || (circle_2_x - circle_2_radius < 0)) { 
    circle_2_x_speed = circle_2_x_speed * -1; 
  };
  //
  //////  //////  //////  //////  //////  //////  //////  //////  MOVE ON Y
  //
  circle_2_y = circle_2_y + circle_2_y_speed;
  if ((circle_2_y + circle_2_radius > height) || (circle_2_y - circle_2_radius < 0)) {
    circle_2_y_speed = circle_2_y_speed * -1;
  }
  
  
  
  
  
  
  
  
  
  
};


