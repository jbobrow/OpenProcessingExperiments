
int rectas; // numero total de rectas

float posX, posY; // variaveis para a posição horizontal e vertical
float tamanho; // variavel para o tamanho da recta
float r,g,b; // variavel para a cor da recta
float limiteVertical, limiteHorizontal; // variaveis para o limite horizontal e vertical
float s; // variavel da espessura de outline

void setup() { // definições de set up
  
  size (500,500); // tamanho da janela
  background(255); // cor de fundo
  smooth(); // suavizar arestas
  noLoop(); // definir se a imagem fica sempre a correr, ou parada
  
  //input
  rectas = 100; // número de rectas
  limiteVertical = 100; 
  limiteHorizontal = 100; 
}

void draw() { // definiçoes de desenho
  
  background(244,245,0); // cor de fundo
  
  for (int i = 0; i <rectas; i++) // gerar um valor para as rectas
  {
    posX = random (width/2-limiteVertical, width/2 + limiteVertical); // definir um numero de rectas para a posição vertical
    posY = random (width/2-limiteHorizontal, width/2 + limiteHorizontal); // definir um numero de rectas para a posição horizontal
    tamanho = random (0,50); // gerar um valor entre 0 e 50 para as rectas
    r = random (0,232); // definir um valor de cor para a componente vermelha entre 0 e 255
    g = random (255); // definir um valor de cor para a componente verde entre 0 e 255
    b = random (255); // definir um valor de cor para a componente azul entre 0 e 255
    s = random (1,10); // definir um valor para a espessura do outline
 
    strokeWeight(s); // definir um valor para a espessura do outline entre 1 e 10
    stroke(0,50); // definir um valor dou outline entre 0 e 50
    fill(r,g,b); // definir valores de preenchimento das rectas
    line ( posX, posY, posX +random(-100,100), posY+random(-100, 100)); // desenhar a recta com os valores gerados
    
  }
}

