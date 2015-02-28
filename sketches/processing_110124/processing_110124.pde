
//1. A simple face example. All drawn with fixed coordinates.
//M. Kontopoulos, 2013

//admin
size(500, 500);
smooth();
background(255);

//black outer eyes
noStroke();
fill(0);
ellipse(170, 150, 50, 50);
ellipse(330, 150, 50, 50);
//white eye rings
stroke(255);
noFill();
ellipse(170, 150, 20, 20);
ellipse(330, 150, 20, 20);
//white eye highlight
fill(255);
ellipse(180, 140, 12, 12);
ellipse(340, 140, 12, 12);

//mouth = filled in arc 
fill(40);
arc(250, 250, 400, 100, 0, PI);

//Hair. A detail.
stroke(50);
for (int i=0; i<250; i+=10)
{
  line(i, 0, i-30, 50);
}
for (int i=250; i<500; i+=10)
{
  line(i, 0, i+30, 50);
}



