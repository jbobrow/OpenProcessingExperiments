
size (250,250);
smooth();
rectMode (CENTER);
background (255);
fill (0);
stroke(255,255,255);
strokeWeight(5);

translate (width/2, height/2);
for(int a=175; a >50; a-=10)
for (int x= 3; x<20; x+=30)
{
  stroke(a+100,x,0,a);
  fill (0,0,0,a);
  rotate (PI/x);
  rect(0,0,a,a);
}  









