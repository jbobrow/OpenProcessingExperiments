
//ben norskov
//bouncing circle
//in class 9-21 without comments

float circle_x = 100;
float circle_y = 181; 
float circle_radius = 50;
float circle_x_speed = 2;
float circle_y_speed = 2;
Boolean move_circle = false; 

void setup() {
  size(600, 500);
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
  fill( random(100), 0, 0 );
  ellipse(circle_x, circle_y, circle_radius*2, circle_radius*2); 
  
  if ( (circle_x + circle_radius > width) || (circle_x - circle_radius < 0) ) { 
    circle_x_speed = -circle_x_speed;
    
    if (circle_x - circle_radius < 0) { 
      circle_x = circle_radius; 
    };
    if (circle_x + circle_radius > width) {
      circle_x = width-circle_radius; 
    };
  };
  
  if ( (circle_y + circle_radius > height) || (circle_y - circle_radius < 0) ) {
    circle_y_speed = -circle_y_speed; 

    if (circle_y - circle_radius < 0) { 
      circle_y = circle_radius;
    };
    if (circle_y + circle_radius > height) {
      circle_y = height-circle_radius;
    };
  };
};
