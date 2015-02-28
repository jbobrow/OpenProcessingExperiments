
// kieran's matrix program

int x = 750, y = 500;
int xspacing = 12, yspacing = 16;
int num, col, rnd;

int xnum = floor(x / xspacing), ynum = int(y / yspacing);

int matrix[ ][ ][ ] = new int[xnum][ynum][3];

PFont ocr;

void setup() {
  size(x, y);
  background(0, 0, 0);
  frameRate(10);
  noSmooth();  
  
  // set the font and text colour
  ocr = loadFont("matrixfont.vlw");
  textFont(ocr); 
  
  // fill the matrix with numbers and assigned each a starting colour!
  for (int i = 0; i < xnum; i++ ) {

    matrix[i][0][2] = 20 + floor(random(20)); // assign each column an add value for the speed at which it changes value
    rnd = floor(random(255));
    
    for (int j = 0; j < ynum; j++ ) {
      matrix[i][j][0] = floor(random(10)); // the number
      matrix[i][j][1] = (rnd + 255 - round((255 * j) / ynum))%255; // the colour
    }
  }
}

void draw() {
  background(0, 0, 0);
  theMatrix();
}

void theMatrix() {
  // loop through all elements of the matrix, calculate their new color and draw them
  for (int i = 0; i < xnum; i++ ) {
    for (int j = 0; j < ynum; j++ ) {
      matrix[i][j][0] = floor(random(10)); // generate a new random number for the matrix position i, j
      matrix[i][j][1] += matrix[i][0][2];  // increase the colour by the corresponding column's add value
      matrix[i][j][1] = matrix[i][j][1]%255; // floor the color back to 0 when it hits 255
      col = 255 - matrix[i][j][1];  // set the color
      fill(col / 4, col, col / 2); // activate the color
      text(matrix[i][j][0], 2 + i * xspacing, (j + 1) * yspacing); // draw the matrix!
    }
  }
}

