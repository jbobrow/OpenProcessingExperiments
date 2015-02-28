
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

background(255);
smooth();

noStroke();
fill(33,120,162,50);
for (int x= 0; x<=width; x=x+50)
{
 for (int y= 0; y<=height; y=y+50)
 {
  quad(x,y, x*1.5, y*1.5, x+y, y+x, x+y/8, y+x/8);
 } 
}

//fill(0);
stroke(255);
for (int x= 0; x<=width; x=x+100)
{
 for (int y= 0; y<=height; y=y+100)
 {
  quad(x,y, x*1.1, y*1.1, x+y, y+x, x+y/8, y+x/8);
 } 
}

///////////////////////////////////////////////////////////////////////////

//endRecord();

