
float[] tableauXcentreDroit;
float[] tableauXcentreGauche;
float[] tableauXdroit;
float[] tableauXgauche;
int Y;
int nbrePoil = 300; //nbrePoil définit egalement longueur monstre
boolean result;
float xCible;
float yCible;
float facteur;
int chrono;
int j;
int etat;
float[] cercleCorpsX;
float[] cercleCorpsY;
float[] diametreCorps;
int TAILLE;


// Fonction qui n'est appelee qu'au demarrage.
void setup() {
  size(400, 400); // La taille de la fenetre.
  frameRate(30); // Le nombre d'images par seconde.
  smooth();
  facteur=0.3;
  chrono=0;
  j=0;
  etat = 0;

  //tableau pour les poils côté droit et gauche  

  tableauXdroit = new float[nbrePoil] ;
  tableauXgauche = new float[nbrePoil] ;
  tableauXcentreDroit = new float[nbrePoil] ;
  tableauXcentreGauche = new float[nbrePoil] ;

  //tableau pour les ronds sur le corps
  TAILLE = 20;

  cercleCorpsX = new float[TAILLE];
  cercleCorpsY = new float[TAILLE];
  diametreCorps = new float[TAILLE];

  for ( int i =0; i < TAILLE ; i = i + 1) {
    cercleCorpsX[ i ] = 200;
    cercleCorpsY[ i ] = i*(300/TAILLE)+50;
    diametreCorps[ i ] = random(20,40);
  }





  //remplissage tableau curve côté droit + augmentation taille
  for (int i = 0; i<nbrePoil; i++)
  {
    tableauXcentreDroit[i] = random(200, 210);
    tableauXcentreGauche[i] = random(190, 200);
    if (i<50) {
      tableauXdroit[i] = random(350, 375);
      tableauXgauche[i] = random(25, 50);
    } 
    else if (i<100) {
      tableauXdroit[i] = random(325, 350);
      tableauXgauche[i] = random(50, 75);
    }
    else   if (i<150) {
      tableauXdroit[i] = random(300, 325);
      tableauXgauche[i] = random(75, 100);
    }
    else if (i<200) {
      tableauXdroit[i] = random(250, 300);
      tableauXgauche[i] = random(100, 125);
    } 
    else if (i<250) {
      tableauXdroit[i] = random(225, 250);
      tableauXgauche[i] = random(125, 150);
    }
    else   if (i<300) {
      tableauXdroit[i] = random(230, 240);
      tableauXgauche[i] = random(160, 170);
    }
  }
}


// Fonction qui est appelee a chaque nouvelle image.
void draw() {
  background(0); // Remplir l'arriere-plan d'une teinte de gris.

  // chronométre avec modulo
  int modulo = frameCount % width;

//multi mouse-over sur les cercle qui composent le corps + minuterie sur l'alpha des ellipses
 for ( int i =0; i < TAILLE ; i = i + 1) {
    if ( insideCircle(cercleCorpsX[ i ] , cercleCorpsY[ i ], 20, mouseX, mouseY ) ) {
      stroke(255, 0, 0,80);
    }
    else {
     stroke(255, 255, 255,20+(modulo/4));
    }
 
    ellipse( cercleCorpsX[ i ] ,  cercleCorpsY[ i ],diametreCorps[ i ] ,diametreCorps[ i ]  );
  }

  //deux antennes principale du monstre 
  strokeWeight(3);
  stroke(255, 80);
  //Appel de la fonction insideCircle
  if (insideCircle (60, 14, 100, mouseX, mouseY))
  {

    //Assouplissement
    xCible = (mouseX - 60.0) * facteur + 60.0;
    yCible = (mouseY - 14.0) * facteur + 14.0;

    //Ellipse
    for (int i = 0; i<40; i++)
    {
      stroke(230, 0, 0, 100-(i+1));
      ellipse(xCible-(i/2), yCible+i, 6+i, 6+i);
      result=false;
    }

    beginShape();
    curveVertex(108.0, 291.0);
    curveVertex(200.0, 50.0);
    curveVertex(18.0, 92.0);
    curveVertex(xCible, yCible);
    curveVertex(5, 15);
    endShape();
  }
  else
  {
    beginShape();
    curveVertex(108.0, 291.0);
    curveVertex(200.0, 50.0);
    curveVertex(18.0, 92.0);
    curveVertex(60, 14.0);
    curveVertex(5, 15);
    endShape();
    //Ellipse
    for (int i = 0; i<40; i++)
    {
      stroke(255, 80);
      ellipse(60-(i/2), 14+i, 6+i, 6+i);
    }
  }

  if (insideCircle (361.0, 14, 100, mouseX, mouseY))
  {
    //Assouplissement
    xCible = (mouseX - 361.0) * facteur + 361.0;
    yCible = (mouseY - 14.0) * facteur + 14.0;


    for (int i = 0; i<40; i++)
    {
      stroke(230, 0, 0, 100-(i+1));
      ellipse(xCible+(i/2), yCible+i, 6+i, 6+i);
      result=false;
    }

    beginShape();
    curveVertex(108.0, 291.0);
    curveVertex(200.0, 50.0);
    curveVertex(348.0, 92.0);
    curveVertex(xCible, yCible);
    curveVertex(367.57596, -25.455757);
    endShape();
    //Ellipse
  }
  else
  {
    stroke(255, 80);
    beginShape();
    curveVertex(108.0, 291.0);
    curveVertex(200.0, 50.0);
    curveVertex(348.0, 92.0);
    curveVertex(361.0, 14.0);
    curveVertex(367.57596, -25.455757);
    endShape();

    //Ellipse

      for (int i = 0; i<40; i++)
    {
      stroke(255, 80);
      ellipse(361, 14+i, 6+i, 6+i);
    }
  }

  //Ellipse central
  if (insideCircle(200, 50, 25, mouseX, mouseY))
  {
    for (int i = 0; i<40; i++)
    {
      stroke(230, 0, 0, 100-(i+1));
      ellipse(200, 50, 8+i, 8+i);
    }
  }
  else
  {  
    for (int i = 0; i<40; i++)
    {
      stroke(255, 80);
      ellipse(200, 50, 8+i, 8+i);
    }
  }


  //Zone intéractive rectangulaire 
  /*rectMode(CORNER);
   pushMatrix();
   translate(width/2, height/5);
   //noStroke();
   rect(-15, -20, 20, 300);
   popMatrix();*/


  //Boucle création des curves
  for (int i = 0; i<(nbrePoil); i=i+3)
  {

    //placement des poils sur l'axe des Y
    Y = 60 + i;
    //changement d'epaisseur des poils
    if (i<75)
    {
      stroke(255, 90);
      strokeWeight(1.5);
    }
    else if (i<125)
    {
      stroke(255, 80);
      strokeWeight(2.5);
    }
    else if (i<175)
    {
      stroke(220, 70);
      strokeWeight(2.25);
    }
    else if (i<225)
    {
      stroke(200, 60);
      strokeWeight(2);
    }


    //chronométre avec assouplissement
    chrono += j;
    if (chrono >=10000)
    {
      j = -1;
    } 
    else if (chrono <= 0)
    {
      j = 1;
    } 

    noFill();
    if (etat == 1)
    {
      //curve côté droit
      beginShape();
      curveVertex(108.0, 293.0);
      curveVertex(tableauXcentreDroit[i], Y);
      curveVertex(tableauXdroit[i], Y+(chrono/200));
      curveVertex(171.0, 17.0);
      endShape();
      //curve côté gauche
      beginShape();
      curveVertex(108.0, 293.0);
      curveVertex(tableauXcentreGauche[i], Y);
      curveVertex(tableauXgauche[i]-20, Y+(chrono/200));
      curveVertex(171.0, 17.0);
      endShape();
    } 
    else if (etat == 0 && chrono !=0)
    {
      j = -1;
      beginShape();
      curveVertex(108.0, 293.0);
      curveVertex(tableauXcentreDroit[i], Y);
      curveVertex(tableauXdroit[i], Y+(chrono/200) );
      curveVertex(171.0, 17.0);
      endShape();
      //curve côté gauche
      beginShape();
      curveVertex(108.0, 293.0);
      curveVertex(tableauXcentreGauche[i], Y);
      curveVertex(tableauXgauche[i]-20, Y+(chrono/200));
      curveVertex(171.0, 17.0);
      endShape();
    }
    else
    {
      beginShape();
      curveVertex(108.0, 293.0);
      curveVertex(tableauXcentreDroit[i], Y);
      curveVertex(tableauXdroit[i], Y );
      curveVertex(171.0, 17.0);
      endShape();
      //curve côté gauche
      beginShape();
      curveVertex(108.0, 293.0);
      curveVertex(tableauXcentreGauche[i], Y);
      curveVertex(tableauXgauche[i]-20, Y);
      curveVertex(171.0, 17.0);
      endShape();
    }
  }
}

void mousePressed() {
  // Vérifier si la souris est à l'intérieur du carré.
  if ( etat == 0  ) etat = 1;
  else etat =0;
}

boolean insideCircle( float circleX, float circleY, float circleRadius, float x, float y) {

  float distance = dist( circleX, circleY, x, y);

  result = distance < circleRadius;

  return result;
}
