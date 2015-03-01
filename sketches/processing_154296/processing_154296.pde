
int state = 0;
int numStars = 1000;
float [] dotX = new float[numStars];
float [] dotY = new float [numStars];
float [] velocity= new float[numStars];
float blackHoleX;
float blackHoleY;
float blackHoleVelocity;
void setup() {
  size (500, 500);
  background(0, 0, 200);
  for (int i =0; i<numStars; i++)
  {
    dotX[i] = random (width);  
    dotY[i]= random (height);
    velocity[i] = random(5) + 1;
  }
  blackHoleX = width/2;
  blackHoleY = height/2;
  blackHoleVelocity = 0.0;
}

void draw() {
  background (255, 0, 200);

  if (state == 0) {
    textSize (32);
    fill (100, 255, 100);
    textAlign(CENTER);
    text ("Push spacebar to start", 250, 350);
  } else if (state == 1) {
    background(0, 0, 255);
    stroke (255, 255, 0);
    strokeWeight(4);
    for (int i =0; i<numStars; i++) {
      point(dotX[i], dotY[i]);
      dotX[i] += velocity[i];
      dotY[i] += velocity[i];
      if (dotX[i] >width )
        dotX[i] = 0;
      if (dotY[i] >height )
        dotY[i] = 0;
    }
    stroke(0); 
    strokeWeight(25);
    point(blackHoleX, blackHoleY);

    for (int i =0; i<numStars; i++)
      if (dist (dotX[i], dotY[i], blackHoleX, blackHoleY)< 75)
      {
        if (dotX[i] > blackHoleX)
          velocity[i] = 0;
        dotX[i]--;
        if (dotX[i] < blackHoleX)

          dotX[i]++;
        if (dotY[i] > blackHoleY)

          dotY[i]--;
        if (dotY[i] < blackHoleY)

          dotY[i]++;
      }
  }
}
void keyPressed() {
  if (state == 0) {
    if (key == ' ') {
      state = 1;
    }
  } else if (state == 1) {
  } else {
  }
}

