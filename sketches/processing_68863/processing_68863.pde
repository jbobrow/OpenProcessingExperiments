
int xPos;
int yPos;
int xVel;
int yVel;
int xPos1;
int yPos1;
int xVel1;
int yVel1;
int xPos2;
int yPos2;
int xVel2;
int yVel2;
int xPos3;
int yPos3;
int xVel3;
int yVel3;

void setup(){
  background(0, 130, 255);
 size(600, 600);
xPos = 3;
yPos = 4;
xVel = 6;
yVel = 7;
xPos1 =145;
yPos1 = 40;
xVel1 = 6;
yVel1 = 7;
xPos2 =109;
yPos2 = 264;
xVel2 = 7;
yVel2 = 9;
xPos3 =50;
yPos3 = 236;
xVel3 = 6;
yVel3 = 7;
}

void draw(){
  fill(0, 255, 0, 20);
translate(90, 90);
rotate(PI/58);
rect( 0,0, 420, 420);
    smooth();
    strokeWeight(39);
    stroke(random(255));
  quad(xPos, yPos, xPos1, yPos1, xPos2, yPos2, xPos3, yPos3);
xPos += xVel;  
yPos += yVel;
xPos1 += xVel1;
yPos1 += yVel1;
xPos2 += xVel2;
yPos2 += yVel2;
xPos3 += xVel3;
yPos3 += yVel3;

if ((xPos < 0) || (xPos > 420)){
  xVel*=-1;
}
if ((yPos < 0) || (yPos > 420)){
  yVel*=-1;
}
if ((xPos1 < 0) || (xPos1 > 420)){
  xVel1*=-1;
}
if ((yPos1 < 0) || (yPos1 > 420)){
  yVel1*=-1;

}
if ((xPos2 < 0) || (xPos2 > 420)){
  xVel2*=-1;
}
if ((yPos2 < 0) || (yPos2 > 420)){
  yVel2*=-1;
}
if ((xPos3 < 0) || (xPos3 > 420)){
  xVel3*=-1;
}
if ((yPos3 < 0) || (yPos3 > 420)){
  yVel3*=-1;
}}
void mousePressed(){
  background(random(255), random(255), random(255));
}


