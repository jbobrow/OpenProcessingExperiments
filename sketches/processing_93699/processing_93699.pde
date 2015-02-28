
int x=85;
int y=75;
int dtelhax=12;
int dtelhay=8;
int ptx=8;
int pty=8;
int j=75;
void setup()
{
  size (200, 200);
}

void draw() {
  background(78, 210, 234);

fill(242, 242, 44);
ellipse(160, j, 20, 20);
j++;

if (j==400)
{
  j=0;
  
}

  fill (55, 118, 30);
  rect(0, 180, 200, 20);

  fill(222, 190, 159);
  rect(40, 120, 90, 60);

  fill(218, 245, 236);
  rect (50, 140, 40, 30);

  fill(103, 53, 3);
  rect(100, 140, 15, 40);

  fill(222, 108, 20);
  triangle(40, 120, 85, 75, 130, 120);

  int x=85;
  int y=75;
  int dtelhax=12;
  int dtelhay=8;
  int ptx=8;
  int pty=8;
  
  for (int i=0; i<6; i++)
  {


    strokeWeight(2);
    line (x, y, x+dtelhax, y+dtelhay);
    x+=ptx;
    y+=pty;
  }

  x=85;
  y=75;
  dtelhax=-12;
  dtelhay=8;
  ptx=-8;
  pty=8;

  for (int i=0; i<6; i++)
  {
    line (x, y, x+dtelhax, y+dtelhay);
    x+=ptx;
    y+=pty;
  }




}
