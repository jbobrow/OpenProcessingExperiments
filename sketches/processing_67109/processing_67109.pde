
PImage[] corgi = new PImage[2];
int colortint;

//Initial Position of the Smiley
float xPos[] = {
  75, 300
};
float yPos[] = {
  50, 50
};

//Velocity of the Smiley
float xVel[] = new float [2];
float yVel[] = new float [2];

//Gravity
float gravity = 0.2;

//Space Setup
void setup() {
  size(500, 500);
  smooth();
  corgi[0] = loadImage("happy.png");
  corgi[1] = loadImage("sad.png");

  for (int i = 0; i < 2; i++) { 
    xVel [i] = random(2, 6);
    yVel [i] = random(4, 7);
  }
}

//Bouncing Ball Setup
void draw() {
  background(255);
  imageMode(CENTER);

  for (int i = 0; i < 2; i++) {
    yVel[i] = yVel[i] + gravity;
    xPos[i] = xPos[i] + xVel[i];
    yPos[i] = yPos[i] + yVel[i];
  }
  for (int i = 0; i < 2; i++) {
    image(corgi[0], xPos[i], yPos[i]);

    if (xPos[1]>width-50) {
      xVel[i]=-xVel[i];
      tint(random(255), random(255), random(255));
    }
    if (xPos[i]<50) {
      xVel[i]=-xVel[i];
      tint(random(255), random(255), random(255));
    }
    if (yPos[i]>height-50||yPos[i]<50) {
      yVel[i]=yVel[i]*-(.75);
      xVel[i]=xVel[i]*(.75);
    }
    if (yPos[i]>height-50) {
      yPos[i]=height-50;
      noTint();
      image(corgi[1], xPos[i], yPos[i]);
    }
  }
  for (int i = 0; i < 2; i++) {
    for (int k = 0; k < 2; k++) {
      if (i != k) { 
        if (dist(xPos[i], yPos[i], xPos[k], yPos[k]) < 95) {
          xVel[i]=-xVel[i];
          yVel[i]=-yVel[i];
          tint(random(255), random(255), random(255));
        }
      }
    }
  }
}


