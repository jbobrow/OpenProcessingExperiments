
/* 
Part of the ReCode Project (http://recodeproject.com)
Based on "Random Squares" by Charles Csuri
Originally published in "Computer Graphics and Art" vol1 no2, 1976
Copyright (c) 2012 Chris Allick - OSI/MIT license (http://recodeproject/license).
*/


          void setup() {
            size( 920, 580);
            background( 255 );
            stroke( 0 );
            strokeWeight( 2 );
            noFill();
            smooth();
            drawRects();
          }

          void draw() {

          }

          void drawRects() {
            background(255);
            for( int i = 0; i < 400; i++ ) {
              roundedRect( random(-10,width), random(-10,height), random( 5, 140), random(5,140), 5, 5 );
            }
          }

          void mousePressed() {
            drawRects();
          }

          void roundedRect(float x, float y, float w, float h, float rx, float ry) { //Code adapted from "cefnhoile", heres the link: https://forum.processing.org/topic/rounded-rectangle .
            beginShape();
            vertex(x, y+ry); //top of left side
            bezierVertex(x, y, x, y, x+rx, y); //top left corner
           
            vertex(x+w-rx, y); //right of top side
            bezierVertex(x+w, y, x+w, y, x+w, y+ry); //top right corner
           
            vertex(x+w, y+h-ry); //bottom of right side
            bezierVertex(x+w, y+h, x+w, y+h, x+w-rx, y+h); //bottom right corner
           
            vertex(x+rx, y+h); //left of bottom side
            bezierVertex(x, y+h, x, y+h, x, y+h-ry); //bottom left corner
           
            endShape(CLOSE);
          }
          //===========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
  String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
 
//==============
