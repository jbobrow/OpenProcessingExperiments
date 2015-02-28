
float x;
float y;
// Oiseaux
PImage oiseau1;

float oiseauX;
float oiseauY;
float oiseauV;

int temps;
int compteur;
int oiseaux = 10;

// Valeurs yeux Musta
int Y = 255;
int E = 249;
int L = 54;
int largeurOeil = 21;
int offset = 22; //x
int inset = 1; //y

//Tête Musta
int largeurTete = 80;

float r = random(100);

//Corps Musta
int tete = -5;
int tete2 = 0;
int boutbras = -40;
int boutbras2 = 65;
int sousbras = 28;
int sousbras2 = 70;
int cotejambepied = 30;
int cotejambepied2 = 100;
int jambe = 15;
int jambe2 = -110;
int entrejambe = 3;
int entrejambe2 = -100;

//Interactivité corps Musta
int depart = 15; 
int depart2 = 35;
int milieu2 = 35;
int milieu = 50; 
int fin = 40;

int rectX = 150;
int rectY = 160;
int rectW = 100;
int rectH = 150;

//Valeurs Nuages 1-2-3
float largeurNuages = 50;

float nuage1basex = 60;
float nuage1basey = 50;
float nuage1 = 70;

float nuage2basex = 200;
float nuage2basey = 90;
float nuage2 = 50;

float nuage3basex = 30;
float nuage3basey = 225;
float nuage3 = 20;

// Yeux nuages
int largeurnuage = 10;

// Rectangle interactif chat
float gauche = rectX;
float droite = gauche + rectW;
float haut = rectY;
float bas = haut + rectH; 

// Tableau gazon
final int GAZON = 100;

float[] tableauDeX;
float[] tableauDeY;


float radians;

////////////////////////////// SETUP //////////////////////
void setup() {
  size(400, 400);
  smooth();
  frameRate(20);
  //background(0);
  x = width/2;
  y = height/2;

   oiseau1 = loadImage("oiseau1.png");
   
   for (int i = 0; i < oiseaux ; i++) {
   oiseauX = random(0, -30);
   oiseauY = random(height/2);
   oiseauV = random(1, -10);
   }

  ////////////////////////////GAZON TABLEAU
  tableauDeX = new float[GAZON];
  tableauDeY = new float[GAZON];
  for ( int i = 0; i < GAZON ; i = i + 1 ) {
    tableauDeX [i] = random(width);
    tableauDeY [i] = random(0, 12);
  }
}


////////////////////////////// DRAW //////////////////////
void draw() {
  background (138, 223, 252);
  rectMode(CORNER);
  noStroke();
  
  oiseaux();

  nuage1();

  nuage2();

  nuage3();

  yeuxNuages();
  
  chat();

  gazon();

 
}
void chat() {
  //TÊTE
  fill(0); // couleur noire 
  ellipse(x, y, largeurTete, largeurTete-20); // tête
  ellipse(x, y, largeurTete-10, largeurTete); // pomettes

  // Oeil gauche
  fill(Y, E, L); // couleur jaune
  ellipse(x-offset, y-inset, largeurOeil, largeurOeil); // jaune oeil gauche (haut-bas/gauche-droite/grosseur)
  fill(0); // couleur noire
  ellipse(x-offset, y+inset+8, largeurOeil, largeurOeil); // noir oeil gauche 

  // Oeil droit
  fill(Y, E, L);
  ellipse(x+offset, y-inset, largeurOeil, largeurOeil); // jaune oeil droit
  fill(0);
  ellipse(x+offset, y+inset+8, largeurOeil, largeurOeil); // noir oeil droit  

  //CORPS
  fill(0);
  stroke(0);
  beginShape();
  curveVertex(x-tete, y-tete2); //début cou
  curveVertex(x-tete, y-tete2);
  curveVertex(x+boutbras, y+boutbras2); // bout du bras gauche
  curveVertex(x-sousbras, y+sousbras2); // sous bras gauche ligne courbe
  curveVertex(x-sousbras+8, y+sousbras2-5); 
  curveVertex(x-cotejambepied, y+cotejambepied2); // sous bras gauche
  curveVertex(x-cotejambepied, y+cotejambepied2+10); // côté gauche mis jambe
  curveVertex(x-jambe, y-jambe2); // courbe pied gauche
  curveVertex(x-jambe+5, y-jambe2-10); // intérieur mis jambe gauche
  curveVertex(x+entrejambe, y-entrejambe2); // entre-jambe gauche
  curveVertex(x+entrejambe+5, y-entrejambe2+10); // entre-jambe milieu 
  curveVertex(x+jambe+10, y-jambe2-4); // courbe pied droit
  curveVertex(x+cotejambepied-13, y+cotejambepied2-30); // côté jambe droit
  curveVertex(x+sousbras-11, y+sousbras2-5); // sous bras droit 
  curveVertex(x+sousbras-6, y+sousbras2+2); // sous bras droit ligne courbe
  curveVertex(x-boutbras-12, y+boutbras2+9); // bout du bras droit
  curveVertex(x-boutbras-1, y+boutbras2+7); // coin droit bras droit
  curveVertex(x-boutbras-4, y+boutbras2-5); // côté droit bras droit
  curveVertex(x-tete-5, y+20); // point droit raliant la tête
  curveVertex(x, y+100);
  endShape();

  // FOULARD ROUGE
  float foulardx = x-40;
  float foulardy = y+6;
  fill (255, 0, 0);
  stroke (255, 0, 0);
  beginShape();
  curveVertex(foulardx, foulardy); //bout visage gauche
  curveVertex(foulardx, foulardy);
  curveVertex(foulardx+15, foulardy-3); //milieu visage
  curveVertex(foulardx+60, foulardy);
  curveVertex(foulardx+75, foulardy+7);
  curveVertex(foulardx+105, foulardy-8); //bout visage droit
  curveVertex(foulardx+110, foulardy-8);
  curveVertex(foulardx+110, foulardy); //bout foulard droit
  curveVertex(foulardx+90, foulardy+2);
  curveVertex(foulardx+90, foulardy+10);
  curveVertex(foulardx+60, foulardy+25);
  curveVertex(foulardx+35, foulardy+37);
  curveVertex(foulardx, foulardy); //retour point de départ
  curveVertex(foulardx, foulardy);

  endShape();

  fill (0);
  //OREILLES MUSTA INTERACTION

  if (mousePressed == true && mouseX > gauche && mouseX < droite && mouseY > haut && mouseY < bas ) {

    //mouseOver
    //OREILLE GAUCHE
    stroke(0);
    beginShape();
    curveVertex(x-depart, y-depart2);
    curveVertex(x-depart, y-depart2);
    curveVertex(x-milieu, y-milieu2+15); 
    curveVertex(x-fin, y);
    curveVertex(x-fin, y); 
    endShape();
    //OREILLE DROITE
    stroke(0);
    beginShape();
    curveVertex(x+depart, y-depart2); 
    curveVertex(x+depart, y-depart2);
    curveVertex(x+milieu, y-milieu2+15); 
    curveVertex(x+fin, y);
    curveVertex(x+fin, y); 
    endShape();
  }
  else {
    //OREILLE GAUCHE
    stroke(0);
    beginShape();
    curveVertex(x-depart, y-depart2); 
    curveVertex(x-depart, y-depart2);
    curveVertex(x-milieu, y-milieu2); 
    curveVertex(x-fin, y);
    curveVertex(x-fin, y); 
    endShape();
    //OREILLES DROITE
    stroke(0);
    beginShape();
    curveVertex(x+depart, y-depart2); 
    curveVertex(x+depart, y-depart2);
    curveVertex(x+milieu, y-milieu2); 
    curveVertex(x+fin, y);
    curveVertex(x+fin, y); 
    endShape();
  }

  noFill();
  noStroke();
  rect(rectX, rectY, rectW, rectH);
}

void nuage1() {
  noStroke();
  fill(255);
  rect(nuage1basex-30, nuage1basey-21.5, largeurNuages+17, largeurNuages+17);
  ellipse(nuage1basex-20, nuage1basey+11, nuage1, nuage1);
  ellipse(nuage1basex+30, nuage1basey+11, nuage1, nuage1);
  ellipse(nuage1basex+5, nuage1basey-5, nuage1, nuage1);

  //Mouvement nuage 1
  float distance = dist(mouseX, mouseY, nuage1basex, nuage1basey);
  if (distance < 130) {
    float radians = atan2(mouseY-nuage1basey, mouseX-nuage1basex);
    radians = radians + PI;
    nuage1basex = constrain( cos(radians) + nuage1basex, 10, width - 15);
    nuage1basey = constrain( sin(radians) + nuage1basey, 10, height/2 - 15);

    // Assouplissement
    float vitesse = 10;

    float angle = atan2( nuage1basey-nuage1, nuage1basex-nuage1 );
    float distance1 = dist( nuage1basex, nuage1basey, nuage1, nuage1 );
}
}

void nuage2() {
  noStroke();
  fill(255);
  rect (nuage2basex+50, nuage2basey-20, largeurNuages, largeurNuages);
  ellipse(nuage2basex+50, nuage2basey+5, nuage2, nuage2);
  ellipse(nuage2basex+100, nuage2basey+5, nuage2, nuage2);
  ellipse(nuage2basex+75, nuage2basey-10, nuage2, nuage2);
  
  //Mouvement nuage 2
  float distance = dist(mouseX, mouseY, nuage2basex, nuage2basey);
  if (distance < 130) {
    float radians = atan2(mouseY-nuage2basey, mouseX-nuage2basex);
    radians = radians + PI;
    nuage2basex = constrain( cos(radians) + nuage2basex, 10, width - 15);
    nuage2basey = constrain( sin(radians) + nuage2basey, 10, height/2 - 15);

    // Assouplissement
    float vitesse = 10;

    float angle = atan2( nuage2basey-nuage2, nuage2basex-nuage2 );
    float distance1 = dist( nuage2basex, nuage2basey, nuage2, nuage2 );
}
}

void nuage3() {
  fill(255);
  noStroke();
  rect(nuage3basex, nuage3basey-5, largeurNuages-30, largeurNuages-30);
  ellipse(nuage3basex, nuage3basey+5, nuage3, nuage3);
  ellipse(nuage3basex+20, nuage3basey+5, nuage3, nuage3);
  ellipse(nuage3basex+10, nuage3basey, nuage3, nuage3);
 
 //Mouvement nuage 3
  float distance = dist(mouseX, mouseY, nuage3basex, nuage3basey);
  if (distance < 130) {
    float radians = atan2(mouseY-nuage3basey, mouseX-nuage3basex);
    radians = radians + PI;
    nuage3basex = constrain( cos(radians) + nuage3basex, 10, width - 15);
    nuage3basey = constrain( sin(radians) + nuage3basey, 10, height/2 - 15);

    // Assouplissement
    float vitesse = 10;

    float angle = atan2( nuage3basey-nuage3, nuage3basex-nuage3 );
    float distance1 = dist( nuage3basex, nuage3basey, nuage3, nuage3 );
}
}

  void yeuxNuages() {
  // Nuage 1
  stroke(0);
  fill(255);
  float posX1 = nuage1basex;
  float posY1 = nuage1basey ;
  float rad1 = atan2(mouseY - posY1, mouseX-posX1);
  fill(0);

  if (dist(mouseX, mouseY, posX1, posY1) < 5)
  {
    posX1=mouseX;
    posY1=mouseY;
  }
  else
  {
    posX1=posX1 + cos(rad1)*9;
    posY1=posY1 + sin(rad1)*9;
  }
  ellipse(posX1, posY1, 8, 13);   // Yeux nuage 1
  ellipse(posX1+30, posY1, 8, 13); 
  
  // Nuage 2
  float posX2 = nuage2basex;
  float posY2 = nuage2basey ;
  float rad2 = atan2(mouseY - posY2, mouseX-posX2);
  fill(0);

  if (dist(mouseX, mouseY, posX2, posY2) < 5)
  {
    posX2=mouseX;
    posY2=mouseY;
  }
  else
  {
    posX2=posX2 + cos(rad2)*7;
    posY2=posY2 + sin(rad2)*7;
  }
  
  
  ellipse(posX2+50, posY2+5, 7, 12); // nuage 2
  ellipse(posX2+70, posY2+5, 7, 12);
  
  
  // Nuage 3 
  float posX3 = nuage3basex;
  float posY3 = nuage3basey;
  float rad3 = atan2(mouseY - posY3, mouseX-posX3);
  fill(0);

  if (dist(mouseX, mouseY, posX3, posY3) < 5)
  {
    posX3=mouseX;
    posY3=mouseY;
  }
  else
  {
    posX3=posX3 + cos(rad3)*4;
    posY3=posY3 + sin(rad3)*4;
  }
  
 ellipse(posX3+10, posY3+1, 3, 8); // nuage 3
 ellipse(posX3+20, posY3+1, 3, 8);
}

void gazon() {
  // BOUCLE WHILE QUI DÉTERMINE POSITION GAZON
  float R = 27;
  float G = 165;
  float B = 0;

  stroke(R, G, B); 

  for ( int i = 0; i < GAZON ; i = i + 1 ) {
    tableauDeX[i] = tableauDeX[i] + random(-1, 1);
    tableauDeY[i] = tableauDeY[i] + random(-1, 1);
    line (tableauDeX[i], 310, tableauDeX[i], 310 - tableauDeY[i]);
    radians = radians + PI;
    tableauDeX[i] = constrain(tableauDeX[i], -1000, width);
    tableauDeY[i] = constrain(tableauDeY[i], -1000, height/2);
  }

  // GAZON FOND
  int gazon = 300;
  noStroke();
  fill(R, G, B, 300);
  int vert = 400;
  rect (gazon/400, gazon+10, vert, vert);
}

void oiseaux() {
 for (int i = 0; i < 3; i++) {
   oiseauX = oiseauX + oiseauV;
   if (oiseauX > width) {
     oiseauX = random(0, -30);
     oiseauY = random(height/2);
   }
     image (oiseau1,oiseauX,oiseauY, 30 ,30);
}
}



