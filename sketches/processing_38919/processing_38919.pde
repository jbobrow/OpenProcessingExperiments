
//======================================
//Variables
//======================================
int x_position = 1;
int x_speed = 10;
int y_position = 200;
int y_speed = 10;

//Void Scope

void setup() {
  size(400, 400);
}

void draw() {
  background(0);
  //Variable
  x_position = x_position + x_speed;
  //If circle x > 400 change variable 
  if (x_position > 400) {
    x_speed = -10;
  } 
  //If circle x < 0 change variable 
  if (x_position < 0) {
    x_speed = 10;
  }
  //Variable
  y_position = y_position + y_speed;
  //If circle x > 400 change variable 
  if (x_position > 200) {
    y_speed = -10;
  } 
  //If circle x < 0 change variable 
  if (x_position < 200) {
    y_speed = 10;
  }
  ellipse(x_position, y_position, 50, 50);
}

