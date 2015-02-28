
int totalObjectos; // numero total de objectos, neste caso circulos

float posX, posY; // variaveis para a posição horizontal e vertical do circulo
float diametro; // variavel para o diametro (tamanho) do circulo
float r,g,b; // variaveis para a cor do circlo
float s; // variavel para controlar a espessura do stroke


void setup() { // definições de Set up
  size(600,500); // definir a area da janela
  background (255); // definir cor de fundo
  smooth(); // suavizar o contorno mesmo que este nao contenha stroke 
  noLoop();// criar imagem estática 
  
  
  totalObjectos = 300;// numero total de circulos 
  
 

}

void draw(){ //  definições do draw
  background(255);// definir cor de fundo
  
  for ( int i = 0; i <totalObjectos; i++)// esta função controla a sequência de repetições 
  {
     posX = random (width); // gerar um numero para posição horizonral 
     posY = random (height); // gerar um numero para posição vertical
     diametro = random (5, 100); // gerar um diametro entre 5 e 100
     r = random(255); // gerar um valor para a componente vermelha entre 0 e 255
     g = random(255); // gerar um valor para a componente verde entre 0 e 255
     b = random(255); // gerar um valor para a componente azul entre 0 e 255
     s = random (1); // gerar um valor para a espessura do stroke (outline)
     
     strokeWeight(s);// espessura da linha, do stroke
     fill(r,g,b,70);// cor de preenchimento da ellipse
     ellipse ( posX, posY, diametro, diametro); // desenhar a elipse com os valores gerados
  } 

         



fill(124,122,122);// cor de preenchimento da cabeça do robot
rect(200, 100, 200, 100);// rectangulo que forma a cabeça do robot
fill(124,122,122);// cor de preenchimento do tronco do robot
rect(150, 200, 300, 100);// rectangulo que forma o tronco do robot
fill(124,122,122);// cor de preenchimento da perna esquerda do robot
rect(200, 300, 50, 70);// rectangulo que forma a perna esquerda 
fill(124,122,122);// cor de preenchimento da perna direita do robot
rect(350, 300, 50, 70);//  rectangulo que forma a perna direita
fill(62,61,61);// cor de preenchimento do olho esquerdo do robot
rect(225, 125, 20, 10);//  rectangulo que forma o olho esquerdo
fill(62,61,61);// cor de preenchimento da olho direito do robot
rect(325, 125, 20, 10);// rectangulo que forma o olho direito
fill(124,122,122);// cor de preenchimento do braço esquerdo do robot
rect(100, 220, 50, 20);//  rectangulo que forma o braço esquerdo
fill(124,122,122);// cor de preenchimento do braço direito do robot
rect(450, 220, 50, 20);// rectangulo que forma o braço direito

PFont myfont; // para associar um nome à font
myfont = loadFont("GeezaPro-48.vlw"); // para fazer o load da fonte pretendida

fill(0); //cor de preenchimento da fonte
textFont(myfont, 30); // para indicar o tamanho da fonte
text( "I'm the boss!", 210 , 270); // para escrever o texto pretendido, e a sua localização

}
