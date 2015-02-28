
/*
                         \/\/\/\/\/\/\/\/\/\\/\/\/\/\/\/\/\/\/\/\/\/\
                         \/        Sébastien Belhumeur Leith       \/
                         \/        EDM4600                         \/
                         \/        TP2 - Tapisserie                \/
                         /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
*/



//VARIABLES
float rond_size;
float carre_size;
float couleur_objet;
boolean couleur; 
int a, b ;
void setup()
{
 size(398,400); //dimension de la scène
 smooth();
 noStroke(); // aucune bordure
 frameRate(30);
  colorMode(HSB); //mode de couleur Hue/Saturation/Brigtness
}
 
void draw()
{
  // Boucle #1 servavant à multiplié les rects/ellipses sur l'axe des X
  for ( a = 0 ; a < width ; a++ ) {
    
        // Boucle #2 servavant à multiplié la ligne rects/ellipses sur l'axe des Y
      for ( b = 0 ; b < 13 ; b++ )   {
    
        //création des ellipses de manière aléatoire
        rond( random(a * 10), random(b*40), rond_size, rond_size, color(a*240,a*couleur_objet,b*10));
        rond_size =1+ (height*mouseX)/9000; //grossir les ellipses selon la position de la souris
        //création des rectangles de manière aléatoire
        carre( random(a * 10), random(b*40), carre_size, carre_size, color(a*240,a*couleur_objet,b*10));
        carre_size =1+ (height*mouseY)/9000; //grossir les rectangles selon la position de la souris
        
            //Condition si la souris est cliqué 
            if ( couleur ==true )
               {
                 couleur_objet = 240;
               }
            else
               {
                 couleur_objet = 0;
               }
      }  
   } 
}



void mousePressed()
{
  // TRUE or FALSE
  couleur = !couleur;
}

//fonction qui crée les ellipses
void rond(float x, float y, float largeur_objet, float hauteur_objet, color c)
{
fill(c);
ellipse(x,y,largeur_objet,hauteur_objet);

}
// fonction qui crée les rectangles
void carre(float x, float y, float largeur_objet, float hauteur_objet, color c)
{
fill(c);
rect(x,y,largeur_objet,hauteur_objet);  
}









