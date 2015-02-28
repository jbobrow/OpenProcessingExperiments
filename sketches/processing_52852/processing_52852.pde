
// Class assignment
// Feb 3, 2012

int circleX;
int circleY;
float b;
float a;
float n;
int circleSize;
int radius;
int mouseX;
int mouseY;
int x;
int y;
float t;


void setup () {
  smooth();
  size(500, 600);
  background(255, 220, 88);
  // x=1;
  b=75;
  n=2;
  a=200;
  t=2;
  circleSize=150;
  radius = 0;
}

void draw() {
  background(255, 220, 88);
  strokeWeight(9);
  //stroke(255, 227, 88);

  //ball_2
  a=a+t;
  b=b+n;
  n=n+1.07; //makes it incrimentally faster as it falls
  t=0; //makes it relative but doesn't change speed


  stroke(88, 200, 255);
  ellipse(a, b, circleSize, circleSize);

  if (b > height-175) {
    n=n*-.925; //makes it not increase to the height of the screen
  }
  if (b >=height-180) { //this block creates the illusion of flattening when the "ground" is approached/hit
    ellipse(a, b, circleSize+20, circleSize-20);
    if (b >=height-200) {
      ellipse(a, b, circleSize+25, circleSize-25);
      if (b >= height-250) {
        ellipse(a, b, circleSize+30, circleSize-30);
        if (b >=height-300) {
          ellipse(a, b, circleSize+35, circleSize-35);
        }
      }
    }
  }

  if (keyPressed) { //this block makes the ball shoot up higher if w is pressed
    if (key == 'w') {
      b = b - 3;
    }
    else if (key == 's') { //slows the ball down and pushes it past the lowest point (squishes it)
      b = b + 3;
    }

    if (keyPressed) { //moves bouncing ball left
      if (key == 'a') {
        a = a - 3;
      }
      else if (key == 'd') { //moves bouncing ball right
        a = a + 3;
      }
    }
  }
}


