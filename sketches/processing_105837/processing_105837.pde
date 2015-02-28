
int numBalls=500;
float[] posX = new float[numBalls];
float[] posY = new float[numBalls];
float[] speedX = new float[numBalls];
float[] speedY = new float[numBalls];
float[] radius = new float[numBalls];



void setup() {
  size(600, 600);
  for (int i=0; i< numBalls; i++) {
    posX[i] = int(random(0, width));
    posY[i] = int(random(0, height));
    radius[i] = int(random(10, 30));
    speedX[i]=int(random(1, 5));
    speedY[i]=int(random(1, 5));
  }
}

void draw() {
  background(255);
  for (int i=0; i<numBalls; i++) {
    stroke(255);
    fill(0,90);
    //mouse interact with balls
    float d=dist(mouseX,mouseY,posX[i],posY[i])/10;
    //ellipse(posX[i], posY[i], radius[i], radius[i]);
    ellipse(posX[i], posY[i], d, d);
    moveCircles(i);
    bounceCircles(i);
    gravity(i);
  }
}



void moveCircles(int i) {
  posX[i]+=speedX[i];
  posY[i]+=speedY[i];
}

void bounceCircles(int j) {
  if (posX[j]>width-radius[j]/2) {  
    speedX[j]=speedX[j]*-1;
    posX[j]=width-radius[j]/2;
  }
  if (posX[j]<radius[j]/2) {
    speedX[j]=speedX[j]*-1;
    posX[j]=radius[j]/2;
  }
  if (posY[j]>height-radius[j]/2) {
    speedY[j]=speedY[j]*-0.95;
    posY[j]=height-radius[j]/2;
  }
  if (posY[j]<radius[j]/2) {
    speedY[j]=speedY[j]*-0.9;
    posY[j]=radius[j]/2;
  }
  if ((posX[j]>=height-radius[j]/2)&&(speedY[j]<=0)) {
    posY[j]=height-radius[j]/2;
    speedX[j]=speedX[j]*0.9;
  }
}

void gravity(int k){
  speedY[k]=speedY[k]+0.3;
}
