
//Camille Gervais
//bouncing circle

 
float circle_x = 100;
float circle_y = 100; 
float circle_radius = 5; 
float circle_x_speed = 6;
float circle_y_speed = 6; 
Boolean move_circle = false; 
 
void setup() {
  size(20, 500);
}
 
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
  };
  fill(random (1),(1),(100)); 
  ellipse(circle_x, circle_y, circle_radius*2, circle_radius*2);
   

  if ( (circle_x + circle_radius > width) || (circle_x - circle_radius < 0) ) { //if circle is on the left or right edge accounting for the radius
    circle_x_speed = -circle_x_speed;
     
    if (circle_x - circle_radius < 0) { 
      circle_x = circle_radius; 
    };
    if (circle_x + circle_radius > width) { 
      circle_x = width-circle_radius;
    };
  };

  if ( (circle_y + circle_radius > height) || (circle_y - circle_radius < 0) ) { //if circle is on the top or bottom edge accounting for the radius
    circle_y_speed = -circle_y_speed; 
 
    if (circle_y - circle_radius < 0) { 
      circle_y = circle_radius;
    };
    if (circle_y + circle_radius > height) { 
      circle_y = height-circle_radius;
    };
  };
};


