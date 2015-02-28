
/** SolLewittLineDrawing  from Drawing Series III/2314/B 1969<br />
*   inspired by cam kafura but written fro scratch by Peter Bosshard Schneider<br />
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
SolLewittSquare sls17;
SolLewittSquare sls18;
SolLewittSquare sls19;
SolLewittSquare sls20;
SolLewittSquare sls21;
SolLewittSquare sls22;
SolLewittSquare sls23;
SolLewittSquare sls24;
SolLewittSquare sls25;
SolLewittSquare sls26;
SolLewittSquare sls27;
SolLewittSquare sls28;
SolLewittSquare sls29;
SolLewittSquare sls30;
SolLewittSquare sls31;
SolLewittSquare sls32;
SolLewittSquare sls33;
SolLewittSquare sls34;
SolLewittSquare sls35;
SolLewittSquare sls36;
SolLewittSquare sls37;
SolLewittSquare sls38;
SolLewittSquare sls39;
SolLewittSquare sls40;
float square_offset,square_side;

void setup() {
  size(500, 500, JAVA2D);   // width and height should be the same
  background(255);
  smooth();
  square_offset = width/4;  // these two variables have the same value
  square_side = width/4;    // its just to make the following code more readable
  
  // instantiate the objects with the second constructor -> SolLewittSquare(PVector pos, float s, int m, float spc)
  // Square 1-4
  sls1 = new SolLewittSquare(new PVector(0, 0), square_side, HORIZONTAL, LINESPACING);
  sls2 = new SolLewittSquare(new PVector(0, 0), square_side, VERTICAL, LINESPACING);
  
  sls3 = new SolLewittSquare(new PVector(square_offset, 0), square_side, DIAGONALUP, LINESPACING);
  sls4 = new SolLewittSquare(new PVector(square_offset, 0), square_side, HORIZONTAL, LINESPACING);
  sls5 = new SolLewittSquare(new PVector(square_offset, 0), square_side, VERTICAL, LINESPACING);
  
  sls6 = new SolLewittSquare(new PVector(2*square_offset, 0), square_side, HORIZONTAL, LINESPACING);
  sls7 = new SolLewittSquare(new PVector(2*square_offset, 0), square_side, VERTICAL, LINESPACING);
  
  sls8 = new SolLewittSquare(new PVector(3*square_offset, 0), square_side, VERTICAL, LINESPACING);
  
  // Square 5-8
  sls9 = new SolLewittSquare(new PVector(0, square_offset), square_side, VERTICAL, LINESPACING);
  
  sls10 = new SolLewittSquare(new PVector(square_offset, square_offset), square_side, DIAGONALDOWN, LINESPACING);
  sls11 = new SolLewittSquare(new PVector(square_offset, square_offset), square_side, DIAGONALUP, LINESPACING);
  sls12 = new SolLewittSquare(new PVector(square_offset, square_offset), square_side, HORIZONTAL, LINESPACING);
  sls13 = new SolLewittSquare(new PVector(square_offset, square_offset), square_side, VERTICAL, LINESPACING);
  
  sls14 = new SolLewittSquare(new PVector(2*square_offset, square_offset), square_side, DIAGONALUP, LINESPACING);
  sls15 = new SolLewittSquare(new PVector(2*square_offset, square_offset), square_side, HORIZONTAL, LINESPACING);
  sls16 = new SolLewittSquare(new PVector(2*square_offset, square_offset), square_side, VERTICAL, LINESPACING);
  
  sls17 = new SolLewittSquare(new PVector(3*square_offset, square_offset), square_side, DIAGONALDOWN, LINESPACING);
  sls18 = new SolLewittSquare(new PVector(3*square_offset, square_offset), square_side, DIAGONALUP, LINESPACING);
  sls19 = new SolLewittSquare(new PVector(3*square_offset, square_offset), square_side, HORIZONTAL, LINESPACING);
  sls20 = new SolLewittSquare(new PVector(3*square_offset, square_offset), square_side, VERTICAL, LINESPACING);
  
  // Square 9-12
  sls21 = new SolLewittSquare(new PVector(0, 2*square_offset), square_side, VERTICAL, LINESPACING);
  
  sls22 = new SolLewittSquare(new PVector(square_offset, 2*square_offset), square_side, HORIZONTAL, LINESPACING);
  sls23 = new SolLewittSquare(new PVector(square_offset, 2*square_offset), square_side, VERTICAL, LINESPACING);
  
  sls24 = new SolLewittSquare(new PVector(2*square_offset, 2*square_offset), square_side, VERTICAL, LINESPACING);
  
  sls25 = new SolLewittSquare(new PVector(3*square_offset, 2*square_offset), square_side, DIAGONALDOWN, LINESPACING);
  sls26 = new SolLewittSquare(new PVector(3*square_offset, 2*square_offset), square_side, DIAGONALUP, LINESPACING);
  sls27 = new SolLewittSquare(new PVector(3*square_offset, 2*square_offset), square_side, HORIZONTAL, LINESPACING);
  sls28 = new SolLewittSquare(new PVector(3*square_offset, 2*square_offset), square_side, VERTICAL, LINESPACING);
  
  // Square 13-16
  sls29 = new SolLewittSquare(new PVector(0, 3*square_offset), square_side, DIAGONALDOWN, LINESPACING);
  sls30 = new SolLewittSquare(new PVector(0, 3*square_offset), square_side, DIAGONALUP, LINESPACING);
  sls31 = new SolLewittSquare(new PVector(0, 3*square_offset), square_side, HORIZONTAL, LINESPACING);
  sls32 = new SolLewittSquare(new PVector(0, 3*square_offset), square_side, VERTICAL, LINESPACING);
  
  
  sls33 = new SolLewittSquare(new PVector(square_offset, 3*square_offset), square_side, DIAGONALUP, LINESPACING);
  sls34 = new SolLewittSquare(new PVector(square_offset, 3*square_offset), square_side, HORIZONTAL, LINESPACING);
  sls35 = new SolLewittSquare(new PVector(square_offset, 3*square_offset), square_side, VERTICAL, LINESPACING);
  
  sls36 = new SolLewittSquare(new PVector(2*square_offset, 3*square_offset), square_side, HORIZONTAL, LINESPACING);
  sls37 = new SolLewittSquare(new PVector(2*square_offset, 3*square_offset), square_side, VERTICAL, LINESPACING);
  
  sls38 = new SolLewittSquare(new PVector(3*square_offset, 3*square_offset), square_side, DIAGONALUP, LINESPACING);
  sls39 = new SolLewittSquare(new PVector(3*square_offset, 3*square_offset), square_side, HORIZONTAL, LINESPACING);
  sls40 = new SolLewittSquare(new PVector(3*square_offset, 3*square_offset), square_side, VERTICAL, LINESPACING);
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
  sls17.display();
  sls18.display();
  sls19.display();
  sls20.display();
  sls21.display();
  sls22.display();
  sls23.display();
  sls24.display();
  sls25.display();
  sls26.display();
  sls27.display();
  sls28.display();
  sls29.display();
  sls30.display();
  sls31.display();
  sls32.display();
  sls33.display();
  sls34.display();
  sls35.display();
  sls36.display();
  sls37.display();
  sls38.display();
  sls39.display();
  sls40.display();
}


