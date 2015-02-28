
int offsetX = 100;
int offsetY = 100;

float maxX = 180; // MAX RIGHT X VALUE
float changeX = 2.5; // AMOUNT TO CHANGE X BY
float initX = 180; // WHERE TO PUT THE OBJECT AT THE START

float maxY = 120;
float changeY = 2;
float initY = 100; 

float maxZ = 69;
float changeZ = 2.5;
float initZ = 66; 

float maxA = 73;
float changeA = 3.2;
float initA = 63; 

float maxB = 35;
float changeB = 1.5;
float initB = 29; 

float maxC = 230;
float changeC = 2.2;
float initC = 227; 

float maxD = 220;
float changeD = 2.2;
float initD = 210; 

float maxE = 200;
float changeE = 1.5;
float initE = 190; 

float maxF = 123;
float changeF = 1.7;
float initF = 118; 

void setup() {
  size(250, 250);
  smooth();
  noStroke();
}

void draw() {
  background(255);
  
  fill(#594882);
  ellipse(125,130,200,200);

  fill(#dbe47b);
  pushMatrix();
  initZ += changeZ;
  
  if (initZ > maxZ || initZ < 50) { 
    changeZ = -changeZ; 
    initZ += changeZ; 
  }
  translate(initZ,3);
  hexagon(40);
  popMatrix();
  
    fill(#000000);
  pushMatrix();
    initA += changeA;
  
  if (initA > maxZ || initA < 50) { 
    changeA = -changeA; 
    initA += changeA; 
  }
  translate(initA,89);
  hexagon(13);
  popMatrix();
  
   fill(#e5a548);
  pushMatrix();
      initY += changeY; 
  
  if (initY > maxY || initY < 100) { 
    changeY = -changeY; 
    initY += changeY; 
  }
  translate(initY,70);
  hexagon(25);
  popMatrix();
  
   fill(#dbe47b);
  pushMatrix();
    initB += changeB;
  
  if (initB > maxB || initB < 29) { 
    changeB = -changeB; 
    initB += changeB; 
  }
  translate(initB,90);
  hexagon(29);
  popMatrix();
  
  fill(#e5a548);
  pushMatrix();
  initX += changeX; // ADD THE VARIABLE SPEED AMOUNT TO THE INITIAL X VALUE
  
  if (initX > maxX || initX < 160) { // IF X IS GREATER THAN THE MAX OR LESS THAN 160
    changeX = -changeX; // REVERSE THE CHANGE AMOUNT FROM 10 TO -10
    initX += changeX; // RESET THE ANIMATION
  }
  
  translate(initX,122); // REPLACE THE X VALUE WITH OUR VARIABLE INITX
  hexagon(38);
  popMatrix();
  
  fill(#000000);
  pushMatrix();
    initC += changeC;
  
  if (initC > maxC || initC < 215) { 
    changeC = -changeC; 
    initC += changeC; 
  }
  translate(initC,126);
  hexagon(27);
  popMatrix();
  
  fill(#dbe47b);
  pushMatrix();
      initD += changeD;
  
  if (initD > maxD || initD < 200) { 
    changeD = -changeD; 
    initD += changeD; 
  }
  translate(initD,180);
  hexagon(11);
  popMatrix();
  
  fill(#dbe47b);
  pushMatrix();
      initE += changeE;
  
  if (initE > maxE || initE < 186) { 
    changeE = -changeE; 
    initE += changeE; 
  }
  translate(initE,125);
  hexagon(8);
  popMatrix();
  
    fill(#dbe47b);
  pushMatrix();
      initF += changeF;
  
  if (initF > maxF || initF < 110) { 
    changeF = -changeF; 
    initF += changeF; 
  }
  translate(initF,150);
  hexagon(12);
  popMatrix();

}

void hexagon(int sideLength) {
  float c = sideLength;
  float a = cos(radians(30)) * c;
  float b = sin(radians(30)) * c;
  
  float[] A = {a, 0};
  float[] B = {2 * a, b};
  float[] C = {2 * a, b + c};
  float[] D = {a, 2 * c};
  float[] E = {a / c, b + c};
  float[] F = {a / c, b};
  
  beginShape();
  vertex(A[0], A[1]);
  vertex(B[0], B[1]);
  vertex(C[0], C[1]);
  vertex(D[0], D[1]);
  vertex(E[0], E[1]);
  vertex(F[0], F[1]);
  rotate(PI/4.0);
  endShape();

}



                
