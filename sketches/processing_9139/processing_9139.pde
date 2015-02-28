
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

import ddf.minim.*;

Minim minim;
AudioInput in;

// Sauvegarde 
boolean sauverPDF = false;
boolean sauverImage = false;

// Nom utilisé pour la sauvegarde des images 
String nomSauvegarde = "Motif012";

// Taille de la grille
// Nombre d'éléments sur la largeur
int NX = 8;
// Nombre d'éléments sur la hauteur
int NY = 8;

float niveauSonore = 0;

// ----------------------------------------------
void setup()
{
  // Taille de la fenêtre et mode de rendu
  size(800,800,JAVA2D);

  // Autres initialisations pour la durée de vie du programme
  smooth();
  rectMode(CENTER);
  randomSeed(1000);
  
   minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
}

// ----------------------------------------------
void draw()

{
  // Sauvegarde en PDF (début)
 // if(sauverPDF == true)
  {
   // beginRecord(PDF, nomSauvegarde+"_PapierPeint"+(new Date()).getTime()+".pdf"); 
  }
 niveauSonore = in.mix.level() * 1000; // à modifier en fonction
 
  // Couleur du fond
  background(255);
  
  // Tailles d'une case
  float largeurCase = (float) width  / (float)NX;
  float hauteurCase = (float) height / (float)NY;

  // Parcours de toutes les cases sur l'écran
  // pour y dessiner dedans
  int i,j;
  for (i=-10;i<=NX;i++)
    for (j=-10;j<=NY;j++)
    {
      pushMatrix();
        // On se positionne au niveau de la case
        translate(i*largeurCase,j*hauteurCase);
        // On de dessine la case
        motif(i,j,largeurCase,hauteurCase);    
      motif2(i,j,largeurCase,hauteurCase);  
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
void stop()
{
  in.close();
  minim.stop();
  super.stop();
}


