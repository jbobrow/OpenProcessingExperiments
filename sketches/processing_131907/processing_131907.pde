
size(400,400);
background(70);
noStroke();
fill(255);
triangle(350,350,400,375,375,400);
triangle(400,400,400,374,374,400);
for(int x=10;x<300;x=x+30)
{
  for (int y=10;y<300;y=y+30)
  {
  stroke(30,220,x+50);
  line(x,y,350,350);
  line(y,x,120,120);
}
}
