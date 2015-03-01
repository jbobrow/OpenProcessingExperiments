
/*-----------------------------
Nested For Loop
Randomness occurs

Created February 5, 2015
By Lauren Alman
contact alman.5@osu.edu
Modified February 5, 2015

project URL
-----------------------------*/

size(1000,1000);
background(100,50,100);


for (int i = 0; i < 500; i++)
{
  line(i,i,i,i+i);
  fill(0,150,150,10);
  ellipse(i,i,i,i+i);
}
int x= 10;
int y= 10;

for (int j = 5; j<width; j=j+10)
{
  fill(100,0,0);
  ellipse (x,y,50,50);
  x=x+20;
  y=y+20;

    fill(0);
  ellipse (x,y,80,80);
    fill(255);
  ellipse (x,y,60,60);
}

