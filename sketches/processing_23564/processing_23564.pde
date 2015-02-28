
int circleX = 70;//this is where we are declaring and initialising our global variables
int circleY = 20; // you can now change these variables easily and move the circle around


void setup(){
  size(100,100);// define initial conditions of the sketch
}


void draw (){
  background(255);// draw apparance of the sketch
  ellipse (circleX, circleY,20,20); // draw cicle with variables in there
  ellipse (circleX,circleY,10,10);
}

