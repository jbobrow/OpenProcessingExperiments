
//////////////////////////////////////////////////////////////////
//////////** LA GOUTE D'EAU QUI FAIT DÃ�BORDER LE VASE**///////////
//////////////////////////   PAR   ///////////////////////////////
///////////////////*-= MARIE-NOÃ�L VANASSE=-* ///////////////////

//#1 DÃ©claration des variables changeantes//
 
  int Xboule1 = 300;  // coordonnÃ©e x goute 1--> nombre entier qui dÃ©termine la position de la goute 1, soit au milieu de l'Ã©cran  
 int Yboule1 = 0; //coordonnÃ©e y boule 1-------> nombre entier qui dÃ©termine la position initiale de la goute 1
 int Xboule2 = 300; // coordonnÃ©e x boule 2----> nombre entier qui dÃ©termine la position de la goute 2, soit au milieu de l'Ã©cran
 int Yboule2 = -250; // coordonnÃ©e y boule 2---> nombre entier qui dÃ©termine le dÃ©calage entre la goute 1 et 2.
 int Yrect   = 500; // coordonnÃ©e y du rectangle-> nombre qui dÃ©termine la position initiale du rectangle. Hors champs au bas de l'Ã©cran.
 
 //#2 DÃ©claration des variables de couleurs changeantes
 
 /* Variables dÃ©cimales RVB du background pour implanter 
 plus tard une fonction alÃ©atoire des couleurs.*/
 float rougeBG = 255; // couleur rouge du background. Initialise en blanc
 float vertBG = 255; // couleur verte du background. Initialise en blanc
 float bleuBG = 255; // couleur bleu du background. Initialise en blanc
 
 /*Variables dÃ©cimales RVB pour implanter des changements
 de couleurs aux formes de l'animation*/
 float rougeG = 0;
 float vertG = 0;
 float bleuG = 0;
 
 
 // Animation "La goute qui fait dÃ©border le vase"
void setup(){
  size(600,500); // dÃ©termine la grandeur de la fenÃªtre
  smooth(); // adoucit les dessins 
  
   
 }

// Espace actif de l'animation
void draw() {
background( rougeBG , vertBG , bleuBG ); // variables des couleurs RVB du fond d'Ã©cran

// dessin du rectangle
fill(rougeG , vertG, bleuG ); // variables des couleurs RVB
noStroke(); // pas de ligne contour (dÃ©clarÃ© une seule fois pour tous les dessins
rect(0,Yrect, 600,500);// dessine un rectangle qui aura la grandeur de l'Ã©cran entier, mais nous ne le voyons pas initialement.

 // animation goute 1
  
 Yboule1 = Yboule1+5 ; // bouge la goute sur l'axe des y de 5 pixels Ã  chaque lecture
fill( rougeG , vertG , bleuG ); // couleur de la goute avec les variables reliÃ©es
ellipse(Xboule1, Yboule1, 20,20);// dessine une ellipse de 20 pixels avec les variables prÃ©-Ã©tablies

 
 // animation goute 2
 
 Yboule2 = Yboule2+5 ; // bouge la goute sur l'axe des y de 5 pixels Ã  chaque lecture
fill( rougeG , vertG , bleuG );// couleur de la goute avec les variables reliÃ©es
ellipse(Xboule2, Yboule2, 20,20);// dessine une ellipse de 20 pixels avec les variables prÃ©-Ã©tablies


/* Ã� chaque fois qu'une goute touche au rectangle, 
celui-ci augmente sa position */

// condition de la goute 1

if (Yboule1 > Yrect){// si la coordonnÃ©e y de la goute #1 dÃ©passe la coordonnÃ© y du rectangle
Yboule1=0;// la goute #1 revient Ã  son point de dÃ©part
Yrect= Yrect-10;// le rectangle descend sa position sur l'axe des y de 10 pixels
}

// condition de la goute 2
if (Yboule2 > Yrect){ // si la coordonnÃ©e y de la goute #1 dÃ©passe la coordonnÃ© y du rectangle
Yboule2= 0;// la goute #1 revient Ã  son point de dÃ©part
Yrect= Yrect-10;// le rectangle descend sa position sur l'axe des y de 10 pixels

}
// condition du rectangle

if( Yrect <= 0){ // Si le rectangle atteind le haut de l'Ã©cran
  
Yrect =500; // le rectangle retourne Ã  son point de dÃ©part
Yboule1 = 0;// la goute 1 retourne Ã  son point de dÃ©part
Yboule2= -250;// la goute 2 retourne Ã  son point de dÃ©part

// si le rectangle atteind le haut de l'Ã©cran le fond d'Ã©cran correspondera Ã  la couleur du rectangle
 rougeBG = rougeG; // la variable Rouge du background correspond Ã  celle des goutes et du rectangle
 vertBG = vertG;// la variable Verte du background correspond Ã  celle des goutes et du rectangle
 bleuBG = bleuG; // la variable Bleue du background correspond Ã  celle des goutes et du rectangle
 
 // si le rectangle atteind le haut de l'Ã©cran, une nouvelle couleur est alÃ©atoirement choisie
 rougeG = random(255); // la variable de la couleur rouge change alÃ©atoirement 
 vertG = random(255); // la variables de la couleur verte change alÃ©atoirement
 bleuG = random(255);// la variable de la couleur bleue change alÃ©atoirement
}




  }// fin de la mÃ©thode Draw
  
  //MERCI :o)
