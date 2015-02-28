
void setup() { // costroi o stage
  size (600,600); // define o tamanho da janela
  background (255); // define a cor de fundo
  smooth(); // suaviza as formas
}

void draw(){ // constroi o desenho/formas
  float posX1 = random (0,600);  // atribui uma variavel para um valor aleatorio para posX1
  float posY1 = random (0,600);  // atribui uma variavel para um valor aleatorio para posY1
  float diametro = random (10,50); // atribui uma variavel para um diametro aleatório entre 10 e 50
  float b = random (60,185); // atribui uma variavel para um valor aleatório na escala dos azuis entre 60 e 185
  float posX2 = width/2; // atribui uma variavel para que posX2 seja no meio da largura da janela 
  float posY2 = width/2; // atribui uma variavel para que posY2 seja no meio da largura da janela
     
  for ( int i = 0; i < 500; i++){ // indica o valor de repetições começando em 0 e acrescentando mais 1 até 500
    
     fill(49,203,b); // define a cor de preenchimento dos circulos
     ellipse ( posX1, posY1, diametro, diametro);  // construção dos circulos
     
     stroke(0); // atribui a cor à linha
     line(posX2, posY2, posX1, posY1); // construção das linhas
     
     posX2 = posX1; // indica que o ponto onde for gerado o posX2 vai coincidir com posX1
     posY2 = posY1; // indica que o ponto onde for gerado o posY2 vai coincidir com posy1
     
  } 
}
