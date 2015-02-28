
PVector mos;
PVector lin;

float originX, originY, x, y, r, currAngle, prevAngle;;
float theta = 0;
float rev = TWO_PI/500; //revolution speed in radians

void setup() {
  size(400, 400);
  originX = width/2;
  originY = height/2;
  r = width/2;
  prevAngle = PI;
}

void draw() {
  background(255);
  
  //get cartesian from polar
  x = r * cos(theta);
  y = r * sin(theta);
  
  mos = new PVector(mouseX-originX, mouseY-originY);
  lin = new PVector(x,y);
  
  
  
  //compare angle between two vectors
  currAngle = PVector.angleBetween(mos,lin);
  
  //if it is greater than previous frame, the line is
  //moving away -  reverse the rotation.
  if(currAngle > prevAngle){
   rev *= -1; 
   
  }
  //update previous angle
  prevAngle = currAngle;
  
  //modify angle by rotation amount
  theta += rev;
  
  //draw out line
  drawVector(lin);
  
}

void drawVector(PVector v) {
  pushMatrix();
  translate(originX, originY);
  line(0, 0, v.x, v.y);
  popMatrix();
}

