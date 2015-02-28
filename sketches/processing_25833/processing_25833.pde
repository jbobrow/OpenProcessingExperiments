
import fisica.*;

FWorld world;
FCircle cercle1;
FCircle cercle2;

void setup() {
  size(400, 400);
  smooth();
   Fisica.init(this);

  world = new FWorld();
  world.setEdges();
  
  cercle1 = new FCircle(40);
  cercle1.setPosition(width*0.4,height/2);
  cercle1.setFriction(2);
  //cercle1.setDensity(50);
  world.add(cercle1);
  
  cercle2 = new FCircle(40);
  cercle2.setPosition(width*0.6,height/2);
  cercle2.setFriction(2);
   world.add(cercle2);
   
   FDistanceJoint joint = new FDistanceJoint(cercle1, cercle2);
   world.add(joint);
   
   
   // Ajouter garnotte
   for ( int i = 0 ; i < 20 ; i ++ ) {
     float w = random(3,10);
     float h = random(3,10);
     FBody c = new FBox(w,h);
     c.setPosition( random(w+5,width-w-5) , random(h+5,height-h-5) );
     c.setFriction(1);
     world.add(c);
     
   }
   
}

void draw() {
  background(255);


  if ( keyPressed && key == CODED ) {
   if ( keyCode == RIGHT ) {
     cercle1.addTorque(20);
     cercle2.addTorque(20);
   } else if ( keyCode == LEFT ) {
     cercle1.addTorque(-20);
     cercle2.addTorque(-20);
   }
  }  

  world.step();
  world.draw();
}

