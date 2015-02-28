
int totalObjectos; // numero total de objectos, neste caso triângulos 

float posX, posY, posX1, posY1, posX2, posY2; // variaveis para a posição horizontal e vertical do triângulo

float r,g,b; // variaveis para a cor do triângulo
float s; // variavel para controlar a espessura do outline, do stroke
float limiteHorizontal, limiteVertical; // variaveis para valores liite


void setup() { // definições do setup
  
  size(500,500); // para definir o tamanho da janela
  background (0); // definir a cor do fundo 
  smooth(); // suavizar o contorno mesmo que este nao contenha stroke 
  noLoop(); // criar imagem estática 
  
  
  totalObjectos = 500;// numero total de triângulos (controlo do loop)
  limiteHorizontal = 350 ; // para limitar a area na horizontal
  limiteVertical = 350; // para limitar a area na vertical

 

}

void draw(){ // definições do draw
  background(255); // cor de fundo
  
  for ( int i = 0; i <totalObjectos; i++)//repetiçoes dos objectos
  {
     posX = random (width/2-limiteHorizontal, width/2 +limiteHorizontal); // criar um numero para a posição horizonral 
     posY = random (height/2-limiteVertical, height/2 + limiteVertical); //criar um numero para a posição vertical
     posX1 = random (width/2-limiteHorizontal, width/2 +limiteHorizontal); // criarr um numero para a posição horizonral de x1 
     posY1 = random (height/2-limiteVertical, height/2 + limiteVertical);// criar um numero para a posiçao vertical de y1
     posX2 = random (width/2-limiteHorizontal, width/2 +limiteHorizontal); // criar um numero para a posição horizonral de x2 
     posY2 = random (height/2-limiteVertical, height/2 + limiteVertical);// criar um numero para a posição vertical de y2
    
     float r = random(255); // criar um valor para a componente vermelha entre 0 e 255
     float g = random(255); // criar um valor para a componente verde entre 0 e 255
     float b = random(255); // criar um valor para a componente azul entre 0 e 255
     float s = random (1,2); // criar um valor para a espessura do stroke, do outline
     
     strokeWeight(s);// espessura da linha 
     fill(r,g,b,95); // cor de preenchimento (rgb) mais a opacidade
     triangle(random(posX=350), random(posY=350), random(posX1=350), random(posY1=350), random(posX2=350), random(posY2=350)); // desenhar o triângulo com os valores gerados
  } 
  
  

 saveFrame("Bounging_Boxes.png"); // para guardar a imagem        
         
}


