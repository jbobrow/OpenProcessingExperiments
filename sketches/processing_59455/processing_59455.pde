
void setup(){ // definições do Set Up
  size(700,700); // tamanho da janela
  smooth(); // definição do contorno
  noLoop(); // imagem estática
}

void draw(){ // desenhar imagem
  background(255); // cor de fundo
  
  for ( int i = 0; i<1000; i = i+1){ // número de círculos
    
  float s = random(10); // varável da espessura do outline
  float r = random(300); // variável da cor dos círculos
  float g = random(100); //variável da cor dos círculos
  float b = random(200); //variável da cor dos círculos
  
  float posX = random (width); //variável para a posição horizontal dos círculos
  float posY = random(height); // variável para a posição vertical dos círculos
  
  float diametro = random (0,100); // gerar um diametro
  
  strokeWeight(s); //espessura da linha do circulo
 fill( r,g,b); // preenchimento dos circulos
  ellipse(posX, posY, diametro, diametro); // desenhar a elipse com  os valores gerados
}
  //circulos estáticos à frente
   for ( int i = 0; i < 3; i++) // numero de circulos
  {
   float posX = random (width); // gerar um numero para posição horizonral dos circulos 
   float posY = random (height); // gerar um numero para posição vertical dos circulos
   
   float diametro = random (100, 300); // gerar um diametro 
     
     noStroke(); // definição dos circulos grandes sem outline
     fill(255); // preenchimento dos circulos
     ellipse ( posX, posY, diametro, diametro); // desenhar a elipse com os valores gerados
  } 
  
 
  
}


