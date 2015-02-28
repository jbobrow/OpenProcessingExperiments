
/*
Cet exemple importe la logitheque controlP5 et cree deux controleurs
 qui changent la position d'une ellipse.
 */


import controlP5.*; // Importer la logitheque.

ControlP5 controlP5; // Déclarer une instance de la logitheque.

/*
 Il existe plusieurs moyens de lier les controleurs controlP5 
 aux variables du sketch. La methode que j'utilise est la suivante:
 
 Declarer une fonction qui porte le  meme nom que le controleur et qui
 prend un argument du type approprie. 
 Lorsque la valeur du controleur est modifiee cette fonction est appelee. 
 
 */

int x;
float y;

void setup() {
  size(300,300);
  smooth();

  // Creer une instance de ControlP5 et la lier a ce sketch (this).
  controlP5 = new ControlP5(this);

  // Ajouter un Numberbox et recuperer une reference temporaire (n1)
  // vers ce nouveau controleur.
  // addNumberbox(String theName, float theDefaultValue, int theX, int theY, int theWidth, int theHeight). 
  Numberbox n1 = controlP5.addNumberbox("valeurX",150,20,60,40,14);
  n1.setMax(width); // Changer la valeur maximale du controleur
  n1.setMin(0); // Changer la valeur minimale du controleur

  // Ajouter un autre Numberbox et recuperer une reference temporaire (n2).
  Numberbox n2 = controlP5.addNumberbox("valeurY",150,80,60,40,14);
  n2.setMax(height);
  n2.setMin(0);

  x = 150;
  y = 150;
}


void draw() {

  background(0);
  ellipse(x,y,20,20);
}


// Cette fonction porte le meme nom qu'un controleur.
// Elle est appelee lorsque la valeur du controleur change.
void valeurX (int valeur) {

  x = valeur;
}

// Cette fonction porte le meme nom qu'un controleur.
// Elle est appelee lorsque la valeur du controleur change.
void valeurY (float valeur) {

  y = valeur;
}

