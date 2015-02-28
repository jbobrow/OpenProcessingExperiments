
ArrayList mesOndulations;
int timeStamp;

void setup() {
  size(400, 400);
  smooth();
  frameRate(30);
  mesOndulations = new ArrayList();
  
  timeStamp = millis();
} // fin du setup()

void draw() {
  background(15, 60, 100);
  
  for(int i = 0; i < mesOndulations.size(); i++){
    Ondulation o = (Ondulation) mesOndulations.get(i);
    o.afficher();
    o.expandre();
  }
  
  int tempsEcoule = millis() - timeStamp;
  
  if(tempsEcoule >= random(100,1000)){
    mesOndulations.add(new Ondulation(mouseX,mouseY,random(20,25),random(20,25),random(0.5,1),255,255,255,255));
    timeStamp = millis();
  }
  
  // Pour garder tout optimisé et ne pas avoir trop de cellules malgré que l'ondulation est rendue invisible (alpha <0), nous supprimons les ondulations qui sont rendues invisibles
  for (int i = mesOndulations.size()-1; i>=0; i--){
    Ondulation o = (Ondulation) mesOndulations.get(i);
    if(o.a <= 0){
      mesOndulations.remove(i);
    }
  }
  
} // fin du draw()

class Ondulation {
  // proprietes
  float x; // pos x
  float y; // pos y
  float l; // largeur
  float h; // hauteur
  float v; // vitesse
  int c1; // R
  int c2; // G
  int c3; // B
  int a; // Alpha

  // constructeur
  Ondulation(float posX, float posY, float largeur, float hauteur, float vitesse, int couleur1, int couleur2, int couleur3, int alpha) {
    x = posX;
    y = posY;
    l = largeur;
    h = hauteur;
    v = vitesse*4;
    c1 = couleur1;
    c2 = couleur2;
    c3 = couleur3;
    a = alpha;
  } // fin du constructeur Ondulation()

  // methodes
  void afficher() {
    noFill();
    stroke(color(c1,c2,c3,a));
    ellipse(x, y, l, h);
  } // fin de afficher()
  
  void expandre(){    
    if(l < 100){
      l += v;
      h += v;
    }else{
      l += v;
      h += v;
      a -= v;
    }
  } // fin de expandre()
} // fin de classe Ondulation
