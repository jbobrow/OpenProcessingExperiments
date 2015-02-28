

float cervena, modra, zelena;
float rndCol;
Bod bodiky[];
int poradi;

void setup() {

  size(800, 600);
  bodiky = new Bod[100000];
  background(255);
  strokeWeight(0.02);
  smooth();

}


void draw() {
//backgroundbackground(255-cervena, 255-zelena, 255-modra);
background(0);
  if (mousePressed) {
    bodiky[poradi] = new Bod(poradi);
    poradi++;
  }
cervena += 0.5;
modra += 0.7;
zelena += 1.1;

if(cervena>255){
cervena = 0;
}
if(modra>255){
modra = 0;
}
if(zelena>255){
zelena = 0;
}
rndCol = random(0,96);
//stroke(abs(cervena-rndCol),abs(modra-rndCol),abs(zelena-rndCol),128);
  for (int i = 0; i < poradi; i++) {
    bodiky[i].display();
  }
}

class Bod {

  float poziceX, poziceY;      //pozice na obrazovce
  int identifikace;
  int  [] seznamSousedu;
  int pocetSousedu;


  Bod(int _id) {

    identifikace = _id;
    poziceX = mouseX;    //pozice bodu X
    poziceY = mouseY;    //pozice bodu Y
    seznamSousedu = new int[identifikace];

    for (int i = 0 ; i < identifikace; i++) {
      float vzdalenost = dist(poziceX, poziceY, bodiky[i].poziceX, bodiky[i].poziceY);
      if (vzdalenost < 60) {
        seznamSousedu[pocetSousedu]=i;
        pocetSousedu++;
      }
    }
  }
  void display() {
    //ellipse(poziceX, poziceY, 10, 10);
  
  poziceX += random(-3,3);
  poziceY += random(-3,3);
  for(int i = 0; i < pocetSousedu; i++){
  stroke(abs(cervena-rndCol),abs(modra-rndCol),abs(zelena-rndCol),250);
    line(poziceX, poziceY, bodiky[seznamSousedu[i]].poziceX, bodiky[seznamSousedu[i]].poziceY);
  }
  }
}



