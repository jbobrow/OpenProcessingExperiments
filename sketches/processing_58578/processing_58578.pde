
int Objectos; //variável para conjunto de objectos
int Objectos2; // nova variável para novo conjunto de objectos


float posX, posY; // variáveis para a posição de x e y
float diametro; // variavel para o diâmetro
float altura,largura;//variável para altura e largura

void setup() {//definir o Setup
  
  size(600,400);//tamanho da janela
  background (255); //cor do fundo
  smooth();//para anular o pixelizado das imagens dando-lhe um ar mais "macio" 
  noLoop();//faz com que o processing execute o código uma só vez
  
  Objectos = 500; // definição a quantidade de objectos no grupo
  Objectos2 = 5; // definição a quantidade de objectos no grupo
  }

void draw(){//executar o código

  background(85,160,188);//cor do fundo
  
  for ( int i = 50; i <Objectos; i++)//criaremos um sequência de repetições que começará em 50 e será menor que 500
  {
     noFill();//sem preenchimento
     stroke(255);//com delineado branco
     posX = random (width); // definir a posição de x
     posY = random (height); // definir a posição de y
     diametro = random (100,150); // definir os valores do diâmetro     
     
     ellipse ( posX, posY, diametro, diametro); // elipse
  } 
  
   for ( int i = 3; i < Objectos2; i++)//criaremos um sequência de repetições que começará em 3 e será menor que 5
  { fill(255);//com preenchimento branco
    stroke(255);//com delineado branco
     posX = random (width); // definir a posição de x 
     posY = random (height); // definir posição de y
     altura = random (300); // dar valores para a altura
     largura = random (300); // dar vaores à largura
     
     rect(posX,posY, altura,largura);//rectângulos
     
  }}
  
  
         


