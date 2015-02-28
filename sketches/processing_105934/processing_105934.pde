
int numCircles = 3;
float[] circleX = new float [numCircles];
float[] circleY = new float [numCircles];
float[] color1 = new float [numCircles];
float[] xSpeed = new float[numCircles];
float[] ySpeed = new float[numCircles];


void setup() {
  size(500, 500);
  smooth();
  noStroke();

  for (int i = 0; i < numCircles; i++) {
    circleX[i] = random(width);
    circleY[i] = random(height);
    xSpeed[i] = random(1, 5);
    ySpeed[i] = random(1, 5);
  }
}
void draw() {
  background(255);
  for (int i = 0; i < numCircles; i++) {
    fill(random(255), random(255), random(255), 200);
    ellipse(circleX[i], circleY[i], 5, 5);

    if (circleX[i]>=width-20||circleX[i]<=20) {
      xSpeed[i]=-xSpeed[i];
      color1[i]=random(0, 255);
    }

    if (circleY[i]>=height-20||circleY[i]<=20) {
      ySpeed[i]=-ySpeed[i];
      color1[i]=random(0, 255);
    }

    circleY[i]=circleY[i]+ySpeed[i];
    circleX[i]=circleX[i]+xSpeed[i];
  }
}



