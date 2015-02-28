
//Repeating Shapes, J.J., CP1. Mods 16/17
size(300, 300);
background(0);
noFill();
smooth();
stroke(255, 0, 0);
translate(150, 150);
float x=10;
while (x<10+10*PI)
{ 
  rotate(x);
  ellipse(0, 0, 50, 150);
  x=x+PI/3;
}
stroke(0, 255, 0);
float y=10;
while (y<50)
{
  rotate(y);
  ellipse(0, 0, 150, 250);
  y=y+PI/3;
}
ellipse(0,0,50,50);
