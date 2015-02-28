
int totalObjectos; //numero total de objectos, neste caso circulos
int LAYER2_totalObjectos;//numero total de objectos para a segunda camada 
int LAYER3_totalObjectos;//numero total de objectos para a terceira camada 
int LAYER4_totalObjectos;//numero total de objectos para a quarta camada 
int LAYER5_totalObjectos;//numero total de objectos para a quinta camada 

float posX, posY;//variaveis para a posição horizontal e vertical
float diametro;//variavel para o diametro
float r,g,b;//variaveis para a cor 
float s;//variavel para controlar a espessura do outline

int area_A_locX, area_A_locY;//centro da primeira area
float A_limiteHorizontal, A_limiteVertical;//variaveis para valores limitação 1 area

int area_B_locX, area_B_locY;//centro da segunda area
float B_limiteHorizontal, B_limiteVertical;//variaveis para valores limite da 2 area

int area_C_locX, area_C_locY;//centro da terceira area
float C_limiteHorizontal, C_limiteVertical;//variaveis para valores limite da 3 area

int area_D_locX, area_D_locY;//centro da quarta area
float D_limiteHorizontal, D_limiteVertical;//variaveis para valores limite da 4 area

int area_E_locX, area_E_locY;//centro da quinta area
float E_limiteHorizontal, E_limiteVertical;//variaveis para valores limite da 5 area



void setup() {//função que define o set up
  
  size (800,600);//tamanho da janela
  background (255);//cor de fundo (branco)
  smooth(); //suaviza o desenho
  noLoop();//pára a repetição, não repete 
  
  totalObjectos = 20;//definição de numero de circulos 1º camada
  LAYER2_totalObjectos = 170;//definição de numero de circulos 2º camada
  LAYER3_totalObjectos = 100;//definição de numero de circulos 3º camada
  LAYER4_totalObjectos = 100;//definição de numero de circulos 4º camada
  LAYER5_totalObjectos = 20;//definição de numero de circulos 5º camada
 
 
 // area A, circulos esquerda
   area_A_locX = width/15;//localização horizontal em que a largura dividir por 15
   area_A_locY = height/2;//localização vertical em que se vai situar no meio da janela
   A_limiteHorizontal = 20;//limite horizontal
   A_limiteVertical= 10;//limite vertical

 // area B, centro circulos
   area_B_locX = width/2;// localização horizontal, meio da janela
   area_B_locY = height/2;//localização vertical em que se vai situar no meio da janela
   B_limiteHorizontal = 40;//limite horizontal
   B_limiteVertical = 300;//limite vertical
   
 // area C, esquerda quadrados
   area_C_locX = width/4;//localização horizontal situado a um quarto da largura
   area_C_locY = height/2;//localização vertical situado no meio da janela
   C_limiteHorizontal = 10;//limite horizontal
   C_limiteVertical=300;// limite vertical
 
 //area D, quadrados direita
   area_D_locX = width-width/3;//localização horizontal situado à direita um terço da largura
   area_D_locY = height/2;//localização vertical situado no meio da janela
   D_limiteHorizontal = 10;//limite horizontal
   D_limiteVertical = 300;//limite vertical
   
 // area E, circulos esquerda
   area_E_locX = width-width/15;//localização horizontal situado à direita em que a largura se divide desde o meio para a direita por 15
   area_E_locY = height/2;//localização vertical em que se vai situar no meio da janela
   E_limiteHorizontal = 20;//limite horizontal
   E_limiteVertical= 10;//limite vertical
 
}

void draw(){//função que define o desenho
  
 
  background(255);//fundo da janela (branco)
  
  
  //Layer 1 -> circulos à esquerda
  for ( int i = 0; i <totalObjectos; i++)//ciclo da ellipse que gera um número até 19 objectos 
  {
     posX = random (area_A_locX - A_limiteHorizontal, area_A_locX + A_limiteHorizontal);//gerar um numero para posição horizonral 
     posY = random (area_A_locY - A_limiteVertical, area_A_locY + A_limiteVertical);//gerar um numero para posição vertical
     diametro = random (5, 40); // gerar um diametro entre 5 e 40
     r = random(255);//gerar um valor para a componente vermelha entre 0 e 255
     g = random(255);//gerar um valor para a componente verde entre 0 e 255
     b = random(255);//gerar um valor para a componente azul entre 0 e 255
     s = random (1,5);//gerar um valor para a espessura do stroke (outline) entre 1 e 5
     
     strokeWeight(s);//espessura do contorno da ellipse
     fill(r,g,b);//cor
     ellipse ( posX, posY, diametro, diametro);//desenhar a elipse com os valores gerados
  } 
  
      
      
     //Layer 2 -> circulos do centro
     for ( int i = 0; i < LAYER2_totalObjectos; i++)//ciclo da ellipse que gera um número até 169 objectos 
  {
     posX = random (area_B_locX - B_limiteHorizontal, area_B_locX + B_limiteHorizontal);//gerar um numero para posição horizonral 
     posY = random (area_B_locY - B_limiteVertical, area_B_locY + B_limiteVertical);//gerar um numero para posição vertical
     diametro = random (5, 100); // gerar um diametro entre 5 e 100
    
     r = random(255);//gerar um valor para a componente vermelha entre 0 e 255
     g = random(255);//gerar um valor para a componente verde entre 0 e 255
     b = random(255);//gerar um valor para a componente azul entre 0 e 255
     s = random (1,5);//gerar um valor para a espessura do stroke (outline) entre 1 e 5
     
     strokeWeight(s);//espessura do contorno da ellipse
     fill(r,g,b);//cor
     ellipse ( posX, posY, diametro, diametro);//desenhar a elipse com os valores gerados
  } 
  
  
  //Layer 3 -> Quadrados Esquerda
  for ( int i = 0; i <LAYER3_totalObjectos; i++)//ciclo dos quadrados que gera um número até 99 objectos 
  {
     posX = random (area_C_locX - C_limiteHorizontal, area_C_locX + C_limiteHorizontal);//gerar um numero para posição horizonral 
     posY = random (area_C_locY - C_limiteVertical, area_C_locY + C_limiteVertical);//gerar um numero para posição vertical
     diametro = random (5, 40); // gerar um diametro entre 5 e 40
     r = random(255);//gerar um valor para a componente vermelha entre 0 e 255
     g = random(255);//gerar um valor para a componente verde entre 0 e 255
     b = random(255);//gerar um valor para a componente azul entre 0 e 255
     s = random (1,5);//gerar um valor para a espessura do stroke (outline) entre 1 e 5
     
     strokeWeight(s);//espessura do contorno do quadrado
     fill(r,g,b);//cor
     rect ( posX, posY, diametro, diametro);//desenhar o quadrado com os valores gerados
  } 
  
  
  //Layer 4 -> Quadrados direita
  for ( int i = 0; i <LAYER4_totalObjectos; i++)//ciclo dos quadrados que gera um número até 99 objectos 
  {
     posX = random (area_D_locX - D_limiteHorizontal, area_D_locX + D_limiteHorizontal);//gerar um numero para posição horizonral 
     posY = random (area_D_locY - D_limiteVertical, area_D_locY + D_limiteVertical);//gerar um numero para posição vertical
     diametro = random (5, 40); // gerar um diametro entre 5 e 40
     r = random(255);//gerar um valor para a componente vermelha entre 0 e 255
     g = random(255);//gerar um valor para a componente verde entre 0 e 255
     b = random(255);//gerar um valor para a componente azul entre 0 e 255
     s = random (1,5);//gerar um valor para o outline, entre 1 e 5
     
     strokeWeight(s);//espessura do contorno do quadrado
     fill(r,g,b);//cor
     rect ( posX, posY, diametro, diametro);//desenhar o quadrado com os valores gerados
  } 
  
 
   //Layer 5 -> circulos à direita
  for ( int i = 0; i <LAYER5_totalObjectos; i++)//ciclo da ellipse que gera um número até 19 objectos 
  {
     posX = random (area_E_locX - E_limiteHorizontal, area_E_locX + E_limiteHorizontal);//gerar um numero para posição horizonral 
     posY = random (area_E_locY - E_limiteVertical, area_E_locY + E_limiteVertical);//gerar um numero para posição vertical
     diametro = random (5, 40);//gerar um diametro entre 5 e 40
     r = random(255);//gerar um valor para a componente vermelha entre 0 e 255
     g = random(255);//gerar um valor para a componente verde entre 0 e 255
     b = random(255);//gerar um valor para a componente azul entre 0 e 255
     s = random (1,5);//gerar um valor para a espessura do stroke (outline) entre 1 e 5
     
     strokeWeight(s);//espessura do contorno da ellipse
     fill(r,g,b);//cor
     ellipse ( posX, posY, diametro, diametro);//desenhar a elipse com os valores gerados
  }  
  
  
           
}




