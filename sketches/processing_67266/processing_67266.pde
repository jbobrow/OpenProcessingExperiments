
//collision detection thanks to Y. Huang Bootcamp team F
int rA = 20;
int rB = 5;

int ballXa = 100;
int ballYa = 50;
int ballXb = 140;
int ballYb = 15;
int xVelocitya = 5;
int yVelocitya = 5;
int xVelocityb = 7;
int yVelocityb = 5;
 
void setup() {
  size(500,500);
  background(0);
  smooth();
}
 
void draw() {
  background(0);
  noStroke();
  fill(255, 0, 196);
  ellipse(ballXa, ballYa, 2*rA, 2*rA);
  fill(0, 172, 255);
  ellipse(ballXb, ballYb, 2*rB, 2*rB);
   
  ballXa += xVelocitya;
  ballYa += yVelocitya;
 
  ballXb += xVelocityb;
  ballYb += yVelocityb;
   
  if (ballXa >= 500-rA || ballXa <= rA){
   xVelocitya *= -1;
  }
   
  if (ballYa >= 500-rA || ballYa <= rA){
   yVelocitya *= -1;
     
  } 
    
  if (ballXb >= 500-rB || ballXb <= rB){
   xVelocityb *= -1;
  }
   
  if (ballYb >= 500-rB || ballYb <= rB){
   yVelocityb *= -1;
     
  }    
 
  if (dist(ballXa, ballYa, ballXb, ballYb) <= (rA+rB)) {
  xVelocitya *= -1;
  yVelocitya *= -1;
  xVelocityb *= -1;
  yVelocityb *= -1;
  }
 
}


