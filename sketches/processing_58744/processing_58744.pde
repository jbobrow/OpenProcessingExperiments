
/*********************************
 composição probabilities
 
 objectivo - 
 em x rectangulos brancos quantos podem ser y% de cor vermelha e assim maiores
 em x circulos brancos quantos podem ser y% de cor amarela e maiores
 
 Carlos Pereira - nª26539 - Design Multimedia
 
 *********************************/


int ntotaldeobjectos; /*numero inteiro - nº total de rectangulos e circulos
 converte um dado primitivo é um representação inteira*/

/*variaveis*/

float prob; // variavel da probabilidade
float percn; // variavel que indica a percentagem que quero
float pX, pY; //sao as variaveis para a posição horizontal e vertical dos objectos
float t; // variavel para o tamanho dos rectangulos e circulos 


/*definições de setup*/
void setup() { // estabelecer o que quero como base

  size(600, 500);//tamanho da janela
  background (0); //cor de fundo, neste caso, preto
  smooth();//torna o traço suave - suaviza o desenho.
  noLoop();//nao fazer loop, portanto fica uma imagem estatica

  ntotaldeobjectos = 100;// numero total de rectangulos que quero ao total
  //tendo assim o controlo do loop, predefenindo o numero de objectos.

  percn = 10; // numero da percentagem pretendida, neste caso 10 %. de acordo com a variavel de cima
  prob = 100 - percn; // a probabilidade de que vai acontecer
}//fechar setp


void draw() { // o que vou desenhar 

    
  for ( int i = 0; i <ntotaldeobjectos; i++) /*ciclo concebibo para iniciar a probabilidade
   onde se ira iniciar uma probabilidade. caso aquela percentagem o objecto segue um caminho, 
   caso nao se verifique o objecto toma outro caminho, neste caso os circulos, probabilidade de
  serem amarelos e ao mesmo tempo maiores */
  {
    
    pX = random (width); // variavel com um numero para posição horizonral 
    pY = random (height); // variavel com um numero para posição vertical
    t = random(5, 20); //tamanho dos circulos é de forma aleatoria entre 5 a 20
    
    if (random(100) > prob) {/*probabilidade- se em 100 circulos a  % x tem de se verificar
      obtando por estes dois caminhos*/
      fill(255, 255, 0);//cor dos circulos caso se verifique a probabilidade - amarelo
      ellipse (pX, pY, 25, 25); // caso se verifique a probabilidade
      //o desenho da elipse é estes com os valores das variaveis em cima
      
    }//fechar probabilidade
    else //se nao se verificar a probabilidade acontece isto
    {
      fill(255);//cor dos circulos caso nao se verifique a probabilidade - branco
      ellipse (pX, pY, t, t);// desenho elipse com os valores das variaveis em cima
    }//fechar else "se"
  } //fechar ciclo
  for ( int i = 0; i <ntotaldeobjectos; i++)/*ciclo concebibo para iniciar a probabilidade
   onde se ira iniciar uma probabilidade. caso aquela percentagem o objecto segue um caminho, 
   caso nao se verifique o objecto toma outro caminho, neste caso os rectangulos, probabilidade de
  serem vermelhos e ao mesmo tempo maiores */
  {
    pX = random (width); // variavel com um numero para posição horizonral 
    pY = random (height); // variavel com um numero para posição vertical
    t = random(5, 20);  //tamanho dos rectangulos é de forma aleatoria entre 5 a 20

      if (random(100) > prob) {/*probabilidade- se em 100 rectangulos a  % x tem de se verificar
      obtando por estes dois caminhos*/
      fill(255, 0, 0);//cor dos rectangulos caso se verifique a probabilidade - vermelho
      rect ( pX, pY, 25, 25); // caso se verifique a probabilidade
      //o desenho do rectangulo é este com os valores das variaveis em cima
      
    }//fechar probabilidade
    
    else//se nao se verificar a probabilidade acontece isto
    {
      fill(255);//cor dos rectangulos caso nao se verifique a probabilidade - branco
      rect (pX, pY, t, t);// desenho do rectangulo caso a probabilidade n acontecer 
     // com os valores das variaveis em cima
    }//fechar else "se"
  } //fechar ciclo

  saveFrame("Probabilities.jpg");// guardar a imagem, apenas uma
}//fechar draw


