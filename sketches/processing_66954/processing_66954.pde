
int count = 1000;

float[] xPos    = new float[count];
float[] yPos    = new float[count];
float[] xSpeed  = new float[count];
float[] ySpeed  = new float[count];
float[] colors  = new float[count];
float[] sizes   = new float[count];

float gravity = 0.1;

void setup() {
  smooth();
  //noStroke();
  //size(screen.width, screen.height);
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 100);

  for (int i = 0; i < count; i++) {
    xPos[i]    = random(width);
    yPos[i]    = 100;
    xSpeed[i]  = random(-5, 5);
    ySpeed[i]  = random(-10, 10);
    colors[i]  = random(360);
    sizes[i]   = random(30, 50);
  }

  frameRate(120);
}

void draw() {

  fill(0, 0, 100, 2);
  rect(0, 0, width, height);
  //background(0, 0, 100);

  for (int i = 0; i < count; i++) {
    xPos[i] += xSpeed[i];
    if (xPos[i] > width - sizes[i]/2 || xPos[i] < sizes[i]/2)
      xSpeed[i] *= -1;

    yPos[i] += ySpeed[i];
    ySpeed[i] += gravity;

    if (yPos[i] > height-sizes[i]/2)
      ySpeed[i] *= -0.95;

    if (dist(xPos[i], yPos[i], mouseX, mouseY) < sizes[i]/2) {
      xSpeed[i] *= -1;
      ySpeed[i] *= -1;
    } 

    fill(colors[i], 80, 80, 80);
    ellipse(xPos[i], yPos[i], sizes[i], sizes[i]);

    for (int j = 0; j < count; j++) {
      if (i == j)
        continue;

      if (dist(xPos[i], yPos[i], xPos[j], yPos[j]) < sizes[i]/2+sizes[j]/2) {
        xSpeed[i] *= -1;
        ySpeed[i] *= -1;
        xSpeed[j] *= -1;
        ySpeed[j] *= -1;
      }
    }
  }
}


