
// POR ARIANE E GIOVANA ISABELA

int yc=0;

void setup()
{
 size(200,200);
//frameRate(10);
}

void draw()
{
background (255);
fill (189,238,240);
stroke(189,238,240);
rect (0,0,200,180);

fill(29,80,37);
rect(0,180,200,200);

stroke(250,250,169);
fill(250,250,169);
rect (13,55,175,125);
triangle(14,55,55,20,100,55);
triangle(100,55,150,20,185,55);
rect (60,20,75,40);




stroke(144,122,73);
line(30, 100, 30, 180);
line(30,180, 120, 180);
line(120, 180, 120, 100);
line(10, 60, 10, 180);
line(10,180,190,180);
line(190, 60, 190, 180);
line(50, 20, 150,20);

//janelas

fill(250);
stroke(144,122,73);
strokeWeight(2);

rect(55, 140, 40, 40);
rect( 50, 100, 20, 20);
rect(85, 100, 20,20);
rect(150, 90, 30,30);
rect(150, 130, 30, 30);
rect(40, 35, 115, 15);

line (50,110,70,110);
line(60,100,60,120);
line (85,110,105,110);
line(95,100,95,120);
line(40,42,155,42);
line (75,140,75,180);

fill(144,122,73);
ellipse(80,160,5,5);

fill(250, 221, 126);

int x=75;
int y=55;
int dtelhax=10;
int dtelhay=8;
int ptx=9;
int pty=9;

strokeWeight(2);
stroke(185, 102, 11);
for (int i=0; i<7; i++)
{
  line(x,y,x+dtelhax, y+dtelhay);
  x+=ptx;
  y+=pty;
}

 x=75;
 y=55;
 dtelhax=-10;
 dtelhay=8;
 ptx=-9;
 pty=9;

for (int i=0; i<7; i++)
{
  line(x,y,x+dtelhax, y+dtelhay);
  x+=ptx;
  y+=pty;
}

 x=50;
 y=20;
 dtelhax=-10;
 dtelhay=8;
 ptx=-9;
 pty=9;

for (int i=0; i<5; i++)
{
  line(x,y,x+dtelhax, y+dtelhay);
  x+=ptx;
  y+=pty;
}

 x=150;
 y=20;
 dtelhax=10;
 dtelhay=8;
 ptx=9;
 pty=9;

for (int i=0; i<5; i++)
{
  line(x,y,x+dtelhax, y+dtelhay);
  x+=ptx;
  y+=pty;
}

 
for (int i=0; i<7; i++)
{
  rect(50+i*14, 20, 15,5);
}

stroke(255);
fill(0);
ellipse (yc/10, 170, 8,23);
ellipse(yc/10, 155, 8,8);
if(yc<1900)
   yc++;
else 
   yc=0;
   
}
