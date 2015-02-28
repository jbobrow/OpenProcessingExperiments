
//by Tommaso Casucci 2011
//create a roots system that follow the mouse position
//press space to restart 


//DECLARE
import toxi.geom.*;
ArrayList ParticleCollection;

int numberOfParticle= 150;

void setup(){
  size(800,600);
  smooth();
  noStroke();
  background(200);
  
//INITIALIZE  
  ParticleCollection = new ArrayList();
  
  for (int i=0; i<numberOfParticle ; i++){
   
    Vec3D origin = new Vec3D (random(width),random(height),0);
 
    particle myPart= new particle(origin);
    ParticleCollection.add(myPart); 
    }

}
 

void draw() {
  
  for (int i=0; i< ParticleCollection.size() ; i++){
     particle myParty = (particle) ParticleCollection.get(i);
     myParty.run ();
     }
}

void keyPressed(){
 if (key == ' ') {
   
     background(200);
     for (int i=0; i< ParticleCollection.size() ; i++){
     particle myParty = (particle) ParticleCollection.get(i);
     myParty.relocate ();
     }
   
 }
}



