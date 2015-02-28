
Titulo titulos;

// —————————— Declaração de variáveis ——————————
int X, Y;


//–––––––––––Setup–––––––––––––––
void setup() {
  //Definições Gerais
  noCursor();
  X = 576;
  Y = 300;
  smooth();
  size(576, 300);
  background(255);
  titulos = new Titulo();
  titulos.desenha();
}

//––––––––––––––––––––Draw––––––––––––––––––––––

void draw() {

}

//––––––––––Desenhando–––––––––––––––––
void mousePressed() {

  titulos.desenha();

}

class GenerativeLogo {

  int totalPtLogo, totalVoltas, sizePtLogo, 
  corPtLogo, RLogo, GLogo, BLogo;
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

      //–––––––Sentido Y–––––––––––
      sentYOldLogo = sentYLogo;
      if (sentYLogo == sentYOldLogo) {
        while (sentYLogo == sentYOldLogo) {
          sentYLogo = random(-2, 2);
        }
      }
      sentYLogo=random(-2, 2);

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
  int posX, posY;
  GenerativeLogo logos;

  Titulo() { // Construtor
    fontTitulo = createFont("OCRAStd", 38);
    logos = new GenerativeLogo();
    posX = X/2-60;
    posY = Y/2+30;
  }

  void desenha() { // Funcionamento
    logos.pintando(posX-40, posY-40);
    fill(0);
    textAlign(LEFT);
    textFont(fontTitulo, 32);
    text ("Pollock v.1.0", posX, posY);
    textFont(fontTitulo, 24);
    text ("Por Bactéria", posX, posY+30);
  }
}



