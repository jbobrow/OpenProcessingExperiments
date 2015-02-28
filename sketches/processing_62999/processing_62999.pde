
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

fill(151,162,216);
stroke(255);
for (int i=0; i<=width; i=i+100)
{
  for (int j=0; j<=height; j=j+100)
  {
    ellipse(i,j, 80,80);
    //println(i);
  }
}

fill(55,67,129);
stroke(255);
for (int i=0; i<=width; i=i+50)
{
  for (int j=0; j<=height; j=j+50)
  {
    ellipse(i,j, 20,20);
    //println(i);
  }
}

fill(151,162,216,50);
stroke(255);
for (int i=0; i<=width; i=i+10)
{
  for (int j=0; j<=height; j=j+10)
  {
    ellipse(i,j, 10,10);
    //println(i);
  }
}

noFill();
stroke(255);
strokeWeight(3);
for (int i=50; i<=width; i=i+100)
{
  for (int j=50; j<=height; j=j+100)
  {
    ellipse(i,j, 80,80);
    //println(i);
  }
}

stroke(255,120);
strokeWeight(4);
for (int i=50; i<=width; i=i+100)
{
  for (int j=50; j<=height; j=j+100)
  {
    ellipse(i,j, 100,100);
    //println(i);
  }
}

stroke(55,67,129);
strokeWeight(2);
for (int i=50; i<=width; i=i+100)
{
  for (int j=50; j<=height; j=j+100)
  {
    ellipse(i,j, 50,50);
    //println(i);
  }
}

stroke(55,67,129);
strokeWeight(1);
for (int i=50; i<=width; i=i+100)
{
  for (int j=50; j<=height; j=j+100)
  {
    ellipse(i,j, 30,30);
    //println(i);
  }
}

/*
noFill();
strokeWeight(1);
stroke(0);
for (int i=10; i<=width; i+=10)
{
  for (int j=10; j<=height-10; j+=50)
  {
    ellipse(i,j, 100, 100);
    //line(i, j, i+6, j+6);
    //line(i+6, j+(i/5.0), i, j+6);
  }
}
*/


///////////////////////////////////////////////////////////////////////////

//endRecord();

