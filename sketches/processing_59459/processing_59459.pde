


float posX, posY; // variaveis para a posição horizontal e vertical do circulo
float diametro; // variavel para o diametrodo circulo
float r,g,b; // variaveis para a cor do circulo
float s; // variavel para a espessura do outline

float px, py;


void setup() {// definições de Set up
  
  float sizeW, sizeH; // variavel da largura e comprimento
  sizeW = 700;
  sizeH = sizeW / 1.3333; 
  size ( (int) sizeW, (int) sizeH); 
 background(random(180,255),200,0); // cor de fundo
  smooth(); // definição do contorno dos circulos
  noLoop();// imagem estatica
  
  
  
 

}

void draw(){ // desenha a imagem
  
  colorMode(RGB, 255,255,255);
   background(random(180,255),200,0); // cor de fundo
  
  colorMode(HSB, 360,400,100,50); // mudar a cor para HSB - Hue Saturation Brightness
  
  // gerar uma posição aleatoria na janela
     px = width/2 ;
     py = height/2 ;
     
  // gerar uma posição aleatoria na janela
     posX = width/2 ;
     posY = height/2 ;
     
  for ( int i = 0; i <300; i++) // numero de circulos
  {
    
     // gerar uma posição aleatoria na janela
     posX = width/2 +   random (-i, i); // gerar um numero para posição horizonral 
     posY = height/2 +  random (-i, i); // gerar um numero para posição vertical
     
     diametro = map ( i, 0, 300, 10,1); 
      
     float h = map ( i, 0, 300, 0,360); // Hue
    
     
    
    
     stroke(0,diametro*15); // contorno do circulo
     fill(h,100,100,diametro*5);// preenchimento do circulo
     ellipse ( posX, posY, diametro, diametro); // desenhar a elipse com os valores gerados
     
     noStroke(); // sem contorno
     fill(0);// preenchimento do circulo
     ellipse ( posX, posY, 1, 1); // desenhar a elipse com os valores gerados
     
     stroke(0,diametro*2); // contorno da linha
     line(px, py, posX, posY); // linha
     
    
     
     px = posX;
     py = posY;
     
  } 
  
  

         
}



