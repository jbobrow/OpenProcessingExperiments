
boolean going = false;
 int box1x = 0; 
 int box1y = 0; 
 int box2x =10; 
 int box2y = 0;
int box2size = 50;

int circleX=0;
int circleY=100;
int speed = 1;
int endLegs =10;
void setup() {
  size (200,200);
   smooth();
}

void draw(){
  background (255);
   circleX = circleX + speed;
  if ( circleX > width || circleX < 0) {
      speed = speed * -1; // reverse course
  }
  // Display the circle at x location 
   stroke(0); 
  fill(#FC0022);
  ellipse(circleX,circleY,50,50);

  }
  
  /*
 if (going){ 
circleX = circleX + 1;
 fill(#00D4FC);
 
 }
*/


void mousePressed(){
 fill(#00D4FC);
  rectMode(CORNER);
 rect (box1x,box1y,200,200); // //box1 upper left
// rect (box2x,box2y,50,50); // //box2 upper right
  }

/*
boolean going = false;
 int box1x = 0; 
 int box1y = 0; 
 int box2x; 
 int box2y = 0;
int box2size = 50;

int circleX=0;
int circleY=100;
int speed = 1;
void setup() {
  size (200,200);
}

void draw(){
  background (255);
   circleX = circleX + speed;
  if ( circleX > width || circleX < 0)
      speed = speed * -1; // reverse course
  // Display the circle at x location 
   stroke(0); 
  fill(#FC0022);
  ellipse(circleX,circleY,50,50);
 if (going); 
circleX = circleX + 1;
}


 

*/

//  rectMode(CORNER);
// rect (box1x,box1y,50,50); // //box1 upper left
// rect (box2x,box2y,50,50); // //box2 upper right
  
 

