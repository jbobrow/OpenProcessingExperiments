
// Autor ou Autora Luiz Ernesto Merkle
// licença CC A SA 
// Parte  1
// O objetivo deste exemplo é ilustrar como se torna um
// esboço simples que contem um desenho e o repetimos. 

int k = 255; 
color fundo = color(k, k, k/2);
color figura = color(0, k, k);
color traco = color (k/2, 0, k/2); 

size(200, 200); 
background(fundo);

// aqui começa o desenho
// trata-se de um ladrilho com duas diagonais e 16 circunferências
stroke(traco);
rect(0, 0, 40, 40); 
line(0,0,40,40); 
line (40,0, 0,40);
noStroke();
fill(figura); 
for (int y=0; y<4; y++)
  for (int x=0; x<4 ; x++)
  {
    if ((x+y)%2==0)
      fill(figura); 
    else
        fill(100);
    ellipse(x*10+5, y*10+5, 8, 8);
  }
// aqui termina o ladrilho
