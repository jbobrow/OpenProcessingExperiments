
int i;
int spaceY = 50;
size(500, 500);
background(0);
smooth();
stroke(18, 255, 23);
 
  for (i=1; i<=500; i++)
  {
  println(i);
  line(i*spaceY, 0,  width,  i*spaceY);
  }
