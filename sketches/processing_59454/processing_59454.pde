
void setup(){ // definições de set up
  size(700,700); // tamanho da janela
  smooth(); // definição do contorno
  noLoop(); // imagem estática
}

void draw(){ // desenhar imagem
  background(255); //cor de fundo
  
  for ( int i = 0; i<100; i = i+1){ // número de círculos
    
  float s = random(20); // variavél da espessura do outline
  float r = random(300); // variavél da cor dos círculos
  float g = random(300); // variavél da cor dos círculos
  float b = random(300); // variavél da cor dos círculos
  
  float posX = random (width); // gerar um numero para a posição horizontal dos círculos
  float posY = random(height);// gerar um numero para a posição vertical dos círculos
  
  float diametro = random (0,100); // gerar um diametro
  
  strokeWeight(s); // espessura da linha do círculo
 fill( r,g,b); // preenchimento dos círculos 
  ellipse(posX, posY, diametro, diametro); // desenhar a elipse com os valores gerados
}

  
  
  
}

