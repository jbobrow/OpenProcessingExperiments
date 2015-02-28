
// exemplo de repetições com telhados e janelas
// merkle

int x = 98;
int y = 50;
int dtelhax = 10;
int dtelhay = -6;
int ptx = -10;
int pty = 10; 


size (200, 200);
background(50,0,150);
strokeWeight (2);
stroke(155,60,80); 

for (int i=0;i<10  ;i++)
{
  line( x, y, x+dtelhax, y+dtelhay);
  x += ptx;
  y += pty;
}

x = 110;
y= 50;
dtelhax = 10;
dtelhay = 6;
ptx = 10;
pty = 10; 


for (int i=0;i<9  ;i++)
{
  line( x, y, x+dtelhax, y+dtelhay);
  x += ptx;
  y += pty;
}

strokeWeight(1);
for (int i=0;i<10;i++)
  for (int j=10;j>0  ;j--)
  {
   fill(random(255), random(255), random(255));
   rect(80+i*5, 120+j*2, 5,5);
  }
