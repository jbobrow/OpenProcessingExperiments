
//Déclaration des variables de position
float x;
float y;
float longCheveux;

float xOeil;
float yOeil;

float xBouche;
float yBouche;

float xChapeau;
float yChapeau;

float xCheveux;

float xMouche;
float yMouche;

float xMoucheDepart;
float yMoucheDepart;

float xSchlack=0;
float ySchlack=0;

float xEcrase=0;
float yEcrase=0;

float xTapette;
float yTapette;

float xBras;
float yBras;

float xCorps;
float yCorps;


//Déclaration des variables diverses
//--------------------------------------
//Minuterie pour l'écrasement de la mouche 
int timeEcrase = 0;

//Compteur de cheveux
int cptCheveux;

//Gestion des états
int etatMouche;
int etat;
int etatTap;
int etatEcrase;
int etatOeil;

//Alpha de l'écrasement de la mouche
int alphaEcrapou=80;

// Gestion de la minuterie pour le clignement d'oeil.
float timeStamp;
float interval;

//Distance entre la mouche et les yeux
float distanceG;
float distanceD;

//Mesure des radians pour l'orientation de la langue
float rads;


float v=0;

// Variables servant au fonctionnement des bobos aux yeux
int ouchOD;
int alphaOeilDroit = 150;
int cptOeilD = 0;

int ouchOG;
int alphaOeilGauche = 150;
int cptOeilG = 0;


//Déclaration de la largeur de la tapette à mouche
float largeurTapette;

//Déclaration du diamètre des yeux
float d = 100;
float step = 5;

//Tableau pour les cheveux
int[] monTableau   = new int[20];


//#############################################################################################################
//#############################################################################################################
//#############################################################################################################

//Configuration de la scène
void setup() 
{
  size(400, 400);
  smooth();

  //Positionner au centre de la scène
  x = width/2;
  y = width/2;

  //Position de la bouche
  xBouche=x;
  yBouche=y+80;

  //Intervalle de clignement d'oeil
  interval=5000;

  //État pour la langue
  etat = 0;


  //Remplissage du tableau avec les longueurs de cheveux
  for (int j = 0; j < monTableau.length; j++ ) 
  {
    monTableau[j] = int(random(-10));
  }
}


//#############################################################################################################
//#############################################################################################################
//#############################################################################################################


void draw() 
{
  //Couleur d'arriere plan
  background(255);

  //Épaisseur du trait
  strokeWeight(3);

  //######################################
  //Dessiner les bras
  //######################################
  //Déclaration de variables de centre pour les bras
  xBras=x-45;
  yBras=y+185;
  fill(0, 180, 0);
  ellipse(xBras, yBras, 150, 200);
  ellipse(xBras+95, yBras, 150, 200);


  //######################################
  //Dessiner le corps
  //######################################
  //Déclaration de variables de centre pour le corps
  xCorps=x;
  yCorps=y+200;

  fill(0, 180, 0);
  stroke(0);
  ellipse(xCorps, yCorps, 200, 300);

  //Dessin du ventre
  noStroke();  //Retrait du contour
  fill(255, 255, 0);
  ellipse(xCorps, yCorps, 125, 225);


  //######################################
  //Dessiner la forme de la tête
  //######################################
  fill(0, 180, 0);
  stroke(0);

  beginShape();
  curveVertex(x-80, y+110);
  curveVertex(x, y+110);
  curveVertex(x+70, y+80);
  curveVertex(x+80, y);
  curveVertex(x+45, y-100);
  curveVertex(x-45, y-100);
  curveVertex(x-80, y);
  curveVertex(x-70, y+80);
  curveVertex(x, y+110);
  curveVertex(x+80, y+110);
  endShape();



  //######################################################################
  //Dessiner les yeux
  //######################################################################
  //Déclaration de variables de centre pour les yeux
  xOeil=x-50;
  yOeil=y-20;
  noStroke();

  //Boucle for pour dessiner les deux yeux
  for (int i=0;i<2;i++) 
  {
    while ( d > 5 ) //Boucle while créant un effet de dégradé pour les yeux 
    {    
      fill (325-d / 200 * 255 ); //Calcul permettant d'avoir la teinte de dégradé voulue
      ellipse( xOeil, yOeil, d, d );
      d = d - step;
    }
    d=100;
    xOeil= xOeil+d;
  }

  //Dessin des pupilles
  //Réinitialiser x et y de l'oeil
  xOeil=x-50;
  yOeil=y-20;
  stroke(0);
  strokeWeight(20);


  //Oeil gauche--------------
  fill(255);

  float radiansG = atan2(yMouche-yOeil, xMouche-xOeil);
  distanceG = dist(xMouche, yMouche, xOeil, yOeil);

  distanceG = constrain(distanceG, 0, 25);  

  float pupilleX = cos(radiansG)* distanceG + xOeil;
  float pupilleY = sin(radiansG)* distanceG + yOeil;

  ellipse(pupilleX, pupilleY, 10, 10);


  //Oeil droit-----------------
  fill(255);

  float radiansD = atan2(yMouche-yOeil, xMouche-(xOeil+d));
  distanceD = dist(xMouche, yMouche, (xOeil+d), yOeil);

  distanceD = constrain(distanceD, 0, 25);  

  float pupilleXD = cos(radiansD)* distanceD + xOeil+d;
  float pupilleYD = sin(radiansD)* distanceD + yOeil;

  ellipse(pupilleXD, pupilleYD, 12, 12);



  //##########################################
  // Bobo oeil droit
  //##########################################
  //Si la langue touche à l'oeil droit, fermer l'oeil pour un moment, le rouvrir et teinté l'oeil de rouge.
  if (ouchOD == 1) 
  {
    cptOeilD++;
    if (cptOeilD<150) 
    {
      fill(180, 100, 180);
      strokeWeight(3);    
      ellipse(xOeil+d, yOeil, d, d);
      arc(xOeil+d, yOeil, d, 20, 0, PI);
    }
    else if (cptOeilD<300)
    {
      fill(255, 0, 0, alphaOeilDroit);
      alphaOeilDroit--;
      strokeWeight(3);    
      ellipse(xOeil+d, yOeil, d, d);
    }
    else 
    {
      cptOeilD=0;
      ouchOD = 0;
      alphaOeilDroit=150;
    }
  }



  //##########################################
  // Bobo oeil gauche
  //##########################################
  //Si la langue touche à l'oeil gauche, fermer l'oeil pour un moment, le rouvrir et teinté l'oeil de rouge.
  if (ouchOG == 1) 
  {
    cptOeilG++;
    if (cptOeilG<150) 
    {
      fill(180, 100, 180);
      strokeWeight(3);    
      ellipse(xOeil, yOeil, d, d);
      arc(xOeil, yOeil, d, 20, 0, PI);
    }
    else if (cptOeilG<300) 
    {
      fill(255, 0, 0, alphaOeilGauche);
      alphaOeilGauche--;
      strokeWeight(3);    
      ellipse(xOeil, yOeil, d, d);
    }
    else 
    {
      cptOeilG=0;
      ouchOG = 0;
      alphaOeilGauche=150;
    }
  }



  //##########################################
  // Paupières
  //##########################################
  noFill();
  strokeWeight(3);
  ellipse(xOeil, yOeil, d, d);
  ellipse(xOeil+d, yOeil, d, d);

  //Gestion pour dessiner les yeux fermés.
  if (etatOeil==1) 
  {
    interval =300;
    fill(0, 180, 0);
    strokeWeight(3);
    ellipse(xOeil, yOeil, d, d);
    ellipse(xOeil+d, yOeil, d, d);
    arc(xOeil, yOeil, d, 20, 0, PI);
    arc(xOeil+d, yOeil, d, 20, 0, PI);
    if ( millis() - timeStamp >= interval ) 
    {
      timeStamp = timeStamp + interval;
      interval =random(3000, 6000);
      etatOeil=0;
    }
  }

  // Timer pour le clignement d'oeil.
  if ( millis() - timeStamp >= interval ) 
  {
    timeStamp = timeStamp + interval;
    etatOeil=1;
  }



  //######################################
  //Dessiner les narines
  //######################################
  //Déclaration de variables de centre pour les narines
  float xNarine=x;
  float yNarine=y+20;
  fill(0);
  noStroke();
  ellipse(xNarine-6, yOeil+50, 7, 7);
  ellipse(xNarine+6, yOeil+50, 7, 7);




  //######################################
  //Dessiner la bouche
  //######################################
  //Déclaration de variables de centre pour la bouche
  stroke(0);
  strokeWeight(7);
  if (etat == 0)
  {
    line(xBouche-68, yBouche, xBouche+68, yBouche);
  }



  //######################################
  //Dessiner le chapeau
  //######################################
  xChapeau=x-6;
  yChapeau=y-86;
  xCheveux = -42;
  cptCheveux = 1;
  strokeWeight(3);

  //Dessin et rotation de tous les éléments constituants le chapeau et les cheveux
  pushMatrix(); 
  translate(xChapeau, yChapeau);
  rotate(TWO_PI-PI/20);

  //Cheveux
  noStroke();
  fill(0, 100, 0);
  //Boucle dessinant les cheveux avec longueur aléatoire
  while (cptCheveux<=10) 
  {
    longCheveux = random(-10);
    ellipse(xCheveux, monTableau[cptCheveux], 10, 40);
    xCheveux+=10;
    cptCheveux++;
  }

  stroke(0);
  //Partie bleue
  fill(0, 0, 255);
  arc(0, 0, 115, 110, PI, TWO_PI);

  //Partie rouge
  fill(255, 0, 0);
  arc(0, 0, 70, 110, PI, PI*1.5);

  //Partie jaune
  fill(255, 255, 0);
  arc(0, 0, 70, 110, PI*1.5, TWO_PI);

  //Lignes pour compléter les contours
  line(-57.5, 0, 57.5, 0);
  line(0, 0, 0, -55);

  //Hélice
  fill(175);
  ellipse(-20, -70, 40, 10);
  ellipse(20, -70, 40, 10);

  //Tige de l'hélice
  rectMode(RADIUS);
  rect(0, -68, 4, 12);

  popMatrix(); 



  //##########################################
  //Tapette à mouche
  //##########################################
  rectMode(CENTER);
  stroke(0);
  strokeWeight(4);
  fill(255); 

  //Variables de position 
  xTapette = x-120;
  yTapette = y+60; 

  //Manche 
  line(xTapette, yTapette, xTapette, yTapette+(largeurTapette*2));

  //Dessin de la tapette
  noFill();
  rect(xTapette, yTapette, largeurTapette, largeurTapette);
  line(xTapette - (largeurTapette/2), yTapette, xTapette + (largeurTapette/2), yTapette);
  line(xTapette - (largeurTapette/2), yTapette-(largeurTapette/4), xTapette + (largeurTapette/2), yTapette-(largeurTapette/4));
  line(xTapette - (largeurTapette/2), yTapette+(largeurTapette/4), xTapette + (largeurTapette/2), yTapette+(largeurTapette/4));

  line(xTapette, yTapette - (largeurTapette/2), xTapette, yTapette + (largeurTapette/2));
  line(xTapette -(largeurTapette/4), yTapette - (largeurTapette/2), xTapette -(largeurTapette/4), yTapette + (largeurTapette/2));
  line(xTapette +(largeurTapette/4), yTapette - (largeurTapette/2), xTapette +(largeurTapette/4), yTapette + (largeurTapette/2));


  //Gestion des différents états de la tapette
  if (etatTap==0) 
  {
    largeurTapette = 55;

    fill(0, 180, 0);
    strokeWeight(2);  
    ellipse(xTapette, yTapette+130, 45, 45);
  }
  else 
  {
    largeurTapette = 95;
    fill(0, 180, 0);
    strokeWeight(4);  
    ellipse(xTapette, yTapette+155, 48, 48);
  }



  //######################################
  //Dessiner et faire bouger la mouche
  //######################################
  //Si la mouche est écrasé
  if (etatEcrase == 1) 
  { 
    if (alphaEcrapou>=0) 
    {
      xMouche = xEcrase;
      timeEcrase++;
      float distEcrap = yMouche-yEcrase;
      noStroke();

      if (timeEcrase>=100) 
      {
        yMouche++;
      }

      if (timeEcrase>=220) 
      {
        alphaEcrapou-=1;
      }

      fill(255, 0, 0, 150); 
      ellipse(xMouche, yMouche, 20, 20);
      ellipse(xMouche+5, yMouche-10, 15, 15); 

      for (float i = 0; i<distEcrap;i++) 
      {
        fill(255, 0, 0, alphaEcrapou); 
        ellipse(xMouche, i+yEcrase, 20, 20);
        ellipse(xMouche+5, i-10+yEcrase, 15, 15);
      }

      fill(255, 255, 255);
      stroke(0);
      strokeWeight(1);

      ellipse(xMouche-3, yMouche-6, 3, 10);
      ellipse(xMouche+3, yMouche-6, 3, 9);

      fill(0, 0, 0);
      strokeWeight(3);
      ellipse(xMouche, yMouche, 8, 8);
      strokeWeight(1);
      line(xMouche-10, yMouche-2, xMouche-16, yMouche+3);
      line(xMouche+10, yMouche, xMouche+16, yMouche+1);
      line(xMouche-4, yMouche, xMouche-2, yMouche+10);
      line(xMouche+2, yMouche+10, xMouche+2, yMouche+20);
      fill(255, 255, 255, alphaEcrapou);
      ellipse(xMouche-2, yMouche-2, 4, 4);
      ellipse(xMouche+2, yMouche-2, 4, 4);

      if (alphaEcrapou<=0) 
      {  
        timeEcrase=0;
        etatEcrase=0;
      }
    }
    xMoucheDepart=random(width);
    yMoucheDepart =-40;
  }
  //Si la mouche se déplace
  else 
  {
    xMoucheDepart = (mouseX - xMoucheDepart) /10 + xMoucheDepart;
    yMoucheDepart = (mouseY - yMoucheDepart ) /10 + yMoucheDepart;

    xMouche = xMoucheDepart + noise(frameCount*0.05) * 30 - 15;
    yMouche = yMoucheDepart  + noise(frameCount*0.06+50) * 30 - 15;

    if (etatMouche<=3) 
    {
      fill(255);
      stroke(0);
      strokeWeight(1);
      ellipse(xMouche, yMouche-6, 3, 10);
      ellipse(xMouche, yMouche-6, 3, 9);
      etatMouche++;
    }
    if (etatMouche > 3) 
    {
      fill(255);
      stroke(0);
      strokeWeight(1);
      ellipse(xMouche+5, yMouche-6, 3, 10);
      ellipse(xMouche-5, yMouche-6, 3, 9);
      etatMouche++;
      if (etatMouche == 7)
      {
        etatMouche =0;
      }
    }
    fill(0);
    strokeWeight(3);
    ellipse(xMouche, yMouche, 8, 8);
    strokeWeight(1);
    line(xMouche, yMouche-2, xMouche-10, yMouche+3);
    line(xMouche, yMouche-2, xMouche+10, yMouche+3);
    line(xMouche-2, yMouche, xMouche-2, yMouche+10);
    line(xMouche+2, yMouche, xMouche+2, yMouche+10);
    fill(255);
    ellipse(xMouche-2, yMouche-2, 4, 4);
    ellipse(xMouche+2, yMouche-2, 4, 4);
  }



  //##########################################
  //Dessiner la langue
  //##########################################
  //Si la langue sort
  if (etat ==1) 
  {   
    float distance = dist(xBouche, yBouche, xSchlack, ySchlack);
    rads = atan2( ySchlack - yBouche, xSchlack - xBouche);
    stroke(0);
    strokeWeight(40);
    line(xBouche-24, yBouche, xBouche+28, yBouche);
    strokeWeight(35);
    stroke(100, 0, 0);
    line( xBouche, yBouche, xBouche + cos(rads) * v, yBouche + sin(rads) * v);

    if (v < distance)
    {
      v+=45;
    }

    if (v>=distance) 
    {
      v=distance;
      etat=2;
    }
  }
  //Si la langue rentre dans la bouche
  else if (etat==2) 
  { 
    float distance = dist(xBouche, yBouche, xSchlack, ySchlack);
    rads = atan2( ySchlack - yBouche, xSchlack - xBouche);
    stroke(0);
    strokeWeight(40);
    line(xBouche-24, yBouche, xBouche+28, yBouche);
    strokeWeight(35);
    stroke(100, 0, 0);
    line( xBouche, yBouche, xBouche + cos(rads) * v, yBouche + sin(rads) * v);

    if (v > 0)
    {
      v-=45;
    }
    if (v<=0) 
    {
      etat=0;
      v=0;
    }
  }
}


//#############################################################################################################
//#############################################################################################################
//#############################################################################################################
//Fonction apellée au moment unique où le bouton gauche de la souris est appuyé.
void mousePressed() 
{
  //Si la mouche est écrasée
  if (etatEcrase==0) 
  {
    //Si on clique sur la tapette (écrase la mouche)
    if ( mouseX > xTapette-largeurTapette/2 && mouseX < xTapette+largeurTapette/2 && mouseY > yTapette-largeurTapette/2 && mouseY < yTapette+largeurTapette/2 ) 
    {
      if ( etatTap == 0 ) 
      {
        etatTap = 1;
        etatEcrase = 1;
        xEcrase = xMouche;
        yEcrase = yMouche;
        alphaEcrapou=80;
      }
    }
    //Si on clique sur l'oeil droit (bobo dans l'oeil droit)
    else if (dist(xMouche, yMouche, (xOeil+d), yOeil)<d/2) 
    {
      etat=1;
      xSchlack = xMouche;
      ySchlack = yMouche;
      ouchOD = 1;
    }
    //Si on clique sur l'oeil gauche (bobo dans l'oeil gauche)
    else if (dist(xMouche, yMouche, (xOeil), yOeil)<d/2) 
    {
      etat=1;
      xSchlack = xMouche;
      ySchlack = yMouche;
      ouchOG = 1;
    }
    //Si on clique n'importe où d'autre (langue essaie d'attraper la mouche mais échoue)
    else 
    {
      etat=1;
      xSchlack = xMouche;
      ySchlack = yMouche;
    }
  }
}

//#############################################################################################################
//#############################################################################################################
//#############################################################################################################
//Fonction apellée au moment où le bouton gauche de la souris est relâché
void mouseReleased() 
{
  etatTap = 0;
}


