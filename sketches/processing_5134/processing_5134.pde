
// kieran's balls program

int spread = 300;
int xc, yc;
int sz = 20, xnum = 30, ynum = 30;
int ballArray[ ][ ][ ] = new int[xnum][ynum][3];
float disx, disy, dis;

void setup() {
  size (600, 600, JAVA2D);
  background(255);
  fill(255, 255, 0);
  strokeWeight(1); stroke(0); smooth();
  
  for(int i = 0; i < xnum; i ++ ) {
    for(int j = 0; j < ynum; j ++ ) {
      ballArray[i][j][0] = floor(random(sz));
      ballArray[i][j][1] = floor(random(255));
      ballArray[i][j][2] = sz;
    }
  }
}

void draw() {
  background(0, 192, 0);
  balls();
}

void balls() {
  for(int i = 0; i < xnum; i ++ ) {
    for(int j = 0; j < ynum; j ++ ) {
      xc = floor(i * sz + (sz / 2)); yc = floor(j * sz + (sz / 2));
      
      ballArray[i][j][1] += 2;
      ballArray[i][j][1] = ballArray[i][j][1]%255;
      fill(0.5 * abs(ballArray[i][j][1] - 127), 2 * abs(ballArray[i][j][1] - 127), 0.5 * abs(ballArray[i][j][1] - 127));
      
      /* ignore this shit, it doesn't work but I  may use it later for some purpose!!!
      disx = abs(xc - (width / 2)); disy = abs(yc - (height / 2));
      dis = 1 + sqrt((disx * disx) + (disy * disy));
      */
      
      ballArray[i][j][0] ++;  ballArray[i][j][0] = ballArray[i][j][0]%ballArray[i][j][2];
      
      ellipse(xc, yc, 2 * abs(ballArray[i][j][0] - (sz / 2)), 2 * abs(ballArray[i][j][0] - (sz / 2)));
    }
  }
}

