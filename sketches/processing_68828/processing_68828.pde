
/*-----------------------------------------------------------------------------
 TP2 - Travail de rattrapage (Oeil)
 Par Joel Lalancette
 EDM4600
 -----------------------------------------------------------------------------*/
float x, y, xCiblee, yCiblee;
float d = 100;
float pupilleD = 30;
float facteur = 0.1;

void setup() {
  size(400,400);
    smooth();
}
  void draw() {
    background(0);
    
float radians = atan2(yCiblee-y,xCiblee-x);
float distance = dist(x,y,xCiblee,yCiblee);
x = (xCiblee - x) * facteur + x;
y = (yCiblee - y) * facteur + y;

radians = atan2(mouseY-y,mouseX-x);
distance = dist(mouseX,mouseY,x,y);

distance = constrain(distance,0,d/2 - pupilleD/2);

float pupilleX = cos(radians)* distance + x;
float pupilleY = sin(radians)* distance + y;

fill(255);
ellipse(x,y,d,d);
fill(0);
ellipse(pupilleX,pupilleY,pupilleD,pupilleD);

  }
  
void mousePressed() {
  xCiblee = mouseX;
  yCiblee = mouseY;
  
}

