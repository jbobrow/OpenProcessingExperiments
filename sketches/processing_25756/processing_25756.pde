
/*
Ajouter et supprimer des corps dynamiquement d'une simulation fisica.
 Cliquer sur un corps pour le supprimer.
 Cliquer ailleurs pour en ajouter.
 */



// Importer la logitheque.
import fisica.*;

// Declarer une reference à la logithèque.
FWorld world;

// Une reference au dernier objet sous la souris
FBody oldBody;

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
}



void draw() {

  background(255);
  
  // Si un corps etait precedemment sous la souris, 
  // remettre sa couleur d'origine
  if (oldBody != null) oldBody.setFill(0);
  
  // Trouver le corps "sous" la souris.
  FBody newBody = world.getBody(mouseX, mouseY);
  // Si aucun corps ne se trouve "sous" la souris,  world.getBody()
  // retourne "null".
  if (newBody != null) {
    newBody.setFill(100);
    oldBody = newBody;
  }
  

  // Executer une etape de la simulation
  world.step();

  // Dessiner la simulation
  world.draw(this);
}

void mousePressed() {

  // Trouver le corps "sous" la souris.
  FBody body = world.getBody(mouseX, mouseY);
  // Si aucun corps ne se trouve "sous" la souris,  world.getBody()
  // retourne "null".
  
  if ( body == null ) {
    // Ajouter un corps.
    body = new FBox(random(10,60),random(10,60));
    body.setPosition(mouseX,mouseY);
    body.setRotation(random(TWO_PI));
    body.setRestitution(0.65);
    body.setFill(0);
    body.setNoStroke();
    world.add(body);
  } 
  else {
    // S'assurer que l'on ne supprime pas un des murs du pourtour
    if ( mouseX > 5 && mouseX < width - 5 && mouseY > 5 && mouseY < height -5 ) {
      // Supprimer le corps.
      world.remove(body);
    }
  }
}


