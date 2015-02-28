
// Based on an original marrimekko print, 'Rasymatto' from the 2011 collection, the code provies tones in red.

PImage poppys;
import processing.pdf.*;
int pdfCounter = 0;
float speed = 1.5;
float speed2 = 0.5;
float speed3 = 0.9;
float r;
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
  r = random (80, 259);
}

void draw (){
  background (224, 55, 92);
  x += random (-speed, speed);
  fill (255, 0, 0);
  for (int i = 10; i< 1100; i +=50){
  ellipse (i, 20, x, 50);
}
fill (190, 30, 20);
  for (int i = 10; i< 1100; i +=50){
  ellipse (i, 80, 50, 50);
  }
fill (150, 30, 20);
  for (int i = 10; i< 1100; i +=50){
  ellipse (i, 140, 50, 50);
  }
fill (190, 20, 10);
 x += random (-speed2, speed2);
  y +=random (-speed2, speed2);
  for (int i = 10; i< 1100; i +=50){
  ellipse (i, 200, x, y);
  }  
  fill (r, 0, 50);
  for (int i = 10; i< 1100; i +=50){
  ellipse (i, 260, 50, 50);
  }
  fill (190, 20, 10);
  y +=random (-speed3, speed3);
   for (int i = 10; i< 1100; i +=50){
  ellipse (i, 320, 50, y);
}
  fill (255, 10, 20);
  for (int i = 10; i< 1100; i +=50){
  ellipse (i, 380, 50, 50);
}
  fill (170, 30, 20);
  for (int i = 10; i< 1100; i +=50){
  ellipse (i, 440, 50, 50);
}  
fill (r, 30, 20);
fill (190, 20, 10);
 x += random (-speed2, speed2);
  for (int i = 10; i< 1100; i +=50){
  ellipse (i, 500, x, 50);
}
fill (200, 30, 20);
  for (int i = 10; i< 1100; i +=50){
  ellipse (i, 560, 50, 50);
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


