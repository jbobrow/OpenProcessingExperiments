
/*  - Santiago Peraza  -  Array homework!  -  */
 
 PImage space;
 
int numBalls = 100;
float[] xPos= new float[numBalls];
float[] yPos= new float[numBalls];
float[] speed= new float[numBalls];
float[] ballRadius= new float[numBalls];
float[] directionX = new float[numBalls];
float[] directionY = new float[numBalls];


 //--- color values
float[] r= new float[numBalls];
float[] g= new float[numBalls];
float[] b= new float[numBalls];
 
boolean[] isGoingRight=new boolean [numBalls];
boolean[] isGoingDown=new boolean [numBalls];
 
void setup() {
  size(1024, 768);
  frameRate(20);
  smooth();
 
  for (int i =0; i < numBalls; i++) {
    xPos[i] = round(random(ballRadius[i]+100, width-ballRadius[i])-100);
    yPos[i] = round(random(ballRadius[i]+100, height-ballRadius[i]-100));
    speed[i] = random(2, 20);
    directionX[i] = 1;
    directionY[i] = 1;
    r[i] = random(2, 100); 
    g[i] = random(5, 250);
    b[i] = random(190, 200);
    fill(r[i], g[i], b[i]);
    ballRadius[i] = random(3, 25);
  
    
     space = loadImage("space.jpg");
    
  }
 
}
 
void draw() {
  
  background(space);
 
  for (int i= 0; i < numBalls; i++) {
    ellipse(xPos[i], yPos[i], ballRadius[i], ballRadius[i]);
    fill(r[i], g[i], b[i]);
 
  }

for (int i = 0; i < numBalls; i++) {
    //initializes the ball's movement
    xPos [i] = xPos [i] + speed[i]*directionX[i];
    yPos [i] = yPos [i] + speed[i]*directionY[i];
     
     
     if (xPos [i] >= 1024) {
      directionX[i] = -1;
      r[i]=random(255);
      g[i]=random(255);
      b[i]=random(255);
    }
    if (xPos [i] <=25) {
      directionX[i] = 1;
      r[i]=random(255);
      g[i]=random(255);
      b[i]=random(255);
    }
    if (yPos [i] >= 768) {
      directionY[i] = -1;
      r[i]=random(255);
      g[i]=random(255);
      b[i]=random(255);
    }
    if (yPos [i] <=25) {
      directionY[i] = 1;
      r[i]=random(255);
      g[i]=random(255);
      b[i]=random(255);
        
    }
    noStroke();
    fill(r[i], g[i], b[i]);
    ellipse(xPos[i], yPos[i],ballRadius[i],ballRadius[i]);
   
  }
   
}
 

