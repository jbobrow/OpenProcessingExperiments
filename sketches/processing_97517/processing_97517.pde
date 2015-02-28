
// Autor ou Autora Luiz Ernesto Merkle
// licença CC A SA 
// Parte  3a
// O objetivo deste exemplo é ilustrar como se torna um
// esboço simples que contem um desenho e o repetimos em malha. 

int k; 
color fundo;
color figura;
color traco; 
void setup() {
  size(200, 200); 
  k = 255; 
  fundo = color(k, k, k/2);
  figura = color(0, k, k);
  traco = color (k/2, 0, k/2); 
  noLoop();
  background(fundo);
} 


void draw() {
  /* Pare repetir um desenho específico em uma malha ixj é 
   necessários colocarmos as respectivas instruções dentro
   de um laço duplo
   */
  fill(figura);
  for (int j=0; j<4; j++)
    for (int i=0; i<4; i++)  
    {
      // mas é preciso somar a cada coordenada x e y dos comandos 
      // do desenho os respectivos valores a desenhar em outros lugares 
      // aqui começa o desenho
      // trata-se de um ladrilho com duas diagonais e 16 circunferências
      stroke(traco);
      fill(255);
      rect(0+i*40, 0+j*40, 40, 40); 
      line(0+i*40, 0+j*40, 40+i*40, 40+j*40); 
      line (40+i*40, 0+j*40, 0+i*40, 40+j*40);
      noStroke();
      fill(figura); 
      for (int y=0; y<4; y++)
        for (int x=0; x<4 ; x++)
        {
          if ((x+y)%2==0)
            fill(figura); 
          else
            fill(100);
          ellipse(x*10+5+i*40, y*10+5+j*40, 8, 8);
        }
      // aqui termina o ladrilho
    }
}

