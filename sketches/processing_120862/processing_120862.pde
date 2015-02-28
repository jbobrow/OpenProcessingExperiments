
int NB_OBJ = 100;
Rectangle[] r;
Cercle[] c;
int time = 0;

void setup() {
  colorMode(HSB);
  noStroke();
  ellipseMode(RADIUS);
  size(500, 500);
  background(0);
  r = new Rectangle[NB_OBJ];
  c = new Cercle[NB_OBJ];
  r[0] = new Rectangle(20, 20);
  c[0] = new Cercle(20);
}

void draw() {
  time++;
  fill(0);
  rect(0,0,width,height);
  fill(255,200);
  if (time % 30 == 0) {
    shift(r);
    shift(c);
    r[0] = new Rectangle(random(20,100), random(20,100));
    c[0] = new Cercle(random(20,50));
  }
  for (int i = 0; i < NB_OBJ; i++) {
    if (r[i] != null)
      r[i].affiche();
    if (c[i] != null)
      c[i].affiche();
  }
  
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
  color couleur;

  // Constructeur
  Rectangle (float w, float h) {
    largeur = w;
    longueur = h;
    posX = width / 2;
    posY = height / 2;
    vitesseX = random(-2, 2);
    vitesseY = random(-2, 2);
    couleur = color(random(0,255), 150, 255);
  }
  
  // Affichage
  void affiche() {
    bouge();
    fill(couleur, 150);
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
  color couleur;
  
  Cercle(float r) {
    rayon = r;
    posX = width / 2;
    posY = height / 2;
    vitesseX = random(-3, 3);
    vitesseY = random(-3, 3);
    couleur = color(random(0,255), 255, 255);
  }  
  
  // afficher
  void affiche() {
    bouge();
    fill(couleur, 150);
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

//============================================================
//                     FONCTIONS
//============================================================


<T> void shift(T[] tab) {
  for(int i = tab.length - 1; i > 0; i--)
    tab[i] = tab[i-1];
   tab[0] = null;
}


