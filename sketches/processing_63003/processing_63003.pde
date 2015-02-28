
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

//yblack line
stroke(0);
for (int x = 0; x<=width; x =x+1)
{
    for (int y = 0; y<=height; y =y+50)
    {
      line(x,y, width/3, height/3);
      //println(x);
    }
}

//purple line
stroke(63,62,100,50);
for (int x = 0; x<=width; x =x+50)
{
    for (int y = 0; y<=height; y =y+1)
    {
      line(x,y, width/3, height/3);
      //println(x);
    }
}

//white line
stroke(255,50);
for (int x = 0; x<=width; x =x+1)
{
    for (int y = 0; y<=height; y =y+100)
    {
      line(x,y, width/3, height/3);
      //println(x);
    }
}

//light purple line
stroke(190,188,255,30);
for (int x = 0; x<=width; x =x+150)
{
    for (int y = 0; y<=height; y =y+1)
    {
      line(x,y, width/3, height/3);
      //println(x);
    }
}
//white line
stroke(255);
for (int x = 0; x<=width; x =x+100)
{
    for (int y = 0; y<=height; y =y+50)
    {
      line(x,y, width/3, height/3);
      //println(x);
    }
}
///////////////////////////////////////////////////////////////////////////

//endRecord();

