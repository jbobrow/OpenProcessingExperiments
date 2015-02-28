
int cols;
int rows;
int[][] r;
int[][] g;
int[][] b;
int mvX, mvY, prevmvX, prevmvY;

void setup() {
  size(600, 600);
  frameRate(60);
  cols = width/6;
  rows = height/6;
  mvX = int(random(25, 75));
  mvY = int(random(25, 75));
  prevmvX =mvX;
  prevmvY =mvY;

  // Declare 2D array
  r = new int[cols][rows];
  g = new int[cols][rows];
  b = new int[cols][rows];

  // Initialize 2D array values
  for (int i = 0; i < cols ; i++) {
    for (int j = 0; j < rows; j++) {
      r[i][j] = 0;
      g[i][j] = 0;
      b[i][j] = int(random(100));
      fill(r[i][j], g[i][j], b[i][j]);
      rect(i*6, j*6, 6, 6);
    }
  }
}

void draw() {
  // Draw points
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (g[i][j] == 0 && r[i][j] == 0 && frameCount % 10 == 0 && i != mvX && i != mvY) {
        b[i][j] = int(random(100));
        fill(r[i][j], g[i][j], b[i][j]);
        rect(i*6, j*6, 6, 6);
      }
      else if (i != mvX && i != mvY) {
        fill(r[i][j], g[i][j], b[i][j]);
        rect(i*6, j*6, 6, 6);
      }
    }
  }

  if (frameCount % 3 == 0) { 
    r[mvX][mvY] = 255;
    g[mvX][mvY] = 255;
    b[mvX][mvY] = 255;
    //    fill(r[mvX][mvY], g[mvX][mvY], b[mvX][mvY]);
    fill(random(255));
    rect(mvX*6, mvY*6, 6, 6);
    movePoint();
  }
}

void movePoint() {
  //not the most efficient way to do this... but I didn't feel like writing
  //a bunch of if statements...
  while ( (mvX == prevmvX && mvY == prevmvY) || (r[mvX][mvY] == 255  && g[mvX][mvY] == 255  && b[mvX][mvY] == 255)) {
    float r = random(0, 1);
    if (r < .25) {
      mvX = mvX - 1;
    }
    else if (r < .5) {
      mvY = mvY + 1;
    }
    else if (r < .75) {
      mvY = mvY - 1;
    }
    else {
      mvX = mvX + 1;
    }

    //for wrap around
    if (mvX < 0)
      mvX = mvX + 100;
    if (mvX > 99)
      mvX = mvX - 100;
    if (mvY < 0)
      mvY = mvY + 100;
    if (mvY > 99)
      mvY = mvY - 100;
  }
  prevmvX = mvX;
  prevmvY = mvY;
}

void keyReleased() {
  if (key == 'c') {
    for (int i = 0; i < cols ; i++) {
      for (int j = 0; j < rows; j++) {
        r[i][j] = 0;
        g[i][j] = 0;
        b[i][j] = int(random(100));
        fill(r[i][j], g[i][j], b[i][j]);
        rect(i*6, j*6, 6, 6);
      }
    }
  } 

  mvX = int(random(25, 75));
  mvY = int(random(25, 75));
  prevmvX =mvX;
  prevmvY =mvY;
}


