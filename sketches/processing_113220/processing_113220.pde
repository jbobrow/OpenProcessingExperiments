
int diameter = 10;
int positionX = 50;
int Switch = 0;

void setup() {
  size(200, 200);
}

void draw() {
  background(255);
  if (positionX == width-diameter/2) {
    Switch = 1;
  }
  if (positionX == diameter/2) {
    Switch = 0;
  }
  if (Switch == 0){
    positionX ++;
  }
  else if(Switch == 1){
    positionX--;
  }
  stroke(1);
  fill(175);
  ellipse(positionX, 100, diameter, diameter);
}



