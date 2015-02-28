
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

fill(0);
stroke(117,152,77);
for (int x = 20; x<=width-20; x =x+10)
{
    for (int y = 20; y<=height-20; y =y+10)
    {
      line(x,y, width/2, height/2);
      //println(x);
    }
}

fill(0);
stroke(255,50);
for (int x = 0; x<=width; x =x+25)
{
    for (int y = 0; y<=height; y =y+50)
    {
      line(x,y, width/2, height/2);
      //println(x);
    }
}


///////////////////////////////////////////////////////////////////////////

//endRecord();

