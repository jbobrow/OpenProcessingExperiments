
int x_position = 100;
int speedX = +10;
int y_position = 10;
int speedY = +10;

void setup() {
  size(600, 400);
}

void draw() { //even nothing had, draw() must be here.
  background(0);
  x_position +=speedX;
  y_position +=speedY;
  if (x_position>=600 ) speedX = -10;
  else if (x_position < 0) speedX = 10;
  if (y_position>=400 ) speedY = -10;
  else if (y_position < 0) speedY = 10;
  
  ellipse(x_position, y_position, 50, 50);
 
 // println(x_position+", "+x_reverse);
}
