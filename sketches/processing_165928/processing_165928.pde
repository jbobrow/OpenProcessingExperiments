
size(500,500);
rectMode(CENTER);
translate(250,250);
for(int angle=0 ; angle<360 ; angle+=15)
{
  scale(0.8);
  rotate(radians(15));
  rect(0,0, 500,500);
}


