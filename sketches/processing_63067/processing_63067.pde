
//import processing.pdf.*;
//
//size(400,400);
//beginRecord(PDF, "comp7.pdf"); //Keep it up here

size (400, 400);
smooth();
background(#57DEDC);
noStroke();


fill(10, 245, 19);
noStroke();
for (int i=-800; i<width; i=i+3)
{
  ellipse((width/19)+(i*19), height/2, i+2, i+30);
  ellipse((width/9)+(i*9), height*3, i+2, i+30);
  ellipse((width/4)+(i/2), height/8, i+2, i+30);
}

fill(#A9FAAC);
noStroke();
for (int i=-800; i<width; i=i+3)
{


  ellipse((width/4)+(i/2), height/13, i+2, i+30);
}

noFill();
stroke(#1A761E);
for (int i=-800; i<width; i=i+3)
{
  ellipse((width/2)+(i*3), height/2, i+2, i+30);
  ellipse((width/4)+(i*9), height/2, i+2, i+30);
}
//endRecord();

