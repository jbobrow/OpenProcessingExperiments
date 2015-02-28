
int numBalls = 50;

/* Position of the Balls */
float[] xPos = new float[numBalls];
float[] yPos = new float[numBalls];

/* Size of the Balls */
float[] ballSize = new float[numBalls];

/* Speed of the Balls */
float[] speed = new float[numBalls];

/* Color of balls */
float[] r = new float[numBalls];
float[] g = new float[numBalls];
float[] b = new float[numBalls];
float[] alfa = new float[numBalls];

/* The Booleans */
boolean[] isGoingDown = new boolean[numBalls];
boolean[] isGoingRight = new boolean[numBalls];

PImage bg;

void setup() {
  size(600, 380);
  smooth();
  frameRate(25);
  bg = loadImage("bg.jpg");
  
  /* Beginning of the list, where we set each feature of each individual ball */
  for (int i = 0; i < numBalls; i++) {
       xPos[i] = 4*(i+4);
       yPos[i] = 3*(i+3);
       speed[i] = random(10,30);
       r[i] = random(220,255);
       g[i] = random(10,200);
       b[i] = random(50,230);
       alfa[i] = random(150, 255);
       ballSize[i] = (i+2);
       isGoingDown[i] = true;
       isGoingRight[i] = false;
  } 
 }


/*  -  -  -  -  -  -  END OF SETUP -  -  -  -  -  -  -  -  -  -  -  -  */

void draw(){
 image(bg,0,0); 
 
   /* This is where each circle gets drawn for every loop of the DRAW  */
   for (int i = 0; i < numBalls; i++){
 
     //  beginning of X DECISION
     if (xPos[i] + ((ballSize[i])/2) > width) {
        isGoingRight[i] = false;
     }
     if (xPos[i] - ((ballSize[i])/2) < 0) {
        isGoingRight[i] = true; 
     }
     // end of X DECISION
     
     // beginning of X BOUNCE
     if (isGoingRight[i] == true) {
        xPos[i]+=speed[i]; 
     }
       else {
        xPos[i]-=speed[i]; 
       }
     // end of X BOUNCE
     
     //beginning of Y DECISION
     
     if (yPos[i] + ((ballSize[i])/2) > height){
         isGoingDown[i] = false;
     }
     if (yPos[i] - ((ballSize[i])/2) < 0) {
          isGoingDown[i] = true; 
     }
     //end of Y DECISION
     
     // beginning of Y BOUNCE
     if (isGoingDown[i] == true){
        yPos[i] += speed[i]; 
     }
     else {
       yPos[i] -=speed[i];
     }
     
     // end of Y BOUNCE
     fill(r[i],g[i],b[i], alfa[i]);
     ellipse(xPos[i], yPos[i], ballSize[i], ballSize[i]);
     
     
     
   }  
  
}


