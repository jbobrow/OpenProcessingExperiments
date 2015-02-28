
float x; //variable pour la largeur
float y; //varialbe de la hauter
float conter; // conter générale 
float conterRes; // conter pour la respiration
float oscilationX; 
float oscilationY;
float oscilationR; // oscilation pour la respiration
float offset; 
float [] offsetLong; //tableau d'offset pour la longeur des épines
float rayon; //rayaon du cecle a détecté
float largeur; // x
float hauteur; // y
float sX; // possition x du rect de d/tecet
float sY; // position y du rect de detect
float xCourant;
float xCible;
float xVitesse;
float xK;
float xD;

float yCourant;
float yCible;
float yVitesse;
float yK;
float yD;
int etat;
int stopper;
int i; //variable pour 
color couleurPet = color(240, 30, 190);// couleur des petales par defaut

// Fonction qui n'est appelee qu'au demarrage.
void setup() {
  size(400, 400); // La taille de la fenetre.
  frameRate(30); // Le nombre d'images par seconde.
  smooth(); // Lisser les formes dessinees.

  x = width/2;
  y = height/2;
  offset = 20; //contrôle l'amplitude (longueur des épines)
  offsetLong = new float [18]; // initialisation du tableau 18 cellules
  rayon = 80; //rayon du cercle de détection
  largeur = 50; //largeur du carré a détecter
  hauteur = 40; //hauteur du cercle a détecter  

  xCourant = width/2;
  xCible = 400;
  xVitesse = 0;
  xK = 0.2 ; //entre 0 et 1
  xD = 0.3 ; // entre 0 et 1

  yCourant = width/2;
  yCible = 400;
  yVitesse = 0;
  yK = 0.2 ; //entre 0 et 1
  yD = 0.3 ; // entre 0 et 1
}

void draw() {
pushMatrix();
  background(127); // Remplir l'arriere-plan d'une teinte de gris.

  translate(x, y);

  ///////////////////////////////////////////
  //////épine a chaque 5 sec changent de/////
  ////////////////taille/////////////////////
  int tempsEcouler = millis() - stopper;

  if (tempsEcouler >= 5000) { //après 5 sec
    stopper = millis();
    //remplisage du tableau
    for (int i = 0; i< 18; i++) { //nouveau tableau
      offsetLong[i] = random(0, 35);
    }
  }

  //------------------------------- ÉPINE

  pushMatrix();
  translate(0, -30);
  for (int i = 0; i < 18; i++) {
    line(60, 0, 100+oscilationY+offsetLong[i], 0);
    stroke(0, 0, 0);
    rotate(radians(-10));
  }
  popMatrix();
  //------------------------------------

  //--------------------------------- L'OEIL
  pushMatrix();
  stroke(10); // Orbite
  translate(0, -30);
  fill(55, 139, 22);
  ellipseMode(CENTER);
  ellipse(0, 0, 132, 134); // fin orbite
  popMatrix();

  pushMatrix();
  stroke(10); // arrière de l'oeil globe
  translate(0, -30);
  fill(55, 24, 237);
  ellipseMode(CENTER);
  ellipse(0, 0, 112, 114); // fin arrière de l'oeil
  popMatrix();

  //--------------------------Iris
  pushMatrix();
  translate(0, -30);
  noStroke(); //début Iris
  for (int i=0;i<39;i=i+3) {
    fill(24+i, 237+i, 25+i);
    ellipse(0, 0, 39-i, 114-i);
  }//fin Iris
  popMatrix();

  //--------------------------Pupile
  pushMatrix();
  stroke(10); //début pupile
  fill(0, 0, 0);
  ellipseMode(CENTER);
  translate(0, -30);
  ellipse(0, 0, 5, 114); // fin pupile
  popMatrix();

  //--------------------------Détaile 1
  pushMatrix();
  noFill();// détail 1
  stroke(10); 
  ellipseMode(CENTER);
  translate(5, -3);
  ellipse(0, 0, 4, 5); //fin détail 1
  popMatrix();

  //------------------------Détaile 2
  pushMatrix();
  noFill();//détail 2
  stroke(10); 
  ellipseMode(CENTER);
  translate(3, 0);
  ellipse(0, 0, 3, 3); //fin détail 2
  popMatrix();

  //------------------------paupière
  pushMatrix();
  noStroke(); //Début paupière
  fill(55, 139, 22);
  translate(0, -31);
  arc(0, 0, 120, 120, radians(200), radians(340)); //fin paupière
  popMatrix();

  //-------------------------CIl 1
  pushMatrix();
  translate(-70, -117);
  noFill();
  stroke(10);
  beginShape();
  curveVertex(57.0, 84.0);
  curveVertex(46.0, 77.0);
  curveVertex(42.0, 66.0);
  curveVertex(44.0, 54.0);
  curveVertex(56.0, 46.0);
  endShape();
  popMatrix();

  //------------------------Cile 2
  pushMatrix();
  translate(-85, -120);
  noFill();
  stroke(10);
  beginShape();
  curveVertex(57.0, 84.0);
  curveVertex(46.0, 77.0);
  curveVertex(42.0, 66.0);
  curveVertex(44.0, 54.0);
  curveVertex(56.0, 46.0);
  endShape();
  popMatrix();

  //-----------------------Cile 3
  pushMatrix();
  translate(-55, -112);
  noFill();
  stroke(10);
  beginShape();
  curveVertex(57.0, 84.0);
  curveVertex(46.0, 77.0);
  curveVertex(42.0, 66.0);
  curveVertex(44.0, 54.0);
  curveVertex(56.0, 46.0);
  endShape();
  popMatrix();

  //-----------------------CILE 4
  pushMatrix();
  noFill();
  stroke(10);
  translate(-50, -103);
  beginShape();
  curveVertex(47, 34);
  curveVertex(58, 45);
  curveVertex(63, 57);
  curveVertex(60, 68);
  curveVertex(50, 78);
  endShape();
  popMatrix();

  //------------------------------CILE 5
  pushMatrix();
  noFill();
  stroke(10);
  translate(-35, -109);
  beginShape();
  curveVertex(47, 34);
  curveVertex(58, 45);
  curveVertex(63, 57);
  curveVertex(60, 68);
  curveVertex(50, 78);
  endShape();
  popMatrix();
  //------------------ FIN DE L'OEIL 

  //------------------ DÉBUT CORP
  pushMatrix();
  fill(55, 139, 22); // Body 2
  stroke(10);
  translate(50, 22);
  ellipse(0, 0, 121, 29+oscilationR); //Fin body 2 
  popMatrix();

  pushMatrix();
  fill(55, 139, 22); // Body 1
  translate(-40, +35);
  ellipse(0, 0, 87, 66+oscilationR); //Fin body 1
  popMatrix();

  pushMatrix();
  fill(55, 139, 22); //corps 3
  translate(59, -49);
  ellipse(0, 0, 53, 53);//fin corps 3
  popMatrix();
  //-------------------- FIN CORP

  //---------------------- DÉBUT TENTACULE

  pushMatrix();
  fill(55, 139, 22);
  translate(-200, -200);
  beginShape();
  curveVertex(74.0, 108.0);
  curveVertex(119.0, 210.0);
  curveVertex(32.0, 331.0);
  curveVertex(178.0, 346.0);
  curveVertex(225.0, 331.0);
  curveVertex(52.0, 324.0);
  curveVertex(122.0, 237.0);
  curveVertex(158.0, 72.0);
  endShape();
  popMatrix();


  pushMatrix();
  translate(0, 0);
  beginShape(); //tentacul 2
  curveVertex(51.0, -44.0);
  curveVertex(79.0, 20.0);
  curveVertex(102.0, 48.0);
  curveVertex(81.0, 110.0);
  curveVertex(24.0, 127.0);
  curveVertex(32.0, 140.0);
  curveVertex(95.0, 111.0);
  curveVertex(109.0, 87.0);
  curveVertex(120.0, 46.0);
  curveVertex(105.0, 22.0);
  curveVertex(126.35443, 13.90503);
  endShape(); //Fin tentacul 2
  popMatrix();

  pushMatrix();
  translate(0, 5);
  beginShape(); // tentacul3
  curveVertex(51.0, 53.0);
  curveVertex(-64, 7.0);
  curveVertex(-95.0, -52.0);
  curveVertex(-111.0, -102.0);
  curveVertex(-155.0, -111.0);
  curveVertex(-118.0, -98.0);
  curveVertex(-111.0, -76.0);
  curveVertex(-99.0, -26.0);
  curveVertex(-84.0, 30.0);
  curveVertex(-46.0, 97.0);
  endShape(); //fintentacul
  popMatrix();
  //-----------------------------FIN TENTACULE

  //------------------- POT
  pushMatrix();
  fill(222, 96, 11); //Bordure
  stroke(10);
  translate(0, 0);
  quad(-69, 23, 71, 23, 71, 38, -69, 38); //Fin Bordure
  popMatrix();

  pushMatrix();
  fill(222, 96, 11); //pot
  stroke(10);
  translate(0, 0);
  quad(-62, 38, 64, 38, 34, 118, -32, 118); //Fin pot
  popMatrix();

  pushMatrix();
  translate(0, 0);
  beginShape(); //Début bouche
  stroke(10);
  fill(0, 0, 0);
  vertex(-28, 60);
  vertex(5, 70);
  vertex(33, 67);
  vertex(45, 65);
  vertex(19, 103);
  vertex(-22, 99);
  endShape(); //fin bouche
  popMatrix();

  pushMatrix();
  translate(0, 0);
  stroke(10); //Crake
  line(-28, 60, -38, 50); 
  line(-31, 58, -25, 48);
  line(-25, 48, -14, 54);//fin crack
  popMatrix();
  //---------------------- FIN POT

  //---------------------- BOUCHE
  pushMatrix();
  stroke(10); //dent haut 1
  fill(255, 255, 255);
  translate(-12, 85);
  rotate(radians(-90));
  arc(0, 0, 15, 15, radians(0), radians(180));
  popMatrix();

  pushMatrix();
  stroke(10); // dent haut 2
  fill(255, 255, 255);
  translate(5, 75);
  arc(0, 0, 15, 15, radians(0), radians(180));
  popMatrix();

  pushMatrix();
  stroke(10); // dent haut 3 
  fill(255, 255, 255);
  translate(22, 85);
  rotate(radians(90));
  arc(0, 0, 15, 15, radians(0), radians(180));
  popMatrix();

  pushMatrix();
  stroke(10); //dent bas 1
  fill(255, 255, 255);
  translate(5, 97);
  arc(0, 0, 15, 15, radians(-180), radians(0));
  //Fin dent bas 1
  popMatrix();
  //---------------------------FIN BOUCHE

  // ---------------------------FLEUR
  stroke(10);
  pushMatrix(); //p/tLE 1
  translate(45, -100);
  fill(couleurPet);
  beginShape();
  curveVertex(-6.0, 143.0);
  curveVertex(29.0, 43.0);
  curveVertex(34.0, 27.0);
  curveVertex(24.0, 9.0);
  curveVertex(14.0, 26.0);
  curveVertex(19.0, 44.0);
  curveVertex(49.0, 143.0);
  endShape();
  popMatrix();

  pushMatrix();//PETAL 2
  translate(100, -100);
  rotate(radians(60));
  beginShape();
  curveVertex(-6.0, 143.0);
  curveVertex(29.0, 43.0);
  curveVertex(34.0, 27.0);
  curveVertex(24.0, 9.0);
  curveVertex(14.0, 26.0);
  curveVertex(19.0, 44.0);
  curveVertex(49.0, 143.0);
  endShape();
  popMatrix();

  pushMatrix(); //petal 3
  translate(125, -55);
  rotate(radians(120));
  beginShape();
  curveVertex(-6.0, 143.0);
  curveVertex(29.0, 43.0);
  curveVertex(34.0, 27.0);
  curveVertex(24.0, 9.0);
  curveVertex(14.0, 26.0);
  curveVertex(19.0, 44.0);
  curveVertex(49.0, 143.0);
  endShape();
  popMatrix();

  pushMatrix(); // petale 4
  translate(100, -10);
  rotate(radians(180));
  beginShape();
  curveVertex(-6.0, 143.0);
  curveVertex(29.0, 43.0);
  curveVertex(34.0, 27.0);
  curveVertex(24.0, 9.0);
  curveVertex(14.0, 26.0);
  curveVertex(19.0, 44.0);
  curveVertex(49.0, 143.0);
  endShape();
  popMatrix();

  pushMatrix(); // petale 5
  translate(45, -10);
  rotate(radians(240));
  beginShape();
  curveVertex(-6.0, 143.0);
  curveVertex(29.0, 43.0);
  curveVertex(34.0, 27.0);
  curveVertex(24.0, 9.0);
  curveVertex(14.0, 26.0);
  curveVertex(19.0, 44.0);
  curveVertex(49.0, 143.0);
  endShape();
  popMatrix();

  pushMatrix(); // petale 6
  translate(20, -55);
  rotate(radians(300));
  beginShape();
  curveVertex(-6.0, 143.0);
  curveVertex(29.0, 43.0);
  curveVertex(34.0, 27.0);
  curveVertex(24.0, 9.0);
  curveVertex(14.0, 26.0);
  curveVertex(19.0, 44.0);
  curveVertex(49.0, 143.0);
  endShape();
  popMatrix();

  //coeur
  noStroke();
  translate(72, -55);
  for (int i=0;i<20;i=i+2) {
    fill(244-(i*5), 245-(i*5), 27-(i*5));
    ellipse(0, 0, 20-i, 20-i);
  }
  //-------------------- FIN FLEUR

  conter = conter+0.1; //controle la vitesse de l'oscilatio des epine

  conterRes = conterRes+0.05; // conrole de vitesse de l<oscilation de la respiration

  sX = screenX(-90, 120); // position écrans x pour détection bouche
  sY = screenY(-90, 120); // position écran Y pour détection bouche 

  ///////////////////////////////////////////
  /////// Atrapper mouche////////////////////
  ///////////////////////////////////////////
  ////// ZONE INTERACTIVE 1//////////////////
  //Carre sur la bouche qui mange la mouche//
  /// carrer doit etre -90, 120, 50, 40 //

  //--------------------------------- Oscillation y epine et mouche
  oscilationY = sin(conter)*offset;
  //---------------------------------
  //--------------------------------- oscilation X de la mouche
  oscilationX = cos(conter)*offset;
  //---------------------------------
  //------------------------------------- Osilation respiration
  oscilationR=  sin(conterRes)*(offset*0.5);
  //-----------------------------------------------------------

  float gauche = sX;
  float droit = sX + largeur;
  float haut = sY;
  float bas = sY + hauteur;

  if (mouseX > gauche
    && mouseX < droit
    && mouseY > haut
    && mouseY < bas) {
    fill(255, 255, 255, 0); // si sur la bouche elle disparait
  } 
  else {
    fill(255, 255, 255, 255); // si pas sur la bouche elle réaparait
  }

  xCible = mouseX;
  yCible = mouseY;

  xVitesse = xD * (xVitesse + xK * (xCible - xCourant));
  xCourant = xCourant + xVitesse;

  yVitesse = yD * (yVitesse + yK * (yCible - yCourant));
  yCourant = yCourant + yVitesse;

  /////La mouche//////
  ellipse((oscilationX+xCourant)-275, (oscilationY+yCourant)-145, 10, 10);
  //////////////////// fin de Zone Interactive 1//////////////////////
  popMatrix();
}


void mousePressed() {
  ////// Changement detat//////////////
  if (etat==0) {
    etat = 1;
  } 
  else {
    etat = 0;
  }

  ////////////////////////////////////
  //////Colorisation petal////////////
  ////////////////////////////////////
  ///////ZONE INTERACTIVE 2///////////
  //cercle qui change la couler///////
  ///////////des pétales//////////////
  float distance = dist(mouseX, mouseY, x+72, y-55);
  if (distance<rayon*0.5) {
    couleurPet = color(random(0, 255), random(0, 255), random(0, 255));
  }
}
