

Bod bodiky[];
int poradi;

void setup() {
  size(1000, 1000);
  bodiky= new Bod[100000];
  background(255);
  smooth();
  strokeWeight(0.02);
}

void draw() {
  background(255);

  if (mousePressed) {

    bodiky[poradi] = new Bod (poradi);
    poradi++;
  }
  for (int i=0; i< poradi; i++) {

    bodiky [i].display();
  }
}
class Bod {



  float poziceX, poziceY;    //pozice bodu na obrazovce
  int identifikace;        // poradove cislo
  int [] seznamSousedu; 
  int pocetSousedu;
  Bod(int _id) {
    identifikace= _id;

    poziceX= mouseX;                         //pozice bodu X
    poziceY= mouseY;                             //pozice bodu Y
    seznamSousedu= new int[identifikace];

    for (int i= 0; i<identifikace ;i++) {
      float vzdalenost = dist(poziceX, poziceY, bodiky [i]. poziceX, bodiky[i].poziceY);      /// spocitej vzdalenost
      if (vzdalenost <60 && vzdalenost>10) {
      //  vzdalenostiCar[pocetSousedu] = vzdalenost;
        seznamSousedu[pocetSousedu] =i;
        pocetSousedu++;
      }
    }
  }
  void display() {
    poziceX += random(-2, 2);
    poziceY += random(-2, 2);
    for (int i=0; i < pocetSousedu; i++) {
     // stroke(vzdalenostiCar[pocetSousedu]);
      line(poziceX, poziceY, bodiky[seznamSousedu[i]].poziceX, bodiky[seznamSousedu[i]].poziceY);
    }
  }
}


