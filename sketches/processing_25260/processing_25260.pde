
/*SIMULATION TP3 ALGORITHMIE ET INTERACTIVITÉ
Félix Descôteaux
"LENDEMAIN DE VEILLE"
*/



//Initialisation des variables
int balleCount = 1000;
Balle[] balle = new Balle[balleCount];
Vecteur[] vecteur = new Vecteur[balleCount];
Sol sol;
float gravite = .0981, rebondissement = 0.7, distance = .3, vitesseApparition = .1, initiation = 0;
PImage b;

void setup(){
  colorMode(RGB);
  size(400, 400);
  smooth();
  //loading de l'image
  b = loadImage( "nez.png" );

  // Initialisation du sol lorsque l'applet est ouvert en se servant de la classe "sol"
  sol  = new Sol(0, random(150, 400), width, random(150, 400));

  //initialisation des balles qui vont joyeusement déferler sur le sol 
  //la boucle vient parcourir les valeurs du tableau
  for (int i=0; i<balleCount; i++){
    balle[i] = new Balle(random(5,10),0,random(.5,15));
    vecteur[i] = new Vecteur(1+random(-distance, distance),0);    
  }
 }


void draw(){
  
  fill(0);
  noStroke();
  rect(0, 0, width, height);
  image (b, 0, 0);
  fill(255,229,243);
  
  //Dessin du sol! Sans le dessin, on ne le voit pas! 
  beginShape();
  vertex(sol.x1, sol.y1);
  vertex(sol.x2, sol.y2);
  vertex(sol.x2, height);
  vertex(sol.x1, height);
  endShape(CLOSE);
  
  //Couleur des balles
  fill(200,255,0);
  stroke(51,255,102);
  strokeWeight(5);
   
  //Dessin des balles
  for (int i=0; i<initiation; i++){
    balle[i].x += vecteur[i].vx;
    vecteur[i].vy += gravite;
    balle[i].y += vecteur[i].vy;
    ellipse(balle[i].x, balle[i].y, balle[i].rayon*2, balle[i].rayon*2);
    
    //Appel de la fonction qui analyse les colisions
    checkSolCollision(sol, balle[i],vecteur[i], rebondissement);
  }
  
  //Condition de lancement des balles
 if (initiation < balleCount-1){
    initiation += vitesseApparition;
  }
  
 //Placement de l'image
 image (b, 0, 0);

}

//Fonction qui analyse et produit les collisions - inspiré du livre de Ira Greenberg - Creative Coding and Computational Art
void checkSolCollision(Sol sol, Balle balle, Vecteur vecteur, float rebondissement) {

  // Calcul de la différence de distance entre la position de la balle et le sol
  float deltaX = balle.x - sol.x;
  float deltaY = balle.y - sol.y;
 
  // détermine le sinus et le cosinus pour déterminer l'angle de rotation
  float cosinus = cos(sol.rot);
  float sinus = sin(sol.rot);

 //rotation du sol et par le fait mm du vecteur pour simuler des collisions orthogonales (rendre le sol horizontal)
  float solXSimule = cosinus * deltaX + sinus * deltaY;
  float solYSimule = cosinus * deltaY - sinus * deltaX;
  float vecteurXSimule = cosinus * vecteur.vx + sinus * vecteur.vy;
  float vecteurYSimule = cosinus * vecteur.vy - sinus * vecteur.vx;
  

  //Condition de détection du sol
  if (solYSimule > -balle.rayon){
    //Empeche la boule de rentrer a moitié dans l sol
    solYSimule = -balle.rayon;
    //Rebondissement de la boule en fonction de sa constante de reondissement
    vecteurYSimule *= -1.0;
    vecteurYSimule *= rebondissement;
  }
  
  

  //Réinitialisation du sol
  deltaX = cosinus * solXSimule - sinus * solYSimule;
  deltaY = cosinus * solYSimule + sinus * solXSimule;
  vecteur.vx = cosinus * vecteurXSimule - sinus * vecteurYSimule;
  vecteur.vy = cosinus * vecteurYSimule + sinus * vecteurXSimule;
  balle.x = sol.x + deltaX;
  balle.y = sol.y + deltaY;
  
}


//Fonction mousePressed qui randomize le sol à chaque clic
void mousePressed() {
    sol  = new Sol(0, random(150, 400), width, random(150, 400));
 }
 
//Classe de la balle
class Balle{
  float x, y, rayon;
  //Constructeurs
  
  Balle() {
  }
   Balle(float x, float y, float rayon){
    this.x = x;
    this.y = y;
    this.rayon = rayon;
  }
}

//Classe du sol
class Sol {
  float x1, y1, x2, y2;  
  float x, y, len, rot;
  
  //Constructeurs
  Sol(){
  }
  Sol(float x1, float y1, float x2, float y2) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    x = (x1+x2)/2;
    y = (y1+y2)/2;
    len = dist(x1, y1, x2, y2);
    rot = atan2((y2-y1), (x2-x1));
    
  }
}

//Classe du vecteur de direction et vitesse des boules
class Vecteur{
  float vx, vy;
  
  //Constructeurs
  Vecteur(){
  }
  Vecteur(float vx, float vy){
    this.vx= vx;
    this.vy = vy;
  }
}


