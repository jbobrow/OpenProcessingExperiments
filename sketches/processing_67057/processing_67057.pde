
//Racers
float[] circleX = new float[10];
float[] circleY = new float[10];
float[] yVel = new float[10];

//Unique colors
int[] colorR = new int[10];
int[] colorG = new int[10];
int[] colorB = new int[10];


void setup() {
  size(200, 700);
  smooth();
  frameRate(30);
  stroke(150);
  fill(0);

  for (int i = 0; i < 10; i++) {
    circleX[i] = 15*(i+1);
    circleY[i] = 0;
    yVel[i] = random(1,1.5);
    colorR[i] = (int)random(255);
    colorG[i] = (int)random(255);
    colorB[i] = (int)random(255);
  }
}


void draw() {
  background(255);
  
  for (int i = 0; i < 10; i++) {
    fill(colorR[i], colorG[i], colorB[i]);
    ellipse(circleX[i], circleY[i], 15, 15);
  }
  update();
}

void update() {
  for (int i = 0; i < 10; i++) {
    yVel[i] = yVel[i] + random(-0.4,0.4);
  }

  for (int i = 0; i < 10 ; i++) {
    if (yVel[i] <= 0.2) {
      yVel[i] = random(0.2, 0.4);
    }
    
    circleY[i] = circleY[i]+yVel[i];
    circleX[i] = 15*(i+1);

    if (circleY[i] + 15 >= height) {
      println("Game ends!");
    }
  }
}


