
// Autor ou Autora Luiz Ernesto Merkle
// licença CC A SA 
// Parte  2
// O objetivo deste exemplo é ilustrar como se torna um
// esboço simples que contem um desenho e o repetimos. 

/* Para se transformar um esboço sequencial em um que utilize 
 a estrutura setup e draw é necessário separar a declaração
 de variáveis da atribuição de seus valores. 
 int k = 255; 
 color fundo = color(k, k, k/2);
 color figura = color(0, k, k);
 color traco = color (k/2, 0, k/2); 
 Ficam só a declaração de variáveis: 
 */
int k; 
color fundo;
color figura;
color traco; 

/* Agora passe a atribuição de valores a elas para dentro do setup,
 assim como outros comandos que não se repetem. */

void setup() {
  size(200, 200); 
  // note que os tipos int foram retirados
  k = 255; 
  fundo = color(k, k, k/2);
  figura = color(0, k, k);
  traco = color (k/2, 0, k/2); 
  // Como o esboço na Parte 1 era estático
  noLoop();
  background(fundo);
} 

void draw() {
 // background(fundo);
  // aqui começa o desenho
  // trata-se de um ladrilho com duas diagonais e 16 circunferências
  stroke(traco);
  rect(0, 0, 40, 40); 
  line(0, 0, 40, 40); 
  line (40, 0, 0, 40);
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
}

