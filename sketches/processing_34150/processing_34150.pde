
/*Elizabeth Clare
 August 13
 control moving balls with timedelay */
 
float lastSavedTime;
float timeDelay = 2000;
 
int numBalls = 50;
float[]speed =new float[numBalls];
float[]xPos=new float [numBalls]; // position on x axis
float[]yPos=new float [numBalls];//position on y axis
float[] ballSize=new float [numBalls];
boolean[] isGoingRight= new boolean [numBalls];
boolean[] isGoingDown =new boolean [numBalls];
boolean switchDirection= true;

float[] r= new float [numBalls];
int g=500;
int b=10;



void setup () {
  lastSavedTime=millis();
  size (600, 700);
  smooth();

  for (int i=0; i <numBalls; i++) {
    xPos[i]=random(0, width);//all of these are position and spped??
    yPos[i]=random(0, height);
    speed[i]=random(5, -2);
    r[i]=255;
    ballSize[i]=random (10, 50);
    isGoingRight[i] = true;
    isGoingDown[i] = false;
  }
}


void draw() {
  background(0);


  for (int i=0; i<numBalls; i++) {
    if (xPos[i] + ((ballSize[i])/2)>width) {
      isGoingRight[i]=false;////has to bounce after hitting 400
    }
    if (xPos[i] - ((ballSize[i])/2) < 0) {
      isGoingRight[i]=true; ///has to bounce after hitting 0
    }
    if (yPos[i]  + ((ballSize[i])/2) > height) {
      isGoingDown[i]=false;
    }   
    if (yPos[i] - ((ballSize[i])/2)< 0) {
      isGoingDown[i]=true;
    }

    if (isGoingRight[i]==true) {
      xPos[i]+=speed[i];
    }
    else {
      xPos[i]-=speed[i];
    }

    if (isGoingDown[i] == true) {
      yPos[i]+=speed[i];
    }
    else {
      yPos[i]-=speed[i];
    }
    ellipse (xPos[i], yPos[i], ballSize[i], ballSize[i]);
    fill(1, 60, xPos[i], yPos[i]);
  }
  if (millis()-lastSavedTime > timeDelay) {
    switchDirection = true;
}
}
void mouseReleased () {

  for (int i=0; i<numBalls; i++) {
    isGoingRight[i] = ! isGoingRight[i];
    isGoingDown[i] = ! isGoingDown[i];
    
  }
}

