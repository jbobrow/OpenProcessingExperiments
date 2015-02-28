
/*-----------------------------------------------------------------------------
 Monstre Interactifs
 Par Samantha Velandia Prieto
 -----------------------------------------------------------------*/

//Variables pour la position
float x = width/2;
float y = height/2;

//Déclaration variables nombril et etats du nombril
int nombrilDiametro = 50; // Taille
float nombrilX = x+150; // Position
float nombrilY = y+150;
float i;
float contabilizadorCirculo;
int estadoCirculo;
final int ON = 1;  // final quand on veut déterminer des mots-clés (ON au lieu de 1)
final int OFF = 0;
int numeroDeRayos = 30;
int tamanoRayos = 40;
float tranche = TWO_PI / numeroDeRayos;
float rads = 0;
float ratio = 0.90;
float x1, y1, x2, y2;

//Declaration Background
float r,g,b;
float rCible, gCible, bCible;

void setup() {


  //Configuration Scene
  size(400, 400);
  smooth();
  
  estadoCirculo = OFF;
  //Point Centre de la scene
  x = width/2;
  y = height/2;
}

void draw() { 
  //Arriere Plan
  background(r,g,b);
  
  
  
  //Changement couleurs arrière-plan
  if ( random(100) < 1 ) {
    rCible = random(256);
    gCible = random(256);
    bCible = random(256);
  }
  
  //Assouplissement
  r = ( rCible - r )  * 0.03 + r;
  g = ( gCible - g )  * 0.03 + g;
  b = ( bCible - b )  * 0.03 + b;

  //Dessin Ventre
  rectMode(CENTER);
  stroke(0);
  fill(32, 198, 169);
  //Taille ventre proportionnel a la scene
  float largeurVentre = width/5;
  float hauteurVentre = height/3;
  //rect(x, y, largeurVentre, hauteurVentre);
  
  //Animation Ventre
  float gauche = x-largeurVentre/2 ;
  float droite = x+largeurVentre/2;
  float haut = y-hauteurVentre/2;
  float bas = y+hauteurVentre/2;
  if ( mouseX > gauche && mouseX < droite && mouseY > haut && mouseY < bas ) {
      // mouseOver
      fill(125, 6, 206);
  } else {
      fill(32, 198, 169);
  }
  rect(x, y, largeurVentre, hauteurVentre);
    

  //Dessin Tete
  rectMode(CENTER);
  stroke(0);
  fill(32, 198, 169);
  //Taille tête proportionnel a la scene
  float largeurTete=width/8;
  float hauteurTete=width/6;
  rect(x-0, y-120, largeurTete, hauteurTete);

  //Dessin Bouche
  rectMode(CENTER);
  stroke(0);
  fill(32, 198, 169);
  //Taille bouche proportionnel a la scene
  float largeurBouche=width/5;
  float hauteurBouche=height/16;
  rect(x-0, y-95, largeurBouche, hauteurBouche);

  //Dessin Yeux+Pupilles+Animation
  //Dessin Yeux
  int yeuxD=25;
  float xoeilG= x-12;
  float xoeilD= x+12;
  float yYeux= y-135;
  ellipseMode(CENTER);
  fill(252, 252, 252);
  stroke(0);
  ellipse(xoeilG, yYeux, yeuxD, yeuxD);
  ellipse(xoeilD, yYeux, yeuxD, yeuxD);
  float pupilleD = 15;

  //Animation Yeux

  float radians = atan2(mouseY-yYeux, mouseX-xoeilG);
  float distanceP = dist(mouseX, mouseY, xoeilG, yYeux);

  distanceP = constrain(distanceP, 0, yeuxD/2 - pupilleD/2);


  float pupilleXG = cos(radians)* distanceP + xoeilG;
  float pupilleYG= sin(radians)* distanceP + yYeux;
  float pupilleXD= cos(radians)* distanceP + xoeilD;
  float pupilleYD= sin(radians)* distanceP + yYeux;


  fill(0);
  ellipse(pupilleXG, pupilleYG, pupilleD, pupilleD);
  ellipse(pupilleXD, pupilleYD, pupilleD, pupilleD);

  //Dessin Dents
  fill(252, 252, 252);
  stroke(0);
  triangle(x-40, y-108, x-30, y-108, x-35, y-118);
  triangle(x-30, y-108, x-20, y-108, x-25, y-118);
  triangle(x-20, y-108, x-10, y-108, x-15, y-118);
  triangle(x-10, y-108, x-0, y-108, x-05, y-118);
  triangle(x-0, y-108, x+10, y-108, x+05, y-118);
  triangle(x+10, y-108, x+20, y-108, x+15, y-118);
  triangle(x+20, y-108, x+30, y-108, x+25, y-118);
  triangle(x+30, y-108, x+40, y-108, x+35, y-118);

  //Dessin Cou
  rectMode(CENTER);
  stroke(0);
  fill(32, 198, 169);
  //Taille cou proportionnel a la scene
  float largeurCou=width/20;
  float hauteurCou=height/25;
  rect(x-0, y-75, largeurCou, hauteurCou);

  //Dessin Jambes
  rectMode(CENTER);
  stroke(0);
  fill(32, 198, 169);
  float largeurJambe=width/20;
  float hauteurJambe=height/10;
  rect(x-20, y+86, largeurJambe, hauteurJambe);
  rect(x+20, y+86, largeurJambe, hauteurJambe);

  //Dessin Pieds
  rectMode(CENTER);
  stroke(0);
  fill(32, 198, 169);
  float largeurPied=width/13;
  float hauteurPied=height/20;
  rect(x-25, y+106, largeurPied, hauteurPied);
  rect(x+25, y+106, largeurPied, hauteurPied);

  //Dessin Bras
  rectMode(CENTER);
  stroke(0);
  fill(32, 198, 169);
  float largeurBras1=width/13;
  float hauteurBras1=height/25;
  rect(x+55, y-59, largeurBras1, hauteurBras1);
  rect(x+65, y-59, largeurBras1/2, hauteurBras1);
  rect(x-55, y-59, largeurBras1, hauteurBras1);
  rect(x-65, y-59, largeurBras1/2, hauteurBras1);

  //Dessin Oreilles
  fill(32, 198, 169);
  stroke(0);
  triangle(x+25, y-153, x+50, y-150, x+25, y-180);
  triangle(x-25, y-153, x-50, y-150, x-25, y-180);

  //Dessin triangles arrière plan
  fill(125, 6, 206);
  noStroke();
  triangle(x-200, y-200, x-70, y-200, x-200, y-30);
  triangle(x+200, y+200, x+70, y+200, x+200, y+30);
  triangle(x-200, y+200, x-70, y+200, x-200, y+30);
  triangle(x+200, y-200, x+70, y-200, x+200, y-30);


// Animation Nombril
  strokeWeight(4);
  stroke(0);
  
 rads = 0; // Réinitialisation de la variable rads
  while ( rads < contabilizadorCirculo ) {
    x1 = nombrilX + cos(rads) * tamanoRayos * ratio;
    y1 = nombrilY + sin(rads) * tamanoRayos * ratio;
    x2 = nombrilX + cos(rads) * tamanoRayos;
    y2 = nombrilY + sin(rads) * tamanoRayos;
    line(x1, y1, x2, y2);
    rads = rads + tranche ;
  }
  strokeWeight(1);
 //Boucle Animation Nombril
  if ( estadoCirculo == ON ) {
    if (contabilizadorCirculo < TWO_PI) {
      contabilizadorCirculo = contabilizadorCirculo + 0.6; // Création du cercle de droite à gauche
    }   
    fill(215, 15, 242);
  }
  else {
    if (contabilizadorCirculo > 0) {
      contabilizadorCirculo = contabilizadorCirculo - 0.3; // Création du cercle de gauche à droite, retour à zéro
    }    
    fill(125, 6, 206);
  } 
  
//Dessin Nombril
  
ellipse(nombrilX, nombrilY, nombrilDiametro, nombrilDiametro); 
  
}

//Détection Souris dans le nombril
void mousePressed() {
  // 
 
  float distanceCercle = dist(mouseX, mouseY, nombrilX, nombrilY);
 
  if ( distanceCercle < 25 ) {
    if (estadoCirculo == OFF) {
      estadoCirculo = ON;
    }
    else if (estadoCirculo == ON) {
      estadoCirculo = OFF;
    }



  
  }
}
