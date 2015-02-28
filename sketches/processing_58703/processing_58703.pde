


int totalObjectos; // numero total de circulos

float posX, posY; // variavel para a posição horizontal e vertical do circulo
float diametro; // variavel para diametro do circulo
float r,g,b; // variaveis para a cor 
float s; // variavel para a espessura do outline

float px, py;


void setup() { // definições de set up
  
 
  size (500,500); // tamanho janela
  background (255); // cor fundo
  smooth(); // suavizar o contorno
  noLoop();// criar imagem estática
  
  
  totalObjectos = 250;// numero total de circulos 
  
 

}

void draw(){
  
  colorMode(RGB, 255,255,255);
  background(255); // cor fundo
  
  colorMode(HSB, 360,100,100,100); // para mudar a cor para HSB 
  
  // gerar uma posição aleatoria na janela
     px = width/2 ;
     py = height/2 ;
     
  // gerar uma posição aleatoria na janela
     posX = width/2 ;
     posY = height/2 ;
     
  for ( int i = 0; i <totalObjectos; i++) // controla a sequência de repetições 
  {
  
    
     // gerar uma posição aleatoria na janela
     posX = width/2 +   random (-i, i); // gerar um numero para posição horizonral 
     posY = height/2 +  random (-i, i); // gerar um numero para posição vertical
     
     diametro = map ( i, 0, totalObjectos, 10,5); 
  
     
     noStroke(); // sem contorno
     fill(0); // sem preenchimento
     ellipse ( posX, posY, 4, 4); // desenhar a elipse com os valores gerados
     
     stroke(15,diametro*4);
     line(px, py, posX, posY);  // desenho linha
     
    
     
     
  }   
  }
