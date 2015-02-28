
float x_position = random(55);
int x_speed = 10;

float y_position = random(15);
int y_speed = 10;


void setup() {
  size(400,400);
  smooth();
}

void draw() {
  background(0);
  x_position = x_position+x_speed;
  y_position = y_position+y_speed;
  
  
  ellipse(x_position+5, y_position+35,100, 100);
  //if the ball gets to right side
  if (x_position > 400) {
  //then begin back in the beginning
    x_speed = -10;
  }

  if (x_position < 1) {
    x_speed = 10;
  }
  
   if (y_position > 400) {
  //then begin back in the beginning
    y_speed = -10;
  }

  if (y_position < 1) {
    y_speed = 10;
  }
  
  
}
            
