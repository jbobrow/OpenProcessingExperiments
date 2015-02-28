
int x_position = 200;
int x_speed = +20;

void setup() {
  size(1000, 400);
}

void draw() {
  background(0);
  x_position = x_position + x_speed;
  ellipse(x_position, 200, 50, 50);

  //if the ball gets to the right of the screen
  if (x_position > 1000) {
    //then the ball changes direction 
    x_speed = -20;
  }
}
                
