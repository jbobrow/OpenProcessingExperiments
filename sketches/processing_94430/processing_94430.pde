
size (200,200);
background(29,224,240);

// telhado
int x=100;
int y=50;
int dtelhax=-15;
int dtelhay=9;
int ptx=-13;
int pty=13;


strokeWeight (5);
stroke(193,103,6);
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


strokeWeight (5);

for(int i=0 ; i<5 ; i++)
 
{
  line (x,y,x+dtelhax,y+dtelhay);
  x+=ptx;
  y+=pty;
}

//grama

fill(10,90,28);
rect(0,150,200,100);

//casa
fill (219,173,151);
rect (50,100,100,90);
fill (234,137,9);
triangle(35,113,100,50,165, 113);
//janelas
strokeWeight (1); //linha
fill(20,137,240); // cor dos objetos
rect (115,125,25,25);
rect (65,125,25,25);
//telhas

stroke (193,103,6); // Cor de traçado
strokeWeight (5); // Largura do traço
