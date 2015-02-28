
size(800,800);
smooth();

for(int x= 0; x< width; x+=50)
{
  for(int y=0; y<height; y+=50)
  {
    stroke (0,147,242);
    strokeWeight(10);
    fill(47,147,211);
    rect(x,y,200,200);
  }
}

noStroke();

float xpos=20;

for (int i=0; i<=9; i++)
{
  fill(i*25);
  ellipse(xpos, 100, i*10, i*10);
  xpos+=80;
}

float ypos=20;

for (int j=0; j<=9; j++)
{
  fill(j*25);
  ellipse(100, ypos, j*10, j*10);
  ypos+=80;
}

float apos=20;
float bpos=20;

for (int i=0; i<=9; i++)
{ for (int j=0; j<=9; j++)
  {fill(j*25);
  ellipse(apos,bpos,j*10,j*10);
  apos+=80;
  bpos+=80;
  }
}

