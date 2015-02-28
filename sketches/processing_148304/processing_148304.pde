
float[] x = new float[100];
float[] y = new float[100];
float[] speed = new float [100];

float ballX = 10;
float ballY = random(200);
float ballR = 1;
float dX = 5;
float dY = 5;
int points = 0;

void setup() {
 
  size(500, 700);
 background(0);
 stroke(255);
 
 int i = 0;
 while (i < 100) {
 x[i] = random(0, width);
 y[i] = random(0, height);
 speed[i] = random(1, 4);
 i = i + 1;
 }
}

void draw() {
  background(0);
  
  int i = 0;
  while(i < 100) {
   float co = map(speed[i], 1, 5, 100, 255);
   stroke(co);
   strokeWeight(speed[i]);
   point(x[i], y[i]);
  
  x[i] = x[i] - speed[i] / 2;
  if( x[i] < 0) {
     x[i] = width;
  }
  i = i + 1;
  }
  text("HITS: " + points, 20, 20);
  
  float paddleY = mouseY;
  
  strokeWeight(10);
  stroke(255);
  line(width / 2, 0, width / 2, height);
  
  stroke(255);
  strokeWeight(10);
  
  rect(ballX, ballY, 2 * ballR, 2 * ballR);
  
  rect(width - 16, paddleY, 0, 70);
  
  ballX = ballX + dX;
  ballY = ballY + dY;
 
 if (ballX < 0 + ballR) 
   dX = -dX;
   
 if ((ballY <= paddleY + 70) && (ballY >= paddleY) && (ballX == width - 20) || (ballX == width - 19) || (ballX == width - 18) || (ballX == width - 17)) {
   dX = - dX;
   points += 1;
 }
 
 if (ballY > height - ballR)
   dY = - dY;
   
 if (ballY < 0 + ballR)
   dY = - dY;
   
}


 
