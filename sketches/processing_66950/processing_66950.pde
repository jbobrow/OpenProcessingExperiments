

//set array
float[] xPos = new float[90];
float[] yPos = new float[90];
float[] xVel = new float[90];
float[] yVel = new float[90];
PImage sky;

//set up array
void setup() {
  size(600, 600);
  sky = loadImage("sky.jpg");
 
  for (int i=0; i < 90; i++) {
    xPos[i] = random(1, 599);
  }

  for (int i=0; i < 90; i++) {
    yPos[i] = random(1, 599);
  }

  for (int i=0; i < 90; i++) {
    xVel[i] = random(-10, 10);
  }

  for (int i=0; i < 90; i++) {
    yVel[i] = random(-10, 10);
  }
}

//draw stars
void draw() {
  background(sky);
  fill(random(100, 200), random(100, 200), random(200, 255));

  for (int i=0; i < 90; i++) {
    ellipse(xPos[i], yPos[i], random(2, 10), random(2, 10));
  }
}

//explode stars
void mouseClicked() {
  for (int i=0; i < 90; i++) {
    if (dist(mouseX, mouseY, xPos[i], yPos[i]) < 15) {
      xPos[i] = xPos[i] + random(100);
      yPos[i] = yPos[i] - random(100);
    }
    stroke(random(100, 200), random(100, 200), random(200, 255), 40);
    line(mouseX, mouseY, xPos[i], yPos[i]);
  }
}


