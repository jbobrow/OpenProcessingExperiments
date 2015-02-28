
int numEllipse = 5000; //5000 total ellises can be drawn
int currentEllipse = 0; //starts at 0 ellipses

void setup() {
  size(500, 500);
  smooth();
  background(0);
  frameRate(30);
  for (int i = 0; i < numEllipse; i++){}
}

void draw() {
  circle();
  
}

void circle() {
  if (mousePressed == true) {
    ellipse(mouseX, mouseY, pmouseX, pmouseY);
  if( currentEllipse < numEllipse - 1) {
    currentEllipse++;
    fill(random(0, 255), random(0, 255), random(0, 255), random(0, 255));//put in draw, make if test to make mousedragged work as function
  }
}
}




