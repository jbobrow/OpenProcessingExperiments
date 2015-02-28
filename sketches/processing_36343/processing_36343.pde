


int movementx;
int movementy;
int directionx;
int directiony;

void setup(){
  size(600,600);
  movementx = 50;
  movementy = 200;
  directionx = 1;
  directiony = 1;
}

void draw(){
  background(229,207,37);
  movementx+= directionx;
  movementy+= directiony;
  ellipse(movementx,movementy,100,100);
  fill(142,37,229);
  println(movementx);
  if(movementy > 550){
    directiony = -1;
  }
  if(movementx > 550){
    directionx = -1;
  }
  if(movementy < 50){
    directiony = 1;
  }
  if(movementx < 50){
    directionx = 1;
  }
}

