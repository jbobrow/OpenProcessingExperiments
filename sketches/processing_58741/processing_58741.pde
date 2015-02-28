
/*********************************
 composição Random
 
 objectivo - criar objectos com tamanhos e posiçoes aleatorias mas com uma figura, os cds de vinil - circulos, rectangulos e linhas.
 
 Carlos Pereira - nª26539 - Design Multimedia
 
 *********************************/

int nTotaldeObjectos;//numero inteiro - nº total de objectos
/*converte um dado primitivo é um representação inteira
 neste caso o numero total de objectos*/

/*variaveis*/
float r, g, b; //variavel para a cor
float t; //variavel para o tamanho dos objectos
float pX, pY, pX2, pY2; //variavel para a posição
float e, e2;// variaveis para a espessura da linha

/*definições do setup*/
void setup() { //o que fica predefinido

  size (800, 500);//tamanho da janela
  background (0);//define a cor de fundo, neste caso preto
  smooth ();//torna o traço suave, torna o desenho suave


  nTotaldeObjectos = 300;//numero maximo de objectos é 100
  //controlo assim o numero de objectos que quero
}//fechar setup


void draw() {  // o que vou desenhar 
  for ( int i = 0; i <nTotaldeObjectos; i++) { /*crio um ciclo for para criar os rectangulos no fundo, ou seja
   cada vez que fizer um rectangulo sera aleatorio e dentro da janela, com uma cor aleatoria*/

    /*o valor das variaveis*/
    r = random (255); // os valores de vermelho variam ate 255
    g = random (255); // os valores de verde variam ate 255
    b = random (255); // os valores de azul variam ate 255
    pX = random(width); // a posição de x é aleatorio em toda a largura da janela
    pY = random(height);// a posição de y é aleatorio em toda a altura da janela
    pX2 = random (height);// a posição de x2 é aleatorio em toda a altura da janela
    pY2 = random (width);// a posição de y2 é aleatorio em toda a altura da janela
    t = random(10, 100); // o tamanho do retangulo varia entre os 10 e os 100
    e = random (1, 5);//espessura da do traço das linhas e dos objectos, vai desde 1 a 5

    stroke(0);//com stroke - traço
    strokeWeight(e);//espessura do traço dado pelo valor da variavel em cima
    fill(r, g, b);//cor atribuida aos rectangulos com 50% de alpha
    rectMode(CENTER); //o ponto central do rectanculo é o que importa
    rect(pX, pY, t, t); // desenho do rectangulo, tendo em conta aos valores das variveis em cima

    fill(255);//cor dos circulos
    ellipse (pX, pY, t, t); //posição e tamanho dos circulos - determinado pelas variaveis
    stroke(255, 50);//cor do traço - preto - poderia ser stroke(0,0,0); - e com 50 % de alpha
    strokeWeight(e);//espessura do traço dado pelo valor da variavel em cima

    line(pX2, pY2, width, height/2-height/2);//posiçao e tamanho das linhas, iniando-se no canto superior direito
    line(pX2, pY2, width/2-width/2, height/2-height/2);//posiçao e tamanho das linhas, iniando-se no canto superior esquerdo
    line(pX2, pY2, width/2-width/2, height);//posiçao e tamanho das linhas, iniando-se no canto inferior esquerdo
    line(pX2, pY2, width/2, height/2);//posição das linhas iniciam-se no centro, desenvolvendo-se de uma forma aleatoria
    line(pX2, pY2, width, height); //posiçao e tamanho das linhas, iniando-se no canto inferior direito
    fill(r, g, b, 50);//cor do circulo mais pequeno, com 50 % de alpha
    ellipse (pX, pY, t/2, t/2);//desenho da ellipse mais pequena, com os valores das variaveis em cima referidos.
  }//fechar ciclo
  saveFrame("random_####.jpg"); //codigo para guardar a imagem, apenas uma como tambem guarda as imagens quando fizer loop
}//fechar draw


