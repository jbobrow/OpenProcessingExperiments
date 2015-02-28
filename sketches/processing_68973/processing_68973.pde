
//Déclaration des variables servant au bouton de gauche (rond)
int ellipseX = 100;
int ellipseY = 200;
float distance;
float diametre = 50;

//Déclaration des variables servant au bouton de droite (carré)
int carreX = 300;
int carreY = 200;
int carreW = 50;
int carreH = 50;

//Déclaration des variables servant à délimiter la zone d'interaction avec le bouton de droite (carré)
float gauche = carreX - carreW/2;
float droite = carreX+carreW/2;
float haut = carreY - carreH/2;
float bas = carreY+carreH/2;


//Déclaration des variables servant à gérer l'état des deux boutons
int etat = 0;
int etatCarre = 0;

//Déclaration de la variable servant à établir le nombre maximum de lignes verticales (bouton carré)
int v=0;

//Déclaration des variables servant à tracer les rayons autour du bouton rond
float j;
float maxRayons = 0;
int nombreDeRayons = 25;
int longueurDesRayons = 60;
float tranche = TWO_PI / nombreDeRayons;
float ratio = 0.6;


//Fonction appelée au démarrage
void setup() {
  size(400, 400);
  smooth();  
}


//Fonction appelée à répétition
void draw() {
  background(0);

  //########################################################################
  //---CARRÉ-----
  //########################################################################
  rectMode(CENTER);
  fill(255);
  
  //Si carré est appuyé
  if (etatCarre==1) {
    fill(255, 0, 0);        

    for (int i = 0; i < v; i+=20 ) { // condition
      stroke(0, 0, 255);
      strokeWeight(5);
      line(0, i, height, i); // bloc de code
    }
    if (v<height)
      v+=8;
  } 
  //Si carré est relâché
  else {
    fill(255);
    if (v>0)
      v-=8;
    for (int i = 0; i < v; i+=20 ) { // condition
      stroke(0, 0, 255);
      strokeWeight(5);
      line(0, i, height, i); // bloc de code
    }
  } 
  noStroke(); 
  rect(carreX, carreY, carreW, carreH); 



  //########################################################################
  //---CERCLE-----
  //########################################################################
  //Distance entre la souris et les coordonées du cercle.
  distance = dist( mouseX, mouseY, ellipseX, ellipseY ) ;
  
  //Si bouton est appuyé (ON)
  if (etat==1) {
    fill(255, 0, 0);
    strokeWeight(5);
    stroke(0,255,0);

    for (j = 0; j < maxRayons; j+=tranche ) {
      float x1 = ellipseX+cos(j) * longueurDesRayons * ratio;
      float y1 = ellipseY + sin(j) * longueurDesRayons * ratio;
      float x2 = ellipseX+cos(j) * longueurDesRayons;
      float y2 = ellipseY + sin(j) * longueurDesRayons;
      line(x1, y1, x2, y2 );
    }
    if (maxRayons<TWO_PI) {
      maxRayons+=tranche;
    }
  }
  //Si bouton est appuyée une seconde fois (OFF)
  else {
    fill(255);
    if (maxRayons>0)
      maxRayons-=tranche;
    strokeWeight(5);
    stroke(0,255,0);
    for (j = 0; j < maxRayons; j+=tranche ) {
      float x1 = ellipseX+cos(j) * longueurDesRayons * ratio;
      float y1 = ellipseY + sin(j) * longueurDesRayons * ratio;
      float x2 = ellipseX+cos(j) * longueurDesRayons;
      float y2 = ellipseY + sin(j) * longueurDesRayons;
      line(x1, y1, x2, y2 );
    }
  }
  
  noStroke(); 
  ellipse(ellipseX, ellipseY, diametre, diametre);
}


//Fonction appelée lorsque la souris est appuyée et qui sert à faire la gestion des états des boutons.
void mousePressed() {
  //Si la souris se trouve dans le cercle
  if ( distance < diametre/2) { 
    if (etat==0) {
      etat=1;
    }
    else {
      etat = 0;
    }
  }
  //Si la souris se trouve dans le carré
  if ( mouseX > gauche && mouseX < droite && mouseY > haut && mouseY < bas ) {
    etatCarre=1;
  }
}

//Fonction appelée lorsque la souris est relachée
void mouseReleased() {
  etatCarre=0;
}
