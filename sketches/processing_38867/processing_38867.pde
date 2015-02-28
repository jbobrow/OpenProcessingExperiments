
float x_position = random(55);
int x_speed = 10;

float y_position = random(15);
int y_speed = 10;
// create variable for ball color when key pressed
float ballColor = (255);

void setup() {
  size(400, 400);
  smooth();
  noLoop();
}

void draw() {
  background(0);
  fill(ballColor);
  x_position = x_position+x_speed;
  y_position = y_position+y_speed;


  ellipse(x_position+5, y_position+35, 100, 100);
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

//when you press 'p'  
void keyPressed() {
  if (key == 'p') {
    //continue the animation
    loop();
    ballColor = random(255);
    //but if you press 's' then stop it
  } 
  else if  (key == 's') {
    noLoop();
    ballColor = (100);
    //otherwise continue looping
  } 
  else {
    loop();
  }
}


