
PImage F01, F02;
Boto b1, b2;
int pantalla=1;

Temps cronometre;

void setup(){
  size(800,600);
  F01=loadImage("P01.png");
  F02=loadImage("P02.png");
  b1= new Boto();
  b2= new Boto(260,520,color(255),100,20,2,3);
  cronometre =new Temps();
}
void draw(){
  switch(pantalla){
    case 1: win();break;
    case 2: apaga();break;
    case 3: compteenrera();break;
    case 4: off();break;
  }
  if (cronometre.fiEnrera()==0){
  pantalla = 4;
  }
}

void mousePressed(){
  b1.apreta();
  b2.apreta();
  if (mouseX>=265&&mouseX<=360&&mouseY>=515&&mouseY<=540){
     cronometre.Inicia();
      }
}
//Aqui crearem els botons
class Boto {
  float xPos;
  float yPos;
  color c;
  float widthB;
  float heightB;
  int pantallaActual;
  int pantallaDesti;

  Boto() {
    xPos = 2;
    yPos = 562;
    c = color(0);
    widthB = 50;
    heightB = 35;
    pantallaActual = 1;
    pantallaDesti = 2;
  }
  Boto(float x, float y, color col, float w, float h, int Segona, int Tercera) {
    xPos = x;
    yPos = y;
    c = col;
    widthB = w;
    heightB = h;
    pantallaActual = Segona;
    pantallaDesti = Tercera;
  }
//Per dibuixar el boto
  void dibuixa() {
    noStroke();
    noFill();
    rect(xPos, yPos, widthB, heightB);
  }

  void apreta() {
    if ((xPos <= mouseX && mouseX <= xPos + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual) {
      pantalla = pantallaDesti;
    }
  }
}
//Aqui creem una class per fer el cronometre
class Temps {
  int principi;
  int enrera;
  PFont foncrono;

  void Inicia() {
      principi=millis();
      enrera = 30000 + principi; //Aqui tenim els segons que volem que duri el cronometre
  }

  int minutsEnrera() {
    int resultat = (int)((enrera-millis())/ 60000);
    if (resultat < 0) {
      resultat = 0;
    }
    return resultat;
  }

  int segonsEnrera() {
    int resultat = (int)((enrera-millis())/ 1000)%60;
    if (resultat < 0) {
      resultat = 0;
    }
    return resultat;
  }

    int fiEnrera(){
      int resultat=1;
    if(principi!=0&&enrera!=0&&minutsEnrera() == 0 && segonsEnrera() == 0){
      resultat=0;
      }
      return resultat;
    }

//Dibuix del cronometre
  void dibuixaComptaEnrere() {
    fill(255, 0, 0);
    foncrono = createFont("Comic Sans MS", 40);
    textFont(foncrono);
    text(minutsEnrera()+":"+segonsEnrera(), width/2, height/2);
  }
}

void win(){
  image(F01, 0, 0);
  b1.dibuixa();
}
void apaga(){
  image(F02, 0, 0);
  b2.dibuixa();
}
void compteenrera(){
  image(F01, 0, 0);
  cronometre.dibuixaComptaEnrere();
}
void off(){
  background(0);
}


