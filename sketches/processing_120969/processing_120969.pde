
//—————————— Importação de bibliotecas —————–————
import processing.pdf.*;

Titulo titulos;

// —————————— Declaração de variáveis ——————————
int X, Y, contador;
String[] data;

//–––––––––––Setup–––––––––––––––
void setup() {
  //Definições Gerais
  noCursor();
  X = int(1024/1.2); //displayWidth;
  Y = int(720/1.5); //displayHeight;
  smooth();
  size(int(1024/1.2), int(720/1.5));  //atribuição de serial
  data = loadStrings("data/contador.txt");
  contador = (int(data[0]));
  background(255);
  titulos = new Titulo();
  titulos.desenha();
}

//––––––––––––––––––––Draw––––––––––––––––––––––

void draw() {

}

//––––––––––Função de teclados–––––––––––––––––
void mousePressed() {
  //println("saving to pdf - starting");
  beginRecord(PDF, "Artes/Pollock#" + contador + ".pdf");

  titulos.desenha();

  //println("saving to pdf – finishing");
  endRecord();
  //println("saving to pdf – done");
  contador++;
  data[0] = str(contador);
  saveStrings ("data/contador.txt", data);
}

//full Screen
//boolean sketchFullScreen() {
//  return true;
//}

class GenerativeLogo {

  int totalPtLogo, totalVoltas, sizePtLogo, corPtLogo, RLogo, GLogo, BLogo;
  float sentXLogo, sentYLogo, sentXOldLogo, sentYOldLogo;

  GenerativeLogo() { // Construtor
    RLogo = (int) random(255);
    GLogo = (int) random(255);
    BLogo = (int) random(255);
    //atribuição variáveis
    sentXLogo = random(-2, 2);
    sentYLogo = random(-2, 2);
  }

  void pintando(int origXLogo, int origYLogo) {

    background(255);
    
    int oldOrigX = origXLogo;
    int oldOrigY = origYLogo;

    for (int v = 0; v <= totalVoltas; v++) {
      //Num de pingos
      totalPtLogo = (int) random(1, 20);
      totalVoltas = (int) random(3, 8);


      //–––––––––Primeiro pingo–––––––––––––––
      //origXLogo = (int) random(origXLogo-5, origXLogo+5);
      //origYLogo = (int) random(origYLogo-10, origYLogo+5);
      //corPt=(int) random(360);
      RLogo = (int) random(255);
      GLogo = (int) random(255);
      BLogo = (int) random(255);
      sizePtLogo=(int) random(1, 20);
      fill(RLogo, GLogo, BLogo);
      noStroke();
      ellipse(origXLogo, origYLogo, sizePtLogo, sizePtLogo);

      //––––––––Sentido X–––––––––––
      sentXOldLogo = sentXLogo;
      if (sentXLogo == sentXOldLogo) {
        while (sentXLogo == sentXOldLogo) {
          sentXLogo = random(-2, 2);
        }
      }
      sentXLogo = random(-2, 2);
      //println(sentXLogo);

      //–––––––Sentido Y–––––––––––
      sentYOldLogo = sentYLogo;
      if (sentYLogo == sentYOldLogo) {
        while (sentYLogo == sentYOldLogo) {
          sentYLogo = random(-2, 2);
        }
      }
      sentYLogo=random(-2, 2);
      //println(sentYLogo);

      //–––Restante dos pingos–––––
      for (int I=0; I<=totalPtLogo; I++) {
        int distXLogo=int(random(12));
        int distYLogo=int(random(12));
        origXLogo=origXLogo+int(distXLogo*sentXLogo);
        origYLogo=origYLogo+int(distYLogo*sentYLogo);
        sizePtLogo=(int)random(1, 20);
        fill(RLogo, GLogo, BLogo);
        ellipse(origXLogo, origYLogo, sizePtLogo, sizePtLogo);
      }
      origXLogo = oldOrigX;
      origYLogo = oldOrigY;
    }
    origXLogo = oldOrigX;
    origYLogo = oldOrigY;
  }
}

class Titulo { // Nome da Classe
  PFont fontTitulo;
  GenerativeLogo logos;

  Titulo() { // Construtor
    fontTitulo = createFont("OCRAStd", 48);
    logos = new GenerativeLogo();
  }

  void desenha() { // Funcionamento
    logos.pintando(X/2-200,Y/2-80);
    fill(0);
    textAlign(CENTER);
    textFont(fontTitulo, 38);
    text ("Pollock v.1.0", X/2, Y/2-30);
    textFont(fontTitulo, 24);
    text ("Por Bactéria", X/2, Y/2+4);
  }
}



