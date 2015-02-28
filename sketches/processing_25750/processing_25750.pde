
/*
Survol des trois corps de base 
de la logitheque fisica
*/



// Importer la logitheque.
import fisica.*;

// Déclarer une reference à la logithèque.
FWorld world;

void setup() {
  size(400, 400);
  smooth();

  // Initialiser la logitheque.
  // Voir: http://www.ricardmarxer.com/fisica/reference/fisica/Fisica.html
  Fisica.init(this);

  // Créer une référence à la logitheque.
  // Voir: http://www.ricardmarxer.com/fisica/reference/fisica/FWorld.html
  world = new FWorld();
  // Activer la gravite ( x , y ).
  world.setGravity(0, 200);
  // Activer les murs du pourtour de la scene .
  world.setEdges();

  // Créer un nouveau corps.
  // Noter que nous creons un objet de type "FBox", 
  // mais que nous assignons la reference a une variable
  // de type "FBody". Cette operation est possible parce
  // que "FBox" prolonge ("extends") "FBody". En d'autres mots,
  // tout "FBox" est aussi un "FBody", mais tout "FBody" n'est pas
  // un "FBox". "FBody" est le type plus generique et "FBox" le type
  // plus specifique.
  // Voir: http://www.ricardmarxer.com/fisica/reference/fisica/FBox.html
  FBody body1 = new FBox(40, 40);

  // Changer la position du corps.
  body1.setPosition(width/4,height/2);

  // Changer les parametres graphiques du corps
  body1.setFill(255,50,50);
  body1.setNoStroke();

  // Par defaut, la souris peu manipuler les corps.
  // On le repette ici pour plus de clarte.
  body1.setGrabbable(true);

  // Ajouter le corps à la simulation.
  world.add(body1);

  // Créer un nouveau corps.
  // Comme pour la ligne "FBody body1 = new FBox(40, 40);" plus haut,
  // nous assignons une reference de type "FCircle" a une variable
  // de type "FBody". 
  // Voir: http://www.ricardmarxer.com/fisica/reference/fisica/FCircle.html
  FBody body2 = new FCircle(30);

  // Changer la position du corps.
  body2.setPosition(width/4*3,height/2);

  // Changer les parametres graphiques du corps
  body2.setFill(50,255,50);
  body2.setStroke(0);

  // Ajouter le corps à la simulation.
  world.add(body2);

  // Creer un polygone.
  // "FPoly" est aussi un "FBody", mais puisque nous utilisons plus bas
  // des méthodes specifiques a "FPoly", nous devons garder une reference
  // de type "FPoly" plutot que la refenrece plus generale de type "FBody".
  // Voir: http://www.ricardmarxer.com/fisica/reference/fisica/FPoly.html
  FPoly polygone = new FPoly();

  // Ajouter des "vertex" au polygone
  polygone.vertex(-30, -30);
  polygone.vertex(0, 0);
  polygone.vertex(30, -30);
  polygone.vertex(30, 30);
  polygone.vertex(-30, 30);

  
  // Positionner le corps
  polygone.setPosition(width/2,height/2);
  
  // Rendre ce corps statique
  polygone.setStatic(true);
  
  world.add(polygone);
}



void draw() {

  background(100);

  // Executer une etape de la simulation
  world.step();

  // Dessiner la simulation
  world.draw(this);
}


