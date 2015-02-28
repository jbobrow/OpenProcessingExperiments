
int numCircles = 5;
float[] circleX = new float[numCircles]; // float for the x pos of all circles
float[] circleY = new float[numCircles]; // float for the y pos of all circles
float[] velX = new float[numCircles]; // float for the movement along the horizontal plane
float[] velY = new float[numCircles]; // float for the movement along the horizontal plane

void setup() {
  size(500, 500);
  smooth();
  // initializing circles to be evenly distributed
  for (int i=0;i<numCircles;i++) {
    circleX[i] = (i+1)*50;
    circleY[i] = (i+1)*50;
    velX[i] = int(random(1, 4));
    velY[i] = int(random(1, 4));
  }
}
void draw() {
  background(0);
  noStroke();
  for (int j=0; j<numCircles-1; j++) { // comparing X values...
    for (int k=j+1; k<numCircles; k++) { //to the y values
      if (dist(circleX[j], circleY[j], circleX[k], circleY[k]) < 30) {
        if ((velX[j] > 0 && velX[k] < 0) || (velX[j] < 0 && velX[k] > 0)) {
          velX[j] *= -1;
          velX[k] *= -1;
        }
        if ((velY[j] > 0 && velY[k] < 0) || (velY[j] < 0 && velY[k] > 0)) {
          velY[j] *= -1;
          velY[k] *= -1;
        }
      }
    }
  } 
  for (int i=0; i<numCircles; i++) { //drawing all circles
    fill(200, 20*i, 30*i);
    ellipse(circleX[i], circleY[i], 75, 75);
    fill(0);
    // text(i, circleX[i], circleY[i]);  <-- if you want to label the balls, uncomment
    // staying within the boundaries of the frame
    // if circles go outside, velocities reverse
    if (circleX[i] < 10 || circleX[i] > width-10) {
      velX[i] = velX[i] * (-1);
    }
    if (circleY[i] < 10 || circleY[i]> height-10) {
      velY[i] = velY[i] * (-1);
    }
    //position is incremented by the velocity
    circleX[i] += velX[i];
    circleY[i] += velY[i];
  }
}


