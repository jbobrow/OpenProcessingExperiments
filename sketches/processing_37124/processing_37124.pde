

int totalSM = 300;
float[] xpos = new float[totalSM];
float[] ypos = new float[totalSM];
float[] squiggles = new float[totalSM];
int monkeysize = 5;
float x=0;
float y=0;
float a=0;
float b=0;
float O=random(TWO_PI);
float L=4;
int move = 0;

void setup() {
  noStroke();
  size(400, 700);
  background(0);
  for (int i = 0; i < totalSM; i++) {
    xpos[i] = random(width);
    ypos[i] = random(height);
    squiggles[i] = random(TWO_PI);
  }
}

void draw() {

  if (dist(pmouseX, pmouseY, mouseX, mouseY) == 0) {
    if (move>0) {
      move = move - 1;
    }
    if (move <= 0) {
      noCursor();
    }
  }


  if (move>0) {


    cursor(HAND);

    for (int count = 0; count < totalSM; count++) {
      xpos[count]= xpos[count] + (mouseX - xpos[count])/40;
      ypos[count]= ypos[count] + (mouseY - ypos[count])/40;

      fill(255, 255, 255, 100);
      ellipse(xpos[count], ypos[count], monkeysize, monkeysize);
    }
  }
  fill(0, 0, 0, 30);
  rect(0, 0, width, height);
  fill(255, 255, 255, 80);
  for (int i = 0; i < totalSM; i++) {
    ellipse(xpos[i], ypos[i], monkeysize, monkeysize);
    xpos[i]=xpos[i]+L*cos(squiggles[i]);
    ypos[i]=ypos[i]+L*sin(squiggles[i]);
    squiggles[i]=squiggles[i]+random(-PI/10.0, PI/10.0);

    if (xpos[i] > width) {
      xpos[i] = 0;
    }
    if (ypos[i] > height) {
      ypos[i] = 0;
    }
    if (xpos[i] < 0) {
      xpos[i] = width;
    }
    if (ypos[i] < 0) {
      ypos[i] = height;
    }
  }
}

void mouseMoved() {
  move = 45;
}

void mouseClicked() {
}


