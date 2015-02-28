
PImage space; 
 
 //-----------------//
 
 float x;
float y;
float easing = 0.05;
 
 //-------------------//
 
 int num = 60;
float mx[] = new float[num];
float my[] = new float[num];
 
 //-------------------//
 
int numBalls = 70;
float[] xPos= new float[numBalls];
float[] yPos= new float[numBalls];
float[] speed= new float[numBalls];
float[] ballRadius= new float[numBalls];
 
//--- color values-------//

float[] r= new float[numBalls];
float[] g= new float[numBalls];
float[] b= new float[numBalls];
  
boolean[] isGoingRight=new boolean [numBalls];
boolean[] isGoingDown=new boolean [numBalls];
 
 //'------------------------------------------------//
 
void setup() {
  
  size(800, 533);
  frameRate(40);
  smooth();
 
  // xPos[0] = 4;
  // xPos[1] = 8;
  // xPos[2] = 12;
 
  for (int i =0; i < numBalls; i++) {
    xPos[i] = round(random(ballRadius[i], width-ballRadius[i]));
    yPos[i] = round(random(ballRadius[i], height-ballRadius[i]));
    speed[i] = random(2, 20);
    r[i] = random(2, 100); //<--random must be a float at top!!!
    g[i] = random(5, 250);
    b[i] = random(190, 200);
    fill(r[i], g[i], b[i]);
    ballRadius[i] = random(7, 40);
    isGoingRight[i] = true;
    isGoingDown[i] = false;
    
    space = loadImage("Yayoi.jpg");
  }
 
  //yPos[0] = 60;
  //yPos[1] = 120;
  //yPos[2] = 360;
 
  // speed[0] = 2;
  // speed[1] = 5;
  // speed[2] = 8;

}
 
 //-------------------------------------------------//
 
void draw() {

  background(space); 
  
 
 //--Storing Input--//
 
 int which = frameCount % num;
  mx[which] = mouseX;
  my[which] = mouseY;
  
   fill(255, 0, 0);
  for (int i = 0; i < num; i++) {
    int index = (which+1 + i) % num;
    ellipse(mx[index], my[index], i, i);
  }
 
 //------Easing.------//
 
 fill(255);
 float targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  
  float targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
  
  ellipse(x, y, 66, 66);
 
 //----bouncing balls---//
 
  for (int i= 0; i < numBalls; i++) {
    ellipse(xPos[i], yPos[i], ballRadius[i], ballRadius[i]);
    fill(r[i], g[i], b[i]);
 
 
    //for X
    //x-right side
    if (xPos[i] + ((ballRadius[i])/2) > width) {
      isGoingRight[i]=false;
    }
    //x-left side
    if (xPos[i] - ((ballRadius[i])/2) < 0) {
      isGoingRight[i]=true;
    }
 
    if (isGoingRight[i] == true) {
      xPos[i]+=speed[i];
    }
 
    else {
      xPos[i]-=speed[i];
    }
 
 
    //for Y
    //y-bottom side
    if (yPos[i] + ((ballRadius[i])/2) > height) {
      isGoingDown[i]=false;
    }
    //y-top side
    if (yPos[i] - ((ballRadius[i])/2) < 0) {
      isGoingDown[i]=true;
    }
 
    if (isGoingDown[i] == true) {
      yPos[i]+=speed[i];
    }
    else {
      yPos[i]-=speed[i];
    }
    
 
  }
}
 


