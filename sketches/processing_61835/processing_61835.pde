

int totalObjectos; // total dos objectos,
int LAYER2_totalObjectos; // total dos objectos da segunda camada


float posX, posY; // variavel da posição horizontal e vertical do circulo
float diametro; // variavel do diametro do circulo
float r,g,b; // variavel para a cor do circulo
float s; // variavel para controlar a espessura do outline

// definições de Set up
void setup() {
  
  float sizeW, sizeH; // variavel da horizontal e da vertical
  sizeW = 700.0; 
  sizeH = sizeW / 1.3333; // variavel da altura e comprimento
  size ( (int) sizeW, (int) sizeH); 
  background (255); // cor do fundo 
  smooth(); // definição de contorno
  noLoop(); // imagem estática
  
  // INPUT
  totalObjectos = 300; // definição de 300 circulos
  LAYER2_totalObjectos = 3; //  numero de circulos 2º camada
  
  

}

void draw(){
  background(500); // cor de fundo 
  
  for ( int i = 0; i <totalObjectos; i++)
  {
     posX = random (width); // numero para posição horizontal 
     posY = random (height); // numero para posição vertical
     diametro = random (5, 50); // gerar um diametro entre 5 e 50
     r = random(120); // valor da componente  entre 0 e 120
     g = random(600); // valor da componente  entre 0 e 600
     b = random(500); //  valor da componente entre 0 e 500
     s = random (1,10); // valor da espessura do stroke (outline)
     
     strokeWeight(s); //espessura do contorno
     fill(r,g,b); // preenchimento dos circulos
     ellipse ( posX, posY, diametro, diametro); // desenhar a elipse com os valores 
  } 
  
   for ( int i = 0; i < LAYER2_totalObjectos; i++)
  {
     posX = random (width); // numero da posição horizontal 
     posY = random (height); // numero da posição vertical
     diametro = random (200, 400); //  diametro 
     
     noStroke();// vamos definir os circulos grandes sem outline
     fill(0); // preenchimento dos circulos
     ellipse ( posX, posY, diametro, diametro); // desenhar a elipse com os valores
  } 
  
  
 
         
}


