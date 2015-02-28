
/*
UQÀM - 2012
 
 TP1 - Monstre
 par Alexandre Dagenais
 
 EDM4600 - Algorithmie de base et intéractivité*/
PGraphics pg;
boolean rajouterCheveux = false;
float distanceOeilG;
float distanceOeilD;

float xFonction;
float yFonction;
boolean dedansDent = false;
float d = 95;


float Rblanc = 255;
float Gblanc = 255;
float Bblanc = 255;
float alphaPupille = 100;


int timeStamp;
int interval;

void setup() {



  size(400, 400);
  background(0);
  pg = createGraphics(400, 400, P2D);


  //--Déclaration de Variables--------




  //-----------------------------------
}




//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


float grosseDent = 375;
float grosseDentCible = 397;

void draw() {


  background(0);  



  int positionFond = (mouseX/100) * 10 ;

  //print(positionFond + " ");

  modifFond();

  probabilite();
  float x = width/2;
  float y = height-120;
  float largeurDent = 24;
  float departDent = x - 175;
  float dimensionDent = 25;
  float compteur = 1;
  float yeux;

  xFonction = x;
  yFonction = y;

  PImage a;
  a = loadImage("fond.png");
  image(a, -143, 75);


  stroke(0);
  strokeWeight(1);
  smooth();







  yeux();
  //--Visage------------------

  fill(147, 4, 40);
  rect(100, 250, 230, 100);

  //--Menton----------
  fill(147, 133, 120);
  arc(x, y+50, 240, 130, 0, PI);

  fill(162, 148, 136);
  arc(x, y+50, 250, 125, 0, PI);
  fill(188, 172, 158);
  arc(x, y+50, 250, 115, 0, PI);
  fill(206, 195, 183);
  arc(x, y+50, 250, 100, 0, PI);
  //--Front---------
  fill(206, 195, 183);
  arc(x, y, 320, 190, TWO_PI-PI, TWO_PI);

  //----------------------------------- 


  //--Petite Dent------------------
  fill(255, 255, 245);
  pushMatrix();
  translate(50, 0);
  while (compteur < 11) {

    beginShape();
    vertex(departDent, y);
    vertex((departDent) + dimensionDent, y);

    //--si je suis rendu a la dent 5 ou 6, met la plus grande )
    if (compteur == 5 || compteur == 6)
    {
      vertex((departDent) + (dimensionDent/2), y + dimensionDent + 10);

      //--sinon laisse la de grandeur normal
    }
    else 
      vertex((departDent) + (dimensionDent/2), y + dimensionDent);

    vertex(departDent, y);
    endShape();

    compteur += 1;
    departDent = departDent + 25;
  };

  popMatrix();

  //-------------------------------

  //--Gencive----------------------
  fill(157, 121, 119);
  noStroke();
  pushMatrix();

  translate(0, -5);
  //--Gauche
  beginShape();
  curveVertex(x-110, y+10);
  curveVertex(x-110, y+10);
  curveVertex(x-132, y-30);
  curveVertex(x-169, y);
  curveVertex(x-123, y+95);
  curveVertex(x-110, y+10);
  curveVertex(x-110, y+10);
  endShape();

  //--Droite
  beginShape();
  curveVertex(x+110, y-10);
  curveVertex(x+110, y-10);
  curveVertex(x+132, y-30);
  curveVertex(x+169, y);
  curveVertex(x+123, y+95);
  curveVertex(x+110, y-10);
  curveVertex(x+110, y-10);
  endShape();


  popMatrix();


  pushMatrix();

  translate(0, 2);
  //--Bas Droite
  beginShape();
  curveVertex(x+75, y+55);
  curveVertex(x+75, y+55);
  curveVertex(x+83, y+72);
  curveVertex(x+115, y+55);
  curveVertex(x+93, y-10);
  curveVertex(x+75, y+55);
  curveVertex(x+75, y+55);
  endShape();

  //--Bas Gauche
  beginShape();
  curveVertex(x-75, y+55);
  curveVertex(x-75, y+55);
  curveVertex(x-83, y+72);
  curveVertex(x-115, y+55);
  curveVertex(x-93, y-10);
  curveVertex(x-75, y+55);
  curveVertex(x-75, y+55);
  endShape();

  popMatrix();

  rect(x-139, y-2, 270, 2);

  //------------------------------




  if (mousePressed) {



    if ( mouseX > x-160 && mouseX < x-110 && mouseY > y && mouseY < y+90 || mouseX > x+110 && mouseX < x+160 && mouseY > y && mouseY < y+90 ) {

      grosseDent = ( grosseDentCible - grosseDent ) *0.1 + grosseDent;
    }
  }
  else {

    grosseDent = 375;
  }




  //--Grosse Dent------------------
  fill(255, 255, 237);
  //--Gauche
  beginShape();
  curveVertex(x-110, y+10);
  curveVertex(x-110, y+10);
  curveVertex(x-132, y-30);
  curveVertex(x-169, y);
  curveVertex(x-123, grosseDent);
  curveVertex(x-110, y+10);
  curveVertex(x-110, y+10);
  endShape();


  //--Droite
  beginShape();
  curveVertex(x+110, y-10);
  curveVertex(x+110, y-10);
  curveVertex(x+132, y-30);
  curveVertex(x+169, y);
  curveVertex(x+123, grosseDent);
  curveVertex(x+110, y-10);
  curveVertex(x+110, y-10);
  endShape();



  fill(255, 255, 240);  
  //--Bas Droite
  beginShape();
  curveVertex(x+75, y+55);
  curveVertex(x+75, y+55);
  curveVertex(x+83, y+72);
  curveVertex(x+115, y+55);
  curveVertex(x+93, y-10);
  curveVertex(x+75, y+55);
  curveVertex(x+75, y+55);
  endShape();

  //--Bas Gauche
  beginShape();
  curveVertex(x-75, y+55);
  curveVertex(x-75, y+55);

  curveVertex(x-83, y+72);
  curveVertex(x-115, y+55);
  curveVertex(x-93, y-10);

  curveVertex(x-75, y+55);
  curveVertex(x-75, y+55);
  endShape();



  //-------------------------------


  nuit();
}
//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||**





//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
void yeux() {

  //--Yeux--------------------------


  float x = width/2;
  float y = height-120;
  float cibleX = mouseX;
  float cibleY = mouseY;

  float pupilleDimension = 20;
  float easing = 0.05;


  float pupilleXD = ( x + 65);
  float pupilleYD = ( y - 95);




  //--derriere Yeux----------------

  fill(147, 133, 120);
  noStroke();
  ellipse(x-57, y-95, 95, 95);
  ellipse(x+57, y-95, 95, 95);

  //-------------------------------

  fill(Rblanc, Gblanc, Bblanc);
  ellipse(x-65, y-95, d, d);
  ellipse(x+65, y-95, d, d);

  //SI ON CLIC DANS L'OEIL


  distanceOeilG = dist( mouseX, mouseY, x-65, y-95 ) ;
  distanceOeilD = dist( mouseX, mouseY, x+65, y-95 ) ;
  if ( mousePressed && distanceOeilD < d/2 || mousePressed && distanceOeilG < d/2) {
    // le point est dans le cercle



    alphaPupille = 0;
    Rblanc = 147;
    Gblanc = 133;
    Bblanc = 120;
  }

  else {
    alphaPupille = 100;
    Rblanc = 255;
    Gblanc = 255;
    Bblanc = 255;
  }



  float radiansD = atan2(cibleY-(y-95), cibleX-(x+65));
  float distanceD = dist(cibleX, cibleY, (x + 65), (y - 95));

  distanceD = constrain(distanceD, 0, (d/2 - pupilleDimension/2) - 25);

  float positionPupilleXD = cos(radiansD) * distanceD + (x + 65);
  float positionPupilleYD = sin(radiansD) * distanceD + (y - 95);



  float radiansG = atan2(cibleX-(x-65), cibleY-(y-95));
  float distanceG = dist(cibleX, cibleY, (x - 65), (y - 95));

  distanceG = constrain(distanceG, 0, (d/2 - pupilleDimension/2) - 25);

  float positionPupilleXG = cos(radiansG) * distanceG + (x - 65);
  float positionPupilleYG = sin(radiansG) * distanceG + (y - 95);




  fill(37, 146, 232, 0);

  // positionPupilleXD = (cibleX - positionPupilleXD) / 10 + positionPupilleXD;
  //positionPupilleYD = (cibleY - positionPupilleYD) / 10 + positionPupilleYD;

  positionPupilleXG = map(mouseX, 0, width, 110, 160);
  positionPupilleYG = map(mouseY, 0, height, 163, 190);

  //--Contour------------
  fill(0, alphaPupille);

  ellipse(positionPupilleXD, positionPupilleYD-9, pupilleDimension+10, pupilleDimension+10);
  ellipse(positionPupilleXG, positionPupilleYG, pupilleDimension+10, pupilleDimension+10);

  //--Centre------------=
  fill(37, 146, 232, alphaPupille);
  ellipse(positionPupilleXD, positionPupilleYD-9, pupilleDimension, pupilleDimension);
  ellipse(positionPupilleXG, positionPupilleYG, pupilleDimension, pupilleDimension);

  //--------------------------------
}
//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||**








int compteurEtoile = 110;
int[] randomX = new int[compteurEtoile];
int[] randomY = new int[compteurEtoile];
float[] randomScale = new float[compteurEtoile];

int alphaValue = 0;         

//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
void etoile(int couleur) {



  stroke(couleur, couleur, couleur, alphaBg*2);


  // SI LA LUNE PAR DE LA BONNE POSITION, QU'IL FAUT ACTIVER LES ETOILES ET QU'ELLES NE SONT PAS DESSINÉES
  if (activerEtoile == true && etoileDessiner == false && luneBonnePosition == true)
  {



    for (int i = 0 ; i<compteurEtoile ; i++)
    {
      randomX[i] = (int)random(5, 395);
      randomY[i] = (int)random(5, 200);
      randomScale[i] = random(0.3, 1.1);
    }



    etoileDessiner = true;
  }
  else if (activerEtoile == false && etoileDessiner == true && luneBonnePosition == false) {
  }
  // SI LA LUNE PAR DE LA BONNE POSITION, QU'IL FAUT DESACTIVER LES ETOILES ET QU'ELLES SONT DESSINÉES
  else if (activerEtoile == false && etoileDessiner == true && luneBonnePosition == true) {   

    randomX = new int[compteurEtoile];
    randomY = new int[compteurEtoile];
    randomScale = new float[compteurEtoile];
    etoileDessiner = false;
  }




  // CRÉATION DES ÉTOILES QUI SONT DE MANIERE RANDOM 
  for (int i = 0 ; i<compteurEtoile ; i++)
  {


    pushMatrix(); 

    translate((randomX[i]) - 10, randomY[i]);
    scale(randomScale[i]); 
    line(0, 0, 0, 10);
    line(-4, 5, 4, 5);

    popMatrix();
  }
}
//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||**


boolean mauvaisTemps = true;
boolean activerEtoile = false;
boolean etoileDessiner = false;
boolean soleil = true;
boolean ouverture = true;
boolean luneBonnePosition = false;
boolean soleilBonnePosition = false;

float rCiblee = 0;
float gCiblee = 0;
float bCiblee = 0;

float rCourante = 141;
float gCourante = 209;
float bCourante = 245;


float vitesse = 0.02;




float  R= 0;
float Rlune = 90;

float alphaBg = 100;

//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
//ANIMER LES COULEURS DU BACKGROUND
void modifFond() {


  rCourante = (rCiblee - rCourante) * vitesse + rCourante;

  gCourante = (gCiblee - gCourante) * vitesse + gCourante;

  bCourante = (bCiblee - bCourante) * vitesse + bCourante;


  background(rCourante, gCourante, bCourante);

  //---------------------------------------




  //CRÉATION ET ROTATION DU SOLEIL

  pushMatrix();
  translate(width/2, height/2);
  rotate(R * 0.03);  //vitesse de rotation du soleil
  translate(150, 0);
  fill(236, 237, 41);
  ellipse(0, 0, 50, 50);
  popMatrix();


  //CRÉATION ET ROTATION DE LA LUNE ET PARS L'ANIMATION DU SOLEIL ET DE LA LUNE

  pushMatrix();
  translate(width/2, height/2);
  rotate(Rlune * 0.03);  //vitesse de rotation dela lune
  translate(150, 0);
  fill(247, 247, 247);
  ellipse(0, 0, 50, 50);
  popMatrix();  


  etoile(255);
  animSoleilLune();
}
//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||**





//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
void mousePressed() {



  // SI LE CLIC N'EST PAS DANS LOEIL FAIT L'ANIMATION DU JOUR À LA NUIT
  if (mousePressed && distanceOeilD < d/2 || mousePressed && distanceOeilG < d/2 ) {
  }
  else if ( mouseX > xFonction-160 && mouseX < xFonction-110 && mouseY > yFonction && mouseY < yFonction+90 || mouseX > xFonction+110 && mouseX < xFonction+160 && mouseY > yFonction && mouseY < yFonction+90 ) {
  }
  else {
    // SI CE N'EST PAS LA NUIT LA COULEUR CIBLÉE EST LE NOIR ET ACTIVE LES ETOILES
    if (mauvaisTemps == false)
    {


      ouverture = false;
      mauvaisTemps = true;
      activerEtoile = true;


      rCiblee = 20;
      gCiblee = 20;
      bCiblee = 20;
    }

    // SINON LA COULEUR CIBLE EST LE BLEU ET DESACTIVE LES ÉTOILES
    else {

      rCiblee = 141;
      gCiblee = 209;
      bCiblee = 245;


      activerEtoile = false;
      mauvaisTemps = false;
    }

    print("nuit = " + mauvaisTemps + " | " + "Bonne position de la lune = " + luneBonnePosition + " / " + " ");
  }
}
//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||**




//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
void animSoleilLune() {


  //SI C'EST LE JOUR 
  if (mauvaisTemps == true )
  {  
    //ANIME L'OPACITÉ DU NOIR QUI DONNE L'EFFET DE NUIT
    if (alphaBg < 100) {
      alphaBg += 1.4;
    }
    //ANIME LE SOLEIL ET LA LUNE
    if (Rlune <155 )
    {
      soleilBonnePosition = false;
      Rlune++;
      R++;
    }

    //SI TU CLIQUE DURANT LE CHANGEMENT, AMENE TOUTE LES ELEMENTS AU BON ENDROIT
    if (mauvaisTemps == true  && luneBonnePosition == false )

    {
      R = 155;
      Rlune = 90;
      alphaBg = 0;
      rCiblee = 141;
      gCiblee = 209;
      bCiblee = 245;
      activerEtoile = false;
      luneBonnePosition = false;
      mauvaisTemps = false;
      soleilBonnePosition = true;
    }


    // SI LA LUNE EST A LA BONNE POSITION 
    if ( Rlune == 155) {

      luneBonnePosition = true;
      soleilBonnePosition = true;
      R = 90;
    }
  }



  ////////////////////////////////////////////////////

  if (mauvaisTemps == false )
  {

    if (alphaBg > 0) {
      alphaBg -= 1.8;
    }


    if (R <155 )
    {
      R ++;
      if ( ouverture == true ) {
      }
      else {
        luneBonnePosition = false;
        Rlune ++;
      }
    }

    if (mauvaisTemps == false && soleilBonnePosition == false )

    {
      R = 90;
      Rlune = 155;
      alphaBg = 100;
      rCiblee = 20;
      gCiblee = 20;
      bCiblee = 20;
      activerEtoile = true;
      mauvaisTemps = true;
    }


    if ( R == 155) {

      luneBonnePosition = true;
      Rlune = 90;
    }
  }
}
//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||**






//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


//DESINNER UN CARRÉ NOIR QUI PREND TOUTE LA SCENE ET S'ANIME POUR SIMULER LA NUIT 
void nuit() {

  pg.beginDraw();
  pg.background(0, alphaBg); 
  pg.endDraw();
  image(pg, 0, 0);
}
//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||**





// La base du code suivant a été créer par : 
//Liliana Osorio
//Comp Sci lab_5
//October 5, 2010
//http://www.openprocessing.org/sketch/14198

int ballCount;
float sprayCount;
float sprayFactor = 4;
float[] x;
float[] y;
float[] r; //Grosseur
float[] speedX;
float[] speedY;
color[] cols; //Colo
float gravity = .1;
float randomHauteur;
int compteur;
boolean decompte = false;
float chance = 0.5;

boolean openLava = false;

//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
//PROBABILITÉ
void probabilite() {



  float r = random(100);
  println(millis() - timeStamp);
  if ( r < chance && (millis() - timeStamp >= 4000) ) { // 0.5 chances sur 100
    timeStamp = millis();
    print("FEUUUUUU ");
          
      sprayCount = 0;
      createBalls(500);
 

  }


    moveBalls();
  
  
}


//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||**




//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
void moveBalls() {
  noStroke();


  for (int i=0; i<sprayCount; i++) {


    fill(cols[i]);                       //colorier les boules
    ellipse(x[i], y[i], r[i]*2, r[i]*2);    // definir la grosseur des boules
    x[i] += speedX[i];
    speedY[i] += gravity;
    y[i] += speedY[i];
  }



  if (sprayCount<ballCount-sprayFactor) {
    sprayCount += sprayFactor;
  }
}
//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||**


//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
void createBalls(int count) {

  ballCount = count;
  x = new float[ballCount];
  y = new float[ballCount];
  r = new float[ballCount];
  speedX = new float[ballCount];
  speedY = new float[ballCount];
  cols = new color[ballCount];

  for (int i=0; i<ballCount; i++) {
    randomHauteur = random(-2 -3);

    x[i] = random(320, 345);                  // position de toute les balle en X
    y[i] = 120;                        // position de toute les balle en Y
    r[i] = random(1.5, 2.5);               // random de grosseur des particules
    speedX[i] = random(-.5, .5);       //random de l'inclinaison des balles
    speedY[i] = random(randomHauteur, -40);       // random de l'hauteur des balles


    //Particles look yellow to represent lights in water
    cols[i] = color(random(200, 255), 5, 5);
  }

  openLava = true;
}
//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||**


