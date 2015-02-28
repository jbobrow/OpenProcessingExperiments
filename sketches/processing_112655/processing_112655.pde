
int diameter = 10;
int positionY = 50;
int Switch = 0;

void setup() {
  size(400, 400);
}

void draw() {
  background(38, 120, 90);


  if (positionY >= width-diameter/2) {
    Switch = 1;
  }
  if (positionY == diameter/2) {
    Switch = 0;
  }
  if (Switch == 0) {
  //positionX++; 
  positionY=positionY+5;
}
  
  else if (Switch == 1) {
    positionY--;
  }

  ellipse(diameter, diameter, positionY, positionY);
}



