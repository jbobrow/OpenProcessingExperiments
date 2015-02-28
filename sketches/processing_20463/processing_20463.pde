
// ****************************************************
// * Algorithmie de base et interactivité EDM4600     *
// * Auteur: Justin Leduc (LEDJ20058800)              * 
// * TP1 - Création d'un monstre interactif           *
// * Nom d'usager sur OpenProcessing.org: JustinL     *
// ****************************************************

// Déclaration et initialisation des variables globales et classes

int nPosX = 197;
int nPosY = 210;
float divis = -25;
float mPosX, mPosY, mPosY2, mPosY3, angle1;
boolean nClick, mClick, viewTut = false;
float lPosY = 0.0;
float cordeCpt = 0.0;
PFont font;
String s = "Coupez la corde";
String s2 = "de gauche à droite.";
Ballon unBallon;
Larme larmes;
Oiseau unOiseau, unOiseau2;

// Fonction générant le canevas et objets

void setup() {
  size(400, 400);
  rectMode(CENTER);
  ellipseMode(CENTER);
  smooth();
  unBallon = new Ballon();
  larmes = new Larme();
  unOiseau = new Oiseau(nPosX, nPosY);
  unOiseau2 = new Oiseau(nPosX-230, nPosY+80);
  font = loadFont("OCRAStd-48.vlw");
  textFont(font, 18);
}

void draw() {
  background(255);
  noStroke();
  // Ombre du monstre sur le sol
  fill(220);
  ellipse(nPosX, nPosY+50, 76, 12);
  fill(0);
  // Parties du corps du monstre
  rect(nPosX, nPosY, 52, 70); // Corps
  rect(nPosX-21, nPosY+40, 10, 20); // Pied gauche
  rect(nPosX+21, nPosY+40, 10, 20); // Pied droit
  fill(255);
  rect(nPosX-23, nPosY-31, 8, 8); // "Trou" blanc sur le bandeau
  rect(nPosX, nPosY-13, 38, 12); // Bandeau
  fill(0);
  rect(nPosX+31, nPosY-39, 8, 8); // Noeud du bandeau
  // Bras
  rect(nPosX-32, nPosY, 20, 10); // Bras gauche
  rect(nPosX+27, nPosY+12, 10, 24); // Bras droit
  unBallon.display(); // Générer le ballon
  unOiseau.display(); // Générer un oiseau
  unOiseau2.display(); // Générer un oiseau
  fill(0);
  if(nClick==true){ // Si le tracé est valide...
    unBallon.move(); // Envolée du ballon
    larmes.couler(); // Générer les larmes
    // Yeux
    noStroke();
    rect(nPosX-8, nPosY-12, 8, 8); // Oeil gauche
    rect(nPosX+8, nPosY-12, 8, 8); // Oeil droit
    stroke(0);
    cordeCpt-=14;
    angle1 = (-cordeCpt/float(width) + 1) * - PI; // Angle du bout de corde restant
    translate(nPosX-40, nPosY); // Rotation de la corde tombante
    if(angle1>-6.3){ // Si la corde a été coupée...
      rotate(angle1); // Tourner la corde
      line(0, 0, 0, nPosY-mPosY3); // Générer la corde
    }else{ // Si la corde est arrêtée...
      rotate(-6.3); // Fixer la corde vers le bas
      line(0, 0, 0, nPosY-mPosY3); // Générer la corde
    }
  }else{
    rect(nPosX-8, nPosY-18, 10, 4); // Oeil gauche
    rect(nPosX+8, nPosY-18, 10, 4); // Oeil droit 
  }
  // Générer le trait rouge
  if(mClick==true){
   stroke(255, 0, 0);
   line(mPosX, mPosY, mouseX, mouseY);
  }
  // Tutoriel
  if(viewTut==false){
      fill(255, 0, 0);
      noStroke();
      // Trait rouge pointillé
      rect(nPosX-56, nPosY-42, 6, 2);
      rect(nPosX-48, nPosY-42, 6, 2);
      rect(nPosX-40, nPosY-42, 6, 2);
      rect(nPosX-32, nPosY-42, 6, 2);
      rect(nPosX-24, nPosY-42, 6, 2);
      // Texte
      fill(0);
      text(s, nPosX-98, nPosY+110);
      text(s2, nPosX-118, nPosY+130);
  }
}

void mousePressed() {
  // Initialisation de variables
  if(mClick==false){
     mPosX = mouseX;
     mPosY = mouseY;
     mClick=true;
  }
}

void mouseReleased(){
  // Vérification et validation des deux extrémités du trait rouge généré par le curseur
  if(mPosX>130 && mPosX<158 && mPosY>160 && mPosY<205){ // Si le premier point se retrouve dans cette marge de valeurs...
       if(mouseX>160 && mouseX<190 && mouseY>158 && mouseY<210){ // Si le deuxième point se retrouve dans cette marge de valeurs...
          mPosY2 = mouseY;
          mPosY3 = mouseY;
          nClick=true;
          // Retirer le tutoriel de l'écran
          if(viewTut==false){
            viewTut=true; 
          }
       } 
  }
  // Retirer le trait rouge de l'écran
  if(mClick==true){
    mClick=false; 
  } 
}

// Classe générant un oiseau

class Oiseau{
  
 float oisCpt = 0.0;
 float oisPosX, oisPosY;
 
 Oiseau(float oPX, float oPY){
   oisPosX = oPX;
   oisPosY = oPY;
 }
 
 // Fonction affichant un oiseau
 
 void display(){
   oisCpt++;
   rectMode(CENTER);
   fill(0);
   rect(oisPosX+104, oisPosY-165, 4, 4);
   if(oisCpt%60>30){ // Si le compteur, incrémenté à chaque image, modulo 60 est plus grand que 30...
     // Aile droite
     rect(oisPosX+108, oisPosY-169, 4, 4);
     rect(oisPosX+112, oisPosY-173, 4, 4);
     // Aile gauche
     rect(oisPosX+100, oisPosY-169, 4, 4);
     rect(oisPosX+96, oisPosY-173, 4, 4);
   }else{
     // Aile droite
     rect(oisPosX+108, oisPosY-161, 4, 4);
     rect(oisPosX+112, oisPosY-157, 4, 4);
     // Aile gauche
     rect(oisPosX+100, oisPosY-161, 4, 4);
     rect(oisPosX+96, oisPosY-157, 4, 4);
   }
 }
  
}

// Classe générant les larmes

class Larme{
  void couler(){
    lPosY++;
    fill(0, 255, 252);
    noStroke();
    rectMode(CENTER);
    if(lPosY<32){
      rect(nPosX-8, (nPosY-5)+lPosY, 6, 6); // Larme gauche
      rect(nPosX+8, (nPosY-5)+lPosY, 6, 6); // Larme droite
    }else{
       lPosY=0; 
    }
    fill(0);
  }
}

// Classe générant le ballon

class Ballon {
  
  float bPosY = nPosX+13; // Position Y du ballon
  float yspeed = 5; // Vitesse Y du ballon
  
  // Fonction affichant le ballon
  
  void display() {
    fill(0);
    rectMode(CENTER);
    // Ballon
    stroke(0);
    strokeWeight(2);
    if(nClick!=true){
      line(nPosX-40, bPosY, nPosX-40, bPosY-70); // Corde
    }else{
      line(nPosX-40, mPosY2, nPosX-40, bPosY-70); // Corde
    }
    noStroke();
    rect(nPosX-39, bPosY-70, 43, 40); // Ballon
    fill(255);
    
    rect(nPosX-57, bPosY-86, 8, 8); // Coin HAUT gauche
    rect(nPosX-21, bPosY-86, 8, 8); // Coin HAUT droit
    rect(nPosX-57, bPosY-54, 8, 8); // Coin BAS gauche
    rect(nPosX-21, bPosY-54, 8, 8); // Coin BAS DROIT
    // Rectangles ("trous") blancs servant à simuler l'effet 8-bits - Côté GAUCHE
    rect(nPosX-52, bPosY-90, 8, 8);
    rect(nPosX-52, bPosY-50, 8, 8);
    rect(nPosX-62, bPosY-59, 8, 8);
    rect(nPosX-62, bPosY-81, 8, 8);
    // Rectangles ("trous") blancs servant à simuler l'effet 8-bits - Côté DROIT
    rect(nPosX-26, bPosY-90, 8, 8);
    rect(nPosX-16, bPosY-81, 8, 8);
    rect(nPosX-26, bPosY-50, 8, 8);
    rect(nPosX-16, bPosY-59, 8, 8);
    // Reflet dans le ballon
    fill(255);
    rect(nPosX-45, bPosY-78, 4, 4);
    rect(nPosX-49, bPosY-74, 4, 4);
  }
  
  // Fonction générant l'interpolation du ballon sur l'axe Y
  
  void move() {
    bPosY = bPosY - yspeed;
    mPosY2 = mPosY2 - yspeed;
    if (bPosY < -250) {
      bPosY = 210;
      cordeCpt=0;
      lPosY=0;
      nClick=false;
    }
  }
}

