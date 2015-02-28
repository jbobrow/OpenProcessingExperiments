
// Collision Detection and Timeout 
int shapes = 1000;
float[]speedX = new float[shapes];
float[]speedY = new float[shapes];
float[]x = new float[shapes];
float[]y = new float[shapes];
float[]w = new float[shapes];
float[]h = new float[shapes];
color[]colors = new color[shapes];
int timeLimit = 155555;
void setup() {
  size(650, 650);
  frameRate(30);
  noStroke();
  // fill arrays will random values
  for (int i=0; i<shapes; i++) {
    x[i]=random(width/2,width/2);
    y[i]=random(height/2,height/2);
    w[i]=random(1, 5);
    h[i]=w[i];
    colors[i]=color(random(255), random(255), random(255));
    speedX[i] = random(-4, 7);
    speedY[i] = random(-4,7);
  }
}
void draw() {
  fill(255, 40);
rect(0, 0, width, height);
  for (int i=0; i<shapes; i++) {
    fill(colors[i]);

    rect(x[i], y[i], w[i], h[i]);
    x[i]+=speedX[i];
    y[i]+=speedY[i];
    // check display window edge collisions
   
    if (x[i] > width-w[i]) {
      x[i] = width-w[i];
      speedX[i]*=-random(-3,3)+1;
      if (speedX[i]==0)
        speedX[i]=1;
    }
     if (x[i] < 0) {
      x[i] = 0;
      speedX[i]*=-random(-3,3)+1;
      if (speedX[i]==0)
      speedX[i]=1;
    }
    else if (y[i] > height-h[i]) {
      y[i] = height-h[i];
      speedY[i]*=-random(-3,3)+1;
    }
    else if (y[i] < 0) {
      y[i] = 0;
      speedY[i]*=-random(-3,3)+1;
    }
  }
  // stop draw when timelimit reached
  if (millis() >= timeLimit*10000) {
    noLoop();
  }
}

