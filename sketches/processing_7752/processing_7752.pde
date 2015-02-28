
//import processing.pdf.*;

int x=2;
int y=2;
float z=1.5;
int w =20;
int h = 10;

void setup (){
  size (600, 600);
  //beginRecord (PDF, "incregrid7.pdf");
  background (0);
  smooth();
}

void draw (){
  strokeWeight (3);
  fill (209, 207, 139, 25);
  //stroke (0);
  ellipse (x, y, 75, 800);
  x = x*2;
  
  strokeWeight (1.5);
  line (x+z, x, x*z, 800);
  line (y, y-z, 800, y*z);
  fill (209, 207, 139, 55);
  ellipse (x, y, 77, 675);
 
  strokeWeight (1);
  fill (245, 85, 22, 35);
  rect (y, y-z, 800, y*z);
  y = y*2;
  fill (245, 85, 22, 55);
  rect (10, y-z, 500, y/z);
  
 
}

void mousePressed() {
  endRecord();
}

