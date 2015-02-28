
int x_position = 30;
int y_position = 30;
int countFrame = 0;
int x_direction = 10;
int y_direction = 13;
 
void setup() {
  size(400, 400);
}
 
void draw() {
  background(0);
  x_position = x_position + x_direction;
  y_position = y_position + y_direction;
  ellipse(x_position, y_position, 100, 100);
 
  if (x_position>400) {x_direction = -1*x_direction;}
  if (x_position<0) {x_direction = -1*x_direction;}
  if (y_position>400){y_direction = -1*y_direction;}
  if (y_position<0){y_direction = -1*y_direction;}
}

