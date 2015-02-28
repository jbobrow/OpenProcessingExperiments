


int numberBalls = 9500;
float centerX [] = new float [numberBalls];
float centerY [] = new float [numberBalls];
float speedX [] = new float [numberBalls];
float speedY [] = new float [numberBalls];
float r[] = new float[numberBalls];
float g[] = new float[numberBalls];
float b[] = new float[numberBalls];
 
 
void setup() {
  size(800, 800);
  for (int i = 0; i < numberBalls; i++) {
    centerX[i] = random(15,799);
    centerY[i] = random(15,799);
    speedX[i] = random(7);
    speedY[i] = random(7);
  }
}
 
void draw() {
  background(0);
  
  for (int i = 0; i < numberBalls; i++) {
    centerX [i] = centerX [i] + speedX [i];
    centerY [i] = centerY [i] + speedY [i];
 
    if (centerX [i] >= 799) {
      speedX [i] = speedX[i] * -1;
      r[i]=random(255);
      g[i]=random(255);
      b[i]=random(255);
    }
    if (centerX [i] <=1) {
      speedX [i] = speedX[i] * -1;
      r[i]=random(255);
      g[i]=random(255);
      b[i]=random(255);
    } 
    if (centerY [i] >= 799) {
      speedY [i] = speedY[i] * -1;
      r[i]=random(255);
      g[i]=random(255);
      b[i]=random(255);
    }
    if (centerY [i] <=1) {
      speedY [i] = speedY[i] * -1;
      r[i]=random(255);
      g[i]=random(255);
      b[i]=random(255);
    }
 
    noStroke();
    fill(r[i],g[i],b[i]);
    rect(centerX [i], centerY[i], 2, 2);
  }
}

