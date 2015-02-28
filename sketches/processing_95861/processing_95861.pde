
/*we need variables for:
 secondsstart,
 a 2d array for ypositions,
 square size,
 number of rows,
 numCols,
 currentI,
 currentJ
 */
int startseconds;
int numRows = 6;
int numCols = 10;
int[][] squareYs = new int[numCols][numRows];
int squareSize = 50;
int currentI = 9;
int currentJ = 5;
int lastFrame = 0;
boolean done = false;


void setup() {
  //size and stuff
  size(800, 800);

  for (int i = 0; i < numCols; i++) {
    for (int j = 0; j < numRows; j++) {
      //set the ypositions to the starting ones.
      squareYs[i][j] = j*(squareSize + 5);
    }
  }
}

void draw() {
    background(255, 50, 225);
    int now = millis();
    float deltaT = (float)(now - lastFrame) / 1000;
    lastFrame = now;
    int mspassed = now - startseconds;
    //keep track of time.
    if (mspassed >= 1000) {
      //a second has passed.
      startseconds = now;
    }

    if (!done) {
      //make the current rectangle fall
      squareYs[currentI][currentJ] += (450 * deltaT);
      int endY = currentJ*(squareSize + 5) + 450;
      if (squareYs[currentI][currentJ] >= endY) {
        squareYs[currentI][currentJ] = endY;
        currentJ--;
        if (currentJ < 0) {
          currentI--;
          if (currentI < 0) {
            done = true;
          }
          currentJ = 5;
        }
      }
    }

    //draw all the rectangles
    for (int i = 0; i < numCols; i++) {
      for (int j = 0; j < numRows; j++) {
        //set the ypositions to the starting ones.
        fill(0);
        noStroke();
        rect( 150 + (i * (squareSize+5)), squareYs[i][j], squareSize, squareSize);
      }
    }
  }


