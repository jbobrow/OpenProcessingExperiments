
int x = 200;
int y = 120;
int dtelhax = 15;
int dtelhay = 12;
int ptx = 10;
int pty = 10;

stroke(100,57,57);
strokeWeight(3);
background(255,255,255);

size (400,400);

for (int i=0; i<10; i++)
{
  line(x, y, x+dtelhax, y+dtelhay);
  x += ptx;
  y += pty;
}
x=200;
y=120;
stroke(100,57,57);
dtelhax = 15;
dtelhay = -12;
ptx = -10;
pty = 10;

for (int i=0; i<10; i++)
{
  line(x, y, x-dtelhax, y-dtelhay);
  x += ptx;
  y += pty;
}

stroke(0,0,0);
line(120,200,120,300);
line(280,200,280,300);
line(0,300,400,300);
fill(56,183,50);
stroke(56,183,50);
rect(0,303,400,400);
stroke(0,0,0);
fill(100,57,57);
rect(140,220,45,80);
stroke(0,0,0);
fill(146,241,245);
rect (210,220,45,45);
line(232,220,232,265);
