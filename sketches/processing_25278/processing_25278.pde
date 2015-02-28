
/*
Cet exemple importe la logitheque controlP5, cree plusieurs controleurs
et les assigne a des onglets.
Appuyer sur une touche de votre clavier pour alterner la visibile de tous
les controleurs.
*/

import controlP5.*; // Importer la logitheque.

ControlP5 controlP5; // Déclarer une instance de la logitheque.

void setup() {
  size(300,300);
  smooth();

  // Creer une instance de ControlP5 et la lier a ce sketch (this).
  controlP5 = new ControlP5(this);

  // Ajouter un Numberbox et recuperer une reference temporaire (n1)
  // vers ce nouveau controleur.
  // addNumberbox(String theName, float theDefaultValue, int theX, int theY, int theWidth, int theHeight).
  Numberbox n1 = controlP5.addNumberbox("a ( tab 1 )",128,130,130,40,14);
  // Deplacer ce controlleur a l'onglet "tab 1".
  n1.moveTo("tab 1");

  Numberbox n2 = controlP5.addNumberbox("b ( tab 2 )",128,130,110,40,14);
  // Deplacer ce controlleur a l'onglet "tab 2".
  n2.moveTo("tab 2");

  Numberbox n3 = controlP5.addNumberbox("c ( tab 2 )",128,130,148,40,14);
  // Deplacer ce controlleur a l'onglet "tab 2".
  n3.moveTo("tab 2");

  Numberbox n4 = controlP5.addNumberbox("d ( global )",128,130,186,40,14);
  // Deplacer ce controlleur a l'onglet "global". "global" est un onglet special
  // qui indique que ce controlleur doit toujours etre visible.
  n4.moveTo("global");
}


void draw() {
  background(0);
}


void keyPressed() {
  if ( controlP5.isVisible() ) {
    controlP5.hide();
  } 
  else {
    controlP5.show();
  }
}


