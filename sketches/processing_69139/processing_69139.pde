
//Justin Luk, Repeating Loops, CP1 16-17

size(1000,600);
background(0,0,0);
noFill();
stroke(0,255,0);
smooth();
int dingdong = 10;
while( dingdong < 1000 )
{
  ellipse(500,300,dingdong,300);
  dingdong = dingdong + 100;
}



