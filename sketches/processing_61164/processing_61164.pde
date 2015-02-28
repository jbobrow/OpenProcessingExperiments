
int LAYER1_totalObj;//numero total de objectos, neste caso linhas
int LAYER2_totalObj;//numero total de objectos, neste caso triangulos
int LAYER3_totalObj;//numero total de objectos, neste caso quadrados
int LAYER4_totalObj;//numero total de objectos, neste caso circulos

float posX, posY;//variaveis para a posição horizontal e vertical 
float tamanho;//variavel para o tamanho dos objectos
float r,g,b;//variaveis para a cor 
float ol;//variavel para o outline


void setup() {// função que define o set up
  
  size (800,600);//tamanho do ecran
  background (0);//fundo do ecran, preto
  smooth();//suaviza o desenho
  noLoop();//não repete
  
  LAYER1_totalObj = 900;//definição de numero de 900 linhas na 1 layer
  LAYER2_totalObj = 15;//definição de numero de 15 triangulos na 2 layer
  LAYER3_totalObj = 25;//definição de numero de 25 quadrados na 3 layer
  LAYER4_totalObj = 2;//definição de numero de 2 circulos na 4 layer

}

void draw(){//função que define o desenho
  background(0);//fundo do ecran, preto
  
  
  for ( int i = 0; i <LAYER1_totalObj; i++)//ciclo da linha que gera um número até 899 objectos
  {
     posX = random (width);//gera um numero para posição horizonral 
     posY = random (height);//gera um numero para posição vertical
     tamanho = random (60, 100);//gera um tamanho entre 60 e 100
     r = random(255);//gerar um valor para a componente vermelha entre 0 e 255
     g = random(255);//gerar um valor para a componente verde entre 0 e 255
     b = random(255);//gerar um valor para a componente azul entre 0 e 255
     ol = random (1,4);//gera um valor o outline
     
     strokeWeight(ol);//espessura do contorno da linha
     stroke(r,g,b);//cor do contorno
     line (posX, posY, posX +random(-100,100), posY+random(-100, 100));//desenhar a linha com os valores gerados
  } 
  
   for ( int i = 0; i < LAYER2_totalObj; i++)//ciclo do triangulo que gera um número até 14 objectos
  {
     posX = random (width);//gera um numero para posição horizonral 
     posY = random (height);//gera um numero para posição vertical
     tamanho = random (50, 450);//gera um tamanho entre 50 e 450
     
     fill(random(255), random(255), random(255));//cor aleatória do triangulo
     triangle (posX, posY, posX +random(-tamanho,tamanho), posY+random(-tamanho, tamanho),posX +random(-tamanho,tamanho), posY+random(-tamanho, tamanho));//desenhar o triangulo com os valores gerados
  }
  
  for ( int i = 0; i < LAYER3_totalObj; i++)//ciclo do quadrado que gera um número até 24 objectos
  {
     posX = random (width);//gerar um numero para posição horizonral 
     posY = random (height);//gerar um numero para posição vertical
     tamanho = random (50, 100); // gerar um tamanho entre 50 e 100
     
     fill(random(255), random(255), random(255));//cor aleatória do quadrado
     rect (posX, posY, 100,100); // desenha o quadrado com os valores gerados
  }
  
  
   for ( int i = 0; i < LAYER4_totalObj; i++)//ciclo do circulo que gera 2 objectos
  {
     posX = random (width);//gerar um numero para posição horizonral 
     posY = random (height);//gerar um numero para posição vertical
     tamanho = random (400, 500);//gerar um tamanho entre 400 e 500
     
     fill(255);//cor aleatória do circulo
     ellipse ( posX, posY, 400,400);//desenha o circulo com os valores gerados
  }
 
  
        
}




