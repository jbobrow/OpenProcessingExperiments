
Forme [] f = new Forme[50];     // Nombre de formes

void setup() {                  // Paramètre de base appliqué au plan
  size(600, 600, P3D);          // Taille de la fenêtre et mise en 3D
  for (int i=0; i<f.length; i++) {
  f[i] = new Forme (random(0.5, 2), random(0.5, 2), (int)random(2));
  background(100, 100, 100);
  smooth ();
 }
}
void draw() {
  noCursor();                   // Enlève curseur
  for (int i=0; i<f.length; i++) {
  f[i].bouge();
  f[i].decision();
  }



// Variables appelées
float mouv=0.1;
float pas = 10;
float i = 20;
float j = 0;
boolean couleur= false;

// Conditions lors du click de la souris: la couleur change
  if (mousePressed) {
    couleur= true;
  }
  if (couleur) {
  stroke(0);
  strokeWeight (0.5);
  translate(mouv, mouv, mouv);
  rotateX(mouv * 0.02);
  rotateY(mouv * 0.02);
  fill(random(0, 255));
  }
 
  else{
  round(0);
  stroke(255);
  strokeWeight (0.5);
  translate(mouv, mouv, mouv);
  rotateX(mouv * 0.02);
  rotateY(mouv * 0.02);
  fill(i*pas, 0, j*pas, 0);
  }

// Conditions: remise à zéro lorsque l'on appuie sur la barre d'espace
if (keyPressed) {
background(100, 100, 100);
}
}

//Caractéristiques de la forme
class Forme {
float centreX;
float centreY;
float directionX = 1;
float directionY = 1;
float vitesse;
int choix;
float r =0;

// Variables permettant les variations de la forme
Forme(float _zoom, float _vitesse, int _choix) {
vitesse = _vitesse;
choix = _choix;
centreX = random(width);
centreY = random(height);
}

// Conditions du code
void decision() {
if (choix == 0) {
dessine();
}

if (choix == 1) {

}
}


void bouge() {
if (centreX > width) {
centreX = width;
directionX *= -1;
}
if (centreX < 0) {
centreX = 0;
directionX *= -1;
}
else {
centreX += vitesse * directionX;
}
if (centreY > height) {
centreY = height;
directionY *= -1;
}
if (centreY < 0) {
centreY = 0;
directionY *= -1;
}
else {
centreY += vitesse * directionY;
}
}

// Construction de la forme
void dessine() {
pushMatrix();
translate(centreX, centreY);


for (int i=0; i<20; i++) {
float [] posX = {
-20, -15, -10, -5, 0, 5, 10, 15, 20
};
float [] posY = {
-30, -20, -25
};
float longueur = posY[(int)random(3)];
float position = posX[(int)random(9)];
box(50);
}
popMatrix();
}
}
