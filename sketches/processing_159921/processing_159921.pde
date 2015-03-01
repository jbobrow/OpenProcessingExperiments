
import processing.pdf.*;

void setup() {
  size(800, 600 /*, PDF, "IdaChow.pdf"*/);
  smooth();
  background(#A2D4D6);
}

void draw() {
  int xShift = 0;

// for loops the first x-row
  for (int y = 0; y < 600/10; y+= 1) {
    // triangleborders
   /*  noStroke();
    fill(34, 34, 34, 255);
    triangle(0, 0+xShift, 0, 25+xShift, 10, 0+xShift);
    triangle(0, 25+xShift, 0, 50+xShift, 10, 50+xShift);
    triangle(40, 0+xShift, 50, 0+xShift, 50, 25+xShift);
    triangle(40, 50+xShift, 50, 50+xShift, 50, 25+xShift);

    // outer triangle
    fill(255, mouseY, mouseX, 10);
    triangle(25, 50+xShift, 5, 12+xShift, 45, 12+xShift);
    triangle(25, 0+xShift, 5, 38+xShift, 45, 38+xShift);

    //inner triangle
    fill(255,233,201,50);
    triangle(25,20+xShift,20,30+xShift,30,30+xShift); */

// for loops the rest of the y-rows including the x-rows
    for (int x = 0; x < 800/10; x+= 1) {
      // triangleborders
      noStroke();
      fill(90, 90, 90, 255);
      triangle(0+x*xShift, 0+y*xShift, 0+x*xShift, 25+y*xShift, 10+x*xShift, 0+y*xShift);
      triangle(0+x*xShift, 25+y*xShift, 0+x*xShift, 50+y*xShift, 10+x*xShift, 50+y*xShift);
      triangle(40+x*xShift, 0+y*xShift, 50+x*xShift, 0+y*xShift, 50+x*xShift, 25+y*xShift);
      triangle(40+x*xShift, 50+y*xShift, 50+x*xShift, 50+y*xShift, 50+x*xShift, 25+y*xShift);

      // outer triangle
      fill(150, mouseY, mouseX, 50);
      triangle(25+x*xShift, 50+y*xShift, 5+x*xShift, 12+y*xShift, 45+x*xShift, 12+y*xShift);
      triangle(25+x*xShift, 0+y*xShift, 5+x*xShift, 38+y*xShift, 45+x*xShift, 38+y*xShift);
      
      fill(255,233,201,50);
      triangle(25+x*xShift,20+y*xShift,20+x*xShift,30+y*xShift,30+x*xShift,30+y*xShift);
      
      xShift = 50;

    }
  }
  /*exit();*/
}

