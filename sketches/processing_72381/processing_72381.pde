
//Crysta Leong
//Creating Computing
//bouncing circle
//September 27th 2012
 

float circle_x = 100;
float circle_y = 181; //circle position
float circle_radius = 20; //how big. radius is half the diameter (width)
float circle_x_speed = 2;
float circle_y_speed = 2; //moving independently on both axis
Boolean move_circle = false; //used for starting and stopping the circle

void setup() {
  size(400, 400);
}
 
void draw() 
{
   noStroke();
  background(200);
  if (mousePressed == true) { //if i press the mouse
    if (move_circle == true) { //if the circle is moving
      move_circle = false; //stop the circle from moving
    } else { //else the circle isn't moving
      move_circle = true;//so move it
    };
  };
  if (move_circle == true) { //move the circle if move_circle is true
    circle_x = circle_x + circle_x_speed; //move on x axis
    circle_y = circle_y + circle_y_speed; //move on y axis
  };
  fill( 185, 230, 240 ); //the color
  ellipse(circle_x, circle_y, circle_radius*2, circle_radius*2);
   
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
};


