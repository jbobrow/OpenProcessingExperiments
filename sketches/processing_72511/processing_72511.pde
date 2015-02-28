
//Anais Freitas
//Creative Computing Friday Class
//9/28/12
 
 
//Ellipse
float circle_x = 100;
float circle_y = 181;
float circle_radius = 50;
float circle_x_speed = 2;
float circle_y_speed = 2;
 
//Rectangle
float rect_a= 30;
float rect_b= 20;
float rect_c= 55;
float rect_d= 55;
 
//Triangle
float triangle_x1 = 30;
float triangle_y1 = 75;
float triangle_x2 = 60;
float triangle_y2 = 20;
float triangle_x3 = 80;
float triangle_y3 = 75;
 
//Button
Boolean move_circle = false;
PImage img;
  
void setup() {
  size(700, 700);
  //img = loadImage ("oops.png");
};
  
void draw() {
  background(200);
  if (mousePressed == true) {
    if (move_circle == true) {
      move_circle = false;
    } else {
      move_circle = true;
    };
  };
  if (move_circle == true) {
    circle_x = circle_x + circle_x_speed;
    circle_y = circle_y + circle_y_speed;
    //if circle is moving, make fill one random colour
    fill (random (70), (247), (124));
  };
  //if circle is not moving, make fill another random colour
  if (move_circle == false) {
    fill (random (240), random (120), random (22));
  };
     
  strokeWeight(4);
  stroke (211,247,70);
  ellipse(circle_x, circle_y, circle_radius*2, circle_radius*2);
   
  //X-axis
     if ( (circle_x + circle_radius > width) || (circle_x - circle_radius < 0) ) {
    circle_x_speed = -circle_x_speed;
    //if ball hist x-axis edges, make a square appear on screen
    rect (rect_a, rect_b, rect_c, rect_d);

    //image (img, 0,0);
    if (circle_x - circle_radius < 0) {
      circle_x = circle_radius;
    };
    if (circle_x + circle_radius > width) {
      circle_x = width-circle_radius;
    };
  };
   
  //Y axis
  if ( (circle_y + circle_radius > height) || (circle_y - circle_radius < 0) ) {
    circle_y_speed = -circle_y_speed;
    //if ball hits Y-axis edges, make a triangle appear on screen
    triangle (triangle_x1, triangle_y1, triangle_x2, triangle_y2, triangle_x3, triangle_y3);
   //image (img, 0,0);
    if (circle_y - circle_radius < 0) {
      circle_y = circle_radius;
    };
    if (circle_y + circle_radius > height) {
      circle_y = height-circle_radius;
    };
  };
};
