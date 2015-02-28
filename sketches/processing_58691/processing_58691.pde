
int totalObjectos; // numero total de objectos, neste caso triângulos
int LAYER2_totalObjectos; // numero total de objectos para a segunda camada, sendo esta a segunda layer

float posX, posY, posX1, posY1, posX2, posY2; // variaveis para a posição horizontal e vertical do triângulo
float r,g,b; // variaveis para a cor do triângulo
float s; // variavel para controlar a espessura do outline, do stroke




void setup() { // definições do setup
  
  size(500,500); // para definir o tamanho da janela
  background (0); // definir a cor do fundo 
  smooth(); // suavizar o contorno mesmo que este nao contenha stroke 
  noLoop(); // criar imagem estática
  
  
  totalObjectos = 500;// numero total de triângulos (controlo do loop)
  LAYER2_totalObjectos = 7; // definição de numero de circulos segunda camada
 

}


void draw(){ // definições do draw
  background(255); // cor de fundo
  
  for ( int i = 0; i <totalObjectos; i++)
  {
     posX = random (width); // criar um numero para a posição horizonral 
     posY = random (height); //criar um numero para a posição vertical
     posX1 = random (width); // criarr um numero para a posição horizonral de x1 
     posY1 = random (height);// criar um numero para a posiçao vertical de y1
     posX2 = random (width); // criar um numero para a posição horizonral de x2 
     posY2 = random (height);// criar um numero para a posição vertical de y2
    
     float r = random(255); // criar um valor para a componente vermelha entre 0 e 255
     float g = random(255); // criar um valor para a componente verde entre 0 e 255
     float b = random(255); // criar um valor para a componente azul entre 0 e 255
     float s = random (1,2); // criar um valor para a espessura do stroke, do outline
     
     strokeWeight(s);// espessura da linha 
     fill(r,g,b,95); // cor de preenchimento (rgb) mais a opacidade
     triangle(random(posX), random(posY), random(posX1), random(posY1), random(posX2), random(posY2)); // desenhar o triângulo com os valores gerados
  } 
  
  

         

  for ( int i = 0; i < LAYER2_totalObjectos; i++)// repetiçao dos objectos
  {
    
   
     noStroke();// vamos definir os circulos grandes sem outline
     fill(0); // cor de preenchimento
     triangle(90, 225, 174, 60, 258, 225); // para definir o triangulo 

}
  
  saveFrame("Layers.png"); // para guardar uma imagem 
         

  }
