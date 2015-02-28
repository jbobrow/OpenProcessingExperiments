
//riho mineta
 
float circle_x = 50;
float circle_y = 50; //circle position
float circle_radius = 50; //how big. radius is half the diameter (width)
float circle_x1 = 650;
float circle_y1 = 50;
float circle_radius1 = 50;
float circle_x_speed = 5;
float circle_y_speed = 2; //moving independently on both axis
Boolean move_circle = false; //used for starting and stopping the circle
PFont font;

void setup() {
  size(700, 500);
  background(255);
  font = loadFont ("TattooInk-48.vlw");
  textFont(font);
}
 
void draw() {
  if (move_circle == false) { //move the circle if move_circle is true
    circle_x = circle_x + circle_x_speed; //move on x axis
    circle_y = circle_y + circle_y_speed; //move on y axis
    circle_x1 = circle_x1 - circle_x_speed;
    circle_y1 = circle_y1 + circle_y_speed;
  };
  strokeWeight(1);
  stroke(255);
  fill( random(255), 0, random(255), 20 );
  ellipse(circle_x, circle_y, circle_radius*2, circle_radius*2);
  fill(0, random(255), random(255), 20);
  ellipse(circle_x1, circle_y1, circle_radius1*2, circle_radius1*2); 
  // X axis bounce
  if ( (circle_x + circle_radius > width) || (circle_x - circle_radius < 0) ) { //if circle is on the left or right edge accounting for the radius
    circle_x_speed = -circle_x_speed; //make the speed negative to move the opposite way
     
    if (circle_x - circle_radius < 0) { //if off the left side
      circle_x = circle_radius; //move to left edge of screen + radius
    };
    if (circle_x + circle_radius > width) { //if off the right side
      circle_x = width-circle_radius; //move to right edge of screen - radius
    };
  };
  //
  //Y axis bounce
  if ( (circle_y + circle_radius > height) || (circle_y - circle_radius < 0) ) { //if circle is on the top or bottom edge accounting for the radius
    circle_y_speed = -circle_y_speed; //make the speed negative to move the opposite way
 
    if (circle_y - circle_radius < 0) { //if off the top of the screen
      circle_y = circle_radius; //move to top edge of screen + radius
    };
    if (circle_y + circle_radius > height) { //if off the bottom of the screen.
      circle_y = height-circle_radius;//move to bottom edge of screen
    };
  };
  textSize(80);
  fill(255);
  text("eye bender", 50, 250);
};
