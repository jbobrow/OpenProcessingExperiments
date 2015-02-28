
//poem sketch by wes mcclain
//thanks so original code by avril
void motif(int i, int j, float largeurCase, float hauteurCase)
{
  fill(100, 80, 120);
  noStroke();
  float dx = mouseX - (i*largeurCase+largeurCase/2);
  float dy = mouseY - (j*hauteurCase+hauteurCase/2);
  float angle = atan2(dy,dx);
  float diagonale = dist(width,height,width/2,height/2);
  float d =  dist(mouseX,mouseY,width/2,height/2)/diagonale;
  pushMatrix();
  translate(largeurCase/2,hauteurCase/2);
  rotate(angle);
  arc (d*largeurCase,d*hauteurCase,largeurCase,hauteurCase,radians(10),radians(180-50));
  popMatrix(); 
}

/*
  --
  PapierPeint08b.pde
  --
  Processing Paris
  23/24 Avril 2010
  Fonderie de l'image
  --
  Atelier Initiation
  --
  http://processingparis.ning.com/
  --
*/
 
// Import de la librairie pour exporter en .pdf
import processing.pdf.*;
 
// Sauvegarde
boolean sauverPDF = false;
boolean sauverImage = false;
 
// Nom utilisé pour la sauvegarde des images
String nomSauvegarde = "Motif012";
 
// Taille de la grille
// Nombre d'éléments sur la largeur
int NX = 50;
// Nombre d'éléments sur la hauteur
int NY = 5;
 
// ----------------------------------------------
void setup()
{
  // Taille de la fenêtre et mode de rendu
  size(600,600,JAVA2D);
 
  // Autres initialisations pour la durée de vie du programme
  smooth();
  rectMode(CENTER);
  randomSeed(1000);
}
// ----------------------------------------------
void draw()
{
  // Sauvegarde en PDF (début)
  if(sauverPDF == true)
  {
    beginRecord(PDF, nomSauvegarde+"_PapierPeint.pdf");
  }
 
  // Couleur du fond
  background(200, 190, 30);
   
  // Tailles d'une case
  float largeurCase = (float) width  / (float)NX;
  float hauteurCase = (float) height / (float)NY;
 
  // Parcours de toutes les cases sur l'écran
  // pour y dessiner dedans
  int i,j;
  for (i=-1;i<=NX;i++)
    for (j=-1;j<=NY;j++)
    {
      pushMatrix();
        // On se positionne au niveau de la case
        translate(i*largeurCase,j*hauteurCase);
        // On de dessine la case
        motif(i,j,largeurCase,hauteurCase);   
      popMatrix();
    }
 
  // Sauvegarde en image, au format .png
  if (sauverImage == true)
  {
    saveFrame(nomSauvegarde+"_PapierPeint_#####.png");
    sauverImage = false;
  }
 
  // Sauvegarde en PDF (fin)
  if(sauverPDF == true)
  {
    endRecord();
    sauverPDF = false;
  }
}
 
// ----------------------------------------------
void keyPressed()
{
  if (key == 'p') sauverPDF   = true;
  if (key == 'i') sauverImage = true;
}


