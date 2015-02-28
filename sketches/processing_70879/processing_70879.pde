
size(560,560);
background(255,255,255);
noStroke();
fill(0,0,0);
triangle(0,0, 20,0 ,0,20);

for(int i = 0; i < 560; i = i + 20)
{
  translate(i,0);
  for(int j = 0; j < 560; j = j + 20)
  {
    int rand = int(random(1,4));
    if(rand == 1)
    {
      translate(0,j);
      triangle(0,0, 20,0, 0,20);
      translate(0,-j);
    }
    else if(rand == 2)
    {
      translate(0,j);
      triangle(0,0, 0,20, 20,20);
      translate(0, -j);
    }
    else if(rand == 3)
    {
      translate(0,j);
      triangle(0,20, 20,20, 20,0);
      translate(0,-j);
    }
    else if(rand ==4)
    {
      translate(0,j);
      triangle(0,0, 20,0, 20,20);
      translate(0,-j);
    }
  }
  translate(-i, 0);
}
