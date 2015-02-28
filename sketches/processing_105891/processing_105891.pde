

int numBalls = 200;

int[] ballPosX = new int[numBalls];
int[] ballPosY = new int[numBalls];
//int[] speedX = new int[numBalls]; 
//int[] speedY = new int[numBalls]; 
int[] ballColor = new int[numBalls];
int[] opacity = new int[numBalls]; 
int i;
int space = 40; 

void setup(){
  size(600,600);
  noStroke();
  ellipseMode(CENTER);

 for (int i = 0; i < numBalls; i++) {
    ballPosX[i] = int(random(0, width));
    ballPosY[i] = int(random(0, height));
    ballColor[i] = int(random(0, 255));
    opacity[i] = int(random(20,40));
    
    // speedX[i] = int(random(2, 10));
   // speedY[i] = int(random(2, 10));
  }}

void draw(){
  background(252,229,253);
 
  
  for (int i = 0; i < numBalls; i++) {
    fill(ballColor[i], 200, 255, opacity[i]);
    ellipse(ballPosX[i], ballPosY[i], i, i);
  }

 { 
  for (int i = 0; i < numBalls; i++) {
    if (dist(mouseX, mouseY, ballPosX[i], ballPosY[i]) < space) {
          ballPosX[i] = mouseX;
          ballPosY[i] = mouseY;
        } 
  }
    }}
  



