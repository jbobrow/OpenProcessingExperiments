
//Sophia Chu CP1 Mods 4-5
//http://iamacarrot.webs.com/RepeatingShapes.html
size(600, 600);
background(0);
noFill();
smooth();
int x = 0;
int y = 0;
int t = 0;
while ( x < 601)
while ( y<601)
{
  
  stroke(255,255,255);
  
  
  triangle(300, 300, 300, 350, x, 300);
  stroke(255,0,0);
  triangle(300, 300, 300, 250, x, 300);
  x=x+25;


  stroke(255,255,255);
  triangle(y, y, 350, 300, 300, y);
  y= y+25;
  

  stroke(255,255,255);
  triangle(300-t, 300+t, 0, 550, 50, 600);
  triangle(300+t, 300-t, 550, 0, 600, 50);
  stroke(255, 0, 0);
  triangle(300+t, 300+t, 550, 600, 600, 550);
  triangle(300-t, 300-t, 50, 0, 0, 50);
  t=t+25;
}
