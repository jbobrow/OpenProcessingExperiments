
void setup(){  // setup da imagem de fundo
  
  size (500, 500); //  tamanho da janela de fundo
  background (255); // cor de fundo
  smooth(); // suaviza a imagem
  noLoop(); // não existe repetição

 

}

void draw(){ //definições do desenho
  
  
     
  for ( int i = 0; i < 100; i++) // repetição do número de círculos e rectas
  {
   
  float posX1 = random (0, 500); // variável para a posição horizontal das recta
  float posY1 = random (0, 500); // variável para a posição vertical das rectas
  float posX2 = random (0, 500); // variável para a posição horizontal das recta
  float posY2 = random (0, 500); // variável para a posição vertical das rectas 
  float s = random (2, 5); // espessura do contorno varia entre 2 e 5 
    
   strokeWeight(s); // espessura do contorno
   stroke(0); // cor do contorno
   line( posX1, posY1, posX2, posY2); // desenho das linhas
  
  float r = random (255); // cor variável para vermelhos
  float g = random (255); // cor variável para verdes
  float b = random (255); // cor variável para azuis
  
   fill(r,g,b); // cor dos círculos
   ellipse(posX1, posY1, 20, 20); // desenho dos círculos
    
  }
  
}
