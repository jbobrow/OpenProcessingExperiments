
/***************************************
 Auteur: Lasfra karim                
 ****************************************/

//Inspiration
//http://www.openprocessing.org/visuals/?visualID=8168
//http://mrdoob.com/projects/harmony/


//VARIABLES
import controlP5.*;  //  controlP5 library
ControlP5 controlP5; // controlP5 object
PImage Pal_Kouleur, logo; // Images
PFont font; //Font
boolean Quattre = false; //Desactivation du dessin en 4
boolean go = false; //Desactivation de la capture d'écran
color kouleur; // couleur
int[] positionsX = new int[150]; //tableau pour 1 des 4 positions
int[] positionsY = new int[150]; //tableau pour 2 des 4 positions
int[] posX = new int[150]; //tableau pour 3 des 4 positions
int[] posY = new int[150]; //tableau pour 4 des 4 positions
int numerotation; // numerotation des photos
int compteur = 0; // incrementation des photos
//FIN DES VARIABLES


void setup () {
  Pal_Kouleur = loadImage("couleurs.png");
  logo = loadImage("logo_1_txt.jpg");
  font = loadFont("ArialNarrow-20.vlw");
  textFont (font, 20);
  size (1200, 660);
  background (255);
  stroke (0);
  smooth ();
  strokeWeight (0.6);
  frameRate(60);
  controlP5 = new ControlP5(this);
  controlP5.addToggle("Quattre", false, 960, 25,20, 20);
}


  //DESACTIVATION DU DESSIN EN 4//
void Quattre() {
  Quattre = !Quattre; //Pour que le dessin a quattre section ne soit pas activé
}
  //FIN DE LA DESACTIVATION DU DESSIN EN 4//

void draw() {
  //SECTION ESTHÉTIQUE//
  fill (0);//Remplissage de la zone du background
  rect (0, 600, 1200, 60); //Affiche le carré derriere la palette de couleurs
  image (Pal_Kouleur, 0, 600);// Insertion de l'image qui sert a la selection des couleurs
  fill (0);// Remplissage de la barre noir
  rect (0, -1, 1150, 47); // Insertion de la Barre noir
  image (logo, -12, -5, 250, 50);// Insertion de l'image du Logo
  fill (150);// Couleur du texte
  text ("Couleur selectionée:", 1000, 40); //Insertion du texte
  text ("Dessin en 4:", 860, 40); //Insertion du texte
  //FIN DE LA SECTION ESTHÉTIQUE//

  //FONCTION GET POUR LA COULEUR //
  if (mousePressed) {
    if (mouseY>610&& mouseY<660 && mouseX>0 && mouseX<1200 /*&& kouleur */) {
      kouleur = get(mouseX, mouseY);
    }
  }
  //FIN DE LA FONCTION GET POUR LA COULEUR //
  
  stroke (kouleur); //Dessine le trait grace a la souris
  
  //POSITIONS DE LA SOURIS
  positionsX = append(positionsX, mouseX);
  positionsY = append(positionsY, mouseY);
  posX = append(posX, width-mouseX);
  posY = append(posY, height-mouseY);
  //FIN DES POSITIONS DE LA SOURIS

  if (mousePressed) {
    if (mouseY>60&& mouseY<590 && mouseX>10 && mouseX<1190) {
      for (int j=0; j < positionsX.length; j++) {
        int distanz = int(dist(positionsX[j], positionsY[j], mouseX, mouseY)); 
        float r = random(0, 2);
        if (distanz < 20 && r <20)  line(positionsX[j], positionsY[j], mouseX, mouseY);
      }
      for (int k=0; k < positionsX.length; k++) {
        int distanze = int(dist(posX[k], positionsY[k], width-mouseX, mouseY));
        float g = random(0, 2);
        if (Quattre) {
          if (distanze < 20 && g <20)  line(posX[k], posY[k], width-mouseX, height-mouseY);
          if (distanze < 20 && g <20)  line(posX[k], positionsY[k], width-mouseX, mouseY);
          if (distanze < 20 && g <20)  line(positionsX[k], posY[k], mouseX, height-mouseY);
        }
        else {
          if (distanze < 20 && g <20)  line(posX[k], positionsY[k], width-mouseX, mouseY); 
        }
      }
    }
  }



  // AFFICHAGE DE LA COULEUR //
  fill (kouleur);// La couleur séléctionée est appliqué au carré au dessous
  rect (1150, 0, 54, 46); //Affiche le carré ou la couleur choisie est afficher
  // FIN AFFICHAGE DE LA COULEUR //


  // PRINTSCREEN// code du prof
  if (go) { 
    compteur++;
    numerotation = compteur;
    save("dessin"+numerotation+".jpeg");
    go = false; 
  }
    // FIN PRINTSCREEN// code du prof
  
}


// MISE A ZERO DE LA SURFACE À DESSIN //
void keyPressed() {
  // Pernmet de rafraichir la zone de dessin avec la creation d'un rectangle blanc sur cette zone
  if (key == ' ') {
    noStroke();
    fill(255);
    rect (0, 50, 1200, 550);
  }
// FIN DE MISE A ZERO DE LA SURFACE À DESSIN //

// ACTIVATION DE LA CAPTURE D'ÉCRAN //
  if (key == 'S' || key == 's') {
    go = true;
  }
  // FIN DE L'ACTIVATION DE LA CAPTURE D'ÉCRAN //
}



