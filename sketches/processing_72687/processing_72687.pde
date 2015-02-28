
// Assignment 2 — Drawing Program with Two Variables
// Kari Kawachi

float lineSize;
int lineColor;
int fancyPants;

void setup(){
  size (1080, 720);
  colorMode(HSB, 360, 100, 100, 100);
  smooth();
  background(0);
  lineSize = 1;
  lineColor = 1;
  fancyPants = 1;
}

void draw(){
  if (mousePressed && (mouseButton == LEFT)) {
    stroke(lineColor, 100, 100, 100);  
    line(pmouseX, pmouseY, mouseX, mouseY);
      if (lineColor > 360) {
//      println("Is this line working");  used for debugging
        fancyPants = 1;
       }
       if (lineColor <= 0) {
        fancyPants = 0;
       }

        if (fancyPants == 1) {
          lineColor --;
        }
        if (fancyPants == 0) {
          lineColor ++;
        }         
  } 
  
  if (keyPressed) {
    if (key == CODED) {
      if (keyCode == UP) {       
       println(lineSize);
       strokeWeight(lineSize ++);
   }
   else if (keyCode == DOWN) {
     println(lineSize);
     strokeWeight(lineSize --);
       if (lineSize < 0) {
         lineSize = 1;
       }
   }
  }
 }
 
// println(lineColor);
// println(fancyPants);

 if (keyPressed) {
   if (key == 'c' || key == 'C') {
     background (0);
  }
 }
}


