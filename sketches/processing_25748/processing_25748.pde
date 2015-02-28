

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
  // Voir: http://www.ricardmarxer.com/fisica/reference/fisica/FBox.html
  FBox box = new FBox(40, 40);

  // Changer la position du corps.
  box.setPosition(width/2,height/2);

  // Ajouter le corps à la simulation.
  world.add(box);

}

void draw() {

  background(100);

  // Executer une etape de la simulation
  world.step();

  // Dessiner la simulation
  world.draw(this);
}


