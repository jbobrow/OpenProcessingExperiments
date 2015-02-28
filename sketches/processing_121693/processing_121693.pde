
PImage img;
float smallCircle = 10;
float frames = 0;
int beeX = 0;
int beeY = 100;
int bee2X = 0;
int bee2Y = 150
int bee3X = 0
int bee3Y = 200
float beeVelX = 3;
float beeVelY = 1;
float beeVel2X = 2;
float beeVel2Y = 3;
float beeVel3X = 3;
float beeVel3Y = 3;


void setup() {
  size (500, 500);
  frameRate (30);
  img = loadImage("bee.jpg");
}

void draw() {
  background (0);

  smallCircle = sin(frames)*5+10;
  frames += .1;

  for (int i = 0; i < 50; i++) {
    for (int j= 0; j < 50; j++) {
      fill (random (237, 255), 255, random (0, 255));
      ellipse (i*10+5, j*10+5, smallCircle, smallCircle);
    }


    noStroke ();
    fill (0);
    image (img, beeVelX, beeVelY, 25, 25);
    image (img, beeVel2X, beeVel2Y, 25, 25);
    image (img, beeVel3X, beeVel3Y, 25, 25);

    if (beeVelX > 460|| beeVelX < 0) {
      beeVelX *=2;
    }
    if (beeVelY > 460|| beeVelY < 0) {
      beeVelY *=1;
    }
    
    if (beeVel2X > 460|| beeVel2X < 0) {
      beeVel2X *=2;
    }
    if (beeVel2Y > 460|| beeVel2Y < 0) {
      beeVel2Y *=4;
    }
    
    if (beeVel3X > 460|| beeVel3X < 0) {
      beeVel3X *=2;
    }
    if (beeVel3Y > 460|| beeVel3Y < 0) {
      beeVel3Y *=3;
    }
  }

