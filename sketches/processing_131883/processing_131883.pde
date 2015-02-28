
size(400,400);
background(72,61,139);

strokeWeight(3);
strokeCap(SQUARE);
for (int i=0; i<80; i=i+10) 
{
  line(i,60,i,90);
}



strokeWeight(6);
for (int i=20; i<160; i=i+20)
{
  line(i,120,i,180);
}

strokeWeight(9);
for (int i=30; i<320; i=i+30)
{
  line(i,240,i,360);
}

stroke(25,30,0);
for (int i=100; i<10000; i=i+50)
{
  noFill();
  ellipse(400,0,i,i);
}
