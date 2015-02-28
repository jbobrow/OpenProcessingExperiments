
int columnWidth = 18;
int circleWidth = (int)(columnWidth * 1.6);

void setup() {
  size(500,500,P2D);
  smooth();
  noStroke();
  ellipseMode(CORNER);
  rectMode(CORNERS);
  generate();
}

void draw() { }

void drawFigure(int configuration, int x, int yCenter) {
  int lowerCircleY, upperCircleY;
  switch(configuration) {
    case 0:  // 2 circles
      ellipse(x, yCenter - columnWidth, circleWidth, circleWidth);
      ellipse(x, yCenter + columnWidth, circleWidth, circleWidth);
      // if we are on the top half, draw rects up there
      if (yCenter < height/2) {
        rect(x, 0, x + columnWidth, yCenter - columnWidth + circleWidth/2);
        rect(x, yCenter + columnWidth + circleWidth / 2, x + columnWidth, height/2);
      }
      // otherwise, draw the rects below the top half
      else {
        rect(x, height/2, x + columnWidth, yCenter - columnWidth + circleWidth/2);
        rect(x, yCenter + columnWidth + circleWidth / 2, x + columnWidth, height);
      }
      
      break;
    case 1:  // 3 circles
      // there is a circle at yCenter
      ellipse(x, yCenter - circleWidth/2, circleWidth, circleWidth);
      // and a circle above
      upperCircleY = yCenter - (columnWidth*2 + circleWidth/2);
      ellipse(x, upperCircleY, circleWidth, circleWidth);
      // and a circle below
      lowerCircleY = yCenter + (columnWidth*2 - circleWidth/2);
      ellipse(x, lowerCircleY, circleWidth, circleWidth);
      // if we are on the top half, draw rects up there
      if (yCenter < height/2) {
        rect(x, 0, x + columnWidth, upperCircleY + circleWidth/2);
        rect(x, lowerCircleY + circleWidth/2, x + columnWidth, height/2);
      }
      // otherwise, draw the rects below the top half
      else {
        rect(x, height/2, x + columnWidth, upperCircleY + circleWidth/2);
        rect(x, lowerCircleY + circleWidth/2, x + columnWidth, height);
      }
      break;
    case 2:  // 4 circles
      // two middle-ish circles connected by a rect
      ellipse(x, yCenter - circleWidth*1.5, circleWidth, circleWidth);
      ellipse(x, yCenter + circleWidth*.5, circleWidth, circleWidth);
      rect(x, yCenter - circleWidth, x + columnWidth, yCenter + circleWidth);
      // an upper circle
      upperCircleY = (int)(yCenter - (columnWidth*2 + circleWidth*1.5));
      ellipse(x, upperCircleY, circleWidth, circleWidth);
      // and a lower circle
      lowerCircleY = (int)(yCenter + circleWidth*.5 + columnWidth * 2);
      ellipse(x, lowerCircleY, circleWidth, circleWidth);
      // if we are on the top half, draw rects up there
      if (yCenter < height/2) {
        rect(x, 0, x + columnWidth, upperCircleY + circleWidth/2);
        rect(x, lowerCircleY + circleWidth/2, x + columnWidth, height/2);
      }
      // otherwise, draw the rects below the top half
      else {
        rect(x, height/2, x + columnWidth, upperCircleY + circleWidth/2);
        rect(x, lowerCircleY + circleWidth/2, x + columnWidth, height);
      }
  }
}

void generate() {
  // top half is black.
  fill(0);
  rect(0, 0, width, height/2);
  // bottom half is white.
  fill(255);
  rect(0, height/2, width, height);
  
  int numColumns = width / columnWidth;
  // do a first pass and draw alternating black and white columns on the outsides
  for (int i=0; i<=numColumns; i++) {
    // set the fill.
    fill( i%2==0 ? 255 : 0);
    
    if (i < numColumns * .2 || i > numColumns * .8) {
      // draw a column
      rect(i*columnWidth, 0, i*columnWidth+columnWidth, height);
    }
  }
  
  for (int i=0; i<=numColumns; i++) {
    // set the fill.
    fill( i%2==0 ? 255 : 0);
    // if this column is in the middle-ish area, we'll draw more complicated figures.
    if (i > numColumns * .2 && i <= numColumns * .8) {
      // there are three possible configurations. choose one at random.
      int configuration = (int)random(3);
      // choose a random y-center for the figure.
      // white figures are at the top, black figures at the bottom.
      int yCenter = (i%2==0) ? (int)random(height*.1, height*.3) : (int)random(height-height*.3, height-height*.1);
      drawFigure(configuration, (int)i*columnWidth, yCenter);
    }
  }
}

void mousePressed() {
  generate();
}

void keyPressed() {
  if (key==' ')
    saveFrame("generator-###.png");
}                                                               
