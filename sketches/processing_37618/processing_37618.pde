

int x_position=1;
int x_speed=10;

void setup() {
  size(400, 400);
}

void draw() {
  background(0);
  x_position=x_position+x_speed;
  ellipse(x_position, 200, 50, 50);


  //if the ball reached the right side of the screen
  if (x_position>400) {
    //then the ball changes direction
    x_speed=-10;
    ellipse(x_position, 200, 50, 50);
  }
  //if the ball reached the left side of the screen
  if (x_position<0) {
    //then the ball changes direction
    x_speed=10;
    ellipse(x_position, 200, 50, 50);
  }
}

