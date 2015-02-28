


float posX, posY; // variaveis para a posição horizontal e vertical do circulo
float diametro; // variavel para o diametro do circulo
float r,g,b; // variaveis para a cor do circulo
float s; // variavel para a espessura do outline

void setup() { // definições de Set up
  
  float sizeW, sizeH; // variavél da largura e comprimento
  sizeW = 700; 
  sizeH = sizeW / 1.3333; 
  size ( (int) sizeW, (int) sizeH); 
  background (0); // cor de fundo
  smooth(); // definição do contorno dos circulos
  noLoop(); // imagem estática
 

}

void draw(){ // desenhar imagem
  
  colorMode(RGB, 255,255,255); 
  background(0); // cor de fundo
  
  colorMode(HSB, 600,100,10); // mudar a cor para HSB - Hue Saturation Brightness
  
  for ( int i = 0; i <250; i++) // numero de circulos
  {
    
    // gerar uma posição aleatoria na janela
     posX = width/2 + random (-i,i); // gerar um numero para posição horizonral 
     posY = random (height); // gerar um numero para posição vertical
     
     float h = map ( i, 0, 250, 0,360); 
     
     diametro = map ( i, 0,250, 200,0); 
    
     // gerar um valor para a espessura do stroke 
     
     strokeWeight(8); // espessura da linha dos circulos
     fill(h,200,200); // preenchimento dos circulos
     ellipse ( posX, posY, diametro, diametro); // desenhar a elipse com os valores gerados
  } 
  

         
}

