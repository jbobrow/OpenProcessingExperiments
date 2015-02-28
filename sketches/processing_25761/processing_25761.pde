
/*
Ce sketch demontre:
L'ajout de forces a un corps dans fisica et la datection de collision entre deux corps.

Utiliser les fleches du clavier pour piloter le vaisseau.
 */



// Importer la logitheque.
import fisica.*;

// Declarer une reference a la logitheque.
FWorld world;

// Declarer une reference a un polygone.
FPoly fusee;

// Declarer une refenrece a un cercle.
FCircle lune;

// Declarer deux tableaux pour emmagasiner les touches appuyees.
boolean[] touches;
boolean[] touchesCodees;

void setup() {
  size(400, 400);
  smooth();

  // Initialiser la logitheque.
  // Voir: http://www.ricardmarxer.com/fisica/reference/fisica/Fisica.html
  Fisica.init(this);

  // Creer une référence à la logitheque.
  // Voir: http://www.ricardmarxer.com/fisica/reference/fisica/FWorld.html
  world = new FWorld();
  // Desactiver la gravite ( x , y ).
  world.setGravity(0, 0);
  // Activer les murs du pourtour de la scene .
  world.setEdges();

  // Creer la "fusee".
  fusee = new FPoly();
  // Ajouter des "vertex" au polygone
  fusee.vertex(-20, -20);
  fusee.vertex(20, -20);
  fusee.vertex(40, 0);
  fusee.vertex(20, 20);
  fusee.vertex(-20, 20);
  fusee.setPosition(width/2,height - 50);
  fusee.setFill(150);
  fusee.setNoStroke();
  world.add(fusee);

  lune = new FCircle(60);
  // Activer le mode "capteur". C'est a dire un corps qui detecte les contacts
  // mais ne cree pas de collisions.
  lune.setStatic(true);
  lune.setPosition(width/2,height/2);
  lune.setFill(255);
  lune.setNoStroke();
  world.add(lune);


  touches = new boolean[256];
  touchesCodees = new boolean[256];
}



void draw() {

  background(0);

  if ( touchesCodees[UP] == true ) {
    float angle = fusee.getRotation();
    float x = cos(angle) * 2000;
    float y = sin(angle) * 2000;
    fusee.addForce(x,y);
  } 

  if ( touchesCodees[RIGHT] == true ) {
    fusee.addTorque(20);
  } 

  if ( touchesCodees[LEFT] == true ) {
    fusee.addTorque(-20);
  } 


  // Executer une etape de la simulation
  world.step();


  /*
  if ( lune.isTouching(fusee) ) {
   lune.setFill(255);
   lune.setNoStroke();
   } else {
   lune.setNoFill();
   lune.setStroke(255);
   }
   */

  // Dessiner la simulation
  world.draw(this);
}

void keyPressed() {

  if ( key == CODED ) {
    touchesCodees[keyCode] = true;
  } 
  else {
    touches[key] = true;
  }
}


void keyReleased() {

  if ( key == CODED ) {
    touchesCodees[keyCode] = false;
  } 
  else {
    touches[key] = false;
  }
}

// Cette fonction est execute chaque fois qu'il y a un contact entre
// deux corps.
void contactStarted(FContact contact) {
  if ( contact.getBody1() == lune || contact.getBody2() == lune ) {
    lune.setFill(0,255,0);
    
    println("Debut de contact: "+contact.getX()+" , "+contact.getY());
  }
  
}

// Cette fonction est execute chaque fois qu'il y a un contact qui 
// persiste entre deux corps.
void contactPersisted(FContact contact) {
  if ( contact.getBody1() == lune || contact.getBody2() == lune ) {
    lune.setFill(255,0,0);
  }
}

// Cette fonction est execute chaque fois qu'il y a un contact qui 
// se termine entre deux corps.
void contactEnded(FContact contact) {
  if ( contact.getBody1() == lune || contact.getBody2() == lune ) {
    lune.setFill(255);
    println("Fin de contact: "+contact.getX()+" , "+contact.getY());
  }
}


