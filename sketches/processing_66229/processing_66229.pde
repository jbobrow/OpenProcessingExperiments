
int ballX = 15;
int ballY = 100;
int xVelocity =3;
int yVelocity =3;


void setup() {
  size(250,250);
  background(200,180,180);
  smooth();
}

void draw() {
  background(200, 180, 180);
  noStroke();
  fill(200, 100, 100, 80);
  ellipse(ballX, ballY, 30, 30);
  
  ballX += xVelocity;
  ballY += yVelocity;

  
  if (ballX >= 235 || ballX <= 15){
   xVelocity *= -1;
  }
  
  if (ballY >= 235 || ballY <= 15){
   yVelocity *= -1;
    
  }  
   

}


