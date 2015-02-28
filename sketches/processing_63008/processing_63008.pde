
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

/*
//3pt white dots
fill(255);
stroke(255);
strokeWeight(3);
for (int i=100; i<=400; i=i+10)
{
  for (int j=100; j<=400; j=j+10)
  {
    point(i,j);
    //println(i);
  }
}
*/

//orangedots
noFill();
//fill(255,80);
stroke(255,182,113,100);
strokeWeight(30);
for (int i=-100; i<=width+300; i=i+50)
{
  for (int j=-100; j<=height+300; j=j+50)
  {
    point(i+j/5.0, j+i/5.0);
    //println(i);
  }
}

//orange dots
noFill();
//fill(255,80);
stroke(255,182,113,100);
strokeWeight(40);
for (int i=-100; i<=width+300; i=i+50)
{
  for (int j=-100; j<=height+300; j=j+50)
  {
    point(i+j/5.0, j+i/5.0);
    //println(i);
  }
}

//blue dots
noFill();
//fill(255,80);
stroke(113,190,255,50);
strokeWeight(50);
for (int i=-100; i<=width+300; i=i+50)
{
  for (int j=-100; j<=height+300; j=j+50)
  {
    point(i+j/5.0, j+i/5.0);
    //println(i);
  }
}

//orange dots
noFill();
//fill(255,80);
stroke(255,182,113,50);
strokeWeight(60);
for (int i=-100; i<=width+300; i=i+50)
{
  for (int j=-100; j<=height+300; j=j+50)
  {
    point(i+j/5.0, j+i/5.0);
    //println(i);
  }
}

//blue dots
noFill();
//fill(255,80);
stroke(113,190,255,100);
strokeWeight(20);
for (int i=-100; i<=width+300; i=i+50)
{
  for (int j=-100; j<=height+300; j=j+50)
  {
    point(i+j/5.0, j+i/5.0);
    //println(i);
  }
}

//blue dots
noFill();
//fill(255,80);
stroke(113,190,255,100);
strokeWeight(20);
for (int i=-100; i<=width+300; i=i+80)
{
  for (int j=-100; j<=height+300; j=j+80)
  {
    point(i+j/5.0, j+i/5.0);
    //println(i);
  }
}

//blue dots
noFill();
//fill(255,80);
stroke(113,190,255,100);
strokeWeight(20);
for (int i=-100; i<=width+300; i=i+40)
{
  for (int j=-100; j<=height+300; j=j+40)
  {
    point(i+j/5.0, j+i/5.0);
    //println(i);
  }
}


//orange dots
noFill();
//fill(255,80);
stroke(255,182,113);
strokeWeight(1);
for (int i=-100; i<=width+300; i=i+30)
{
  for (int j=-100; j<=height+300; j=j+30)
  {
    point(i+j/9,j+i/9);
    point(i+j/7,j+i/7);
    point(i+j/5,j+i/5);
    point(i+j/3,j+i/3);
    point(i+j,j+i);
    //println(i);
  }
}

//orange dots
noFill();
//fill(255,80);
stroke(255,182,113);
strokeWeight(5);
for (int i=-100; i<=width+300; i=i+50)
{
  for (int j=-100; j<=height+300; j=j+50)
  {
    point(i+j/9,j+i/9);
    point(i+j/7,j+i/7);
    point(i+j/5,j+i/5);
    //println(i);
  }
}

//orange dots
noFill();
//fill(255,80);
stroke(255,182,113);
strokeWeight(5);
for (int i=-100; i<=width+300; i=i+80)
{
  for (int j=-100; j<=height+300; j=j+80)
  {
    point(i+j/9,j+i/9);
    //println(i);
  }
}

//orange dots
noFill();
//fill(255,80);
stroke(255,182,113);
strokeWeight(5);
for (int i=-100; i<=width+300; i=i+110)
{
  for (int j=100; j<=height+300; j=j+110)
  {
    point(i+j/9,j+i/9);
    //println(i);
  }
}

//orange dots
noFill();
//fill(255,80);
stroke(255,182,113);
strokeWeight(5);
for (int i=-100; i<=width+300; i=i+140)
{
  for (int j=100; j<=height+300; j=j+140)
  {
    point(i+j/9,j+i/9);
    //println(i);
  }
}

//orange dots
noFill();
//fill(255,80);
stroke(255,182,113,100);
strokeWeight(10);
for (int i=-100; i<=width+300; i=i+150)
{
  for (int j=100; j<=height+300; j=j+150)
  {
    point(i+j/9,j+i/9);
    //println(i);
  }
}

/*
//blue dots
noFill();
//fill(255,80);
stroke(113,190,255,100);
strokeWeight(10);
for (int i=250; i<=width; i=i+10)
{
  for (int j=250; j<=height; j=j+10)
  {
    point(i,j);
    //println(i);
  }
}
*/

/*
//green dots
noFill();
//fill(255,80);
stroke(163,1214,130,50);
strokeWeight(10);
for (int i=0; i<=250; i=i+5)
{
  for (int j=250; j<=height; j=j+5)
  {
    point(i,j);
    //println(i);
  }
}
*/

/*
//1pt white dots
fill(255);
stroke(255);
strokeWeight(1);
for (int i=0; i<=width; i=i+10)
{
  for (int j=0; j<=height; j=j+10)
  {
    point(i,j);
    //println(i);
  }
}
*/


///////////////////////////////////////////////////////////////////////////

//endRecord();

