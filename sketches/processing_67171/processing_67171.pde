
int numRacers = 4;
//int numObstacles = 1;
float[] racerX = new float[numRacers];
float[] racerY = new float[numRacers];
float[] yVel = new float[numRacers];
float[] yAcc = new float[numRacers];
//float[] obstacleX = new float[numObstacles];
//float[] obstacleY = new float[numObstacles];
//float[] obstacleV = new float[numObstacles];
color[] racers = {#F6F792,#77C4D3,#DAEDE2,#EA2E49};
boolean game = false;

void setup() {
  size(500, 1000);
  smooth();
  frameRate(30);
  noStroke();
  background(255);
  fill(0);
  textAlign(CENTER);
  text("READY?", width/2,height/2);
  for (int i = 0;i < numRacers;i++) {
    racerX[i]=100+i*100;
    racerY[i]=height-10;
    yVel[i]=0;
    //      for (int p = 0;p < numObstacles;p++) {
    //      obstacleX[p]=0;
    //      obstacleY[p]=random(height/4,height*3/4);
    //    }
  }
}

void draw() {
  int m = millis();
  if (!game && m >4500) {
    if (m < 6000) {
      background(255);
      fill(0);
      textAlign(CENTER);
      text("THREE", width/2,height/2);
    }
    else if (m < 7000) {
      background(255);
      fill(0);
      textAlign(CENTER);
      text("TWO", width/2,height/2);
    }
    else if (m < 8000) {
      background(255);
      fill(0);
      textAlign(CENTER);
      text("ONE", width/2,height/2);
    }
    else if (m < 8500) {
      background(255);
      fill(0);
      textAlign(CENTER);
      text("GO!", width/2,height/2);
    }
    else if (m >= 8500) {
      background(255);
      fill(0);
      textAlign(CENTER);
      text("GO!", width/2,height/2);
      game = true;
    }
  }
  if (game) {
    background(0);
    for (int i = 0; i < numRacers; i++) {
      fill(racers[i]);
      ellipse(racerX[i], racerY[i], 20, 20);
      //      for (int p = 0; p < numObstacles; p++) {
      //        ellipse(obstacleX[p], obstacleY[p], 10, 10);
      //      }
    }
    racing();
  }
}

void racing() {
  for (int i = 0; i < numRacers;i++) {
    yAcc[i] = random(-0.25, 0);
    racerY[i] = racerY[i] + yVel[i];
    yVel[i] = yVel[i] + yAcc[i];
    //    for (int p = 0; p < numObstacles;i++) {
    //      obstacleX[p] = obstacleX[p] + random(0,3);
    //      for (int t = 0; t < i*p; t++) {
    //        float[] col = {dist(obstacleX[p],obstacleY[p],racerX[i],racerY[i])};
    //        if (col[t] <= 15) {
    //          obstacleX[p] = 0;
    //        }
    //      }
    //    }
  }
}


