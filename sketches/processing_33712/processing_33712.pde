
int numCircle = 50;
float [] r = new float [numCircle];
float [] g = new float [numCircle];

float [] circleX = new float [numCircle];
float [] circleY = new float [numCircle];
float [] velX = new float [numCircle];
float [] velY = new float [numCircle];


void setup() {

  size(500, 500);
  smooth();
  noStroke();



  for (int i=1; i<numCircle; i++) {
    circleX [i] = random(width);
    circleY [i] = random(height);
    
    velX [i] = random(3);
    velY [i] = random(5);
  }
}



void draw() {  

  background (255, 40, 0);


  for (int i=1; i<numCircle; i++) {
    circleX[i]+=velX[i];
    circleY[i]+=velY[i];

    if ((circleX[i]<0)||(circleX[i]>width)) {
      velX[i]=velX[i]*-0.95; // switch from + to minus
    }

    if ((circleY[i]<0)||(circleY[i]>height)) {
      velY[i]=velY[i]*-0.9;
    }
    
    if ((circleY[i]>height)) {
      r [i] = random(50,255);
      g [i] = random(100,255);

}
      fill(r[i],g[i],150);
          ellipse(circleX[i], circleY[i], i+10, i+10);

}
}

