
int ROWS = 4;
int COLS = 4;

int FONT_SIZE = 56;
int GRID_SIZE = 128;

int[][] board = new int[ROWS][COLS];

PFont boardFont;

int SHUFFLING = 0;
int PLAYING = 1;
int COMPLETE = 2;

int state = SHUFFLING;

int TOTAL_SHUFFLES = 200;

int shuffleCount = 0;

int JAVA = 0;
int JAVASCRIPT = 1;

int ENVIRONMENT = JAVASCRIPT;

Maxim maxim;

AudioPlayer click;
AudioPlayer fanfare;

/* @pjs font="Impact.ttf"; */

void setup() {
  size(512, 512);
  background(0);

  maxim = new Maxim(this);

  click = maxim.loadFile("click.wav");
  fanfare = maxim.loadFile("tada.wav");

  int n = 1;
  for (int i = 0; i < ROWS; i++) {
    for (int j = 0; j < COLS; j++) {
      board[i][j] = n++ % (ROWS * COLS);
    }
  }

  if (ENVIRONMENT == JAVASCRIPT) {
    boardFont = createFont("Impact.ttf", FONT_SIZE);
  } 
  else {
    boardFont = loadFont("Impact-80.vlw");
  }
  textFont(boardFont);

  repaint();
}

float scaleColor(float c, float k) {
  return constrain(c * k, 0, 255);
}

void fillScaled(float r, float g, float b, float k) {
  fill(192 + scaleColor(r, k), 192 + scaleColor(g, k), 192 + scaleColor(b, k));
}

void drawBubble(float x, float y, float size, float ar, float ag, float ab, float br, float bg, float bb) {
  /*
   * Draw shadows.
   */
  //  noStroke();
  //  //  fill(240, 240, 255); // FIX ME
  //  fillScaled(ar, ag, ab, .25);
  //  ellipse(x + 6 + GRID_SIZE / 2, y + 6 + GRID_SIZE / 2, GRID_SIZE * 3 / 4, GRID_SIZE * 3 / 4);
  //
  //  //  fill(216, 226, 255); // FIX ME
  //  fillScaled(ar, ag, ab, .15);
  //  ellipse(x + 5 + GRID_SIZE / 2, y + 5 + GRID_SIZE / 2, GRID_SIZE * 3 / 4, GRID_SIZE * 3 / 4);
  //
  float dr = (br - ar) / 32;
  float dg = (bg - ag) / 32;
  float db = (bb - ab) / 32;

  /*
   * Draw main bubble.
   */

  stroke(0, 0, 0, 255);
  fill(ar, ag, ab, 255);  

  pushMatrix();  
  translate(x, y);
  scale(size / 100);

  strokeWeight(4.6875);
  ellipse(50, 50, 75, 75);

  noStroke();

  for (int k = 0; k < 32; k++) {
    fill(ar + k * dr, ag + k * dg, ab + k * db);
    ellipse(50 - k * .26, 50 - k * .26, 75 - k * .78 - 6.25, 75 - k * .78 - 6.25);
  }

  pushMatrix();
  translate(30, 30);
  rotate(PI / 4);
  noStroke();
  fill(255, 255, 255, 192);
  ellipse(0, 0, 7, 17);
  popMatrix();

  strokeWeight(6.25);
  stroke(255, 255, 255, 192);
  point(40, 22);

  popMatrix();
}

void drawHighlightCircle(float x, float y, float size) {
  stroke(0);
  noFill();

  pushMatrix();  
  translate(x, y);
  scale(size);

  strokeWeight(0.046875);     
  ellipse(.5, .5, .75, .75);
  popMatrix();
}

void drawTile(float x, float y, float size) {
  stroke(0);
  fill(255);
  pushMatrix();
  translate(x, y);
  scale(size / 100);
  strokeWeight(2);
  rect(0, 0, 100, 100);

  int BEZEL_WIDTH = GRID_SIZE / 5;
  int hbw = BEZEL_WIDTH / 2;

  noStroke();
  fill(0);

  rect(0, 0, 10, 10);
  rect(90, 0, 10, 10);
  rect(0, 90, 10, 10);
  rect(90, 90, 10, 10);

  fill(255);

  ellipse(10, 10, 17, 17);
  ellipse(90, 10, 17, 17);
  ellipse(10, 90, 17, 17);
  ellipse(90, 90, 17, 17);

  popMatrix();
}

//void text2(String textToDisplay, float xPos, float yPos)
//{
//  pushMatrix();
//  float matrixScale = g.getMatrix().get(null)[0];
//  PVector newTextPos = new PVector(0, 0);
//  g.getMatrix().mult(new PVector(xPos, yPos), newTextPos);
//  resetMatrix();
//
//  float origTextSize = g.textSize;
//  textSize(matrixScale*origTextSize);
//  text(textToDisplay, newTextPos.x, newTextPos.y);
//  textSize(origTextSize);
//
//  popMatrix();
//}

void drawText(String s, float x, float y, float size) {
  noStroke();
  fill(0);

  pushMatrix();
  translate(x, y);
  scale(size / 100);
  textSize(43.75);
  // text2(s, 50, 50);
  text(s, 50, 50);
  popMatrix();
}

void drawCorrectNumberTile(String s, float x, float y, float size, float r, float g, float b) {
  drawTile(x, y, size);
  drawBubble(x, y, size, r, g, b, r + 64, g, b);
  drawText(s, x, y, size);
}

void drawIncorrectNumberTile(String s, float x, float y, float size) {
  drawTile(x, y, size);
  drawHighlightCircle(x, y, size);
  drawText(s, x, y, size);
}

void drawSmileyTile(float x, float y, float size) {
  drawTile(x, y, size);
  drawBubble(x, y, size, 236, 236 - 64, 0, 236, 236, 0);

  noStroke();
  fill(0);
  pushMatrix();
  translate(x, y);
  scale(size / 100);
  ellipse(36, 40, 10, 20);
  ellipse(63, 41, 10, 20);

  stroke(0);
  strokeWeight(6);
  noFill();
  arc(50, 50, 45, 45, PI / 8, 7 * PI / 8);

  popMatrix();
}

void drawEmptySpace(float x, float y, float size) {
  stroke(0);
  fill(0);

  pushMatrix();
  translate(x, y);
  scale(size / 100);
  strokeWeight(2);
  rect(0, 0, 100, 100);
  popMatrix();
}

void repaint() {
  boolean solved = isSolved();

  textSize(FONT_SIZE);
  textAlign(CENTER, CENTER);

  for (int i = 0; i < ROWS; i++) {
    int y = i * GRID_SIZE;
    for (int j = 0; j < COLS; j++) {
      int x = j * GRID_SIZE;
      int n = board[i][j];
      if (n == 0) {
        if (!solved) {
          drawEmptySpace(x, y, GRID_SIZE);
        }
        else {
          drawSmileyTile(x, y, GRID_SIZE);
        }
      }
      else {
        if (n == i * COLS + j + 1) {
          float r = 160 + i * 3;
          float g = 192;
          float b = 255 - i * 8;
          drawCorrectNumberTile(str(n), x, y, GRID_SIZE, r, g, b);
        } 
        else {
          drawIncorrectNumberTile(str(n), x, y, GRID_SIZE);
        }
      }
    }
  }
}

void draw() {
  if (state == SHUFFLING) {
    shuffle();
    repaint();
    shuffleCount++;
    if (shuffleCount == TOTAL_SHUFFLES) {
      state = PLAYING;
    }
  }
}

boolean hasZeroLeft(int row, int col) {
  return col > 0 && board[row][col - 1] == 0;
}

boolean hasZeroRight(int row, int col) {
  return col < COLS - 1 && board[row][col + 1] == 0;
}

boolean hasZeroUp(int row, int col) {
  return row > 0 && board[row - 1][col] == 0;
}

boolean hasZeroDown(int row, int col) {
  return row < ROWS - 1 && board[row + 1][col] == 0;
}

void slideLeft(int row, int col) {
  int n = board[row][col];
  board[row][col] = board[row][col - 1];
  board[row][col - 1] = n;
}

void slideRight(int row, int col) {
  int n = board[row][col];
  board[row][col] = board[row][col + 1];
  board[row][col + 1] = n;
}

void slideUp(int row, int col) {
  int n = board[row][col];
  board[row][col] = board[row - 1][col];
  board[row - 1][col] = n;
}

void slideDown(int row, int col) {
  int n = board[row][col];
  board[row][col] = board[row + 1][col];
  board[row + 1][col] = n;
}

int correctPiece(int row, int col) {
  return (row * COLS + col + 1) % (ROWS * COLS);
}

boolean isSolved() {
  for (int i = 0; i < ROWS; i++) {
    for (int j = 0; j < COLS; j++) {
      if (board[i][j] != correctPiece(i, j)) {
        return false;
      }
    }
  }
  return true;
}

void playClick() {
  click.stop();
  click.cue(0);
  click.speed(random(2.0, 2.5));
  click.volume(0.3);
  click.play();
}

void mousePressed() {
  int row = int(mouseY / GRID_SIZE);
  int col = int(mouseX / GRID_SIZE);

  if (hasZeroLeft(row, col)) {
    slideLeft(row, col);
    playClick();
  } 
  else if (hasZeroRight(row, col)) {
    slideRight(row, col);
    playClick();
  } 
  else if (hasZeroUp(row, col)) {
    slideUp(row, col);
    playClick();
  } 
  else if (hasZeroDown(row, col)) {
    slideDown(row, col);
    playClick();
  }
  repaint();
  
  if (isSolved()) {
    fanfare.play();
  }
  
  state = COMPLETE;
}

void shuffle() {
  for (;;) {
    int i = int(random(ROWS));
    int j = int(random(COLS));
    int dir = int(random(4));
    switch (dir) {
    case 0: 
      if (hasZeroUp(i, j)) {
        slideUp(i, j);
        return;
      }
    case 1: 
      if (hasZeroDown(i, j)) {
        slideDown(i, j);
        return;
      }
    case 2: 
      if (hasZeroLeft(i, j)) {
        slideLeft(i, j);
        return;
      }
    case 3: 
      if (hasZeroRight(i, j)) {
        slideRight(i, j);
        return;
      }
    }
  }
}
