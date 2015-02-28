
//import processing.pdf.*;
void setup() {
  size(800,600);
 // beginRecord(PDF, "para_imprimir4.pdf");
  
}

void draw() {
  background(0);
  int x = 0;
  
  while (x < 600) {
   noFill ();
    stroke(255);
    smooth ();
    triangle(x,0,500,x,height,100);
    x += 10;
  }
//endRecord();
}

