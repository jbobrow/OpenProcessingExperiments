
//import processing.pdf.*;

void setup() {
  size(800,600);
  //beginRecord(PDF, "para_imprimir.pdf");
  
}

void draw() {
  background(0);
  int x = 0;
  
  while (x < width) {
   fill (180,31,27,70);
    stroke(0);
    smooth ();
    triangle(x,0,300,x,height,70);
    x += 10;
  }
endRecord();
}

