
/*********************************
 composição relational
 
 objectivo - criar circulos e rectangulos ligados com linhas
 
 Carlos Pereira - nª26539 - Design Multimedia
 
 *********************************/
int ntotaldeobjectos;//numero inteiro - nº total de objectos(para os circulos e rectangulos)

/*converte um dado primitivo é um representação inteira
 neste caso o numero total de circulos e de rectangulos*/

/*variaveis*/
float r, g, b, r1, g1, b1; //variavel para as cores
float t; //variavel para o tamanho dos circulos e dos rectangulos
float pX, pY, pX2, pY2; //variavel para a posição dos circulos e rectangulos na janela
float e; // variavel para a espessura do traço

/*definições de setup*/
void setup() { //dentro deste codigo irei estabelecer o que quero como base

  size(800, 500);//tamanho da janela
  background (0); //cor de fundo, neste caso, preto
  smooth();//torna o traço suave - suaviza o desenho.
  noLoop();//nao fazer loop, portanto fica uma imagem estatica

  ntotaldeobjectos = 100;// numero total de objectos que quero, neste caso 300 circulos e rectangulos.
  //tendo assim o controlo do loop, predefenindo o numero de objectos.
}//fechar setup


void draw() { // o que vou desenhar 
  for ( int i = 0; i <ntotaldeobjectos; i++) {/*ciclo for para a criação dos objectos e das linhas, com ordem aleatoria,
   mas dentro dos paramentos, ou seja os circulos nao tao proximos do centro, e o contrario para os rectangulos*/

    /*o valor das variaveis*/

    pX = random (20, (width-20)); //um ponto aleatorio dentro da largura da janela para o circulo e traço, dentro da janela
    pY = random (20, (height-20)); //um ponto aleatorio dentro da altura da janela para o circulo e traço, dentro da janela
    pX2 = random (150, (width-150)); //um ponto aleatorio dentro da largura da janela para o rectangulo e traço, dentro da janela, mas mais central
    pY2 = random (150, (height-150)); //um ponto aleatorio dentro da altura da janela para o rectangulos e traço, dentro da janela, mas mais central

    r = random (0, 100); // os valores de vermelho variam ate 100
    g = random (100, 255); // os valores de verde variam de 100 ate 255
    b = 100; // valor de azul 255

    r1 = 255; // valor de vermelho 255
    g1 = random (100, 255); // os valores de verde variam de 100 ate 255
    b1 = random (100, 255); // os valores de azul variam de 100 ate 255

      t = random (5, 15); //varaivael para o tamanho dos objectos que varia de 5 a 15

      e = random (1, 2); // variavel para a espessura da do traço, na linha
      
    /*desenho*/
    
    noStroke();//sem stroke, traço - para os objectos
    fill(r, g, b);//cor dos circulos tendo em conta as variaveis
    ellipse (pX, pY, t, t); //posição e tamanho dos circulos - determinado pelas variaveis
    fill(0);// cor para o circulo mais pequeno, preto
    ellipse (pX, pY, t/2, t/2); //posição e tamanho dos circulos pequenos - variaveis

    fill(r1, g1, b1);//cor dos circulos tendo em conta as variaveis
    rectMode(CENTER);// o ponto central do rectangulo é a referencia
    rect (pX2, pY2, t, t); //posição e tamanho dos circulos - determinado pelas variaveis
    fill(0); // cor para o retangulo mais pequeno, preto
    rect (pX2, pY2, t/2, t/2); //posição e tamanho dos circulos pequenos - variaveis

    stroke(255, 50);//cor do traço - preto - poderia ser stroke(0,0,0); - e com 50 % de alpha
    strokeWeight(e);//espessura do traço

    line( pX, pY, pX2, pY2); /*desenho da linha, que vai de um circulo para um rectangulo */
  }//fechar ciclo
  saveFrame("relational.jpg"); //codigo para guardar a imagem, apenas uma 
}//fechar draw


