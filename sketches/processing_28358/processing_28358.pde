
//My version of exercise 5.8 from 'Learning Processing' by Daniel Shiffman
//set variables
boolean move = false;
int circleX = 0;
int circleY = 100;

//set canvas
void setup() {
  size(200,200);
  smooth();
}

//set draw loop
void draw() {
  background(255); //redraw background each time draw loops
  stroke(0); //black outline
  fill(255); //white fill
  ellipse(circleX,circleY,40,40); //draw ellipse
  if (move){
    circleX = circleX + 1; //move circle across the screen if move is true
  }
}

void mousePressed(){ //if mouse is pressed, run this code
  move = !move; //if circle is moving, click stops, and vica versa
}
