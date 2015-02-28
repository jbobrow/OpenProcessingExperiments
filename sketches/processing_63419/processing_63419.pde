
/** SolLewittLineDrawing  from Drawing Series III/2314/A 1969<br />
*   inspired by cam kafura but written from scratch by Peter Bosshard Schneider<br />
*/


final int HORIZONTAL = 0;
final int VERTICAL = 1;
final int DIAGONALDOWN = 2;
final int DIAGONALUP = 3;
final float LINESPACING = 5.0;

SolLewittSquare sls1;
SolLewittSquare sls2;
SolLewittSquare sls3;
SolLewittSquare sls4;
SolLewittSquare sls5;
SolLewittSquare sls6;
SolLewittSquare sls7;
SolLewittSquare sls8;
SolLewittSquare sls9;
SolLewittSquare sls10;
SolLewittSquare sls11;
SolLewittSquare sls12;
SolLewittSquare sls13;
SolLewittSquare sls14;
SolLewittSquare sls15;
SolLewittSquare sls16;
float square_offset,square_side;

void setup() {
  size(500, 500, JAVA2D);   // width and height should be the same
  background(255);
  smooth();
  square_offset = width/4;  
  square_side = width/4;
  // SolLewittSquare(PVector pos, float s, int m, float spc)
  sls1 = new SolLewittSquare(new PVector(0, 0), square_side, HORIZONTAL, LINESPACING);
  sls2 = new SolLewittSquare(new PVector(square_offset, 0), square_side, DIAGONALUP, LINESPACING);
  sls3 = new SolLewittSquare(new PVector(2*square_offset, 0), square_side, HORIZONTAL, LINESPACING);
  sls4 = new SolLewittSquare(new PVector(3*square_offset, 0), square_side, VERTICAL, LINESPACING);
  sls5 = new SolLewittSquare(new PVector(0, square_offset), square_side, VERTICAL, LINESPACING);
  sls6 = new SolLewittSquare(new PVector(square_offset, square_offset), square_side, DIAGONALDOWN, LINESPACING);
  sls7 = new SolLewittSquare(new PVector(2*square_offset, square_offset), square_side, DIAGONALUP, LINESPACING);
  sls8 = new SolLewittSquare(new PVector(3*square_offset, square_offset), square_side, DIAGONALDOWN, LINESPACING);
  sls9 = new SolLewittSquare(new PVector(0, 2*square_offset), square_side, VERTICAL, LINESPACING);
  sls10 = new SolLewittSquare(new PVector(square_offset, 2*square_offset), square_side, HORIZONTAL, LINESPACING);
  sls11 = new SolLewittSquare(new PVector(2*square_offset, 2*square_offset), square_side, VERTICAL, LINESPACING);
  sls12 = new SolLewittSquare(new PVector(3*square_offset, 2*square_offset), square_side, DIAGONALDOWN, LINESPACING);
  sls13 = new SolLewittSquare(new PVector(0, 3*square_offset), square_side, DIAGONALDOWN, LINESPACING);
  sls14 = new SolLewittSquare(new PVector(square_offset, 3*square_offset), square_side, DIAGONALUP, LINESPACING);
  sls15 = new SolLewittSquare(new PVector(2*square_offset, 3*square_offset), square_side, HORIZONTAL, LINESPACING);
  sls16 = new SolLewittSquare(new PVector(3*square_offset, 3*square_offset), square_side, DIAGONALUP, LINESPACING);
}

void draw() {
  background(255);
  sls1.display();
  sls2.display();
  sls3.display();
  sls4.display();
  sls5.display();
  sls6.display();
  sls7.display();
  sls8.display();
  sls9.display();
  sls10.display();
  sls11.display();
  sls12.display();
  sls13.display();
  sls14.display();
  sls15.display();
  sls16.display();
}


