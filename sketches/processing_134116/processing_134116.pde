
// crashCourse processing by Corneel Cannaerts 2014
// conditionals, if, else

// a block of code between {} is exectued only if a condition is true

float x = 200;
float y = 200;
float speedX =0;
float speedY =0;

void setup() {  
  size(400, 400);
}

void draw() {
  background(255);

  if (mouseX>200) {
    fill(0);
  }
  else {
    fill(255,0,0);
  }

  ellipse(x, y, 30, 30);

  x = x + speedX;
  y = y + speedY;

  //if the bouncing dot goes out of the screen, reverse the speed
  if (x>385 || x<15) {  
    speedX = -speedX;
  }
  if (y>385 || y<15) {
    speedY = -speedY;
  }
}



