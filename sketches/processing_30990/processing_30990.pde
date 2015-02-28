
float mAngle = 30;
float mPositionX = 40;


PImage b;
void setup() {
  size(400, 400);
  background(255);
  frameRate(5);
  println("START");

  // Images must be in the "data" directory to load correctly
  b = loadImage("data/315.jpg");
  //image(b, 0, 0);
  //image(b, 0, 0, width/2, height/2);
}

void draw() {
  //background(255);
  //moves and rotate coordinate system

  mPositionX = mPositionX + 1;
  mAngle = mAngle +15;

  translate(width/2, height/2);

  rotate(radians(mAngle));

  float myAlpha = map(mAngle, 0, 360, 50, 150);

  if (mAngle > 360) {
    mAngle = 0;
  }


  if (mAngle > 0 && mAngle < 90) {
    tint(#FA036A, myAlpha);
  }

  else if (mAngle > 90 && mAngle < 180) {
    tint(#0325FA, myAlpha);
  }

  else if (mAngle > 180 && mAngle < 270) {
    tint(#039DFA, myAlpha);
  }

  else if (mAngle > 270 && mAngle < 360) {
    tint(#03FAA9, myAlpha);
  }

  float mySize = map(mAngle, 360, 0, 30, 5);
  float myMouse = map(mouseX, 0, 315, 0, 100);
  image(b, mPositionX, 0, myMouse, mySize);









  //screenshot
  if (keyPressed) {
    if (key == 's') {
      saveFrame();
    }
  }
  println("DRAW");
}


