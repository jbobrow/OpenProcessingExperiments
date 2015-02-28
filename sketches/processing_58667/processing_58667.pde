
void setup(){ //inicio do Set up da composição
  
  size (500,500); //definição do tamanho da composição
  background (0); //definição da cor de fundo
  smooth (); //serve para suavisar os elementos da composição
  frameRate(10); //determina o número de repetições por segundo

}

void draw(){ //inicio da criação dos elementos da composição
  
  //variável para a cor dos quadrados#1
  
   float r1 = random (255); //determina um valor para a escala de vermelhos que vai de 0 a 255
   float g1 = random (255); //determina um valor para a escala de verdes que vai de 0 a 255
   float b1 = random (255); //determina um valor para a escala de azuis que vai de 0 a 255
  
  //variável para localização dos quadrados#1
  
  float posX, posY; //variável que determina as posições de X e Y do quadrado#1
  
  posX = random (0,500); //variável para a posição de X que vai de 0 a 500
  posY = random (height/2, height/2); //variável para a posição de Y cujas coordenadas se encontram no centro da composição 
  
  //variável para o tamanho dos quadrados#1
  
  float diametro = random (20,50); //variável que determina as o tamanho do quadrado#1
  
  fill (r1,g1,b1,50); //preenchimento do quadrado #1 consoante variáveis criadas para este anteriormente
  noStroke(); //determina que o quadrado #1 não tem contorno
  rect (posX, posY, diametro, diametro); //coordenadas do quadrado #1
  
   //variável para a cor dos quadrados#2
  
   float r2 = random (255); //determina um valor para a escala de vermelhos que vai de 0 a 255
   float g2 = random (255); //determina um valor para a escala de verdes que vai de 0 a 255
   float b2 = random (255); //determina um valor para a escala de azuis que vai de 0 a 255
  
  //variável para localização dos quadrados#2
  
  float posX_2, posY_2; //variável que determina as posições de X e Y do quadrado#2

  posX_2 = random (width/2, width/2); //variável para a posição de X cujas coordenadas se encontram no centro da composição 
  posY_2 = random (0,500); //variável para a posição de Y que vai de 0 a 500
  
  //variável para o tamanho dos quadrados#2
  
  float diametro_2 = random (20,50); //variável que determina as o tamanho do quadrado#2
  
  fill (r2,g2,b2,50); //preenchimento do quadrado #2 consoante variáveis criadas para este anteriormente
  noStroke(); //determina que o quadrado #2 não tem contorno
  rect (posX_2, posY_2, diametro_2, diametro_2); //coordenadas do quadrado #2

  
  
}
