
//import processing.pdf.*;

void setup (){
  size (800,600);
  
 //  beginRecord(PDF, "circulosrojos.pdf");
  background (0,0,0);
  smooth ();
}
void draw (){
  for (int i=0; i<= 100; i++) {
    circulito (int (random (255)), int (random (5)), int (random (width)),
    int (random (height)), 300);
  }
  
//endRecord();

}
  


void circulito (int a, int b, int x, int y, int f){
  stroke (a);
    strokeWeight (b);
 
 fill (240, 15,15, 30);
ellipse (a, -b, 300,+ f);
 ellipse (600, + b, 400,x);
 ellipse (200, 100, 200,x);
 ellipse (800, 500, 300, x);
 ellipse (800, 300, 600, x);

  }
  
void mousePressed(){
  saveFrame("1.JPG");
   // saveFrame();
  }




