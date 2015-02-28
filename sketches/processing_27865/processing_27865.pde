
/* "weich-hart" - Susanne Appelhanz,
HTW Berlin, Sommersemester 2011 */

void setup(){
   size(400, 400);
   background(0);
   smooth();
}

void draw(){
if (mousePressed) {
  stroke(255,50);
  strokeWeight(3); 
  line(mouseX, 0, mouseX, 400);
}else{
  noFill();
  stroke(255,50);
  strokeWeight(1);
  bezier(10,200,mouseX,mouseY,mouseX,mouseY,390,200);
}}
