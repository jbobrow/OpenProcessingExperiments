
/*
  Bouncing growing square
*/

// Coordinates
int x=0;
int y=0;

// Square size
int sqsize=25;

void setup() {
  size(300, 300);
  background(255);
 // frameRate(60);
}

void draw() {
  strokeWeight(10);
  
  //Draw square
  recta();
  // Move square
  moverecta();
}

void recta() {  
  // -function creating rectangle -declare vatables
  strokeWeight(1);
  //Random color
  randomSeed(millis());
  float x1=random(255);
  float x2=random(255);
  float x3=random(255);
  //Same for stroke and fill to have same
  //color and tail
  stroke(x1, x2, x3);
  fill(x1, x2, x3);
  rect(x, y, sqsize, sqsize);
  //double rect size when in 0,0
  if (x==0 && y==0) {
    sqsize=sqsize*2;
  }
}

void moverecta() {
  // Bouncing rules
  if ( y==0 && x<255) {
    x=x+1;
  }
  else if (x==255 && y<250) {
    y=y+1;
  }
  else if (y==250 && x>0) {
    x=x-1;
  }
  else if (x==0 && y>0) {
    y=y-1;
  }
}



