
int numEyes = 18;
float eyeX[] = new float[numEyes];
float eyeY[] = new float[numEyes];
float pupilX[] = new float[numEyes];
float pupilY[] = new float[numEyes];


float eyeRadius[] = new float[numEyes];
float pupilRadius[] = new float[numEyes];

float angle[] = new float[numEyes];

float distance[] = new float[numEyes];

boolean eyesClosed[] = new boolean[numEyes];

void setup() {
  size(600, 600);
  background(150);
  smooth();

  for (int i = 0; i < numEyes; i++) {

    eyeX[i] = random(width*(i)/(numEyes+1), width*(i+1)/(numEyes+1));
    eyeY[i] = random(height/numEyes, height-height/numEyes);

    eyeRadius[i] = random(12, width/(numEyes+1));
    pupilRadius[i] = random(4, eyeRadius[i]/2);

    eyesClosed[i] = false;
  }
}

void draw() {
  background(255, 80, 0);

  for (int i = 0; i < numEyes; i++) {
    fill(255);


    ellipse(eyeX[i], eyeY[i], 2*eyeRadius[i], 2*eyeRadius[i]);
    ellipse(eyeX[i], eyeY[i], 2*eyeRadius[i], 2*eyeRadius[i]);

    fill(0);

    //*******DRAW EYES******

    distance[i] = dist(mouseX, mouseY, eyeX[i], eyeY[i]);

    angle[i] = acos((mouseX-eyeX[i])/distance[i]);
    //account for negative Y values
    if (mouseY <= eyeY[i]) {
      angle[i] = PI*2 - angle[i];
    }


    //**set pupil coordinates for left eye**
    //if pointer is inside the boundaries of the left eye:

    if (distance[i] < (eyeRadius[i]-pupilRadius[i])) {
      pupilX[i] = mouseX;
      pupilY[i] = mouseY;
    }
    //if outside the eye area:
    else {
      pupilX[i] = cos(angle[i])*(eyeRadius[i] - pupilRadius[i]) + eyeX[i];
      pupilY[i] = sin(angle[i])*(eyeRadius[i] - pupilRadius[i]) + eyeY[i];
    }
    //draw pupils
    ellipse(pupilX[i], pupilY[i], 2*pupilRadius[i], 2*pupilRadius[i]);

    if (eyesClosed[i]) {
      fill(155);
      ellipse(eyeX[i], eyeY[i], 2*eyeRadius[i], 2*eyeRadius[i]);
    }
  }
}

void mouseReleased() {
  for (int i = 0; i < numEyes; i++) {
    eyesClosed[i] = !eyesClosed[i];
    println(eyesClosed[i]);
  }
}


