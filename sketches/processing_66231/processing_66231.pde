
int ballXa = 15;
int ballYa = 100;
int ballXb = 140;
int ballYb = 15;
int xVelocitya = 3;
int yVelocitya = 3;
int xVelocityb = 4;
int yVelocityb = 3;

void setup() {
  size(250,250);
  background(200,180,180);
  smooth();
}

void draw() {
  background(200, 180, 180);
  noStroke();
  fill(200, 100, 100, 80);
  ellipse(ballXa, ballYa, 30, 30);
  ellipse(ballXb, ballYb, 30, 30);
  
  ballXa += xVelocitya;
  ballYa += yVelocitya;

  ballXb += xVelocityb;
  ballYb += yVelocityb;
  
  if (ballXa >= 235 || ballXa <= 15){
   xVelocitya *= -1;
  }
  
  if (ballYa >= 235 || ballYa <= 15){
   yVelocitya *= -1;
    
  }  
   
  if (ballXb >= 235 || ballXb <= 15){
   xVelocityb *= -1;
  }
  
  if (ballYb >= 235 || ballYb <= 15){
   yVelocityb *= -1;
    
  }     

  if (dist(ballXa, ballYa, ballXb, ballYb) <= 30) {
  xVelocitya *= -1;
  yVelocitya *= -1;
  xVelocityb *= -1;
  yVelocityb *= -1;
  }

}


