
boolean o = false;
size (480, 120);
background (115, 137, 21);
stroke (200);

for (int i = 1; i < width; i += 2) 
{
  if (i < width/2) {
    o = true;
  } else {
    o = false;
  }
  
  if (o) {
    stroke(255);
    line(i, 1, i, height-1);
  }
  
  if (!o) {
    stroke(126);
    line(width/2 , i, width-2, i);
  }
}
int x=80;
//int y=20;

for
(int y=20; y< 400; y +=60)


{
  ellipse(y, 40, y+60, 80);
}


