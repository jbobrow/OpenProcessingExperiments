
int numCircles = 20;
float[] circleX = new float [numCircles];
float[] circleY = new float [numCircles];
float[] velocity = new float [numCircles];

int dia = 50;
float gravity = 0.2;

void setup () {
  size (500, 500);
  smooth();
  noStroke();
  background(255);

  for (int i=0; i<numCircles; i++) {
    circleX[i]=random(width);
    circleY[i]=random(height);
    velocity[i]=random(1, 5);
  }
}

void draw () {
  background (255);
  fill (50);

  circle();
}  

void circle() {

  for (int i=0; i<numCircles; i++) {
    ellipse (circleX[i], circleY[i], dia, dia);
    circleY[i] += velocity[i];
    velocity[i] += gravity;

    if (circleY[i]> height-dia||circleY[i]<dia) {
      circleY[i]= height-dia;
      velocity[i] = velocity[i] * -0.75;
    }
  }

  for (int i=0; i<numCircles; i++) {
    for (int j=0; j<i+1; j++) {
      if (dist(circleX[i], circleY[i], circleX[i], circleY[i]) < dia) {
        velocity[i] *= -1;
      }
    }
  }
}



