
int numball=10;

float[] posX=new float[numball];
float[] posY=new float[numball];
float[] xSpeed=new float[numball];
float[] ySpeed=new float[numball];
float[] red=new float[numball];
float[] green=new float[numball];
float[] blue=new float[numball];

void setup() {
  size(400, 400);
  background(120);
  for (int i=0; i<numball; i++) {
    posX[i]=random(40, width-40);
    posY[i]=random(40, height-40);
    xSpeed[i]=random(-10, 10);
    ySpeed[i]=random(-10, 10);
    red[i]=random(0,255);
    green[i]=random(0,255);
    blue[i]=random(0,255);
  }
  noStroke();
  }

void draw() {
  background(150);
  
  for (int i=0; i<numball; i++) {
    fill(red[i],green[i],blue[i]);
    ellipse(posX[i], posY[i], 40, 40);
    if (posX[i]>=width-20||posX[i]<=20) {
      xSpeed[i]=-xSpeed[i];
      red[i]=random(0,255);
      green[i]=random(0,255);
      blue[i]=random(0,255);
    }
    
    if (posY[i]>=height-20||posY[i]<=20) {
      ySpeed[i]=-ySpeed[i];
      red[i]=random(0,255);
      green[i]=random(0,255);
      blue[i]=random(0,255);
    }
    
      posY[i]=posY[i]+ySpeed[i];
      posX[i]=posX[i]+xSpeed[i];
 
  }
}
