
// Autor ou Autora Luiz Ernesto Merkle
// licença CC A SA 
// Parte  3b
// O objetivo deste exemplo é ilustrar como se torna um
// esboço simples que contem um desenho e o repetimos em malha. 
// Nesta parte, em vez de controlarmos individualemente as 
// coordenaedas de cada primitiva, vamos utilizar comandos 
// de transformações geométricas, que permitem trabalhar, 
// translação, rotação e escala. 
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
  scale (0.5); // digamos que queiramos um ladrilho 5o% menor
  translate (40,40); // mas iniciando na coordenada 40, 40 
  
  fill(figura);
  for (int j=0; j<4; j++)
    for (int i=0; i<4; i++)  
    {
      // mas é preciso somar a cada coordenada x e y dos comandos 
      // do desenho os respectivos valores a desenhar em outros lugares 
      // aqui começa o desenho
      // trata-se de um ladrilho com duas diagonais e 16 circunferências
 
      pushMatrix(); //salva o sistema de coordenadas
      translate(i*40, j*40); // translaciona cada ladrilho para um a posição
      stroke(traco);
      fill(255);
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
      popMatrix(); // restitui o sistema de coordenadas
    }
}

