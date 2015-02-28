
float x;
float y;

size(400, 400);
smooth();

x = width/2;
y = height/2;
float r = 138;
float g = 223;
float b = 252;

background(r, g, b);

//TÊTE
int largeurTete = 80;

fill(0); // couleur noire 
ellipse(x, y, largeurTete, largeurTete-20); // tête
ellipse(x, y, largeurTete-10, largeurTete); // pomettes

// OEILS
int Y = 255;
int E = 249;
int L = 54;
int largeurOeil = 21;
int offset = 22; //x
int inset = 1; //y
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

//OREILLES
int depart = 15; 
int depart2 = 35;
int milieu2 = 35;
int milieu = 50; 
int fin = 40;
// Oreille gauche
stroke(0);
beginShape();
curveVertex(x-depart, y-depart2); 
curveVertex(x-depart, y-depart2);
curveVertex(x-milieu, y-milieu2); 
curveVertex(x-fin, y);
curveVertex(x-fin, y); 
endShape();
// Oreille droite
stroke(0);
beginShape();
curveVertex(x+depart, y-depart2); 
curveVertex(x+depart, y-depart2);
curveVertex(x+milieu, y-milieu2); 
curveVertex(x+fin, y);
curveVertex(x+fin, y); 
endShape();

//CORPS
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

// GAZON
// BOUCLE WHILE QUI DÉTERMINE POSITION GAZON
float R = 27;
float G = 165;
float B = 0;

stroke(R, G, B); 
 float h = 0;
 while (h < 400) {
 float hasard = (int) random(0,12);  
 line (h, 310, h, 300);
 h = h + hasard;
 }

// GAZON FOND
int gazon = 300;
noStroke();
fill(R, G, B, 127);
int vert = 400;
rect (gazon/400, gazon+10, vert, vert);

// NUAGES
int largeurNuages = 50;
int nuage1basex = 60;
int nuage1basey = 50;
int nuage1 = 70;
fill(255);
rect(nuage1basex-30, nuage1basey-21.5, largeurNuages+17, largeurNuages+17);
ellipse(nuage1basex-20, nuage1basey+11, nuage1, nuage1);
ellipse(nuage1basex+30, nuage1basey+11, nuage1, nuage1);
ellipse(nuage1basex+5, nuage1basey-5, nuage1, nuage1);

int nuage2basex = 200;
int nuage2basey = 90;
int nuage2 = 50;
rect (nuage2basex+50, nuage2basey-20, largeurNuages, largeurNuages);
ellipse(nuage2basex+50, nuage2basey+5, nuage2, nuage2);
ellipse(nuage2basex+100, nuage2basey+5, nuage2, nuage2);
ellipse(nuage2basex+75, nuage2basey-10, nuage2, nuage2);

int nuage3basex = 30;
int nuage3basey = 225;
int nuage3 = 20;
rect(nuage3basex, nuage3basey-5, largeurNuages-30, largeurNuages-30);
ellipse(nuage3basex, nuage3basey+5, nuage3, nuage3);
ellipse(nuage3basex+20, nuage3basey+5, nuage3, nuage3);
ellipse(nuage3basex+10, nuage3basey, nuage3, nuage3);

