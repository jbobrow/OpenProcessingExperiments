
int speedY = 5;
int speedX = 5;
int x = 0;
int y = 0;

int speedYb = 5;
int speedXb = 5;
int xb = 400;
int yb = 400;

int grand = 0;

void setup() {
  size(400, 400);
  smooth();
}

void draw() {
  noStroke();
  fill(240, 50);
  rect(0, 0, width, height);

  fill(255);
  stroke(0);
  ellipse(x, y, grand, grand);

  if (mousePressed) {
    if (x >= 400 || x < 0) {
      speedX = speedX * -1;
    }
    x = x + speedX;
  }
  else {
    if (x >= 400 || x < 0) {
      speedX = speedX * -1;
    }
    x = x + speedX;

    if (y >= 400 || y < 0) {
      speedY = speedY * -1;
    }
    y = y + speedY;
  }


  fill(255);
  stroke(0);
  ellipse(xb, yb, grand, grand);

  if (mousePressed) {
    if (xb >= 400 || xb < 0) {
      speedXb = speedXb * -1;
    }
    xb = xb + speedXb;
  }
  else {
    if (xb >= 400 || xb < 0) {
      speedXb = speedXb * -1;
    }
    xb = xb + speedXb;

    if (yb >= 400 || yb < 0) {
      speedYb = speedYb * -1;
    }
    yb = yb + speedYb;
  }



  //se la grandezza supera 50
  if (grand >= 50) {
    //50*-1 = -50
    grand = grand *-1;
  }
  else {
    //aggiungi 1 alla grandezza attuale Es -50+1 = -49
    grand = grand + 1;
  }
}


