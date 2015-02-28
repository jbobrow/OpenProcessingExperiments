
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

smooth();
noFill();
strokeWeight(5);
stroke(114, 98, 144,200);
for (int i=10; i<=width-10; i+=10)
{
  for (int j=10; j<=height-10; j+=30)
  {
    ellipse(i,j, 50, 50);
    //line(i, j, i+6, j+6);
    //line(i+6, j+(i/5.0), i, j+6);
  }
}


strokeWeight(1);
stroke(255, 94, 13, 100);
for (int i=10; i<=width-10; i+=10)
{
  for (int j=10; j<=height-10; j+=50)
  {
    ellipse(i,j, 100, 100);
    //line(i, j, i+6, j+6);
    //line(i+6, j+(i/5.0), i, j+6);
  }
}

///////////////////////////////////////////////////////////////////////////

//endRecord();

