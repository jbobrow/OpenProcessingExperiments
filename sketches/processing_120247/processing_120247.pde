
//- Trabalho 1 - Halloween
//- Tags( PIimage, KeyPressed, MousePressed, random, for, if)
//- Nome: Thais Lullez
//- Data criação: 05/11/2013
//- Resumo da ideia: Programa que criaria uma animação que muda-se a tela de dia para noite, sendo esta com tema de Halloween. Foram usadas estruturas de repedição e as funções te teclado e mouse para dar interatividade. //

PImage bruxa,passaro,nuvem,morcego,fantasma;
float morc =300, sol=180, estrela=255;

void setup() {
  size (300, 300);
  bruxa = loadImage("bruxa.gif");
  passaro = loadImage("twitter.png");
  nuvem = loadImage("nuvem.gif");
  morcego = loadImage("morcego.gif");
  fantasma = loadImage("fantasma.gif");
  }
  void draw() {
    background(0, 200, 255);
    //passaro//
    image(passaro, mouseX, mouseY, 60, 60);
    noCursor();
    noStroke();
    //sol//
    fill(250,random(sol),0);
    ellipse(40,30,55,55);
    fill(250,140,0);
    ellipse(40,30,35,35);
    //nuvem//
     if (keyPressed == true) {
      image(nuvem, 20, 100, 60, 60);
      image(nuvem, 150, 50, 60, 60);
      image(nuvem, 100, 220, 60, 60);
      image(nuvem, 220, 150, 60, 60);
      }
     //Se o mouse for pressionado//
        if (mousePressed == true) {
          stroke(255);
          strokeWeight(2); 
          background(0, 0, 90);
          //bruxa//
          image(bruxa, mouseX, mouseY, 60, 60);
          //morcego//
          image(morcego, random(morc), random(morc), 70, 70);
          //fantasma//
          image(fantasma, 10, 120, 280, 160);
          noCursor();
          //estrelas//
            for(int n=0;n<=random(estrela);n+=5){
              fill(random(estrela));
                for (int y=10; y<300;y+=30) {
                  for (int x=10; x<300;x+=30) {
                    point(x, y);
                                 }
                                    }
                                      }
                       //lua//
                    fill(255);
                    ellipse(40,30,55,55);

                                  }
                                  }


