
PImage ceu; /*Chamar a classe das imagens para declarar uma variavel de imagem com nome "ceu"*/
PFont myFont; /*Chamar a classe das fontes para declarar uma nova fonte "myFont"*/

color corColina = color(117,220,57); /*Declarar e inicializar variável para cor das colinas*/
color corMem = color(260,110,18); /*Declarar e inicializar variável para cor dos membros*/
color corAm = color(255,244,100); /*Declarar e inicializar variável para cor amarela*/
color corCorp = color(252,124,18); /*Declarar e inicializar variável para cor do corpo*/
color corCara = color(250,170,100); /*Declarar e inicializar variável para cor da cara*/

int cons = 65; /*Declarar e inicializar variável inteira para uma constante*/

void setup() { /*Função que serve para estabelecer as definições do nosso programa/aplicação*/
  size(1366,768); /*Função para definir o tamanho da janela (largura,altura)*/
  ceu=loadImage("DSC00345.JPG"); /*Carregar um ficheiro de imagem*/
  myFont=loadFont("AngsanaNew-BoldItalic-48.vlw"); /*Carregar a fonte pretendida, neste caso "AngsanaNew-BoldItalic-48"*/
  textFont(myFont,86); /*Indicar os atributos da fonte (nome da variável fonte, tamanho da fonte)*/
  background(156,245,255); /*Função para definir a cor do fundo (r,g,b)*/
  smooth(); /*Função para suavizar o design*/
}

void draw(){ /*Função para desenhar os objectos/formas*/
  float x1 =(width-width/3); /*Declarar e inicializar variável decimal para uma posição x*/
  float y1 =(height-height/4); /*Declarar e inicializar variável decimal para uma posição y*/
  float y2 =(height/3); /*Declarar e inicializar variável decimal para uma posição y*/
  float y3 =(height/2); /*Declarar e inicializar variável decimal para uma posição y*/
  
  ceu.resize(1600,0); /*Redimensionar a imagem*/
  image(ceu,0,0); /*Desenhar uma imagem com os parâmetros (imagem, poX, posY)*/
  noLoop(); /*Função para não haver repetições*/
  
  //Colinas
  noStroke(); /*Sem contorno*/
  fill(corColina); /*Preencher com cor "corColina"*/
  ellipse(x1,y1,980,700); /*Desenhar uma elipse (primitiva 2D) com os parâmetros (posX,posY,largura,altura)*/
  ellipse(width/3,y1,1300,500); /*Desenhar uma elipse */
  ellipse(x1+420,y1,700,500); /*Desenhar uma elipse*/
  
  //Ovos
  int posX = width/12; /*Declarar e inicializar a variável inteira "posX"*/
  for (int i=0; i<10; i++){ /*Ciclo for, ocorre até "i" ser igual a 9*/
    noStroke(); /*Sem contorno*/
    fill(random(10,255),random(25,255),random(255)); /*Preencher com cor aleatória, mas com algumas restrições*/
    posX = posX+cons; /*Alterar o valor da variável "posX"*/
    int posY =(int) random((height/4)+200,height-100); /*Declarar e inicializar variável inteira "posY"*/
    int largura =(int) random(20,100); /*Declarar e inicializar variável inteira "largura"*/
    float altura = 1.75*largura; /*Declarar e inicializar variável decimal "altura"*/
    ellipse(posX,posY,largura,altura); /*Desenhar uma elipse*/
  }
  //Orelhas
  noStroke(); /*Sem contorno*/
  fill(corMem); /*Preencher com cor "corMem"*/
  ellipse(x1-40,y2-30,66,300); /*Desenhar uma elipse*/
  ellipse(x1+40,y2-30,66,300); /*Desenhar uma elipse*/
  fill(corAm); /*Preencher com cor "corAm"*/
  ellipse(x1-38,y2-30,46,240); /*Desenhar uma elipse*/
  ellipse(x1+38,y2-30,46,240); /*Desenhar uma elipse*/
  
  //Pés
  fill(corMem); /*Preencher com cor "corMem"*/
  ellipse(x1-50,y3+185,110,34); /*Desenhar uma elipse*/
  ellipse(x1+50,y3+185,110,34); /*Desenhar uma elipse*/
  
  //Corpo
  noStroke(); /*Sem contorno*/
  fill(corCorp); /*Preencher com cor "corCorp"*/
  ellipse(x1,y3,210,380); /*Desenhar uma elipse*/
  
  //Barriga
  fill(corAm); /*Preencher com cor "corAm"*/
  ellipse(x1,y3+70,150,176); /*Desenhar uma elipse*/
  
  //Maos
  fill(corCorp); /*Preencher com cor "corCorp"*/
  ellipse(x1-52,y3+32,34,80); /*Desenhar uma elipse*/
  ellipse(x1+52,y3+32,34,80); /*Desenhar uma elipse*/
  
  //Dentes
  fill(255); /*Preencher com cor branca*/
  rect(x1-10,y2+60,10,22); /*Desenhar um rectângulo com os parâmetros (posX,posY,largura,altura)*/
  rect(x1+1,y2+60,10,22); /*Desenhar um rectângulo*/
  
  //Nariz
  fill(0); /*Preencher com cor preta*/
  ellipse(x1,y2+40,25,20); /*Desenhar uma elipse*/
  
  //Cara
  fill(corCara); /*Preencher com cor "corCara"*/
  ellipse(x1-25,y2+56,50,43); /*Desenhar uma elipse*/
  ellipse(x1+25,y2+56,50,43); /*Desenhar uma elipse*/
  strokeWeight(1); /*Definir espessura do traço/contorno para 1 pixel*/
  stroke(200); /*Definir cor do contorno para cinzento claro*/
  line(x1-137,y2+40,x1-40,y2+50); /*Desenhar uma linha com os parâmetros (coordenada x,coordenada y do 1ºponto,coordenada x,coordenada y do 2ºponto*/
  line(x1-140,y2+52,x1-40,y2+56); /*Desenhar uma linha*/
  line(x1+137,y2+40,x1+40,y2+50); /*Desenhar uma linha*/
  line(x1+140,y2+52,x1+40,y2+56); /*Desenhar uma linha*/
  
  //Olhos
  strokeWeight(3); /*Definir espessura do contorno para 3 pixeis*/
  stroke(corMem); /*Definir cor do contorno para "corMem"*/
  fill(255); /*Preencher com cor branca*/
  ellipse(x1-25,y2+10,30,30); /*Desenhar uma elipse*/
  ellipse(x1+25,y2+10,30,30); /*Desenhar uma elipse*/
  noStroke(); /*Sem contorno*/
  fill(0); /*Preencher com cor preta*/
  ellipse(x1-25,y2+10,10,10); /*Desenhar uma elipse*/
  ellipse(x1+25,y2+10,10,10); /*Desenhar uma elipse*/
  
  fill(80,41,250); /*Preencher com cor azul*/
  text("Feliz Páscoa!",x1-100,y2+400); /*Função para desenhar o texto ("texto",posX,posY)*/
}

