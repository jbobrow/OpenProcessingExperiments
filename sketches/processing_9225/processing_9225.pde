
//MovingSquareAccording2State

float x = 100; // x location of square
float y = 0; // y location of square

float speed = 0; // x location of square
float gravity = 0.1; // x location of square

void setup () {
  size (200,200);
}
void draw () {
  background(255);
  
  //display the square
  fill(0);
  noStroke();
  rectMode(CENTER);
  rect(x,y,10,10);
  
  y = y + speed;
  
  speed = speed + gravity;
  
  // if square reaches the bottom
  // reverse the speed
  
  if (y > height) {
    speed = speed * -0.95;
  }
}

