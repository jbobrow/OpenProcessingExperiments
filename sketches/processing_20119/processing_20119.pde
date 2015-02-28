
int pX;
int pY;
int mX;
int mY;
int rand;
color colorVar;
int ang;

void setup() {
  size(300, 600);
  colorMode(HSB,100);
  background(0);
  smooth();
  pX = width/2;
  pY = height/2;
}

void draw() {
  if (mouseX==0 && mouseY==0) {
     mouseX = width/2;
     mouseY = width/2;
   }
 
  drawBez(1, 3, 200, 200, 200, 200); 
}

void mousePressed(){
   pX = mouseX;
   pY = mouseY;
}


void mouseReleased(){
  fill(0, 5);
  rect(0, 0, width, height);
  save("offf.png");
}

void drawBez(int sW, int speed, int control1X, int control1Y, int control2X, int control2Y) {

  mX = mouseX;
  mY = mouseY;

  noFill();
  stroke(random(50, 100),100,100,75); 
  stroke(50,100,100,75); 
  
  //this does the Math for finding the points around a circle.
  //I found This Math at http://processing.org/learning/trig/
  //radX = Center of Circle X + cos(radians(ang)) * Size of the Circle
  //radY = Center of Circle Y + sin(radians(ang)) * Size of the Circle
  float radX = mouseX + cos(radians(ang)) * control1X;
  float radY = mouseY + sin(radians(ang)) * control1Y;
  
  float handX = 50 + cos(radians(ang)) * 25;
  float handY = width/2  + sin(radians(ang)) * 25;
  
  float radX2 = width/2 + cos(radians(ang)) * control2X;
  float radY2 = height/2 + sin(radians(ang)) * control2Y;
  
  
  bezier(pX, pY, radX2, radY2, radX, radY, mouseX,mouseY);
  ang = ang + speed;
  
  noStroke();
  fill(0,2);
  rect(0, 0, width, height);
}


