
// -----------------------------------
// --- TunnelTriangles :: Karl Salameh
// --- 16 Avril 2014 -----------------
// -----------------------------------

TunnelTriangles TT;

void setup() {
  size(300, 300, P3D);
  smooth();
  frameRate(30);

  // ARGS: float posX | float posY | float taille | float vitesse | int quantite de triangles dans le tunnel | type spike (0), bubbly (1), fusion (2) 
  TT = new TunnelTriangles(150, 150, 160, 0.5, 10, 0);
}

void draw() {
  background(255);
  TT.draw();
}

void mousePressed(){
 TT.animer();   
}

class TunnelTriangles {
  // proprietes
  float posX, posY, taille;
  float vitesse;
  int qte; // quantite de triangles dans le tunnel
  ArrayList<uTriangle> aTriangles; // arraylist qui contiendra les triangles du tunnel
  String etat = "triangle"; // etat triangle ou tunnel?
  boolean animer = false;

  // constructeur
  // type = spike (0), bubbly (1), fusion (2) - affecte la plage de couleur des triangles du tunnel selon les arrays
  TunnelTriangles(float posX, float posY, float taille, float vitesse, int qte, int type) {
    this.posX = posX;
    this.posY = posY;
    this.taille = taille;
    this.vitesse = vitesse;
    this.qte = qte;
    aTriangles = new ArrayList<uTriangle>();

    for (int i = 0; i < qte; i++) {
      aTriangles.add(new uTriangle(taille, type, i)); // taille, type et numero du triangle (pour animation de taille)
    }
  }

  // methodes
  // afficher les triangles
  void draw() {
    pushMatrix();
    translate(posX, posY);

    for (int i = 0; i < aTriangles.size(); i++) {
      uTriangle t = (uTriangle) aTriangles.get(i);
      t.draw();
    }
    popMatrix();

    //-------------------------------
    //-- ANIMATION DU TUNNEL --------
    //-------------------------------
    if (animer) {
      if (etat == "triangle") {
        if (aTriangles.get(aTriangles.size()-1).taille > 10) { // Si nous devons animer le tunnel ET que le dernier tunnel n'est pas trop petit
          for (int i = 0; i < aTriangles.size(); i++) {
            uTriangle t = (uTriangle) aTriangles.get(i);
            t.taille -= i*vitesse;
          }
        } 
        else {
          etat = "tunnel";
          animer = !animer;
        }
      } 
      else { // etat tunnel
        if (aTriangles.get(aTriangles.size()-1).taille < taille) { // Si nous devons animer le tunnel ET que le dernier tunnel n'est pas trop petit
          for (int i = 0; i < aTriangles.size(); i++) {
            uTriangle t = (uTriangle) aTriangles.get(i);
            t.taille += i*vitesse;
          }
        } 
        else {
          etat = "triangle";
          animer = !animer;
          for (int i = 0; i < aTriangles.size()-1; i++) {
            uTriangle t = (uTriangle) aTriangles.get(i);
            t.assignerCouleur();
          }
        }
      }
    }
  }

  void animer() {
    animer = !animer;
  }
}

class uTriangle {
  float taille;
  int num;
  int type;
  color[] spikeColor = new color[5];
  color[] bubblyColor = new color[5];
  color[] fusionColor = new color[5];
  color couleurActuelle;

  uTriangle(float taille, int type, int num) {
    this.taille = taille;
    this.num = num;
    this.type = type;

    // ---------------------------------
    // -- Plages de couleur ------------
    // ---------------------------------
    spikeColor[0] = color(244, 152, 84); 
    spikeColor[1] = color(182, 54, 78); 
    spikeColor[2] = color(244, 177, 95); 
    spikeColor[3] = color(152, 47, 78); 
    spikeColor[4] = color(237, 115, 74); 
    bubblyColor[0] = color(32, 78, 149); 
    bubblyColor[1] = color(74, 92, 169); 
    bubblyColor[2] = color(121, 193, 67); 
    bubblyColor[3] = color(87, 173, 190); 
    bubblyColor[4] = color(41, 53, 115); 
    fusionColor[0] = color(255, 255, 255); 
    fusionColor[1] = color(249, 234, 160); 
    fusionColor[2] = color(234, 206, 43); 
    fusionColor[3] = color(185, 122, 42); 
    fusionColor[4] = color(107, 88, 35);

    assignerCouleur();
  }

  void draw() {
    noStroke();
    fill(couleurActuelle);
    triangle(-taille/2, taille/2, 0, -taille/2, taille/2, taille/2); // cause le centre du triangle a etre a 0,0
  }

  void assignerCouleur() {
    switch(type) {
    case 0:
      couleurActuelle = spikeColor[int(random(5))];
      break;
    case 1:
      couleurActuelle = bubblyColor[int(random(5))];
      break;
    case 2:
      couleurActuelle = fusionColor[int(random(5))];
      break;
    }
  }
}

