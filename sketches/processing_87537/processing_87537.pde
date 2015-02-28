
float[] tableauXcentreDroit;
float[] tableauXcentreGauche;
float[] tableauXdroit;
float[] tableauXgauche;
int Y;
int nbrePoil = 300; //nbrePoil définit egalement longueur monstre

// Fonction qui n'est appelee qu'au demarrage.
void setup() {
  size(400, 400); // La taille de la fenetre.
  frameRate(30); // Le nombre d'images par seconde.
  smooth();
  tableauXdroit = new float[nbrePoil] ;
  tableauXgauche = new float[nbrePoil] ;
  tableauXcentreDroit = new float[nbrePoil] ;
  tableauXcentreGauche = new float[nbrePoil] ;


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
  background(0); // Remplir l'arriere-plan d'une teinte de noir.
  //deux antennes principale du monstre 
  strokeWeight(3);
  stroke(255, 100);
  beginShape();
  curveVertex(108.0, 291.0);
  curveVertex(200.0, 50.0);
  curveVertex(18.0, 92.0);
  curveVertex(60, 14.0);
  curveVertex(5, 15);
  endShape();
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
    ellipse(60-(i/2), 14+i, 6+i, 6+i);
    ellipse(361, 14+i, 6+i, 6+i);
    ellipse(200, 50, 8+i, 8+i);
  }

  //ellipse sur le corps
  for (int i = 0; i<nbrePoil; i=i+25)
  {
    ellipse(200, 60+i, 4, 4);
  }
  for (int i = 0; i<nbrePoil; i=i+15)
  {
    ellipse(200, 60+i, 12, 12);
  }
  for (int i = 0; i<nbrePoil; i=i+50)
  {
    ellipse(200, 60+i, 20, 60);
    ellipse(200, 60+i, 35, 35);
  }
  for (int i = 0; i<nbrePoil; i=i+70)
  {
    ellipse(200, 60+i, 20, 20);
    ellipse(200, 60+i, 8, 8);
  }

  //Boucle création des curves
  for (int i = 0; i<(nbrePoil); i=i+3)
  {
    //placement des poils sur l'axe des Y
    Y = 60 + i;
    //changement d'epaisseur des poils
    if (i<75)
    {
      strokeWeight(0.6);
    }
    else if (i<125)
    {
      strokeWeight(0.9);
    }
    else if (i<175)
    {
      strokeWeight(1.2);
    }
    else if (i<225)
    {
      strokeWeight(1.5);
    }
    noFill();

    //curve côté droit
    beginShape();
    curveVertex(108.0, 293.0);
    curveVertex(tableauXcentreDroit[i], Y);
    curveVertex(tableauXdroit[i], Y);
    curveVertex(171.0, 17.0);
    endShape();
    //curve côté gauche
    beginShape();
    curveVertex(108.0, 293.0);
    curveVertex(tableauXcentreGauche[i], Y);
    curveVertex(tableauXgauche[i], Y);
    curveVertex(171.0, 17.0);
    endShape();
  }
}
