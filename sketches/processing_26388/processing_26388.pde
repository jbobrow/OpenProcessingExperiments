

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

  // Créer un nouveau corps.
  // Voir: http://www.ricardmarxer.com/fisica/reference/fisica/FBox.html
  FBox torse = new FBox(40, 80);
  torse.setPosition(width/2,height/2);
  world.add(torse);
  
  FBox brasG = new FBox(10, 80);
  brasG.setPosition(width/2-25,height/2);
  world.add(brasG);
  
  FBox brasD = new FBox(10, 80);
  brasD.setPosition(width/2+25,height/2);
  world.add(brasD);
  
  FCircle tete = new FCircle(40);
  tete.setPosition(width/2,height/2-60);
  world.add(tete);
  
  FBox jambeG = new FBox(10, 80);
  jambeG.setPosition(width/2-15,height/2+80);
  world.add(jambeG);
  
  FBox jambeD = new FBox(10, 80);
  jambeD.setPosition(width/2+15,height/2+80);
  world.add(jambeD);
  
  
  FDistanceJoint jointTorseBrasG = new FDistanceJoint(torse, brasG);
  jointTorseBrasG.setLength(0);
  jointTorseBrasG.setAnchor1(-20,-40);
  jointTorseBrasG.setAnchor2(5,-40);
 
  FDistanceJoint jointTorseBrasD = new FDistanceJoint(torse, brasD) ;
   jointTorseBrasD.setLength(0);
  jointTorseBrasD.setAnchor1(20,-40);
  jointTorseBrasD.setAnchor2(-5,-40);
  
  FDistanceJoint jointTorseTete = new FDistanceJoint(torse, tete) ;
  jointTorseTete.setLength(0);
  jointTorseTete.setAnchor1(0,-40);
  jointTorseTete.setAnchor2(0,20);
  
  FDistanceJoint jointTorsejambeG = new FDistanceJoint(torse, jambeG);
  jointTorsejambeG.setLength(0);
  jointTorsejambeG.setAnchor1(-20,40);
  jointTorsejambeG.setAnchor2(-5,-40);
 
  FDistanceJoint jointTorsejambeD = new FDistanceJoint(torse, jambeD) ;
   jointTorsejambeD.setLength(0);
  jointTorsejambeD.setAnchor1(20,40);
  jointTorsejambeD.setAnchor2(5,-40);
  
          //Construct a revolute joint between two bodies given an anchor position.
   world.add(jointTorseBrasG);
   world.add(jointTorseBrasD);
   world.add(jointTorseTete);
   world.add(jointTorsejambeG);
   world.add(jointTorsejambeD);

}

void draw() {

  background(100);

  // Executer une etape de la simulation
  world.step();

  // Dessiner la simulation
  world.draw(this);
}


