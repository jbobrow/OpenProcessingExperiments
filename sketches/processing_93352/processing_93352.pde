
float positionX;
float positionY;
float sizeX;
float sizeY;
float snapX;
float snapY;
float snapRadius;
float distance;

void setup() {
  positionX = mouseX;
  positionY = mouseY;
  sizeX = 100;
  sizeY = 100;
  snapRadius = 400; //play with this one for ultra max super time fun!
  snapX = 100;
  snapY = 300;
  size(800, 600);
  background(#FFFFFF);
}

void draw() {
  background(#FFFFFF);
  // drawing rect
  fill(#FFFFFF);
  rectMode(CENTER);
  rect(positionX, positionY, sizeX, sizeY);
  
  // setting distance and snapping:
  distance = dist(mouseX, mouseY, snapX, snapY);
  if (distance < (snapRadius/2)) {
    positionX = snapX;
    positionY = snapY;
  } 
  else {
    positionX = mouseX;
    positionY = mouseY;
  }

  // just for visuals:
  //snapradius circle
  fill(#060606, 100);
  ellipse(snapX, snapY, snapRadius, snapRadius);

  //snappoint circle
  fill(#000000, 255);
  ellipse(snapX, snapY, 10, 10);
}


