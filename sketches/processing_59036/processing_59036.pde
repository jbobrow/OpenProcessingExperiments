
// Based on an original marrimekko print from the 2011 collection, the code provies a blue and green toned option.



PImage poppys;
import processing.pdf.*;
int pdfCounter = 0;
float speed = 1.5;
float speed2 = 0.5;
float speed3 = 0.9;
float b;
int diameter = 20;
float x;
float y;

// PDF setup
void mousePressed() {
  pdfCounter++;
  saveFrame("frame-####.png");  
}

// Background
void setup () {
  size (1000, 570) ;
  smooth ();
  noStroke ();
  x= 45;
  y= random (30, 50);
  b = random (80, 259);
}

void draw (){
  background (43, 130, 147);
  fill (15, 80, 6);
  for (int i = 10; i< 1100; i +=50){
  ellipse (i, 20, 50, 50);
}
fill (99, 152, 8);
  x += random (-speed, speed);
  for (int i = 10; i< 1100; i +=50){
  ellipse (i, 80, x, 50);
  }
fill (195, 242, 115);
  for (int i = 10; i< 1100; i +=50){
  ellipse (i, 140, 50, 50);
  }
fill (32, 72, 93);
 x += random (-speed2, speed2);
  y +=random (-speed2, speed2);
  for (int i = 10; i< 1100; i +=50){
  ellipse (i, 200, x, y);
  }  
  fill (116, 149, b);
  for (int i = 10; i< 1100; i +=50){
  ellipse (i, 260, 50, 50);
  }
  fill (32, 72, 93);
   for (int i = 10; i< 1100; i +=50){
  ellipse (i, 320, 50, 50);
}
  fill (80, 124, 103);
   y +=random (-speed3, speed3);
  for (int i = 10; i< 1100; i +=50){
  ellipse (i, 380, 50, y);
}
  fill (37, 206, 145);
  for (int i = 10; i< 1100; i +=50){
  ellipse (i, 440, 50, 50);
}  
fill (158, 206, 37);
  for (int i = 10; i< 1100; i +=50){
  ellipse (i, 500, 50, 50);
}
fill (99, 152, 8);
 x += random (-speed2, speed2);
  for (int i = 10; i< 1100; i +=50){
  ellipse (i, 560, x, 50);
  }
}

// PDF closer
void mouseReleased() {
  endRecord();
}  
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


