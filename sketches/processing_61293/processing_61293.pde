
import traer.physics.*;

//Planet[] planets;
//boolean mouseReleased = false;
ParticleSystem universe;
Particle sun;
PVector vel;

void setup() {
  size(1200, 800);
  smooth();
  noStroke();
  universe = new ParticleSystem();
 // universe.setDrag(10.0);
  sun = universe.makeParticle(1000.0,width/2,height/2,0.0);
  sun.makeFixed();
  
 
}

void draw() {
  //sun = universe.makeParticle(500.0,width/2,height/2,0.0);
  universe.tick();
 
  //sun = universe.makeParticle(500.0,width/2,height/2,0.0);
  
  background(255);
  fill(0, 255, 255);
  ellipse(mouseX, mouseY, 10, 10);
  /*
  if ( mouseReleased ) {
     //for ( Planet p : planets ) {
       for (Particle p : universe ) {
         //Particle p = universe.makeParticle(5.0, loc.x, loc.y, 0.0);
         p.go();
     }
   }
   */
  fill(255,230,0);
  ellipse(sun.position().x(),sun.position().y(), 30,30);
  
  for ( int i = 1; i < universe.numberOfParticles(); ++i )
  {
   // if ( universe.getParticle(i) == sun ) {
    //  fill(255, 230, 0);
    //  ellipse(width/2, height/2, 200, 200);
    //} else {
      fill(0, 255, 255);
      Particle v = universe.getParticle( i );
      
      
      ellipse( v.position().x(), v.position().y(), 10, 10 );
   // }
  }
}

void mouseReleased() {
  //mouseReleased = true;
  //Planet p = new Planet(mouseX, mouseY, color(random(255),random(255),random(255)));
  //planets = (Planet[])append(planets, p);
  addPlanet(mouseX,mouseY);
}

void addPlanet(float setX, float setY) {
  Particle p = universe.makeParticle(1.0, setX, setY, 0.0);
  p.makeFree();
  /*PVector myPos = new PVector(p.position().x(), p.position().y() );
  PVector sunPos = new PVector(sun.position().x(), sun.position().y());
  PVector dir = PVector.sub(myPos,sunPos);
  vel.mult(sin(90));
  */
  p.velocity().set(20,20,0);
  makeGrav(p,sun);
  //p.velocity().add(p.velocity().y(),-p.velocity().x(),0.0);
  //print(p.velocity().x() + "\n" + p.velocity().y() + "\n" + p.position().x() + "\n" + p.position().y());
 
}

void makeGrav(Particle p, Particle b) {
  universe.makeAttraction( p, b, 300, 200);
  
}
/*
void calculatePerp(float x, float y) {
  inwardForce = (x - sun.position().x(), y - sun.position().y());
  Pvector perpForce(y-sun.position().y(), -1 * (x - sun.position().x());
}

//int addVelocity(float x, float y) {
  
//}

class MyCustomForce implements Force
{
	// Particle p; or one or more particles
 	// you're applying this force to

	public void apply()
	{
             for ( int i = 1; i < universe.numberOfParticles(); ++i ) {
               Particle v = universe.getParticle(i);
               
                 
             }
                
	}
}
*/

