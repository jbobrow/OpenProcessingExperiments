
PImage weed;
int numCircles = 1000;
//float gravity = 0.95;

float circleX[] = new float[numCircles];
float circleY[]= new float[numCircles];

float velX[] = new float [numCircles];
float velY[] = new float [numCircles];

void setup() {
  size(300,300);
  smooth();
  noStroke();
  fill(255);
  for(int i=0; i<numCircles; i++) {
  circleX[i] = random(10,width-10);
  circleY[i] = random(10,height-10);
  
  velX[i] = random(1);
  velY[i] = random(1);
  
  }
}

void draw(){
   background(0);
   weed = loadImage("weed.jpg");
   image(weed,0,0);
   for(int i=0; i<numCircles; i++) {
     circleX[i] = circleX[i] + velX[i];
     circleY[i] = circleY[i] +velY[i];
     
     ellipse(circleX[i],circleY[i],1,5);
   }
}

