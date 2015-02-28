
int x = 90;
int y = 45;
int dtx = 10;
int dty = -6;
int ptx = -10;
int pty = 10;
size (200, 200);
stroke(255, 215, 0);
strokeWeight(6);

background(255, 0, 0); 

for (int i=0; i<10; i++)
{
  line( x, y, x+dtx, y+dty);
  x += ptx;
  y += pty;
}
 
x = 100;
y= 40;
dtx = 10;
dty = 6;
ptx = 10;
pty = 10;
 
 
for (int i=0;i<10  ;i++)
{
  line( x, y, x+dtx, y+dty);
  x += ptx;
  y += pty;
}

fill(0, 0, 128); //estrutura casa
noStroke ();
rect (0,150,width,50);
triangle(-7, 150, 100, 45, 207, 150);
fill(255, 255, 0); //porta
rect(100,160,20,90);
fill(255, 255, 0); //janela
rect(50,160,20,25);
