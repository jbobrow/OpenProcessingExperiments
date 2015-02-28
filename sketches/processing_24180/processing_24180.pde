
/*
 * Based on the idea of Mauricio J. Martínez
 * Draw's rotating rectangles of random width x height
 * Used as background canvas with processing.js
 *
 * Fabian Dennler <fd@fabforge.ch>
 */
   
float r = PI/6;                     // initial rotation

void setup() {
  //size(screen.width,screen.height);
  size(320,240);
  frameRate(4);
  initialize();
}  

void initialize() {
  stroke(255,30);
  strokeWeight(5);
  smooth();
}

void draw(){
 
  if (frameCount > 40) {
    rectMode (CENTER);
    translate (random(width), random(height));
    rotate (r);
    stroke(255,20);
    fill (random(150), random(10), random(160),random(160)*0.1);
    rect (0, 0, random(width/2), random(width/2));
    //increment angle – make smaller to slow rotation
    r += PI/36;                         
  }
}
