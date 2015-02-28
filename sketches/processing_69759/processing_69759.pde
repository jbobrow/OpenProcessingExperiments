
//Loops project
//Iam B

size(500,500);
noFill();
background(0);

//diagonal left
int position=0;
float w=1.0;
int shade=0;
while(position<350)
{
  stroke(160+shade,246,255);
  ellipse(250+position,250+position,20+w,20+w);
  ellipse(250-position,250-position,20+w,20+w);
  position=position+4;
  w=w*1.1;
  shade=shade+2;
}

//diagonal right
int position2=0;
float diameter=1.0;
int shade2=0;
while (position2<350)
{
  stroke(160+shade2,246,255);
  ellipse(250-position2,250+position2,20+diameter,20+diameter);
  ellipse(250+position2,250-position2,20+diameter,20+diameter);
  position2=position2+4;
  diameter=diameter*1.1;
  shade2=shade2+2;
}


//sphere
int x=0;
int s=0;
while(x<100)
{
  stroke(230-s,250-s,255-s);
  ellipse(250,250,x,100);
  x = x + 5;
  s=s+7;
}
