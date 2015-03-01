
int state = 0;
int numStars =500;
float[] dotX = new float [numStars];
float[] dotY = new float [numStars];
float[] velocity = new float [numStars];

float blackHoleX;
float blackHoleY;
float blackHoleVelocity;
void setup() {
  size (700, 700);
  background(255, 0, 200);
  for (int i=0; i<numStars; i++) {
    dotX[i] =0;
    dotY[i] =random(height);
    velocity[i] =random(5);
  }
  
  blackHoleX =width/2;
  blackHoleY = height/2;
  blackHoleVelocity =0.0;
}
void draw() {
  if (state ==0) {
    background(255, 0, 200);
    textSize(32);
    textAlign(CENTER);
    text("press space bar to begin", 20, 20);
  } else if (state ==1) {
    background(255, 0, 200);

    stroke(56);
    strokeWeight(5);
    for (int i=0; i<numStars; i++) {
      point(dotX[i], dotY[i]);

      dotX[i] += velocity[i];
      if (dotX[i] >width) {
        dotX[i] = 0;
      }
    }
    
    //draw the blackHole
    stroke (0);
    strokeWeight(25);
    point(blackHoleX, blackHoleY);
    
    for (int i=0; i<numStars; i++) {
    if (dist(dotX[i], dotY[i], blackHoleX, blackHoleY) < 75) {
        dotX[i]=blackHoleX;
        dotY[i]=blackHoleY;
      }
    }
  } else {
  }
}
void keyPressed() {
  if (state ==0) {
    if (key ==' ') {
      state=1;
    }
  } else if (state ==1) {
  } else {
  }
}

