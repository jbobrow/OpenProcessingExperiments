
int numCircles = 5;
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
    velocity[i]=random(-1, 1);
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
    if ( circleY[i] >height-dia/2) {
      circleY[i]= height-dia/2;
    }
    if (circleY[i]< dia) {
      circleY[i]=dia;
    }
    if (circleY[i]>= height-dia/2||circleY[i]<=dia) {
      velocity[i] = velocity[i] * -0.7;
    }


    println(circleY);
    println(velocity);
  }

  for (int i=0; i<numCircles; i++) {
    for (int j=i+1; j<numCircles; j++) {
      if (dist(circleX[i], circleY[i], circleX[j], circleY[j]) < dia) {
        velocity[j] *= -0.7;
      }
    }
  }
}


