
/*
Demonstration de l'utilisation des images dans fisica.
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
  world.setGravity(0, 400);
  // Activer les murs du pourtour de la scene .
  world.setEdges();

  // Charger les images.
  PImage img_25cents = loadImage("25cents.png");
  PImage img_1cent = loadImage("1cent.png");
  PImage img_2dollars = loadImage("2dollars.png");

  // Creer quelques corps de la taille de l'image "25cents.png".
  for ( int i =0; i < 4 ; i++ ) {

    // Créer un nouveau corps.
    FBody body = new FCircle(img_25cents.width);

    // Placer le corps aleatoirement dans la scene.
    float x = random( img_25cents.width/2 + 10, width - img_25cents.width/2 -10);
    float y = random( img_25cents.height/2 + 10, height - img_25cents.height/2 -10);
    body.setPosition(x,y);

    // Attacher une image au corps.
    body.attachImage(img_25cents);

    // Ajouter le corps a la simulation.
    world.add(body);
  }

  // Creer quelques corps de la taille de l'image "1cent.png".
  for ( int i =0; i < 6 ; i++ ) {
    FBody body = new FCircle(img_1cent.width);
    float x = random( img_1cent.width/2 + 10, width - img_1cent.width/2 -10);
    float y = random( img_1cent.height/2 + 10, height - img_1cent.height/2 -10);
    body.setPosition(x,y);
    body.attachImage(img_1cent);
    world.add(body);
  }

  // Creer un crops de la taille de l'image "2dollars.png"
  for ( int i =0; i < 1 ; i++ ) {
    FBody body = new FCircle(img_2dollars.width);
    float x = random( img_2dollars.width/2 + 10, width - img_2dollars.width/2 -10);
    float y = random( img_2dollars.height/2 + 10, height - img_2dollars.height/2 -10);
    body.setPosition(x,y);
    body.attachImage(img_2dollars);
    world.add(body);
  }
}



void draw() {

  background(100);

  // Executer une etape de la simulation.
  world.step();

  // Dessiner la simulation.
  world.draw(this);
}


// Cette fonction donne un petit coup a la bourse lorsqu'une
// touche du clavier est appuyee.
void keyPressed() {

  ArrayList bodies = world.getBodies();
 
  for ( int i =0 ; i < bodies.size(); i++ ) {
    
    FBody body = (FBody) bodies.get(i);
    body.addForce(0, -300000);
    
  }
}


