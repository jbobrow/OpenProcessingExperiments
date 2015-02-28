
//Anne Lagacé
//Monstre interactif
//12 septembre 2012
 
/////////////////////////////////////////////DEFINITION DES VARIABLES /////////////////////
 
//VARIABLES DANS SIZE
float x = 150;
float y = 200;
float radians = 1.5;
 
//GAZON
int totalGazon = 8000;
float[ ] randomX = new float [ totalGazon ] ;
float[ ] randomY = new float [ totalGazon ] ;
float[ ] angleGazon= new float [ totalGazon ] ;
float randomX2;
 
//ARGUMENTS JOUR
boolean jour = true;
////Changement de la couleur de ciel avec ammortissage
float couranteCielG = 225;  //couleur départ ciel Vert
float cibleeCielG = 200;    //couleur ciblee ciel Vert (variable pour true ou false)
float couranteCielB = 225;  //couleur départ ciel Bleu
float cibleeCielB = 200;    //couleur ciblee ciel Bleu (variable pour true ou false)
 
//DÉGRADÉ COULEUR LION
float couranteTeteR = 200;
float couranteTeteG = 100;
float couranteTeteB = 0;
 
float cibleeTeteR = random(255);
float cibleeTeteG = random(255);
float cibleeTeteB = random(255);
 
//ÉTOILES
int alphaEtoiles = 0;
//Tableau pour positions étoiles
float[] etoileX;
float[] etoileY;
//Amortissage étoiles
float couranteEtoilesA = 0;  //Transparence de départ
float cibleeEtoilesA = 0;  //Transparence ciblee(variable pour true ou false)
 
//Soleil
int nombreDeRayonsSoleil = 25;
int longueurDesRayonsSoleil = 41;
 
//POSITION SOLEIL
float r = 455; // rayon entre le coin et le centre du soleil
float radsPosSoleil = 7 * PI / 4 ;
float cibleeSoleilRads = 11 * PI / 4;
float couranteSoleilX;
float couranteSoleilY;
float couranteLuneX;
float couranteLuneY;
 
//POSITION LUNE
float cibleeLuneRads;
float radsPosLune;
 
//DÉGRADÉS
float xDSoleil = width * 0.5;
float yDSoleil = height * 0.5;
//float d = width;
float difference = 1;
float scale;
float r_c1 = 200; // couleur out
float g_c1 = 150;
float b_c1 = 0;
float r_c2 = 225; // couleur in
float g_c2 = 175;
float b_c2 = 0;
 
float a_c1 = 0; // out
float a_c2 = 4; // in
 
//Criniere
int nombreDeRayonsCriniere = 18;
int longueurDesRayonsCriniere = 90;
float trancheCriniere = TWO_PI / nombreDeRayonsCriniere;
float radsCriniere = 0;
float ratioCriniere = 0.75;
 
//YEUX
float xOeil1 = x-40;
float yOeil1 = y-81;
float xOeil2 = x+40;
float yOeil2 = y-81;
float xOeil3 = x;
float yOeil3 = y-84;
 
float w = 30;
float h = 55;
float w3 = 55;
float h3 = 80;
float pupilleD = 10;
 
//PAUPIERES
int timeStamp1;
int timeStamp2;
int timeStamp3;
int interval;
 
 
// Les valeurs cibles sont un oui ou non du départ ou arrivé alors on les met dans le void mousePressed
// Les valeurs courrante sont graduelles so dans le void draw ont met l'algorythme pcq ca va se restorer souvent
 
 
////////////////////////////////////////////VOID SETUP //////////////////////////////////////
 
void setup () {
  size(400, 400);
  smooth();
 
  //GAZON
  for ( int i = 0 ; i < totalGazon ; i ++ ) {
    randomX [ i ] = random (0, width);
    randomY [ i ] = random (150, height);
    line (randomX [ i ], randomY [ i ], randomX [ i ], randomY [ i ]+4);
  }
  //ÉTOILES
  etoileX = new float[250];
  etoileY = new float[250];
  for ( int i= 0; i < 250 ; i = i+ 1 ) {
    etoileX[i] = random (0, width);
    etoileY[i] = random (0, 150);
  }
  //PAUPIERES
  interval = 4000;
}
 
////////////////////////////////////////////VOID DRAW //////////////////////////////////////
void draw () {
 
  //COULEUR CIEL
  couranteCielG = ( cibleeCielG - couranteCielG ) * 0.05 + couranteCielG;
  couranteCielB = ( cibleeCielB - couranteCielB ) * 0.05 + couranteCielB; // Le 0,2 est le facteur de ralentissement comme un graph exponetiel pour assouplir
  couranteEtoilesA = ( cibleeEtoilesA - couranteEtoilesA) * 0.2 + couranteEtoilesA;
 
  background(0, couranteCielG, couranteCielB);
 
  radsPosSoleil = radsPosSoleil + (cibleeSoleilRads - radsPosSoleil) *0.15 ; //
  radsPosLune = radsPosSoleil + PI; //
 
 
  couranteSoleilX = -1 * (cos (radsPosSoleil) * r  ); // *0.1 + couranteSoleilX; //
  couranteSoleilY = height - sin (radsPosSoleil) * r ; //*0.1 + couranteSoleilY; //
  couranteLuneX = -1 * (cos (radsPosLune) * r  ); // *0.1 + couranteSoleilX; //
  couranteLuneY = height - sin (radsPosLune) * r ; //*0.1 + couranteSoleilY; //;
 
  //ÉTOILES
  noStroke();
 
  for ( int i= 0; i < 250 ; i = i+ 1 ) {
    fill (255, 255, 200, couranteEtoilesA);
    ellipse ( etoileX[i], etoileY[i], 1, 1);
  }
 
  //RAYON SOLEIL
  float tranche = TWO_PI /nombreDeRayonsSoleil;
  float rads= 0;
  strokeWeight (5);
  stroke (200, 150, 0);
  while ( rads < TWO_PI ) {
    line(couranteSoleilX, couranteSoleilY, couranteSoleilX+cos(rads) * longueurDesRayonsSoleil, couranteSoleilY + sin(rads) * longueurDesRayonsSoleil);
    rads = rads + tranche;
  }
  //SOLEIL
  noStroke();
  float d = width;
  while ( d > 5 ) {
    scale = d/width;
    float red = (r_c1*scale) + (r_c2*(1.0-scale));
    float green = (g_c1*scale) + (g_c2*(1.0-scale));
    float blue = (b_c1*scale) + (b_c2*(1.0-scale));
    float r = d*0.20; //=rayon de l'objet total
 
    float offsetx = w*0.5 +20  ; // à partir du cercle collé sur la bordure droite
    float offsety = h*0.5 -225  ; // à partir du cercle collé sur la borduredu bas
    fill ( red, green, blue);
    ellipse( couranteSoleilX, couranteSoleilY, r, r );
    d = d - difference;
  }
 
  //GLOW LUNE
  noStroke();
  d=width;
 
  while ( d > 5 ) {
    scale = d/width;
    float alpha = (a_c1*scale) + (a_c2*(1.0-scale));
    //   float w= width*0.5; //=coin sup gauche a 50%pixel du bord
    //   float h= height*0.5; //=coin sup gauche a 50%pixel du bord
    float r = d*0.20; //=rayon de l'objet total
    fill ( 255, 240, 180, alpha);
    ellipse( couranteLuneX, couranteLuneY, r+40, r+40 );
    d = d - difference;
  }
 
  //LUNE
  noStroke();
  fill (255, 240, 180);
  ellipse(couranteLuneX, couranteLuneY, 75, 75);
  fill (100, 100, 87, 40 );
  ellipse(couranteLuneX-5, couranteLuneY+7, 7, 7 );
  ellipse(couranteLuneX+15, couranteLuneY-22, 15, 15 );
  ellipse(couranteLuneX+15, couranteLuneY+20, 8, 8 );
  ellipse(couranteLuneX-13, couranteLuneY-10, 22, 22 );
 
 
  //GAZON
  fill(10, 110, 10);
  rect(0, 150, 400, 400); 
 
  strokeWeight(1);
  stroke(30, 145, 30);
  for ( int i = 0 ; i < totalGazon ; i ++ ) {
    float distance = dist(mouseX, mouseY, randomX[i], randomY[i]);
    if ( distance < 30) {
      float radians = atan2(mouseY-randomY[i], mouseX-randomX[i]);
      radians = radians + PI;
      float gazonX = constrain( cos(radians) * 10 + randomX[i], 12, width - 12);
      float gazonY = constrain( sin(radians) * 10 + randomY[i], 12, height - 12);
      line (randomX [ i ], randomY [ i ], gazonX, gazonY);
    }
    else {
      line (randomX [ i ], randomY [ i ], randomX [i], randomY [i] +12);
    }
  }
  //Queue
  noFill();
  strokeWeight(10);
  stroke(200, 100, 0);
 
  beginShape();
  curveVertex(x+300, y+100 );
  curveVertex(x, y+155);
  curveVertex(x-125, y+50);
  curveVertex(x-75, y-50);
  curveVertex(x-125, y-100);
  curveVertex(x-125, y-100);
  endShape();
 
  //Bout de la queue
  fill(225, 175, 0);
  noStroke();
  beginShape();
  curveVertex(x-150, y-112); //199 - 49, 199 - 87
  curveVertex(x-140, y-112); //199 - 59, 199 - 87
  curveVertex(x-119, y-107); //199 - 80, 199 - 92
  curveVertex(x-119, y-94); //199 - 80, 199 - 105
  curveVertex(x-131, y-92); //199 - 68, 199 - 107
  curveVertex(x-140, y-112); //199 - 59, 199 - 87
  curveVertex(x-141, y-120); //199 - 58, 199 - 79
  endShape();
 
  //Corps lion
  fill(200, 100, 0);
  ellipse(x, y+75, 175, 200);//corps foncé
  fill(225, 175, 0);
  ellipse(x, y+85, 150, 180);// corps pale
  //Nombril
  fill(125, 75, 10);
  ellipse(x, 350, 5, 5);
 
  // Crinière
  noStroke();
  fill(200, 150, 0);
 
  for ( float radsCriniere = 0; radsCriniere < TWO_PI ; radsCriniere = radsCriniere +trancheCriniere) {
    float x1 = x+cos(radsCriniere) * longueurDesRayonsCriniere * ratioCriniere;
    float y1 = y + sin(radsCriniere) * longueurDesRayonsCriniere * ratioCriniere;
    float x2 = x+cos(radsCriniere) * longueurDesRayonsCriniere;
    float y2 = y + sin(radsCriniere) * longueurDesRayonsCriniere;
    ellipse(x1, y1-75, 30, 30 );
  }
 
  //Tête lion
  noStroke();
  fill(couranteTeteR, couranteTeteG, couranteTeteB);
  ellipse(x, y-75, 125, 115); // tete
 
 
  /*-------------------------------------------
   Yeux
   -------------------------------------------*/
  //oeil 1
  float radiansOeil1 = atan2(mouseY-yOeil1, mouseX-xOeil1); // calcul des radians entre souris et oeil
  float distanceOeil1 = dist(mouseX, mouseY, xOeil1, yOeil1); // calcul de la distance entre la souris et l'oeil
  float distanceWOeil1 = constrain(distanceOeil1, 0, w/2- pupilleD /2); // Limitation Largeur pupille dans l'oeil
  float distanceHOeil1 = constrain(distanceOeil1, 0, h/2- pupilleD /2); // Limitation Hauteur pupille dans l'oeil
  float pupilleXOeil1 = cos(radiansOeil1)* distanceWOeil1 + xOeil1; // Position de la pupille X
  float pupilleYOeil1 = max( sin(radiansOeil1)* distanceHOeil1 + yOeil1, y-86) ; // Position de la pupille Y
  //oeil 2
  float radiansOeil2 = atan2(mouseY-yOeil2, mouseX-xOeil2); // calcul des radians entre souris et oeil
  float distanceOeil2 = dist(mouseX, mouseY, xOeil2, yOeil2); // calcul de la distance entre la souris et l'oeil
  float distanceWOeil2 = constrain(distanceOeil2, 0, w/2- pupilleD /2); // Limitation Largeur pupille dans l'oeil
  float distanceHOeil2 = constrain(distanceOeil2, 0, h/2- pupilleD /2); // Limitation Hauteur pupille dans l'oeil
  float pupilleXOeil2 = cos(radiansOeil2)* distanceWOeil2 + xOeil2; // Position de la pupille X
  float pupilleYOeil2 = max( sin(radiansOeil2)* distanceHOeil2 + yOeil2, y-86) ; // Position de la pupille Y
  //oeil 3
  float radiansOeil3 = atan2(mouseY-yOeil3, mouseX-xOeil3); // calcul des radians entre souris et oeil
  float distanceOeil3 = dist(mouseX, mouseY, xOeil3, yOeil3); // calcul de la distance entre la souris et l'oeil
  float distanceWOeil3 = constrain(distanceOeil3, 0, w3/2- pupilleD /2); // Limitation Largeur pupille dans l'oeil
  float distanceHOeil3 = constrain(distanceOeil3, 0, h3/2- pupilleD /2); // Limitation Hauteur pupille dans l'oeil
  float pupilleXOeil3 = cos(radiansOeil3)* distanceWOeil3 + xOeil3; // Position de la pupille X
  float pupilleYOeil3 = max( sin(radiansOeil3)* distanceHOeil3 + yOeil3, y-86) ; // Position de la pupille Y
  noStroke();
  //oeil 1
  fill(255);
  ellipse(xOeil1, yOeil1, w, h);// dessin de l'oeil
  fill(0);
  ellipse(pupilleXOeil1, pupilleYOeil1, pupilleD, pupilleD);//pupille
  fill(225, 175, 0);
  stroke(225, 175, 0);
  strokeWeight(3);
  if ( millis() - timeStamp1 >= interval ) {
    timeStamp1 = timeStamp1 + interval;
    interval = int(random(500, 4000));
    ellipse ( x-40, y-81, 30, 55);
  }
  noStroke();
  fill(225, 175, 0);
  arc(x-40, y-86, 35, 60, PI, TWO_PI);//paupiere
  //oeil 2
  fill(255);
  ellipse(xOeil2, yOeil2, w, h);// dessin de l'oeil
  fill(0);
  ellipse(pupilleXOeil2, pupilleYOeil2, pupilleD, pupilleD);//pupille
  fill(225, 175, 0);
  stroke(225, 175, 0);
  strokeWeight(3);
  if ( millis() - timeStamp2 >= interval ) {
    timeStamp2 = timeStamp2 + interval;
    interval = int(random(500, 4000));
    ellipse ( x+40, y-81, 30, 55);
  }
  noStroke();
  fill(225, 175, 0);
  arc(x+40, y-86, 35, 60, PI, TWO_PI);//paupiere
  //oeil 3
  fill(255);
  ellipse(xOeil3, yOeil3, w3, h3);// dessin de l'oeil
  fill(0);
  ellipse(pupilleXOeil3, pupilleYOeil3, pupilleD, pupilleD);//pupille
  stroke(225, 175, 0);
  strokeWeight(3);
  fill(225, 175, 0);
  if ( millis() - timeStamp3 >= interval ) {
    timeStamp3 = timeStamp3 + interval;
    interval = int(random(500, 4000));
    ellipse ( x, y-84, 55, 80);
  }
  noStroke();
  fill(225, 175, 0);
  arc(x, y-89, 55, 80, PI, TWO_PI);//paupiere
 
 
  /*-------------------------------------------
   Museau
   -------------------------------------------*/
 
  /*
Le deuxième doit être pareil à l’avant dernier
   Le premier à l’avant avant dernier
   Le dernier au troisième
   */
 
  // Nez
 
  fill(0);
  beginShape();
  curveVertex(x, y-35);
  curveVertex(x+10, y-40);
  curveVertex(x-10, y-40);
  curveVertex(x, y-35);
  curveVertex(x+10, y-40);
  curveVertex(x-10, y-40);
  endShape();
 
  if (mousePressed) {
    if ( mouseX > x-19 && mouseX < x+19 && mouseY > y-40 && mouseY < y-20 ) {
      fill(255);
      noStroke();
      beginShape(TRIANGLES);
      vertex(x-10, y-28);
      vertex(x-3, y-28);
      vertex(x-6, y-21);
      vertex(x+3, y-28);
      vertex(x+10, y-28);
      vertex(x+6, y-21);
      endShape();
 
      couranteTeteR = random(255);
      couranteTeteG = random(255);
      couranteTeteB = random(255);
    }
  }
  else {
    couranteTeteR = 200;
    couranteTeteG = 100;
    couranteTeteB = 0;
  }
  // Machoire
  strokeWeight(2);
  stroke(0);
  noFill();
  arc(x+7, y-35, 14, 12, 0, PI);
  arc(x-7, y-35, 14, 12, 0, PI);
}
 
////////////////////////////////////////////VOID MOUSE PRESSED //////////////////////////////////////
void mousePressed () {
  
  float distanceSoleil = dist( mouseX, mouseY, couranteSoleilX, couranteSoleilY );
  float distanceLune = dist( mouseX, mouseY, couranteLuneX, couranteLuneY );
  if ( (distanceSoleil < width*0.1) || (distanceLune < width*0.1)  ) {
    //réinitialise bouton soleil//   
    if (jour == true ) {
      jour = false;
      cibleeCielB = 42;
      cibleeCielG = 5;
      cibleeEtoilesA = 255;
    }
    else {
      jour = true;
      cibleeCielB = 255;
      cibleeCielG = 200;
      cibleeEtoilesA = 0;
    }
    cibleeSoleilRads = cibleeSoleilRads + PI;
  }
}


