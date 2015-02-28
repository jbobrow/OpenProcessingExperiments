
int numBalls = 10;
float[] xPos = new float[numBalls]; //ball x
float[] yPos = new float[numBalls]; //ball y

float xMDist; 
float yMDist;
float[] rad = new float[numBalls];
float[] xSpeed = new float[numBalls];
float[] ySpeed = new float[numBalls];


void setup (){
  size (800, 800); //frame size
  for (int ballStart = 0; ballStart < numBalls; numBalls++){
   xPos[ballStart] = 1.2*ballStart;
   yPos[ballStart] = (height/numBalls)*ballStart;
 
   rad[ballStart] = 50*(1/numBalls); 
  }
  
}

void draw (){ //begins draw function
  background (0);
  frameRate (60);
  
  
  for(int ball = 0; ball < numBalls; ball++){
    yPos[ball] = yPos[ball]+ySpeed[ball];
    xPos[ball] = xPos[ball]+xSpeed[ball];
    ellipse (xPos[ball], yPos[ball], rad[ball],rad[ball]);
    if ( (yPos[ball]+rad[ball] >= height) ||(yPos[ball]-rad[ball] <= 0) ) {
      ySpeed[ball] = ySpeed[ball] * -1;
        //fill(h, 90, 90);
      }
    if ( (xPos[ball]+rad[ball] >= width) || (xPos[ball]-rad[ball] <= 0) ) {
      xSpeed[ball] = xSpeed[ball] * -1;
      //fill(h, 90, 90);
    }
  }
}

//colorMode(HSB, 360, 100, 100);
 // float h = random(0, 300);
 // float h2 = random(0, 300);
 // h = (h + 1) % 200;
 // h2 = (h2 + 1) % 200;


