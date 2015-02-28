
float xPos; //ball x
float yPos; //ball y
float x2Pos; //ball x
float y2Pos; //ball y
float xMDist; 
float yMDist;
int xRad = 30;
int yRad = 30;
float xSpeed = 4;
float ySpeed = 5;
float x2Speed = 4;
float y2Speed = 5;

void setup (){
  size (800, 500); //frame size
  yPos = 50;
  xPos = 150;
  y2Pos = 150;
  x2Pos = 250;
}

void draw (){ //begins draw function
  background (0);
  frameRate (60);
  colorMode(HSB, 360, 100, 100);
  float h = random(0, 300);
  float h2 = random(0, 300);
  h = (h + 1) % 200;
  h2 = (h2 + 1) % 200;
  float s = random(1, 5);
  yPos = yPos+ySpeed;
  xPos = xPos+xSpeed;
  y2Pos = y2Pos+y2Speed;
  x2Pos = x2Pos+x2Speed;
  xMDist = xPos - mouseX;
  yMDist = yPos - mouseY;
  ellipse (xPos, yPos, xRad, yRad);
 
  ellipse (x2Pos, y2Pos, xRad, yRad);
  
if ( (yPos+yRad >= height) ||(yPos-yRad <= 0) ) {
  ySpeed = ySpeed * -1;
    fill(h, 90, 90);
}
if ( (y2Pos+yRad >= height) ||(y2Pos-yRad <= 0)) {
  y2Speed = y2Speed * -1;
    fill(h2, 90, 90);
}
//if ( yPos > 300 ) {
 // ySpeed = ySpeed * 0.01;
 // xSpeed = xSpeed * 0.01;
//}

if ( (xPos+xRad >= width) || (xPos-xRad <= 0) ) {
  xSpeed = xSpeed * -1;
  fill(h, 90, 90);
}
if ( (x2Pos+xRad >= height) ||(x2Pos-xRad <= 0)) {
  x2Speed = x2Speed * -1;
    fill(h2, 90, 90);
}

//if ( xMDist < 15 ) {
 //  xSpeed = s;
 //  ySpeed = s;
 //  xSpeed = xSpeed * -1;
  //  ySpeed = ySpeed * -1;
 //}
}




