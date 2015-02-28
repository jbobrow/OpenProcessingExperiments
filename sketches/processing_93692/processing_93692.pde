
int x = 200;
int y = 150;
int dtelhax = 15;
int dtelhay = 12;
int ptx = 10;
int pty = 10;

size (400,400);
stroke(255,0,0);
strokeWeight(3);
background(200,200,255);

for (int i=0; i<10; i++)
{
  line(x, y, x+dtelhax, y+dtelhay);
  x += ptx;
  y += pty;
}

x=200;
y=150;
stroke(255,0,0);
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
strokeWeight(3);
line(120,230,120,350);
line(280,230,280,350);
line(0,350,400,350);

fill(134,10,10);
rect(220,270,40,80);

fill(120,255,100);
rect(0,350,400,400);

fill(134,10,10);
rect(130,250,40,40);
