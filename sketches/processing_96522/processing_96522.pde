
size (200, 200);
background (70, 99, 137);
fill(208, 242, 191);

beginShape ();
vertex (87, 73);
vertex (193, 73);
vertex (193, 191);
vertex (135, 191);
vertex (133, 115);
vertex (90, 72);
endShape (CLOSE);
//telhado1
int x=77;
int y= 60;
int dtelhax= 15;
int dtelhay= 10;
int ptx= 7;
int pty= 7;
stroke(229, 129, 46);
strokeWeight (2);
for (int i=0; i<8; i++)
{
  line (x, y, x+dtelhax, y+dtelhay );
  x += ptx;
  y += pty;
}
x=67;
y= 70;
dtelhax= 15;
dtelhay= -10;
ptx= -7;
pty= 7;
for (int i=0; i<8; i++)
{
  line (x, y, x+dtelhax, y+dtelhay );
  x += ptx;
  y += pty;
}
//telhado2
//direita
int a=138;
int b= 22;
int dtelhaa= 15;
int dtelhab= 10;
int pta= 7;
int ptb= 7;
for (int i=0; i<7; i++)
{
  line (a, b, a+dtelhaa, b+dtelhab );
  a += pta;
  b += ptb;
}
//esquerda

a=128;
b= 32;
dtelhaa= 15;
dtelhab= -10;
pta= -7;
ptb= 7;
for (int i=0; i<7; i++)
{
  line (a, b, a+dtelhaa, b+dtelhab );
  a += pta;
  b += ptb;
}
rect (23, 116, 112, 75);


line (0, 191, 200, 191);
fill( 126, 86, 52);
stroke (0);
rect (0, 191, 200, 191);


// PRIMEIRO TELHADO
stroke (229, 129, 46);
fill(229, 129, 46);
beginShape (TRIANGLES);
vertex (80, 63);
vertex (26, 116);
vertex (133, 116);
endShape (CLOSE);

// SEGUNDO TELHADO
beginShape ( TRIANGLES );
vertex (141, 25);
vertex (90, 73);
vertex (190, 73);
endShape (CLOSE);
//janela
stroke (0);
strokeWeight (1);
fill (54, 255, 213);
rect (30, 130, 45, 30);

//porta
fill(54, 255, 213);
rect (150, 140, 30, 48);
rect (95, 140, 30, 48);

noStroke();
fill(240, 242, 242);
ellipse (30, 30, 40, 40);
fill(209, 209, 211);
ellipse (30, 30, 30, 30);
