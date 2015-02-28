
int x = 90;
int y = 45;
int dtelhax = 10;
int dtelhay = -6;
int ptx = -10;
int pty = 10;

size (200, 200);
background (0, 0, 200, 60);
stroke (200,0,0);
strokeWeight (4);



//telhado
for (int i=0;i<10  ;i++)
{
  line( x, y, x+dtelhax, y+dtelhay);
  x += ptx;
  y += pty;
}

x = 100;
y= 40;
dtelhax = 10;
dtelhay = 6;
ptx = 10;
pty = 10;


for (int i=0;i<10  ;i++)
{
  line( x, y, x+dtelhax, y+dtelhay);
  x += ptx;
  y += pty;
}
 
 
 //parede
int z = 1;
int w = 198;
noStroke (); 
fill(250,230,120);
rect (z,y,w,x);
triangle ( z,y,100,40,w,y);

//sombra
stroke (240,220,100);
strokeWeight(10);
line (100,50,10,145);
line (100,50,190,145);

//porta

noStroke ();
fill (100,100,200);
rect (80,140,40,200);
