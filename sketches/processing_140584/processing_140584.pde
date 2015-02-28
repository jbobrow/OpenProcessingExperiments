

// based on this example:
//   http://rorys.webfactional.com/creative-computing/2014-spring/week04_motion_07.pde
// from here:
//   http://rorys.webfactional.com/creative-computing/2014-spring/week04.html

int x = 0;
int direction = 1;

int s = 100;

int num = 1;

void setup() {
  size(600, 600);
  smooth();
  stroke(50, 50, 150);
  fill(200, 200, 255);

  // uncomment this to slow down the frame rate:
  // frameRate(10);
}

void draw() {
  //background(255);

  // uncomment this to see the values
  // println(x);

  int i = 0;
  while ( i < num ) {
    ellipse(x, 300 + 10*i, s, s);  
    i = i + 1;
  }
  
  num = num + 1;

  // change the 1 to other numbers to speed up or slow down:  
  x = x + direction;

  s = s + 1;
  
  if ( x > width ) {
    direction = -1;
  } 
  else if ( x < 0 ) {
    direction = 1;
  }
}
