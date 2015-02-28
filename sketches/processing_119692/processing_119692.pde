
Rectangle r;
Cercle c;

void setup() {
  ellipseMode(RADIUS);
  size(500, 500);
  background(0);
  r = new Rectangle(30, 30);
  c = new Cercle(20);
}

void draw() {
  fill(0);
  rect(0,0,width,height);
  fill(255);
  r.affiche();
  c.affiche();
}
//============================================================
//                     CLASSES
//============================================================


//--------------------- Rectangle --------------------------
class Rectangle {
  float largeur;
  float longueur;
  float posX, posY;
  float vitesseX, vitesseY;

  // Constructeur
  Rectangle (float w, float h) {
    largeur = w;
    longueur = h;
    posX = width / 2;
    posY = height / 2;
    vitesseX = random(-5, 5);
    vitesseY = random(-5, 5);
  }

  // Aire
  float aire() {
    return largeur * longueur;
  }

  // Périmètre
  float perimetre() {
    return 2 * (largeur + longueur);
  }
  
  // Affichage
  void affiche() {
    bouge();
    rect(posX, posY, largeur, longueur);
  }
  
  // Bouger
  void bouge() {
    posX += vitesseX;
    posY += vitesseY;
    if (posX > width - largeur || posX < 0)
      vitesseX *= -1;
    if (posY > height - longueur || posY < 0)
      vitesseY *= -1;
  }
}

//--------------------- Cercle --------------------------
class Cercle {
  float rayon;
  float posX, posY;
  float vitesseX, vitesseY;
  
  Cercle(float r) {
    rayon = r;
    posX = width / 2;
    posY = height / 2;
    vitesseX = random(-5, 5);
    vitesseY = random(-5, 5);
  }
  
  Cercle(float r, float x, float y) {
    rayon = r;
    posX = x;
    posY = y;
  }
  
  // aire
  float aire() {
    return PI * rayon * rayon;
  }
  
  // perimetre
  float perimetre() {
    return 2 * PI * rayon;
  }
  
  
  // afficher
  void affiche() {
    bouge();
    ellipse(posX, posY, rayon, rayon);
  }
  
  // bouger
  void bouge() {
    posX += vitesseX;
    posY += vitesseY;
    if (posX > width - rayon || posX < rayon)
      vitesseX *= -1;
    if (posY > height - rayon || posY < rayon)
      vitesseY *= -1;
  }
}


