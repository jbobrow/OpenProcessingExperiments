
int numBalls = 500;
float[]posX=new float[numBalls];
float[]posY=new float[numBalls];
int[]diameter=new int[numBalls];
float[]speedx=new float[numBalls];
float[]speedy=new float[numBalls];
float[]gravity=new float[numBalls];
float[]hue=new float[numBalls];
int[]opacity=new int [numBalls];
float[] d= new float[numBalls];
int [] memory= new int [numBalls];
void setup() {
  size(600, 600);
  colorMode(HSB,width);
  for (int i=0;i<numBalls; i++) {
    posX[i] = int(random(0, width));
    posY[i] = int(random(0, height-200));
    diameter[i] = int(random(5, 50));
    speedx[i]=random(-3, 6);
    speedy[i]=random(-3, 6);
    gravity[i]=random(1,4);
    hue[i]=random(0,255);
    opacity[i]=int(random(0,width));
    memory[i] = opacity[i];   
  }
}

void draw() {
  background(0);
  noStroke();
  for (int i=0; i<numBalls; i++) {
    fill(hue[i],width,width,opacity[i]);
    moveCircle(i);
    bounce(i);
    speedy[i]=speedy[i]+gravity[i];
    d[i]=dist(mouseX, mouseY, posX[i], posY[i]);
    erase(i);
    }
  }

void erase(int i){ 
  if (d[i]<diameter[i]+100){
      opacity[i]=0; 
    }
  else{
  opacity[i]=memory[i];
  }
}

void moveCircle(int i) {
  ellipse(posX[i], posY[i], diameter[i], diameter[i]);
  posX[i]=posX[i]+speedx[i];
  posY[i]=posY[i]+speedy[i];
}


void bounce(int i) {
  if (posX[i]<diameter[i]/2) {
    speedx[i]=-speedx[i];
  }
  if (posX[i]>width-diameter[i]/2) {
    speedx[i]=-speedx[i];
  }
  if (posY[i]<diameter[i]/2) {
    speedy[i]=-speedy[i]*0.97;
  }
  if (posY[i]>height-diameter[i]/2) {
    speedy[i]=-speedy[i]*0.97;
    speedx[i]=speedx[i]*0.97;
  }
  if (posY[i]>=height-diameter[i]/2){
  posY[i]=height-diameter[i]/2;}
  
  if (posY[i]<=diameter[i]/2){
  posY[i]=diameter[i]/2;}
  
  if (posX[i]<=diameter[i]/2){
  posX[i]=diameter[i]/2;}
  
  if (posX[i]>=width-diameter[i]/2){
  posX[i]=width-diameter[i]/2;}
}
  




