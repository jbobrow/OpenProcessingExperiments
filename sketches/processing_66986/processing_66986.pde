
//number of balls
int numBalls = 200;
int ballRadius = 3;

float [] ballsX= new float[numBalls]; //x
float [] ballsY= new float[numBalls]; //y
float [] ballSpeed = new float[numBalls]; //speed

//setup
void setup() {
  size(500, 500);
  noStroke();
  background(0);
  smooth();
  frameRate(30);


for(int i = 0; i < numBalls; i++){
    ballsX[i] = random(0, 500); // X location -100 and 50
}

for(int i = 0; i < numBalls; i++){
    ballsY[i] = random(500); //Y location random 0 - 400
}

for(int i = 0; i < numBalls; i++){ 
  ballSpeed[i] = random (5,20); //speed random 
  }
}

void draw() { //draw
  stroke(0);
  background(0);
  fill (mouseX,mouseY,random(255)); 
  ellipseMode(RADIUS);

for (int i = 0; i < numBalls; i++) {
  ellipse(ballsX[i], ballsY[i], ballRadius, ballRadius);

}
for (int i = 0; i <ballsX.length; i++){
  if ((ballsX[i] >= width) || (ballsX[i] <=0)) {
  ballSpeed[i] = ballSpeed[i] * -1; 
    }
   ballsX[i] = ballsX[i] + ballSpeed[i]; 
 
  }

    
}


