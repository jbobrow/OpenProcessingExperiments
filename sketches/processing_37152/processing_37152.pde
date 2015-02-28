

int totalSM = 200;
float[] xpos = new float[totalSM];
float[] ypos = new float[totalSM];
float[] squiggles = new float[totalSM];
int monkeysize = 5;
float x=0;
float y=0;
float a=0;
float b=0;
float O=random(TWO_PI);
float L=3;
int move = 0;
int away = 0;
int happy = 40;

void setup() {
  noStroke();
  size(400, 700);
  background(0, 82, 137);
  for (int i = 0; i < totalSM; i++) {
    xpos[i] = random(width);
    ypos[i] = random(height);
    squiggles[i] = random(TWO_PI);
  }
}

void draw() {
  if (dist(pmouseX, pmouseY, mouseX, mouseY) == 0) {
    if (move > 0) {
      move = move - 1;
      happy = happy -5;
    }

    if (move <= 0 ) {
      noCursor();
      happy = 40;
    }
  }

  if (move>0 && move <46) {

    cursor(HAND);

    for (int count = 0; count < totalSM; count++) {
      xpos[count]= xpos[count] + (mouseX - xpos[count])/50;
      ypos[count]= ypos[count] + (mouseY - ypos[count])/50;

      fill(255, 255, 255, happy);
      ellipse(xpos[count], ypos[count], monkeysize, monkeysize);
      happy = happy + 1;
      if (happy > 100);
      happy = 100;
    }
  }
  if (move > 46) {
    cursor(HAND);
    if (dist(pmouseX, pmouseY, mouseX, mouseY) == 0) {
      if (move <= 90 && move > 46) {
        move = move - 1;
      }

      if (move <= 46 ) {
        move = 0;
      }
    }

    for (int count = 0; count < totalSM; count++) {
      xpos[count]= xpos[count] - (mouseX - xpos[count])/80;
      ypos[count]= ypos[count] - (mouseY - ypos[count])/80;

      fill(255, 255, 255, 40);
      ellipse(xpos[count], ypos[count], monkeysize, monkeysize);
    }
  }
  fill(0, 82, 137, 40);
  rect(0, 0, width, height);
  fill(255, 255, 255, 40);
  for (int i = 0; i < totalSM; i++) {
    ellipse(xpos[i], ypos[i], monkeysize, monkeysize);
    xpos[i]=xpos[i]+L*cos(squiggles[i]);
    ypos[i]=ypos[i]+L*sin(squiggles[i]);
    squiggles[i]=squiggles[i]+random(-PI/10.0, PI/10.0);
  }
}
void mouseMoved() {
  move = 45;
}

void mouseDragged() {
  move = 90;
}


