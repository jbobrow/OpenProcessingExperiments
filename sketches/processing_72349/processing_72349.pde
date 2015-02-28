
//Cari Hume
//Creative Computing, Friday, Fall 2012
//September 28
//Bouncing Ball Code

int circle_x=30;
int circle_y=40;
int circle_radius=30;
int circle_x_speed=2;
int circle_y_speed=4;
Boolean move_circle = false;

void setup() {
  size(300, 500);
  background(95, 158, 160);
};

void draw() {

  fill(173, 216, 230, 0);
  noStroke();
  rect (0, 0, width, height);
  if (mousePressed == true){
  move_circle = true;
  }
  if(move_circle==true){
  //if(mouseX < 100) {
  circle_x = circle_x + circle_x_speed;
  circle_y+=circle_y_speed;

  println(circle_x);
  //draw an ellipse that will move
  noStroke();
  fill( random(0), random(220), random(255) );
  ellipse(circle_x, circle_y, circle_radius*2, circle_radius*2); 
  //now tell it where to go!
  //if it reaches an edge, change direction...
  //if circle_x reaches width (of the screen, 500)
  if ((circle_x > width - 30) || (circle_x < 0 +30)) {
    //change direction 
    circle_x_speed = circle_x_speed = -circle_x_speed;
    //or circle_speed = *-1;
  }
  //now to do the y-axis!
  if ((circle_y > height - 30) || (circle_y < 0 +30)) {
    //change direction 
    circle_y_speed = circle_y_speed = -circle_y_speed;
  }

}
  }
