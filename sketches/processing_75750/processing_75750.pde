
void setup () {
  size( 428, 300); 
  background (0);
  smooth();
  firstRow();
  firstDiagonal ();
  secondDiagonal ();
  secondRow ();
  baseOutsideRight();
  quadTopRight();
  quadTopLeft();
  baseOutsideLeft ();
  baseInsideLeft();
  baseInsideRight ();
  triangleFillerRight ();
  triangleFillerLeft ();
  triangleFillerTopRight ();
  triangleFillerTopLeft ();
  circles ();
  drawLinesRight ();
  drawLinesLeft ();
  spiral ();
}


// makes the triangles on the edge on the top left diagonal of the M
void triangleFillerTopLeft () {
  fill (255);
  int x1 = 214;
  int y1 = 90;
  int redToWhite = 95;
  while (y1 <= height ) {
    //triangle(214, height - 90, 210, height - 90, 210, height - 100);
    fill (255, redToWhite, redToWhite);
    triangle (x1, height - y1, x1 - 4, height - y1, x1 - 4, height - (y1 + 10));
    x1 = x1 - 4;
    y1 = y1 + 10;
    redToWhite = redToWhite - 5;
  }
}

//makes the triangles to smooth out the top right side of the diagonal
void triangleFillerTopRight () {
  int redToWhite = 95;
  int x1 = 214;
  int y1 = 90;
  while ( y1 <= height ) {
    fill (255, redToWhite, redToWhite);
    triangle (x1, height - y1, x1 + 4, height - y1, x1 + 4, height - (y1 + 10));
    x1 = x1 +4;
    y1 = y1 + 10;
    redToWhite = redToWhite - 5;
  }
}

//makes triangles on the M
void triangleFillerRight () {
  int x1 = 0;
  int y1 = 30;
  int redToWhite = 130;
  while ( y1 <= 280 ) {
    fill ( 255, redToWhite, redToWhite);
    triangle ( 234 + x1, height - y1, 234 + x1, height - (y1 + 10), 234 + (x1 + 4), height - (y1 + 10));
    x1 = x1 + 4;
    y1 = y1 + 10;
    redToWhite = redToWhite - 5;
  }
}

void triangleFillerLeft () {
  int x1 = 0;
  int y1 = 30;
  int redToWhite = 130;
  while ( y1 <= 280 ) {
    fill ( 255, redToWhite, redToWhite);
    triangle ( 194 - x1, height - y1, 194 - x1, height - (y1 + 10), 194 - (x1 + 4), height - (y1 + 10));
    x1 = x1 + 4;
    y1 = y1 + 10;
    redToWhite = redToWhite - 5;
  }
}



// vertical row on the left
void firstRow () {
  int yLocation = 0; 
  int redToWhite = 0;
  while ( yLocation <= height ) {
    fill ( 255, redToWhite, redToWhite );
    noStroke ();
    rect ( 50, yLocation, 40, 10 );
    yLocation = yLocation + 10;
    redToWhite = redToWhite + 5;
  }
}

// the vertical row on the right
void secondRow () {
  int yLocationTwo = 0; 
  int redToWhiteTwo = 0;
  while ( yLocationTwo <= height ) {
    fill ( 255, redToWhiteTwo, redToWhiteTwo );
    noStroke ();
    rect ( 338, yLocationTwo, 40, 10 );
    yLocationTwo = yLocationTwo + 10;
    redToWhiteTwo = redToWhiteTwo + 5;
  }
}

//the diagonal row on the left
void firstDiagonal () {
  int redToWhiteM = 0;
  int yLocationM = 0;
  int xLocationM = 90;
  while ( yLocationM <= 260 ) {
    fill( 255, redToWhiteM, redToWhiteM );
    noStroke();
    rect (xLocationM, yLocationM, 40, 10);
    xLocationM = xLocationM + 4;
    yLocationM = yLocationM + 10;
    redToWhiteM = redToWhiteM + 5;
  }
}

// the diagonal row on the right
void secondDiagonal () {
  int redToWhiteMtwo = 0;
  int yLocationMtwo = 0;
  int xLocationMtwo = 298;
  while ( yLocationMtwo <= 260 ) {
    fill( 255, redToWhiteMtwo, redToWhiteMtwo );
    noStroke();
    rect (xLocationMtwo, yLocationMtwo, 40, 10);
    xLocationMtwo = xLocationMtwo - 4;
    yLocationMtwo = yLocationMtwo + 10;
    redToWhiteMtwo = redToWhiteMtwo + 5;
  }
}

//quad for second bottom left
void baseInsideLeft() {
  int redToWhite = 145;
  float x1 = 0;
  float y1 = 0;
  while ( y1 <= 30) {
    fill ( 255, redToWhite, redToWhite);
    quad ( 140 - x1, height - y1, 90, height - y1, 90, height - (y1 + 10), 140 - (x1 + 7.5), height - (y1 + 10));
    x1 = x1 + 7.5;
    y1 = y1 + 10;
    redToWhite = redToWhite - 5;
  }
}

//quad base on the bottom outsie left
void baseOutsideLeft () {
  fill ( 255, 145, 145);
  quad ( 0, height, 50, height, 50, height - 10, 7, height - 10);
  fill ( 255, 140, 140);
  quad ( 7, height - 10, 50, height - 10, 50, height - 20, 15, height - 20);
  fill ( 255, 135, 135);
  quad ( 15, height - 20, 50, height - 20, 50, height - 30, 22, height - 30);
  fill ( 255, 130, 130);
  quad ( 22, height - 30, 50, height - 30, 50, height - 40, 30, height - 40);
}

//quad for bottom right
void baseOutsideRight() {
  int redToWhite = 145;
  float x1 = 0;
  float y1 = 0;
  while (y1 <= 30) {
    fill ( 255, redToWhite, redToWhite);
    quad ( width - x1, height - y1, width - 50, height - y1, width - 50, height - (y1 + 10), width - (x1 + 7.5), height - (y1 + 10));
    x1 = x1 + 7.5;
    y1 = y1 + 10;
    redToWhite = redToWhite - 5;
  }
}

//quad for top right
void quadTopRight() {
  float x1 = 0;
  float y1 = 0;
  int redToWhite = 0;
  while (redToWhite <= 15) {
    fill ( 255, redToWhite, redToWhite);
    quad ( width - x1, y1, width - 50, y1, width - 50, y1 + 10, width - (x1 + 7.5), y1 + 10);
    x1 = x1 + 7.5;
    y1 = y1 + 10;
    redToWhite = redToWhite + 5;
  }
}


//quad for top left
void quadTopLeft() {
  int redToWhite = 0;
  float x1 = 0;
  float y1 = 0;
  while (redToWhite <= 15) {
    fill ( 255, redToWhite, redToWhite);
    quad ( x1, y1, 50, x1, 50, y1 + 10, x1 + 7.5, y1 + 10);
    x1 = x1 + 7.5;
    y1 = y1 + 10;
    redToWhite = redToWhite + 5;
  }
}







void baseInsideRight () {
  int redToWhite = 145;
  float x1 = 0;
  float y1 = 0;
  while ( y1 <= 30) {
    fill ( 255, redToWhite, redToWhite );
    quad (width - (140 - x1), height - y1, width - 90, height - y1, width - 90, height - (y1 + 10), width - (140 - (x1 + 7.5)), height - (y1 + 10));
    x1 = x1 + 7.5;
    y1 = y1 + 10;
    redToWhite = redToWhite - 5;
  }
}

//noise generated circles
void circles() {
  float  noiseValue = 2;
  float circleNoise= 1;
  for (int x=0; x < width; x += 15) {
    for ( float y1 = 1; y1 <= height; y1 += 5 * noiseValue) {
      noiseValue = noise( x*circleNoise );
      fill(noiseValue*255);
      ellipse(x, y1, 10, 10* noiseValue);
      y1 = y1 + 10 * noiseValue;
    }
  }
}

void drawLinesRight () {
  strokeWeight (1);
  stroke (255);
  for ( float x = 0; x <= height; x += 5) {
    line (x, 0, width, height);
  }
}
// make white lines
void drawLinesLeft () {
  strokeWeight (1);
  stroke (255);
  for ( float x = 0; x <= height; x += 5) {
    line (width - x, 0, 0, height);
  }
}

void spiral () {
  strokeWeight (8);
  stroke (150 + random(106), 150 + random(106), 0);
  translate(width / 4, height/ 1.5 );
  int numPoints = 200;

  for ( int i = 1; i <=16; i ++) {
    rotate (7*PI/ 3 );
    for (float x = 0; x <= width; x += 1.0 * width/numPoints) {
      stroke (150 + random(106), 0, 0, 100);
      float randomness = x/height*(random(60) - 30);
      point( x, 50*sin(6*x/width*TWO_PI / 3) + randomness);
    }
  }
}
