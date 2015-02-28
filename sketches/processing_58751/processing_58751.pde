
/*********************************
 composição a'
 
 objectivo - conceber uma paisagem
 
 Carlos Pereira - nª26539 - Design Multimedia
 
 *********************************/

PImage img;/* onde se carrega as imagens
 e se coloca a imagem aqu, atribuindo um nome a imagem*/
PImage img2;//segunda imagem carregada
PFont myFont;//fonte carregada
int pX, pY;//numero inteiro para o tamanho da imagem.
int ndeObjectos;//numero inteiro - numero todal de objectos

/*variaveis*/
float pX2, pY2; //variavel para as posiçoes dos circulos, rectangulos e traços
float r, g, b; //variavel para a cor dos objectos
float t;//variavel para o tamanho dos objectos (circulos e rectangulos)
float e;

img = loadImage("Paisagem.JPG");//carrega-se um ficheiro da 1º imagem
img2 = loadImage("saxplayer.png");//carrega-se outro ficheiro da 2º imagem
myFont = loadFont ("AvantGardeITCbyBT-Book-15.vlw");//carrega-se a fonte que pretendo usar
img.filter(BLUR,1);//blur para a imagem, neste caso a imagem de fundo (desfoque)
imageMode(CENTER);/*é o centro da imagem, e nao onde a imagem começa*/

pX = img.width-300;//numero dado pela imagem - largura
pY = img.height-300;//numero dado pela imagem - altura
size(pX, pY);//tamanho da janela = tamanho da imagem


image(img, width/2, height/2);/*função para desenhar a imagem |
 recebe 3 parâmetros: a imagem, pX,pY*/
float prob; // variavel da probabilidade
float percn; // variavel que indica a percentagem que quero
percn = 15; // numero da percentagem pretendida, neste caso 15 %. de acordo com a variavel de cima
prob = 100 - percn; // a probabilidade de isso acontecer


ndeObjectos= 10;//numero de objectos que pretendo, 10..

smooth();//suavizar o desenho

/************arvore1*****/
stroke(80,44,17);//cor da linha, stroke
strokeWeight(20);//espessura da linha
line (width/2-400,height/2+200,width/2-400,250);//linha, do tronco da arvore, onde é atribuido a sua posiçao

noStroke();//sem stroke, sem traço
fill(60,100,0);//cor da ellipse - cupula da arvore
ellipse(width/2-400,height/2,100,260);//posição da ellipse - cupula da arvore

/************arvore2*****/

stroke(80,44,17);//cor do traço, stroke
strokeWeight(20);//espessura da linha
line (width/2-100,height/2+200,width/2-100,250);//linha, do tronco da arvore2, onde é atribuido a sua posiçao

noStroke();//sem stroke, sem traço
fill(60,100,0);//cor da ellipse - cupula da arvore2
ellipse(width/2-100,height/2,100,260);//posição da ellipse - cupula da arvore2

/**********CEU*******/

for ( int i = 0; i <ndeObjectos*70; i++) { /*ciclo for para o ceu, onde esta contida uma probabilidade
o ceu azul sera feito pelo quadrado, com 99% de alpha, havendo uma probabilidade, em % as bolas brancas,
imitando a probabilidade de existir as nuvens no ceu, com stroke*/
  pX2 = random(width); //numero para a variavel onde é mencionada a posição de x dos objectos
  pY2 = random (height/2);//numero para a variavel onde é mencionada a posição de y dos objectos
  r= 50;//cor para que nao varia, vermelhos, para os quadrados azuis
  g=random (70, 150);//variavel para a cor verde, que varia de 70 a 150 aleatoriamente
  b=random (100, 200);//variavel para a cor azul, onde vari aleatoriamente de 100 a 200
  t=random(5, 40);//valor da variavel onde sera usado para os rectangulos e circulos
  
  strokeWeight(1);//espessura do traço, stroke
  if (random(100) > prob) {/*probabilidade, se em 100, 15% faz isto-- circulos brancos aleatorios no tamanho
  e na posição com stroke*/
    stroke(0);//cor do traço, preto
    fill(255);//cor do circulo, branco
    ellipse(pX2, pY2, t, t);//posição da ellipse, juntamente com o tamanho
    
  }//fechar probabilidade
  else /*se nao se verificar a probabilidade acontece isto--- quadrado aleatorios no tamanho 
  e na posição, azuis e sem stroke*/
  {
    noStroke();//sem traço, sem stroke, outline
    fill(r, g, b, 99);//cor para o quadrado, com os valores das variaveis em cima, com 99%
    rect(pX2, pY2, t, t);//posição e tamanho dos rectangulos
  }//fechar else
  }//fechar ciclo
  
  for ( int i = 0; i <ndeObjectos*70; i++) { /* segundo ciclo for, para desenhar o campo verde da imagem,
  e os 'focos luminosos' feito atraves das linhas*/
    pX2 = random(width);//valor para a posição x dos circulos e das linhas
    pY2 = random (height/2+100, height/2+300);//valor para a posição y dos circulos e das linhas
    r=random (20, 100);//valor aleatorio de vermelho - de 20 a 100
    g=random (100, 200);//valor aleatorio de verde - de 100 a 200
    b=random (20, 100);//valor aleatorio para o azul - de 20 a 100
    t=random(5, 40);//tamanho dos circulos, com os valores da variavel em cima
    e = random(1, 2);//valor da variavel para a espessura dos traços 

    noStroke();//sem linha/outline
    fill(r, g, b);//preenchimento dos circulos
    ellipse(pX2, pY2, t, t);//tamanho e posição dos circulos
    stroke(160, 150, 30, 40);// cor da linha, com 40 % de alpha
    strokeWeight(e);//variação da espessura da linha
    line(pX2, pY2, width, height);//posiçoes e tamanhos das linhas
    line(pX2, pY2, width/2-width/2, height);//posiçoes e tamanhos das linhas
  }//fechar ciclo

  for ( int i = 0; i <ndeObjectos*10; i++) {//3º ciclo for para o foco luminoso central, feito com linhas
    pX2 = random(width);//posição de x da linha, conjuntamente coom a variavel em cima
    pY2 = random(height);//posição de y da linha, conjuntamente coom a variavel em cima
    e = random(1, 4);//valor da variavel para a espessura dos traços
    stroke(255, 50);// cor da linha, branco com 50 % de alpha
    strokeWeight(e);//variação da espessura da linha
    line(pX2, pY2, width/2, height/2);//posiçoes e tamanhos das linhas, no centro da janela
  }//fechar ciclo
  
  img2.filter(BLUR,1);//blur para a imagem, neste caso a imagem de fundo (desfoque)
  imageMode(CENTER);/*é o centro da imagem, e nao onde a imagem começa*/
  image (img2, width/2+50, height/2+100);//posição da segunda imagem
  fill(255);//cor das letras, brancas
  textFont(myFont, 40);//tipo de fonte a usar-defenido em cima, e o tamanho da letra
  text("Carlos Pereira - nº26539, Design Multimedia", width/2-400, height/2+250);/*texto que pretendo escrevre,
  juntamente com a sua posição*/

  noFill();//sem prenchimento
  strokeWeight(5);//espessura do traço
  stroke(random(255), random(255), random(255));//cor para a linha a volta da imagem
  rectMode(CENTER);//é o centro do rectangulo que importa, e nao onde começa
  rect(width/2, height/2, pX, pY);/*o rectangulo é criado como moldura da imagem 
   e vai procurar o tamanho exacto da imagem principal*/
   
saveFrame("composição.jpg"); //codigo para guardar apenas uma imagem

