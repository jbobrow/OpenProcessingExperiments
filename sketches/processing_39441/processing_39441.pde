
int squareSize;
int white, black;
int coorX, coorY;

boolean blackBox1, blackBox2, blackBox3, blackBox4, blackBox5;
boolean whiteBox1, whiteBox2, whiteBox3, whiteBox4, whiteBox5;

void setup () {
  size (300, 675);
  smooth ();
  squareSize = 75;
  white = 255;
  black = 0;
  blackBox1 = false;
  blackBox2 = false;
  blackBox3 = false;
  blackBox4 = false;
  blackBox5 = false;
  whiteBox1 = false;
  whiteBox2 = false;
  whiteBox3 = false;
  whiteBox4 = false;
  whiteBox5 = false;
}

void draw () {
  coorX = mouseX;
  coorY = mouseY;
  square1 (50, 50, white);
  square2 (175, 50, black);
  square3 (50, 175, white);
  square4 (175, 175, black);
  square5 (50, 300, white);
  square6 (175, 300, black);
  square7 (50, 425, white);
  square8 (175, 425, black);
  square9 (50, 550, white);
  square10 (175, 550, black);
}


void mousePressed () {
  if ((coorX >= 50) && (coorX <= (50+squareSize))) { //column1
    if ((coorY >= 50) && (coorY <= (50+squareSize))) {
      blackBox1 = ! blackBox1;
    }
    if ((coorY >= 175) && (coorY <= (175+squareSize))) {
      blackBox2 = ! blackBox2;
    }
    if ((coorY >= 425) && (coorY <= (425+squareSize))) {
      blackBox3 = true;
    }
  }

  if ((coorX >= 175) && (coorX <= (175+squareSize))) { //column2
    if ((coorY >= 50) && (coorY <= (50+squareSize))) {
      whiteBox1 = ! whiteBox1;
    }
    if ((coorY >= 175) && (coorY <= (175+squareSize))) {
      whiteBox2 = ! whiteBox2;
    }
    if ((coorY >= 425) && (coorY <= (425+squareSize))) {
      whiteBox3 = true;
    }
  }
}

void mouseReleased () {
  if ((coorX >= 50) && (coorX <= (50+squareSize))) { //column1
    if ((coorY >= 50) && (coorY <= (50+squareSize))) {
      blackBox1 = ! blackBox1;
    }
    if ((coorY >= 300) && (coorY <= (300+squareSize))) {
      blackBox4 = ! blackBox4;
    }
    if ((coorY >= 550) && (coorY <= (550+squareSize))) {
      blackBox5 = true;
    }
  }

  if ((coorX >= 175) && (coorX <= (175+squareSize))) { //column2
    if ((coorY >= 50) && (coorY <= (50+squareSize))) {
      whiteBox1 = ! whiteBox1;
    }
    if ((coorY >= 300) && (coorY <= (300+squareSize))) {
      whiteBox4 = ! whiteBox4;
    }
    if ((coorY >= 550) && (coorY <= (550+squareSize))) {
      whiteBox5 = true;
    }
  }
}


void square1 (int sx, int sy, int squareColor) {
  noStroke ();
  if (blackBox1) {
    blackSquare (sx, sy);
  }
  else {
    fill (squareColor);
    rect (sx, sy, squareSize, squareSize);
    upArrow (sx+33, sy+20, black);
    downArrow (sx+33, sy+20, black);
  }
}

void square2 (int sx, int sy, int squareColor) {
  noStroke ();
  if (whiteBox1) {
    whiteSquare (sx, sy);
  }
  else {
    fill (squareColor);
    rect (sx, sy, squareSize, squareSize);
    upArrow (sx+33, sy+20, white);
    downArrow (sx+33, sy+20, white);
  }
}

void square3 (int sx, int sy, int squareColor) {
  noStroke ();
  if (blackBox2) {
    blackSquare (sx, sy);
  }
  else {
    fill (squareColor);
    rect (sx, sy, squareSize, squareSize);
    downArrow (sx+23, sy+20, black);
    downArrow (sx+47, sy+20, black);
  }
}

void square4 (int sx, int sy, int squareColor) {
  noStroke ();
  if (whiteBox2) {
    whiteSquare (sx, sy);
  }
  else {
    fill (squareColor);
    rect (sx, sy, squareSize, squareSize);
    downArrow (sx+23, sy+20, white);
    downArrow (sx+47, sy+20, white);
  }
}

void square5 (int sx, int sy, int squareColor) {
  noStroke ();
  if (blackBox4) {
    blackSquare (sx, sy);
  }
  else {
    fill (squareColor);
    rect (sx, sy, squareSize, squareSize);
    upArrow (sx+23, sy+25, black);
    upArrow (sx+47, sy+25, black);
  }
}

void square6 (int sx, int sy, int squareColor) {
  noStroke ();
  if (whiteBox4) {
    whiteSquare (sx, sy);
  }
  else {
    fill (squareColor);
    rect (sx, sy, squareSize, squareSize);
    upArrow (sx+23, sy+25, white);
    upArrow (sx+47, sy+25, white);
  }
}

void square7 (int sx, int sy, int squareColor) {
  noStroke ();
  if (blackBox3) {
    blackSquare (sx, sy);
  }
  else {
    fill (squareColor);
    rect (sx, sy, squareSize, squareSize);
    downArrow (sx+33, sy+20, black);
  }
}

void square8 (int sx, int sy, int squareColor) {
  noStroke ();
  if (whiteBox3) {
    whiteSquare (sx, sy);
  }
  else {
    fill (squareColor);
    rect (sx, sy, squareSize, squareSize);
    downArrow (sx+33, sy+20, white);
  }
}

void square9 (int sx, int sy, int squareColor) {
  noStroke ();
  if (blackBox5) {
    blackSquare (sx, sy);
  }
  else {
    fill (squareColor);
    rect (sx, sy, squareSize, squareSize);
    upArrow (sx+33, sy+25, black);
  }
}

void square10 (int sx, int sy, int squareColor) {
  noStroke ();
  if (whiteBox5) {
    whiteSquare (sx, sy);
  }
  else {
    fill (squareColor);
    rect (sx, sy, squareSize, squareSize);
    upArrow (sx+33, sy+25, white);
  }
}

void blackSquare (int sx, int sy) {
  fill (black);
  rect (sx, sy, squareSize, squareSize);
}

void whiteSquare (int sx, int sy) {
  fill (white);
  rect (sx, sy, squareSize, squareSize);
}

void upArrow (int ax, int ay, int arrowFill) {
  noStroke ();
  fill (arrowFill);
  rect (ax, ay, 10, 30);
  triangle (ax-5, ay, ax+5, ay-10, ax+15, ay);
}

void downArrow (int ax, int ay, int arrowFill) {
  noStroke ();
  fill (arrowFill);
  rect (ax, ay, 10, 30);
  triangle (ax-5, ay+30, ax+5, ay+40, ax+15, ay+30);
}
       
