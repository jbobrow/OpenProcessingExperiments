


import processing.pdf.*;
PShape s;
int x;
int y;
void setup() {
  size(1000, 600);
  background(256,256,256);
  frameRate(40);
  s = loadShape("arrow.svg");
  smooth();

}

void draw() {


y++;
 x++; 
 pushMatrix();
 scale(0.4);
 translate(mouseX,mouseY); 
 
 if (mouseX <= 500)
 {
   rotate(radians(y));
 }
 
 else {
  rotate(radians(y*(-1))); 
 }
 shape(s, 0,0);
 
  stroke(1);
noFill();
  vertex( 400,500 );
  vertex( 400,500 );
  vertex( 400,500 );
  vertex( 400,500 );
  vertex( 400,500 );
  endShape(CLOSE);
 
 popMatrix();

}


void keyPressed() {
println ("Recording " + key);
if (key == 's') beginRecord(PDF, "Lines.pdf");
 
println ("Stop " + key);
if (key == 'e') endRecord();
}


