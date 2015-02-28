
// Ball Bounce
// Devon Moscoso
// Ben Norsky - Creative Computing


int circle_x = 200;
int circle_y = 300;
int circle_x1 = 150;
int circle_y1 = 200;
int circle_radius = 30;
int circle_xspeed = 10; 
int circle_yspeed = 10;
int circle_x1speed = 10; 
int circle_y1speed = 10;
int circle_size = 5 + 1;

void setup () {
  size (400, 600);
  background (30);
};

void draw () {
  //  noStroke (); 
  background (50, 50, 90); 
  ellipse (circle_x, circle_y, circle_radius*2, circle_radius*2);
  circle_x = circle_x + circle_xspeed;  
  ellipse (circle_x1, circle_y1, circle_radius*2, circle_radius*2);
  circle_x1 = circle_x1 + circle_x1speed;
  circle_radius = circle_size + 1;
//  circle_size = circle_size + 1; 
  circle_size = circle_size - 1;
  

  // bouncing circle off sides
  // if circle is next to side move other way
  // circle_x >= width

  ///// /////   ///// /////  ///// /////  ///// /////  ///// /////  MOVE ON X 

  if ((circle_x + circle_radius >= width) || (circle_x - circle_radius < 0)) {
    // make circle speed negative
    // || = OR
    circle_xspeed = circle_xspeed * -1;
  };

  if ((circle_x1 >= width) || (circle_x1 < 0)) {
    circle_x1speed = circle_x1speed * -1;
  };

  ///// /////   ///// /////  ///// /////  ///// /////  ///// /////  MOVE ON Y

  circle_y = circle_y + circle_yspeed;
  if (( circle_y + circle_radius > height ) || (circle_y - circle_radius < 0)) {
    circle_yspeed = circle_yspeed * -1;
  }

  circle_y1 = circle_y1 + circle_yspeed;
  if (( circle_y1 + circle_radius > height ) || (circle_y1 - circle_radius < 0)) {
    circle_y1speed = circle_y1speed * -1;
  }
  
  };

