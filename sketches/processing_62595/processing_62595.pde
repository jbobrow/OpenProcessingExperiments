
int quadrados; // numero total de objectos, neste caso circulos

float posX, posY; // variaveis para a posição horizontal e vertical do quadrado e círculos
float area; // variavel para a area da página
float px, py;//variavies das posições desta janela



void setup() {//definir as propriedades iniciais do ambiente, tais como o tamanho da janela e a cor
  
  size(800,800);//define o tamanho da janela
  background (255);//define a cor de fundo
  smooth();//suavizar 
  noLoop();//apenas lê o código uma vez
  
  quadrados = 300;// numero de quadrados gerados
  
 

}


void draw(){// parte ilustrativa (desenhos)

 
  
  //gera uma posição aleatoria na janela
     px = width/2 ;
     py = height/2 ;
     
  //gera uma posição aleatoria na janela
     posX = width/2 ;
     posY = height/2 ;
     
  for ( int i = 0; i <quadrados; i++)//controle das repetições da sequencia de código
  {
     posX = width/2 +   random (-i, i); // gera um numero para posição horizontal (x)
     posY = height/2 +  random (-i, i); // gera um numero para posição vertical (y)
     
     stroke(255,0,0);//outline a branco
     fill(0,23,255);//cor azul
     rect( posX, posY,10,10); // desenhar o quadrado 
     stroke(255,188,0);//outline 
     line(px, py, posX, posY);//desenha as linhas 
     stroke(0); // outline a preto
     fill(255); // cor branco
     ellipse(posX, posY,5,5); // elipse
    
     //interliga os quadrados para que estes nao convergam todos no mesmo ponto, mas mantendo-se ligadas umas com as outras
     px = posX;
     py = posY;
     
  } 
  
  
 }

