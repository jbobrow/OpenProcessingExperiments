
int numCircles=100;
float gravity= 0.95;

float circleX[] = new float[numCircles];
float circleY[] = new float[numCircles];

float velX[] = new float [numCircles];
float velY[] = new float [numCircles];

void setup() {
  size(500,500);
  smooth();
  noStroke();
  fill(255);
  for(int i=0; i<numCircles; i++) {
  circleX[i] = random(10,width-10);
  circleY[i] = random(10,height-10);

  velX[i] = random(3);
  velY[i] = random(5);
  
  
  }
}

void draw() {
  background(121,181,200);
  
  for(int i=0; i<numCircles; i++) {

    circleX[i] = circleX[i] +velX[i];
    circleY[i] = circleY[i] +velY[i];

    if((circleX[i] <= 10)||(circleX[i]>=width-10)) {
      velX[i] = velX[i] * -1;
    }

    if(circleY[i] <= 10) {
      velY[i] = velY[i] * -1;
    }
    
    if(circleY[i]>=height-10) {
      velY[i] = velY[i] * -0.95;
    }
    ellipse(circleX[i],circleY[i],10,10);
  }
}

