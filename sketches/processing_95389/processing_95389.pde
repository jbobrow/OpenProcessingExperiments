
int numEllipse = 5000; //5000 total ellises can be drawn
int currentEllipse = 0; //starts at 0 ellipses

void setup() {
  size( 500, 500);
  smooth();
  background(0);
}

void draw() {
  circle();
  STARS(mouseX, mouseY);
  drawEyes();
}

void circle() {
  if (mousePressed == true) {
    ellipse(mouseX, mouseY, pmouseX, pmouseY);
  if( currentEllipse < numEllipse - 1) {
    currentEllipse++;
    //put in draw, make if test to make mousedragged work as function
  }
  }
}

void STARS(int x, int y){
  ellipse( x+ 5, y + 40, 7,7);
 ellipse(x + 99, y + 10, 5, 5);
 ellipse (x + 15, y + 25, 6,6);
 ellipse ( x + 66, y + 10, 7, 7);
 ellipse( x + 50, y + 90, 5, 5);
}

void drawEyes() {
  noStroke();
  drawEye(0,400);
  drawEye(100,400);
  drawEye(200,400);
  drawEye(300,400);
  drawEye(400,400);
  drawEye(500,400);
  drawEye(600,400);
  drawEye(700,400);
  drawEye(800,400);
    
 }
  
void drawEye(float minX, float maxX) {
    
   ellipse(map(mouseX,300,500,minX,maxX), map(mouseY,0,600,250,350), 50, 50);
   fill(random(0, 255), random(0, 255), random(0, 255), random(0, 255));
    
}




