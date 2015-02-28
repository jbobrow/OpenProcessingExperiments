
//variables
//Ball Size
int xBall = 30;
int yBall = 30;
 
//position of BallA
int xPosA = 150;
int yPosA = 150;
 
//position of BallB
int xPosB = 250;
int yPosB = 150;
 
 //position of BallC
int xPosC = 250;
int yPosC = 250;

//position of BallD
int xPosD = 150;
int yPosD = 250;

//speed of the balls
int xVelA=-1;
int yVelA=-1;
int xVelB=1;
int yVelB=-1;
int xVelC=1;
int yVelC=1;
int xVelD=-1;
int yVelD=1;

//colour of the balls
color A = color(255,0,200);
color B = color(255,0,200);
color C = color(255,0,200);
color D = color(255,0,200);

void setup() {
  size(400,400);
    background(255);
}

void draw() {

  // BallA
  fill(A); // the color is changed depends to which colour is set when a certain function is met
  ellipse(xPosA,yPosA,xBall,yBall);
  //BallB
  fill(B);
  ellipse(xPosB,yPosB,xBall,yBall);
   //BallC
  fill(C);
  ellipse(xPosC,yPosC,xBall,yBall);
  //BallD
  fill(D);
  ellipse(xPosD,yPosD,xBall,yBall);
  
  //positon of the ball is the positon of x and y of each balls + the speed
  xPosA=xPosA+xVelA;
  yPosA=yPosA+yVelA;
   
  xPosB=xPosB+xVelB;
  yPosB=yPosB+yVelB;
  
  xPosC=xPosC+xVelC;
  yPosC=yPosC+yVelC;
  
  xPosD=xPosD+xVelD;
  yPosD=yPosD+yVelD;
  
 //if posx and y is more than width of the screen and/ or if the pos is 
 //less than the half the size of the ball  then the velocity becomes negative
 //which therefore makes the balls go the opposite way (bounce)
  if (xPosA>width||xPosA<xBall/2) {
    xVelA=xVelA*-1;
  }
  if (yPosA>height||yPosA<xBall/2) {
    yVelA=yVelA*-1;
  }
  if (xPosB>width||xPosB<xBall/2) {
    xVelB=xVelB*-1;
  }
  if (yPosB>height||yPosB<xBall/2) {
    yVelB=yVelB*-1;
  }
  if (xPosC>width||xPosC<xBall/2) {
    xVelC=xVelC*-1;
  }
  if (yPosC>height||yPosC<xBall/2) {
    yVelC=yVelC*-1;
  }
  if (xPosD>width||xPosD<xBall/2) {
    xVelD=xVelD*-1;
  }
   if (yPosD>height||yPosD<xBall/2) {
    yVelD=yVelD*-1;
  }
   
  //Ball Collision
  //if pos stated are less than 30 distance from each other then
  //the velocity is multiplied by negative 2 which makes it go backwards.
  //this causes the balls to bounce from each other
  if (dist(xPosA,yPosA,xPosB,yPosB)<=30){
    xVelA=xVelA-2*xVelA;
    yVelA=yVelA-2*yVelA;
    xVelB=xVelB-2*xVelB;
    yVelB=yVelB-2*yVelB;
  }
    if (dist(xPosA,yPosA,xPosB,yPosB)<=30){
    A = color (255,0,0);//if the distance is what is stated then
                        // the colour of a ball changes 
    }
  if (dist(xPosA,yPosA,xPosC,yPosC)<=30){
    xVelA=xVelA-2*xVelA;
    yVelA=yVelA-2*yVelA;
    xVelC=xVelC-2*xVelC;
    yVelC=yVelC-2*yVelC;
  }
   if (dist(xPosA,yPosA,xPosC,yPosC)<=30){
    C = color (0,255,0);
  }
    if (dist(xPosB,yPosB,xPosC,yPosC)<=30){
    xVelB=xVelB-2*xVelB;
    yVelB=yVelB-2*yVelB;
    xVelC=xVelC-2*xVelC;
    yVelC=yVelC-2*yVelC;
  }
    if (dist(xPosB,yPosB,xPosC,yPosC)<=30){
   B = color (0,0,255);
  }
    if (dist(xPosA,yPosA,xPosD,yPosD)<=30){
    xVelA=xVelA-2*xVelA;
    yVelA=yVelA-2*yVelA;
    xVelD=xVelD-2*xVelD;
    yVelD=yVelD-2*yVelD;
  }
    if (dist(xPosA,yPosA,xPosD,yPosD)<=30){
   D = color (255, 243, 3);
  }
    if (dist(xPosB,yPosB,xPosD,yPosD)<=30){
 background (0);
  }
    if (dist(xPosC,yPosC,xPosD,yPosD)<=30){
    xVelC=xVelC-2*xVelC;
    yVelC=yVelC-2*yVelC;
    xVelD=xVelD-2*xVelD;
    yVelD=yVelD-2*yVelD;
  }
 } 
// REF - http://www.openprocessing.org/sketch/66284


