
float r;
float g;
float b;
float a;
float diam;
float elipse;

int x = 0;  // x location of square
int y = 0;// y location of square
int speed = 5;  // speed of square
// A variable to keep track of the square's "state."  
// Depending on the value of its state, it will either move right, down, left, or up.
int state = 0;
int circleX = 0;
int circleY = 0;
int count = 0;


void setup() {
  size(500,500);
  background(0);
  frameRate(9000000000);
}

void draw() {

  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);

 
  // Display the square
  stroke(255);
  fill(r,g,b,a);
  ellipse(x,y,circleX,circleY);
  

  
  
  circleX = 50;
  circleY = 50;

  // If the state is 0, move to the right.
  if (state == 0) {
    y = y + speed;
    // If, while the state is 0, it reaches the right side of the window, change the state to 1
    // Repeat this same logic for all states!?
    if (y > width-10) {
      y = width-10;
      state = 1;
    }
  } else if (state == 1) {
    x = x + speed;
    if (x > height-10) {
      x = height-10;
      state = 2;
    }
  } else if (state == 2) {
    y = y - speed;
    if (y < 0) {
      y = 0;
      state = 3;
    }
  } else if (state == 3) {
    x = x - speed;
    if (x < 0) {
      x = 0; 
      state=0;
    }
  }

}
