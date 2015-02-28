
int B = -1600;
int A = 450;
int C = 600;
int D = 1;
void setup() {
  size (800, 700);
}
void draw() {
  background (#000066);
  B = B + 5;
  A = A - 1;
  C = C - 1;
  D = D + 2;
  stroke (0);
  fill (255); ellipse (100, 100, 10, 10); ellipse (280, 73, 10, 10); ellipse (275, 373, 10, 10); ellipse (562, 300, 10, 10); ellipse (733, 256, 10, 10); ellipse (633, 120, 10, 10); ellipse (355, 210, 10, 10);
  fill (255); ellipse (C, A, 80, 80);
  fill (#A9A9A9); stroke (0); ellipse (B - 20, 210, 100, 10); triangle (B + 100, 220, B + 105, 185, B + 120, 200); triangle (B + 120, 200, B + 135, 185, B + 140, 220); 
  ellipse (B + 120, 220, 40, 40); 
  ellipse (B + 10, 272, 25, 25); 
  ellipse (B + 90, 272, 25, 25);
  fill (#663300); ellipse (B + 110, 215, 5, 5); ellipse (B + 130, 210, 5, 5);
  fill(255); stroke (255); arc (B + 120, 225, 30, 20, 0, PI);
  fill (#FAEBD7); rect (B, 200, 100, 60);
  fill (#FF66FF); rect (B + 10, 210, 80, 40);
  fill (255, 0, 0); stroke (255, 0, 0); rect (B - 100, 220, 100, 10); rect (B - 200, 200, 100, 10); rect (B - 300, 220, 100, 10);
  fill (#FFFF00); stroke (#FFFF00); rect (B - 100, 230, 100, 10); rect (B - 200, 210, 100, 10); rect (B - 300, 230, 100, 10);
  fill (0, 255, 0); stroke (0, 255, 0); rect (B - 100, 240, 100, 10); rect (B - 200, 220, 100, 10); rect (B - 300, 240, 100, 10);
  fill (0, 0, 255); stroke (0, 0, 255); rect (B - 100, 250, 100, 10); rect (B - 200, 230, 100, 10); rect (B - 300, 250, 100, 10);
  fill (#006600); stroke (#003300); rect (-1, 500, 801, 200);
  fill (#003300); stroke (0); triangle (65, 550, 150, 450, 235, 550); triangle (85, 490, 150, 390, 215, 490); triangle (100, 415, 150, 340, 200, 415);
  fill (0); rect (-1, 560, 800, 60);
  fill (255, 0, 0); stroke (0); rect (D, 570, 90, 30); rect (D + 20, 550, 50, 20);
  fill (#14141F); ellipse (D + 20, 600, 30, 30); ellipse (D + 70, 600, 30, 30);
  fill (#003300); stroke (0); triangle (550, 650, 650, 500, 750, 650); triangle (570, 575, 650, 425, 730, 575); triangle (590, 510, 650, 390, 710, 510);
   
  
  
}

