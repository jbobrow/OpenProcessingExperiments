
// AlanChen
//RepeatingShapes
//14/15ComputerProgrammingClass
//http://alansprogrammingsite.webs.com/

size(600, 600);
smooth();
background(0);

noFill();
int x = 3;
while (x < 550)
{
  stroke(25, 151, 254);
  ellipse(300, 150, x, 250);
  x = x + 4;
  
  stroke(56,255,112);
  ellipse(300, 300, x, 250);
  x = x + 4;
  
  stroke(254,65,112);
  ellipse(300, 430, x, 250);
  x = x + 4;
}
