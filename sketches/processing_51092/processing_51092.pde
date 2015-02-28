
/* --------------------------------------------------------------------------
Travail 1 : Monstre
Par Marc-André Brault (BRAM18028903)
Dans le cadre du cours Algrothmie de base et interactivite (EDM4600)
UQAM 2012
-------------------------------------------------------------------------- */
  
// Variables pour la position
float y;
float x;
 
// Configurer la scene
size(400,400);
smooth();
 
// Placer au centre de la scene
x = width/2;
y = height/2;
 
//// Arriere plan

// Ciel
background(135,206,250);

// Gazon
float largeurGazon = width;
float hauteurGazon = width/4;
rectMode(CENTER);
noStroke();
fill(50,205,50);
rect(x,y+(width/2),largeurGazon,hauteurGazon);

//// Corps

float largeurCorps = width/2;
float hauteurCorps = 300;
rectMode(CENTER);
noStroke();
fill(139,69,19);
rect(x,y-30,largeurCorps,hauteurCorps);

//// Jambes

float largeurJambe = 90;
float hauteurJambe = 60;
rectMode(CENTER);
noStroke();
fill(139,69,19);

// Gauche
rect(x-55,y+150,largeurJambe,hauteurJambe);

// Droite
rect(x+55,y+150,largeurJambe,hauteurJambe);

//// Yeux

float largeurOeil = 30;
float hauteurOeil = 30;
ellipseMode(CENTER);
noStroke();
fill(0);

// Gauche
ellipse(x-65,y-140,largeurOeil,hauteurOeil);

// Droit
ellipse(x+65,y-140,largeurOeil,hauteurOeil);

//// Pupilles

float largeurPupille = 8;
float hauteurPupille = 8;
ellipseMode(CENTER);
noStroke();
fill(255);

// Gauche
ellipse(x-65,y-140,largeurPupille,hauteurPupille);

// Droit
ellipse(x+65,y-140,largeurPupille,hauteurPupille);

//// Bouche

float largeurBouche = 132;
float hauteurBouche = 100;
rectMode(CENTER);
noStroke();
fill(255,0,0);
rect(x,y-40,largeurBouche,hauteurBouche);

//// Dents

float largeurDent = 33;
float hauteurDent = 25;
float debutDentDuHaut = y - 90; // A quelle hauteur est la dent
float debutDentDuBas = y + 10; // A quelle hauteur est la dent
float departDent = x - 66; // Ou la dent commence
float compteur = 0; // Controle le nombre de dents crees

fill(255);

// Rangee du haut
while(compteur < 4){
   
  beginShape();
    vertex(departDent,  debutDentDuHaut);
    vertex(departDent + largeurDent,  debutDentDuHaut);  
    vertex(departDent + (largeurDent/2),  debutDentDuHaut + hauteurDent);   
    vertex(departDent,  debutDentDuHaut);
  endShape();   
 
  departDent = departDent + largeurDent; // Pour etablir ou la prochaine dent sera tracee
  compteur += 1; // On augmente le compteur
};

departDent = x - 66; // reset de departDent
compteur = 0; // reset du compteur

// Rangee du bas
while(compteur < 4){
   
  beginShape();
    vertex(departDent,  debutDentDuBas);
    vertex((departDent) + largeurDent,  debutDentDuBas);  
    vertex((departDent) + (largeurDent/2),  debutDentDuBas - hauteurDent);   
    vertex(departDent,  debutDentDuBas);
  endShape();
    
  departDent = departDent + largeurDent;
  compteur += 1;
};

//// Bras

float largeurBras = 40;
float largeurArc = 120;
float hauteurArc = 120;

noFill();
stroke(139,69,19);
strokeWeight(largeurBras);

// Gauche
arc(110, y + 70, largeurArc, hauteurArc, PI, TWO_PI-PI/2);

// Droit
arc(width - 110, y + 70, largeurArc, hauteurArc, TWO_PI-PI/2, TWO_PI);

