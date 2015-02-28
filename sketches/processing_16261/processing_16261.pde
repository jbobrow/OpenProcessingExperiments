
/* ScribbleIt
 *Bibliotecas usadas: controlP5 e movingLetters
 *controlP5== cria barras de controle. Sliders por exemplo.
 *movingLetters== é uma tipografia animada com possibilidade de cores variadas
 
 *download links:
 
 *movingLetters = http://www.foobarquarium.de/blog/processing/MovingLetters/movingletters-20071118.zip
 *controlP5 = http://www.sojamo.de/libraries/controlP5/download/controlP5.zip
 
 *requisitos para instalação:
 Ter o Processing instalado no seu computador
 Sistema operacional Windows ou Mac
 IMPORTANTE! Instalar as bibliotecas com o Processing fechado. 
 
 *instalação:
 >descompacte o arquivo que você baixou>coloque na pasta de bibliotecas do seu processing (crie uma se necessário 
 veja como em:http://www.brunocampagnolo.com/2009_2/processing/libs/indexJava.html)>abra o processing> sketch>import library>
 contributed>selecione a biblioteca.
 
 *Nesse exemplo há um colorPicker, três sliders usados para mudar a cor da linha a ser traçada. 
 *o Texto que aparece está em movingLetters.
 *selecione a cor do seu "pincel" e comece a rabiscar a tela (Scribble It!)
 *have fun :D
 
 *by:Gustavo Ritta
 
 */


//importa as bibliotecas
import de.ilu.movingletters.*;
import controlP5.*;

//define o que será usado da biblioteca (como uma variavel qlqr);
ControlP5 controlP5;
MovingLetters letters,letters1,lettersR;

// color[] comando da propria bib movingLetters?
color[] colors;

//cores para o P5
int R=0;
int G=0;
int B=0;

void setup() {

  frameRate(10);
  size(800,500);
  fill(#FFFFFF);
  rect(0,0,800,400);
 

  smooth();

  //define o tamanho das fontes.
  letters1=new MovingLetters(this,15);
  letters = new MovingLetters(this, 40);
  lettersR=new MovingLetters (this, 20);
  colors = new color[]{
    //cores para o texto final
    color(20, 20, 240), // 0
    color(40, 20, 220), // 1
    color(60, 20, 200), // 2
    color(80, 20, 180), // 3
    color(100, 20, 160), // 4
    color(120, 20, 140), // 5
    color(140, 20, 120), // 6
    color(160, 20, 100), // 7
    color(180, 20, 80), // 8
    color(200, 20, 60), // 9
    color(220, 20, 40), // 10
    color(240, 20, 20), // 11
  };

  //addSlider. Definindo aqui os sliders de cor.
  controlP5 = new ControlP5(this); 
  //controlP5.addslider("nome",min,max,valorInicial, posX,posY,comprimento,largura); 
  controlP5.addSlider("RED",1,255,10,10,410,100,20);
  controlP5.addSlider("GREEN",1,255,10,10,430,100,20);
  controlP5.addSlider("BLUE",1,255,10,10,450,100,20);
}

void draw() {
  
  //quadrado preto do fundo
  fill(0);
  rect(0,400,800,100);


  //limpar a tela
 if (keyPressed == true) {
    fill(#FFFFFF);
    rect(0,0,800,400);
  } 

  /*controlP5*/
  //para desenhar linhas com o mouse
  //cor definida na barra de cores.
  if(mousePressed){
    stroke(R,G,B);
    strokeWeight(3);
    //pmouseX é a posição do frame anterior
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
  //fill(0) para o quad dos sliders ser "trasnparente"
  fill(0);

  /*movingLetters*/

  //escolha a cor
  stroke(255);
  letters1.text("Chose your",150,410);
  letters1.text("brush color",150,430);
  letters1.text(">>> HERE!!",150,450);
  stroke(140,206,255);
  letters1.text("Press any button",300,460);
  letters1.text("to clear screen",300,480);

  //agora você pode
  stroke(random(255),random(255),random(255));

  lettersR.text("now you can..",500,410);

  //scribbe it!, cada #numero. indica uma cor definida anteriormente  ;
  // letters.text("texto",posX,posy,espessura dos vertices, espessurra da linha, variavel que está usando (colors no caso));
  letters.text("#0;S#1;C#2;R#3;I#4;B#5;B#6;L#7;E #8;I#9;T#10;!", 500, 450,int(random(15)),int(random(15)), colors);
}

//le valores da barra e manda pra variavel das cores *P5
//ex, se mudar o nome desse void, os valores no slider nao ficam precisos, ficam com virgula.
void RED(int theValue) {
  R=theValue;
}
void GREEN(int theValue) {
  G=theValue;
}
void BLUE(int theValue) {
  B=theValue;
}




