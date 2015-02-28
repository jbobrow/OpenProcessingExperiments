
float[] xPos = new float[10];
float[] yPos = new float[10];
float[] xVel = new float[10];
float[] yVel = new float[10];

float gravity = 0.3;

PImage bball;
PImage court;

void setup() {
  size(300, 300);
    
  bball = loadImage("bball.jpg");
  court = loadImage("court.jpg");
  imageMode(CENTER);


  for (int i=0; i < 10; i++) {
    xPos[i] = random(40, 260);
    yPos[i] = 100;
  }
  
  for (int i=0; i < 10; i++) {
    xVel[i] = 2;
    yVel[i] = random(-2, 2);
  }
}
void draw() {

  background(court);
  
  for (int i=0; i < 10; i++) {
    image(bball, xPos[i], yPos[i]);
  }

  for (int i=0; i <10; i++) {
    yVel[i] = yVel[i] + gravity;
    yPos[i] = yPos[i] + yVel[i];
    xVel[i] = xPos[i] + xVel[i];

    if (xPos[i] > width-20 || xPos[i] < 0) {
      xVel[i] *=-1;
    }

    if (yPos[i] > height-20 || yPos[i] < 0) {
      yVel[i] *=-1;
    }
  }
}

void mouseClicked() {
  for (int i=0; i < 10; i++) {
    if (dist(pmouseX, pmouseY, xPos[i], yPos[i]) <= 20) {
      xVel[i] *= -2;
      yVel[i] *= -3;
    }
  }
}

