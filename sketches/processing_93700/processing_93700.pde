
size(200,200);
background(112,219,219);
strokeWeight(2);
fill(219,147,112);
rect(50,150,100,50);
fill(151,105,79);
rect(87,175,25,25);
int x=100;
int y=100;
int dtelhax=15;
//int dtelhax=15 comprimento da telha
int dtelhay=10;
//int dtelhay=10 altura e inclinação
int ptx=10;
int pty=10;
// int ptx=10 e int pty=10 espaçamento entre as telhas
// for(int i=0;i<6;i++) são 6 telhas (o i de 0 à 6)
for(int i=0;i<6;i++)
{
  line(x, y, x+dtelhax, y+dtelhay);
  x+=ptx;
  y+=pty;
}

 x=100;
 y=100;
dtelhax=-15;
//int dtelhax=15 comprimento da telha
dtelhay=10;
//int dtelhay=10 altura e inclinação
ptx=-10;
pty=10;
// int ptx=10 e int pty=10 espaçamento entre as telhas
// for(int i=0;i<6;i++) são 6 telhas (o i de 0 à 6)
for(int i=0;i<6;i++)
{
  line(x, y, x+dtelhax, y+dtelhay);
  x+=ptx;
  y+=pty;
}

// para fazer o lado esquerdo do telhado eu copio 
// e colo as mesmas funções e tiro os ints e no
// dtelhax e no ptx eu coloco sinal negativo
fill(151,105,79);
triangle (52,150,100,102,148,150);
