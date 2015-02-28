
/*********************************
 composição Layers
 
 objectivo - criar um fundo com rectangulos, onde por cima colocarei layers
 criando algo parecido com teias de aranha, com ajuda de linhas, circulos e triangulos
 
 Carlos Pereira - nª26539 - Design Multimedia
 
 *********************************/
 
int nTotaldeObjectos;//numero inteiro - nº total de objectos(para os circulos e triangulos)
int nTotaldeRectangulos;//numero inteiro - nº total de rectangulos

/*converte um dado primitivo é um representação inteira
 neste caso o numero total de objectos e de rectangulos*/

/*variaveis*/
float r, g, b; //variavel para a cor
float t; //variavel para o tamanho dos circulos e dos rectangulos
float x, y, x1, y1, x2, y2; //variavel para a posição


/*definições do setup*/
void setup() { //dentro deste codigo irei estabelecer o que quero como base

  size (800, 500);//define o tamanho da janela
  background (255);//define a cor de fundo, neste caso branco
  //igual se fosse (255,255,255)
  smooth ();//torna o traço suave (suaviza o desenho)
  noLoop(); //nao fazer loop, ou seja apenas um imagem estactica


  nTotaldeRectangulos = 2000;// 1ª camada - 2000 rectangulos, como fundo de ecrã
  nTotaldeObjectos = 300; //2ª camadao - numero maximo de objectos é 300
  //controlo o numero de objectos que quero
}//fechar setup


void draw() {  // aquilo que vou desenhar 
  for ( int i = 0; i <nTotaldeRectangulos; i++) { /*crio um ciclo for para criar os rectangulos no fundo, ou seja
   cada vez que fizer um rectangulo sera aleatorio e dentro da janela, com uma cor aleatoria*/
    
    /*o valor das variaveis*/
    r = random (0, 255); // os valores de vermelho variam ate 255
    g = random (0, 255); // os valores de verde variam ate 255
    b = random (0, 255); // os valores de azul variam ate 255
    x = random(width); // a posição de x do rectangulo é aleatorio em toda a largura da janela
    y = random(height);// a posição de y do rectangulo é aleatorio em toda a altura da janela
    t = random(10,50); // o tamanho do retangulo varia entre os 10 e os 50

      fill(r, g, b, 50);//cor atribuida aos rectangulos com 50% de alpha
    rectMode(CENTER); //o ponto central do rectanculo é o que importa, e nao onde começa o rectangulo 
    rect(x, y,t,t); // desenho do rectangulo, tendo em conta aos valores das variveis em cima
  }//fechar ciclo

  for ( int i = 0; i <nTotaldeObjectos; i++) { /*crio outro ciclo for para colocar por cima dos rectangulos
  onde cada vez que o programa desenho um objecto este o faça da seguinte maneira: desenho um circulo de tamanho e
  posição aleatoria, e dentro desenha um circulo mais pequeno. os triangulos seram desenhados com 10% de alpha, 
  assemelhando-se com o fumo. de onde partem os circulos, existiram linhas dessa extremidade ate ao centro da janela

    /*o valor das variaveis*/
    r = random (50, 255); // os valores de vermelho variam ate 255
    g = random (50, 255); // os valores de verde variam ate 255
    b = random (50, 255); // os valores de azul variam ate 255

    t = random (10, 50); //o tamanho varia de 10 a 50

    x = random (width); //um ponto aleatorio dentro da largura da janela para o circulo e o triangulo
    y = random (height); //um ponto aleatorio dentro da altura da janela para o circulo e o triangulo
    x1 = random (width); //um ponto aleatorio dentro da largura da janela para o triangulo
    y1 = random (height); //um ponto aleatorio dentro da altura da janela para o triangulo
    x2 = random (width); //um ponto aleatorio dentro da largura da janela para o triangulo
    y2 = random (height); //um ponto aleatorio dentro da altura da janela para o triangulo

    /*desenhar objectos*/
    fill(255, 10); //cor dos triangulos com 10% de alpha 
    triangle(x, y, x1, y1, x2, y2); //posições dos pontos dos triangulos - determinado pelas variaveis
    fill(r, g, b);//cor dos circulos tendo em conta as variaveis
    ellipse (x, y, t, t); //posição e tamanho dos circulos - determinado pelas variaveis
    stroke(255, 50);//cor do traço - preto - poderia ser stroke(0,0,0); - e com 50 % de alpha
    strokeWeight(2);//espessura do traço

    line( x, y, width/2, height/2); /*posiçao e tamanho das linhas
     -> width/2 e heigth/2 (posição das linhas iniciam-se no centro, indo ao 
     encontro ao centro dos circulos maiores*/

    fill(255); //cor branca para os circulos pequenos
    ellipse (x, y, 10, 10);//posição e tamanho dos circulos pequenos
  }//fechar ciclo
  saveFrame("layer.jpg"); //codigo para guardar a imagem, apenas uma 
}//fechar draw


