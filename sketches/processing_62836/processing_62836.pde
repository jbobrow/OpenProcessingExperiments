
/*
Metodo Iterativo
Tecnica de composição - Imagem Estatica

*/


int totalObjectos; // numero total de objectos, neste caso circulos

float posX, posY; // variaveis para a posição horizontal e vertical do circulo
float diametro; // variavel para o diametro (tamanho) do circulo
float r,g,b; // variaveis para a cor do circlo
float s; // variavel para controlar a espessura do outline

// definições de Set up
void setup() {
  
  float sizeW, sizeH;
  sizeW = 800.0; 
  sizeH = sizeW / 1.3333; 
  size ( (int) sizeW, (int) sizeH); 
  background (59,40,20); 
  smooth();
  noLoop();
  

  
  totalObjectos = 500;// numero total de circulos (controlo do loop)
  
 

}

void draw(){
  
  colorMode(RGB, 255,255,255);
  background(29, 30, 590);
  
  colorMode(HSB, 360,90,100); // mudar a cor para HSB - Hue Saturation Brightness
  
  for ( int i = 0; i <totalObjectos; i++)
  {
    
    // gerar uma posição com base na iteração "i"
     posX = i; //width/2 + random (-i,i); // gerar um numero para posição horizonral 
     posY = random (height/-100,height/2+200 ); // gerar um numero para posição vertical
     
     float h = map ( i, 0, totalObjectos, 0,360); 
     
     diametro = map ( i, 0, totalObjectos, 200,0); 
    
     //s = random (1,10); // gerar um valor para a espessura do stroke (outline)
     
     noStroke();
     //strokeWeight(1);
     fill(h,100,100);
     ellipse ( posX, posY, diametro, diametro); // desenhar a elipse com os valores gerados
  } 
  
  saveFrame("Iteracao_Posicao_02.png"); 

         
}

