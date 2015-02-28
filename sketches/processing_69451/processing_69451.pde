
// Brendan M, computer programming 1, mods 4-5, Loops thing

//Size was originally larger, didn't bother to change code.
//Numbers may look odd, but it works

size (550, 500);
background (0, 200, 50);
smooth();
noFill();

int a = 20;
int b = 15;

while (a < 711)
{
  strokeWeight (20);
  stroke (0, 255 + b, a);
  ellipse (250, 1000 + b, a, a);
  strokeWeight (7);
  stroke (a, a, 700 + b);
  rect (100 + a, 250 + b, b, a);
  
  a = a + 30;
  b = b - 42; 
}

strokeWeight (5);
stroke (0, 160, 90);

int q = 300;
int p = 0;

while (p < 801)
{
  line (p, 300, p, 800);
  line (0, q, 800, q);
  
  p = p + 10;
  q = q + 10;
}

int x = 10;
int y = 10;


while (y < 476)
{
  stroke (75, x, y, y);
  fill (y, x, 75, y);
  ellipse ( x + 200, y + 5, x, 100);
  
  x = x + 10;
  y = y + 25;
}

fill (0);
ellipse (200, 25, 200, 50);
stroke (0,0,0,75);
noFill();
rect (315, 465, 5, 5);
rect (355, 465, 5, 15);
fill (0, 100, 0, 75);
rect (300, 450, 100, 50);
noStroke();
rect (375, 420, 15, 34);

int X = 50;

while (X < 501)
{
  stroke (255, 0, 0);
  triangle (X, 500, X + 5, 500, X + 2.5, 495);
  
  X = X + 5;
}
