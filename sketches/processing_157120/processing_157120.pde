
int ballCount=200;
float[] circleX = new float [ballCount];
float[] circleY = new float [ballCount];
float gravity;
float[] speedY = new float[ballCount];
float diam=10;

void setup() {
  size(700, 700);

  for (int i=0; i<ballCount; i++) {
    circleX[i]=random(diam/2, width-diam/2);
    circleY[i]=random(-1000, 0);
    speedY[i]=50;
  }

  gravity=0.1;
}

void draw() {
  
  
//  for (int i=0; i<ballCount - 1; i++) {
//    circleX[i] = circleX[i+1];
//    circleY[i] = circleY[i+1];
//  }
//
//  circleX[ballCount-1]=circleX;
//  circleY[ballCount-1]=circleY;

  float brightness = map(sin(frameCount/3),-1, 1, 1, 2);
  background((125*brightness/random(1,10)),(125*brightness/random(1,10)),(125*brightness/random(1,10)));
  
  noStroke();
  fill(random(255), random(255), random(255));
  for (int i=0; i<ballCount; i++) {
    circleY[i] += speedY[i];
    speedY[i] += gravity;
    ellipse(circleX[i], circleY[i], 2, diam);

    if (circleY[i]>height) {
      circleY[i]=random(-500, 0);
      gravity=0;
      
    }
  }
}



