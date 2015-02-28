
int boucle = 1;
int taille = 50;
float ecart = 10;
float cubeW;
float prof;
int couleur;
int transp = 128;

String texte;
int posTxtX = 10;

int seuilH = 50;
int seuilB = 10;
float txCrois = 0.5;
boolean fCrois = true;

boolean fBox = false;
boolean fAxis = false;
boolean fCube = true;
boolean fStroke = false;

void setup() {
  size(800, 600, P3D);
  lights();
  smooth();
}

void draw() {
  background(50);
  stroke(255);
  
  // Gestion de la croissance du cube
  if (seuilH != seuilB) {
    if (ecart < seuilB) fCrois=true;
    if (ecart > seuilH) fCrois=false;
    if (fCrois) {ecart = ecart+txCrois;} else {ecart = ecart-txCrois;}
  }
  cubeW = ((boucle*(taille+ecart))-ecart);
  prof = -cubeW;
  couleur = (256/boucle);
  
  // Texte
  textDisplay();
  
  // Centrage de la vue et rotation souris
  translate(width/2,height/2,prof);
  rotateY(map(mouseX,0,width,-PI,PI));
  rotateX(map(mouseY,0,height,-PI,PI));
  
  // Affichage des repères
  if (fAxis) {
    line(0,0,width,0);
    line(0,0,0,height);
    line(0,0,0,0,0,height);
  }
  
  // Affichage du gabarit du cube
  if (fBox) {  noFill();  box(cubeW); }
  
  //Affichage des tracés 
  if (!fStroke) noStroke();
  
  // Affichage du cube
  translate((-cubeW+taille)/2,(-cubeW+taille)/2,(-cubeW+taille)/2);
  if (fCube) {
    for (int z = 0; z < boucle; z++) {
    
      for (int y = 0; y < boucle; y++) {
    
        for (int x = 0; x < boucle; x++) {
          fill(z*couleur,y*couleur,x*couleur,transp);
          box(taille);
          translate(taille+ecart,0,0);
        }
        translate(-boucle*(taille+ecart),taille+ecart,0);
      }
      translate(0,-boucle*(taille+ecart),taille+ecart);
    }
  }
}

void keyPressed() {
  if (key == '+') {
    if (transp + 20 > 255) {transp = 255;} else {transp = transp + 20;}
  }
  if (key == '-') {
    if (transp - 20 < 0) {transp = 0;} else {transp = transp - 20;}
  }
  if (key == 'p') {
    if (txCrois + 0.1 > 10) {txCrois = 10;} else {txCrois = txCrois + 0.1;}
  }
  if (key == 'o') {
    if (txCrois - 0.1 < 0.1) {txCrois = 0.1;} else {txCrois = txCrois - 0.1;}
  }
  if (key == 'b') {
    if (fBox) {fBox=false;} else {fBox=true;}
  }
  if (key == 'a') {
    if (fAxis) {fAxis=false;} else {fAxis = true;}
  }
  if (key == 'c') {
    if (fCube) {fCube=false;} else {fCube = true;}
  }
  if (key == 't') {
    if (fStroke) {fStroke=false;} else {fStroke = true;}
  }
  if (key == CODED) {
    if (keyCode == RIGHT) {
      if (seuilB + 1 > seuilH) {seuilB = seuilH-1;} else {seuilB = seuilB + 1;}
    }
    if (keyCode == LEFT) {
      if (seuilB - 1 < -taille) {seuilB = -taille;} else {seuilB = seuilB - 1;}
    }
    if (keyCode == UP) {
      if (seuilH + 1 > 100) {seuilH = 100;} else {seuilH = seuilH + 1;}
    }
    if (keyCode == DOWN) {
      if (seuilH - 1 < seuilB) {seuilH = seuilB+1;} else {seuilH = seuilH - 1;}
    }
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if (boucle + 1 > 50 ) { boucle=50; } else { boucle++; }
  }
  if (mouseButton == RIGHT) {
    if (boucle - 1 < 1 ) { boucle=1; } else { boucle--; }
  }
}

void textDisplay() {
  fill(255);
  int saut = 20;
  texte = "# Cubes/face : "+boucle+" (fps : "+frameRate+")";  text(texte,posTxtX,saut); saut=saut+20;
  texte = "";  text(texte,posTxtX,saut); saut=saut+20;
  texte = "Souris :";  text(texte,posTxtX,saut); saut=saut+20;
  texte = "Move = rotation X et Y";  text(texte,posTxtX,saut); saut=saut+20;
  texte = "Clic gauche = +1 cube";  text(texte,posTxtX,saut); saut=saut+20;
  texte = "Clic droit = -1 cube";  text(texte,posTxtX,saut); saut=saut+20;
  texte = "";  text(texte,posTxtX,saut); saut=saut+20;
  texte = "Clavier :";  text(texte,posTxtX,saut); saut=saut+20;
  texte = "Cubes (c) = "+fCube;  text(texte,posTxtX,saut); saut=saut+20;
  texte = "Alpha (+ ou -) = "+int(map(transp,0,255,0,100))+"%";  text(texte,posTxtX,saut); saut=saut+20;
  texte = "Repère (a) = "+fAxis;  text(texte,posTxtX,saut); saut=saut+20;
  texte = "Gabarit (b) = "+fBox;  text(texte,posTxtX,saut); saut=saut+20;
  texte = "Tracé (t) = "+fStroke;  text(texte,posTxtX,saut); saut=saut+20;
  texte = "Taux croissance (p ou o) = "+txCrois;  text(texte,posTxtX,saut); saut=saut+20;
  texte = "Seuil écart sup (haut/bas) = "+seuilH;  text(texte,posTxtX,saut); saut=saut+20;
  texte = "Seuil écart inf (gauche/droite)"+seuilB;  text(texte,posTxtX,saut); saut=saut+20;
}



