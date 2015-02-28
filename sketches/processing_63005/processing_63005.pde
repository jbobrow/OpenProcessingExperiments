
/*
ACCD Summer 2012
ID02
2a Patterns
Charlene Chen
06/01/2012
*/

//import processing.pdf.*;

size(700, 700);
//beginRecord(PDF, "myFile.pdf");

///////////////////////////////////////////////////////////////////////////

background(0);
smooth();

noStroke();
fill(255, 124, 187,100);
for (int y =-height; y<=height; y=y+10)
{
 for (int x =-width; x<=width; x=x+20) 
 {
   ellipse(x+y, y, 30- y/10, 30- y/10);
 }
}
///////////////////////////////////////////////////////////////////////////

//endRecord();

