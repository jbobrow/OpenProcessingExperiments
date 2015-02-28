
int posY;

boolean goingUp;

void setup () {
  size (500, 500);
  posY=400;
  goingUp = true;
}


void draw () {
  background (posY/2, 200, 225);

  fill (posY, 58, 56);

  noStroke ();
  
  ellipse (200, posY, 100, 100);

  if (goingUp == true) {
    posY = posY -10;
    if (posY < 50) {
      goingUp = false;
    }
  }


  else {
    posY = posY +10;
    if (posY > 450) {
      goingUp = true;
    }
  }
}


