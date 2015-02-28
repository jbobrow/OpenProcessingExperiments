
float ball = 40;
int speed = 4;

float gravity = 0.7;

float r;
float g;
float b;
float a;
float diam;
float x;
float y;

void setup() {  
  size(700, 700);
  background(255);
  smooth();
}

void draw() {

  // random square "snow" background--sourced from schiffmann
  r = random(70, 90);
  g = random(75, 85);
  b = random(200, 225);
  x = random(width);
  y = random(height);
  // values to draw rect
  noStroke();
  fill(r, g, b);
  rect(x, y, 14, 14);

  //gradient bkg

  // gradient bar1
  noStroke();
  fill(120, 160, 200, 75);
  rect(0, 0, 700, 100);

  // gradient bar2
  fill(127, 167, 207, 75);
  rect(0, 100, 700, 100);

  // gradient bar3
  fill(134, 174, 214, 75);
  rect(0, 200, 700, 100);

  // gradient bar4
  fill(143, 181, 221, 75);
  rect(0, 300, 700, 100);

  // gradient bar5
  fill(151, 189, 228, 75);
  rect(0, 400, 700, 100);

  // gradient bar6
  fill(158, 196, 235, 75);
  rect(0, 500, 700, 100);

  // gradient bar7
  fill(165, 204, 242, 75);
  rect(0, 600, 700, 100);


  // gradient bar1
  if (ball >= 1) {
    fill(170, 210, 250);
    rect(0, 0, 700, 100);
  }

  // gradient bar2
  if (ball >=100) {
    fill(170, 210, 250);
    rect(0, 100, 700, 100);
  }

  // gradient bar3
  if (ball >= 200) {
    fill(170, 210, 250);
    rect(0, 200, 700, 100);
  }
  // gradient bar3
  if (ball >= 300) {
    fill(170, 210, 250);
    rect(0, 300, 700, 100);
  }

  // gradient bar4
  if (ball >= 400) {
    fill(170, 210, 250);
    rect(0, 400, 700, 100);
  }

  // gradient bar5 
  if (ball >= 500) {
    fill(170, 210, 250);
    rect(0, 500, 700, 100);
  }


//ball
  noStroke();
  ball = ball + speed + gravity; //represents ball + value
  fill(115, 170, 200);//ball color
  ellipse(100, ball, 50, 50);


  //if the ball gets to the last gradient bar, stoppppp and go back
  if (ball >= 585) {//ball gets to last gradient bar
    //ball bounce
    speed = -4;
  }
}

void keyTyped() {
  ball=40; 
  speed=4;
}


