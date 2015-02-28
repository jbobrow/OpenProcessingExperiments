
/*
Jenny Hsu
Benjamin Bacon
Creative Computing Section B
6 March 2014

Week 4 Assignment - Motion A
Circular Growth
*/


int x = 0;
int y = 0;
int direction = 1;
float ellipse1;
float ellipse2;

void setup () {
  size(600, 600);
  
  ellipse1 = 100;
  ellipse2 = 200;
  }

void draw() {
  background(255);
  smooth();
  noStroke();
  
  
  if ( mousePressed ) {
    ellipse1 = ellipse1 + 2;
    ellipse2 = ellipse2 - 2;
    
//  if ( ellipse1 > width) {
//    ellipse1 = ellipse1 -1;
//  }
}
  
  fill(random(255), random(255), random(255), 100);
  frameRate(30);
  ellipse(x, 300, ellipse1, ellipse1);
  ellipse(x, 300, ellipse2, ellipse2);
  
  x = x + direction;
  
    if ( x > width ) {
    direction = -1;
  } else if ( x < 0 ) {
    direction = 1;
  }
}


