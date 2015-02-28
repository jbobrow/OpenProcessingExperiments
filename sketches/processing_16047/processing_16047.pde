
//import processing.pdf.*;
void setup() {
  size(800,600);
 // beginRecord(PDF, "para_imprimir5.pdf");
}

void draw() {
  background(0);
  int x = 0;
  
  while (x < 600) {
   noFill ();
    stroke(255);
    smooth ();
    triangle(x,800,100,x,height,300);
    x += 10;
  }


endRecord();
}

