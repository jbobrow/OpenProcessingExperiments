
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

background(200);
smooth();

/*
noStroke();
fill(255,106,123);
for (int x=0; x<=width; x=x+20)
{
 for (int y=0; y<=height; y=y+20)
 {
   quad(x,y, x+10, y, x-10, y+10, x, y+10);
 }
}
*/

//noFill();
noStroke();
fill(240,85,103);
//stroke(0);
for (int x=0; x<=width; x=x+80)
{
 for (int y=0; y<=height; y=y+200)
 {
   quad(x,y, x+20, y-10, width/2, height/2, width/2+10, height/2+10);
 }
}

fill(255);
noStroke();
//stroke(0);
for (int x=0; x<=width; x=x+200)
{
 for (int y=0; y<=height; y=y+80)
 {
   quad(x,y, x+20, y-10, width/2, height/2, width/2+10, height/2+10);
 }
}

fill(240,85,103,30);
//stroke(0);
for (int x=0; x<=width; x=x+30)
{
 for (int y=0; y<=height; y=y+100)
 {
   quad(x,y, x+20, y-10, width/3, height/3, width/3+10, height/3+10);
 }
}

fill(255,150);
//stroke(0);
for (int x=0; x<=width; x=x+200)
{
 for (int y=0; y<=height; y=y+80)
 {
   quad(x,y, x+20, y-10, width*1.2, height*1.2, width*1.2+10, height*1.2+10);
 }
}

///////////////////////////////////////////////////////////////////////////

//endRecord();

