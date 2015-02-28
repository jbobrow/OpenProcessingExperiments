
Auto monAuto;
float timeStamp;

void setup() {
  size(400, 400);
  smooth();
  frameRate(30);

  monAuto = new Auto(color(255,0,0), 0, height/2, 5);
  timeStamp = millis();
}

void draw() {
  background(255);
  monAuto.afficher();
  monAuto.rouler();
  
  float tempsEcoule = millis() - timeStamp;
  
  if(tempsEcoule >= 100){
    monAuto.changerCouleur();
    timeStamp = millis();
  }
}

class Auto {
  // data/proprietes
  color c; // couleur
  float x; // pos X
  float y; // pos Y
  float v; // vitesse

  // constructeur
  Auto(color couleur, float posX, float posY, float vitesse) {
    c = couleur;
    x = posX;
    y = posY;
    v = vitesse;
  }

  // methodes/fonctionalite
  void afficher() {
    fill(c);
    rect(x, y, 50, 20);
  }

  void rouler() {
    x = x + v;
    if(x >= width){
      x = 0;
    }
  }
  
  void changerCouleur(){
    c = color(random(0,255),random(0,255),random(0,255));
  }
}
