
//credit to Alex Samuel (openprocessing) http://www.openprocessing.org/sketch/66950

//set array
float[] xPos = new float[250];
float[] yPos = new float[250];
float[] xVel = new float[250];
float[] yVel = new float[250];
float[] s = new float[250]; 

int a = 0;
int b = 0;
int c = 100;
int p = 10;

//set up array
void setup() {
  size(1200, 600);

  for (int i=0; i < 250; i++) {
    xPos[i] = random(1, 1200);
  }

  for (int i=0; i < 250; i++) {
    yPos[i] = random(1, 599);
  }

  for (int i=0; i < 250; i++) {
    xVel[i] = random(-10, 10);
  }

  for (int i=0; i < 250; i++) {
    yVel[i] = random(-10, 10);
  }
  for (int i=0; i < 250; i++) {
    s[i] = random(1, 6);
  }
}
//draw stars
void draw() {
  background(0);
  fill(255);
  tracker();

  for (int i=0; i < 250; i++) {
    noStroke ();
    ellipse(xPos[i], yPos[i], s[i], s[i]);
  }
}

void mouseMoved() {
  for (int i=0; i < 250; i++) {
    if (dist(mouseX, mouseY, xPos[i], yPos[i]) < 100) {
      xPos[i] = xPos[i] + random(100);
      yPos[i] = yPos[i] - random(100);
      xPos[i] = xPos[i] - random(100);
      yPos[i] = yPos[i] + random(100);

      if (xPos[i] < 0 || xPos[i] > 1200) {
        xPos[i] = random(1200);
      }

      if (yPos[i] < 0 || yPos[i] > 600) {
        yPos[i] = random(600);
      }
    }


    //    stroke(random(100, 200), random(100, 200), random(200, 255), 40);
    line(mouseX, mouseY, xPos[i], yPos[i]);
  }
}

void mouseDragged() {
  for (int i=0; i < 250; i++) {
    if (dist(mouseX, mouseY, xPos[i], yPos[i]) > 150) {
      xPos[i] = xPos[i] - random(100);
      yPos[i] = yPos[i] + random(100);
      xPos[i] = xPos[i] + random(100);
      yPos[i] = yPos[i] - random(100);

      if (xPos[i] < 0 || xPos[i] > 1200) {
        xPos[i] = random(1200);
      }

      if (yPos[i] < 0 || yPos[i] > 600) {
        yPos[i] = random(600);
      }
    }


       stroke(100, 200, 250, 40);
    line(mouseX, mouseY, xPos[i], yPos[i]);
  }
}

void tracker ()
{
  smooth ();
//  stroke(255);
    noStroke ();
  line (a, b, c, a);
  a = a + 3;
  if (a == 600) {
    a = 0;
    c = c +100;
    b = b +100;
  }
  stroke (255);

  for (int i=0; i < 250; i++) {

    line (xPos[i]+p, yPos[i], xPos[i], yPos[i]);
    line (xPos[i], yPos[i]+p, xPos[i], yPos[i]);
    line (xPos[i], yPos[i], xPos[i]-p, yPos[i]);
    line (xPos[i], yPos[i], xPos[i], yPos[i]-p);
    if (a > yPos[i]-25) {
      p = 5;
    }
    if (a < yPos[i]+25) {
      p = 5;
    }
    if (a < yPos[i]-25) {
      p = 0;
    }
    if (a > yPos[i]+25) {
      p = 0;
    }
    i = i + 1;
  }
}



