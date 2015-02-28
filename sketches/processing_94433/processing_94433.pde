
background(117,211,187);


size (200,200);
// telhado

int x=100;
int y=50;
int dtelhax=-15;
int dtelhay=9;
int ptx=-13;
int pty=13;


strokeWeight (4);
stroke(188,84,23);
for(int i=0 ; i<5 ; i++)
 
{
  line (x,y,x+dtelhax,y+dtelhay);
  x+=ptx;
  y+=pty;
}

x=100;
y=50;
dtelhax=15;
dtelhay=9;
ptx=13;
pty=13;


strokeWeight (4);
for(int i=0 ; i<5 ; i++)
 
{
  line (x,y,x+dtelhax,y+dtelhay);
  x+=ptx;
  y+=pty;
}


fill(72,37,2);
rect(55,95,90,90);

rect(88,125,28,55);




fill(0,77,15);
stroke(0,77,15);
rect(0,185,200,25);

stroke(240,229,17);
strokeWeight(0);
fill(240,229,17);
ellipse(160,30,25,25);
