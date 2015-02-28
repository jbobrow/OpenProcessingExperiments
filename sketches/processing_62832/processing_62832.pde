
/*
Limitadores - Boounding Boxes 2 layers
Tecnica de composição - Imagem Estatica

*/

int totalObjectos; // numero total de objectos, neste caso circulos
int LAYER2_totalObjectos; // numero total de objectos para a segunda camada 

float posX, posY; // variaveis para a posição horizontal e vertical do circulo
float diametro; // variavel para o diametro (tamanho) do circulo
float r,g,b; // variaveis para a cor do circlo
float s; // variavel para controlar a espessura do outline


// variaveis para definição de duas areas A e B
int area_A_locX, area_A_locY; // centro da primeira area
float A_limiteHorizontal, A_limiteVertical; // variaveis para valores limitação 1 Area

int area_B_locX, area_B_locY; // centro da segunda area
float B_limiteHorizontal, B_limiteVertical; // variaveis para valores liite


// definições de Set up
void setup() {
  
  float sizeW, sizeH;
  sizeW = 700.0; 
  sizeH = sizeW / 1.3333; 
  size ( (int) sizeW, (int) sizeH); 
  background (255); 
  smooth();
  noLoop();
  
  
  totalObjectos = 500;// numero total de circulos (controlo do loop)
  LAYER2_totalObjectos = 500; // definição de numero de circulos 2º camada
  
 // set up dos parametros para as areas:
 
 // area A, da esquerda
 area_A_locX = width/3;      //localização horizontal > um quarto da largura
 area_A_locY = height/2;      //localização vertical > meio da janela
 A_limiteHorizontal = 300;      // limite horizontal
 A_limiteVertical= 1000;        // limite vertical

 // area B, da direita
 area_B_locX = width - width/4;   // tres quartos da largura
 area_B_locY = height/2;       //localização vertical > meio da janela
 B_limiteHorizontal = 100;    // limite Horizontal
 B_limiteVertical = 100;     // limite vertical

 

}

void draw(){
  background(0);
  
  
  //******* primeira layer > area da esquerda
   
  for ( int i = 0; i <totalObjectos; i++)
  {
     posX = random (area_A_locX - A_limiteHorizontal, area_A_locX + A_limiteHorizontal); // gerar um numero para posição horizonral 
     posY = random (area_A_locY - A_limiteVertical, area_A_locY + A_limiteVertical); // gerar um numero para posição vertical
     diametro = random (5, 100); // gerar um diametro entre 5 e 50
     r = random(855); // gerar um valor para a componente vermelha entre 0 e 255
     g = random(355); // gerar um valor para a componente verde entre 0 e 255
     b = random(155); // gerar um valor para a componente azul entre 0 e 255
     s = random (1,10); // gerar um valor para a espessura do stroke (outline)
     
     strokeWeight(s);
     fill(r,g,b);
     ellipse ( posX, posY, diametro, diametro); // desenhar a elipse com os valores gerados
  } 
  
  //******* segunda layer > area da direita
       for ( int i = 0; i < LAYER2_totalObjectos; i++)
  {
     posX = random (area_B_locX - B_limiteHorizontal, area_B_locX + B_limiteHorizontal); // gerar um numero para posição horizonral 
     posY = random (area_B_locY - B_limiteVertical, area_B_locY + B_limiteVertical); // gerar um numero para posição vertical
     diametro = random (135, 100); // gerar um diametro entre 5 e 50
    
     r = random(225); // gerar um valor para a componente vermelha entre 0 e 255
     g = random(55); // gerar um valor para a componente verde entre 0 e 255
     b = random(95); // gerar um valor para a componente azul entre 0 e 255
     s = random (1,0); // gerar um valor para a espessura do stroke (outline)
     
     strokeWeight(s);
     fill(r,g,b);
     ellipse ( posX, posY, diametro, diametro); // desenhar a elipse com os valores gerados
  } 

  
  
         

 noStroke();
  fill(255);
  rect (width/1,0,width,height);
  
  for(int i = 0; i < 50; i++){
    
    strokeWeight(random(5));//espessura
    stroke(90,290);//cor
    
    //line (x1,                           y1,             x2,                             y2            );
    line (random(width/4-100, width/4+100), random(height), random(width/4-150, width/4+300), random(height));
  //line (random(umQuarto-50,umQuarto+50),random(alturaTotal),random(umQuarto-50,umQuarto4+50),random(alturaTotal));
  }
}  

