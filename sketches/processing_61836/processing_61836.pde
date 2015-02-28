

int totalObjectos; // total de objectos ( circulos )

float posX, posY; //  posição horizontal e vertical do circulo
float diametro; // variavel para o diametro 
float r,g,b; // variavel da cor do circulo
float s; // variavel da espessura do outline

float limiteHorizontal, limiteVertical; // variavel dos valores limite

// definições de Set up
void setup() {
  
  float sizeW, sizeH; // variavel da largura e comprimento
  sizeW = 700.0; 
  sizeH = sizeW / 1.3333; 
  size ( (int) sizeW, (int) sizeH); 
  background (250); // cor de fundo 
  smooth(); // definição de contorno
  noLoop(); // imagem estática
  
  
  totalObjectos = 100;// total de circulos (controlo do loop)
  limiteHorizontal = 100; 
  limiteVertical = 200; 

}

void draw(){ // desenho de a imagem
  background(250); // cor de fundo
  
  for ( int i = 0; i <totalObjectos; i++)
  {
     posX = random (width/2-limiteHorizontal, width/2 +limiteHorizontal); // posição horizonral 
     posY = random (height/2-limiteVertical, height/2 + limiteVertical); //  posição vertical
     diametro = random (5, 100); // gerar um diametro 
     r = random(300); // valor da componente entre 0 e 300
     g = random(240); // valor da componente entre 0 e 240
     b = random(700); // valor da componente entre 0 e 700
     s = random (1,10); //  valor da espessura do stroke(outline)
     
     strokeWeight(s); // espessura do contorno
     fill(r,g,b); // preenchimento dos circulos
     ellipse ( posX, posY, diametro, diametro); // desenhar a elipse com os valores
  } 
  
  

         
}


