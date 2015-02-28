
int numberBalls = 10;
//defines ball's coordinates
float centerX [] = new float [numberBalls];
float centerY [] = new float [numberBalls];
//defines "speed"
float speedX [] = new float [numberBalls];
float speedY [] = new float [numberBalls];
//sets color values
float r[] = new float[numberBalls];
float g[] = new float[numberBalls];
float b[] = new float[numberBalls];


void setup() {
  size(400, 400);
  for (int i = 0; i < numberBalls; i++) {
    centerX[i] = random(15, 385);
    centerY[i] = random(15, 385);

    speedX[i] = random(10);
    speedY[i] = random(10);
  }
}

void draw() {
  background(232, 230, 19);

  //if centerX location is greater than or equal to 385, which is the stage width minus radius of the ellipse, then ball will go in the opposite direction, AND change to a random color value
  for (int i = 0; i < numberBalls; i++) {
    //initializes the ball's movement
    centerX [i] = centerX [i] + speedX [i];
    centerY [i] = centerY [i] + speedY [i];

    if (centerX [i] >= 385) {
      speedX [i] = speedX[i] * -1;
      r[i]=random(255);
      g[i]=random(255);
      b[i]=random(255);
    }
    if (centerX [i] <=15) {
      speedX [i] = speedX[i] * -1;
      r[i]=random(255);
      g[i]=random(255);
      b[i]=random(255);
    }  
    if (centerY [i] >= 385) {
      speedY [i] = speedY[i] * -1;
      r[i]=random(255);
      g[i]=random(255);
      b[i]=random(255);
    }
    if (centerY [i] <=15) {
      speedY [i] = speedY[i] * -1;
      r[i]=random(255);
      g[i]=random(255);
      b[i]=random(255);
    }

    noStroke();
    fill(r[i],g[i],b[i]);
    ellipse(centerX [i], centerY[i], 30, 30);
  }
}


