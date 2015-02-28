


int Objectos; //variavel nomeada Objectos

float posX, posY; // variaveis para a posição horizontal e vertical do quadrado
float r,g,b; //variaveis para cor 
float posX2, posY2;//variaveis para a posiçao horizintal e verticarl do ponto 2
float tamanho;//variavel para o tamanho do quadrado
float probabilidade; //variavel para a 50 porcento
float percentagem; //variavel para a 50 porcento


void setup() {//elementos constantes 
  
  float sizeW, sizeH;//variaveis para a largura e altura da area de trabalho 
  sizeW = 700; //largura 700
  sizeH = sizeW ; //altura =largra
  size ( (int) sizeW, (int) sizeH); //tamanho de area de trabalho 
  background (255); // cor de fundo 
  smooth();// suavizar os elementos
  noLoop();// determina a ausencia de movimento
    
 Objectos = 100;// o numero de objectos vai ser 100
 percentagem = 50; // a precentagem vai sem 50 porcentp
 probabilidade = 100 - percentagem; //a probabilidade vai ser igual a 50
  
}

void draw(){// elementos no constante que vao alterando 
  background(0);//fundo branco
  
  for ( int i = 0; i <Objectos; i++)//funçao que informa  o i vai de 0 a 100
  {
   
    r = random(255); //o r vai variar entre 0,255
    g = random(255); //o g vai variar entre 0,255
    b = random(255); //o bvai variar entre 0,255
   
      if (random(100) > probabilidade){// funçao que diz se as varia variarem 0 e 100 forem menores da 50
      posX = random (width/2 , width/4*3  ); //posiçao que varia ente metade da largura e tres quartos da mesma
      posY = random (0, height); //posiçao que varia entre 0 e altura 
      posX2= random(width/2,width/4*3);//posiçao que varia entre metade da largura e tres quartos da mesma
      posY2=random(0,height);//posiçao que varia entre 0 e altura 
      tamanho=random(0,50);// variavel que vai varia o tamanho entre 0,50
      r=255;//r 255 para dar branco
      g=255;//g 255 para dar branco
      b=255;//b 255 para dar branco
   
     
     }
     else//se não acontecer o anteriormente referido vai acontecer isto 
     {
       
     posX = random (0,width);//o posicao de X vai variar entre 0 e largura
     posY = random (0,height); //o posicao de Y vai variar entre 0 e altura
     posY2= random(0,height); //o posicao de Y vai variar entre 0 e altura
     posX2=random(0,width);//o posicao de X vai variar entre 0 e largura
     tamanho=random(0,100);// variavel que vai varia o tamanho entre 0,100
    
     }
     
     fill(r,g,b);//a cor vai variar na escala tuda cromatica de rgb
    
     rect ( posX2, posY2, tamanho, tamanho); //a linha vai começar no varias veis anteriore referidas e o tamanho vai variar entre 0 e 50 
     rect ( posX, posY, tamanho, tamanho);  //a linha vai começar no varias veis anteriore referidas e o tamanho vai variar entre 0 e 100
  } 
  
  

         
}




