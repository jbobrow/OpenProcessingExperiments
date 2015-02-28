
int posX;
int posY;
int state;
int lightUp;

void setup() {
  size(500, 500);
  posX = 50;
  posY = 75;

  noStroke();
  smooth();

  state = 0;
}

void draw() {
  background(0, 51, 255);


  fill(255, 14, 38);
  rect(25, 50, 50, 50);
  rect(425, 50, 50, 50);
  rect(25, 375, 50, 50);
  rect(425, 375, 50, 50);

  if (state == 0) {

    if (mousePressed && mouseX > 25 && mouseX < 75 && mouseY > 75 && mouseY < 125) {
      state = 1;
    }
  }

  // TL -> TR
  if (state == 1) {
    posX = posX + 5;
    if (posX > 425 && posX < 550) {
      fill(255);
      rect(425, 50, 50, 50);
      fill(255, 14, 38);
      state = 2;
      //lightUp = 255;
    }
  }

  // TR -> BL
  if (state == 2) {
    posX -= 6;
    posY += 5;

    if (posX < 25 && posY > 350) {
      fill(255);
      rect(25, 375, 50, 50);
      fill(255, 14, 38);
      state = 3;
    }
  }

  // BL -> BR
  if (state == 3) {
    posX += 5;

    if (posX > 430) { 
      state = 4;
    }
  }

  // BLACKOUT
  if (state == 4) {
    background(0);
    fill(255, 14, 38);
  }

  fill(255);
  ellipse(posX, posY, 20, 20);
}


