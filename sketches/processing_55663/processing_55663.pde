
import traer.physics.*;

ParticleSystem physics;

int i;
int j;
int pCount = 20;

// parameters of springs between center and rim
float spokeStrength = 0.1;
float spokeDamping = 0.15;
float spokeLength = 30;

// parameters for springs among rim points
float rimStrength = 0.1;
float rimDamping = 0.1;
float rimLength = 50;

Particle theParticles[] = new Particle[pCount];
Spring theSprings[] = new Spring[pCount*2];

// the point we can click on
Particle p;

void setup()
{
  size( 640, 480 );
  smooth();
  fill( 64,64,64,128 );
  ellipseMode( CENTER );
        
  physics = new ParticleSystem( 0, 0.05 );
  
  for (i=0;i<pCount;i++){
    theParticles[i] = physics.makeParticle(1, random(width), random(height), 0);
  }
        
  p = physics.makeParticle(1, width/2, height/2, 0 );
  
  for (i=0;i<pCount;i++){
    if(i==0){
      j=pCount-1;
    }else{
      j=i-1;
    }
    theSprings[i] = physics.makeSpring(theParticles[i], p, rimStrength, rimDamping, rimLength);
    println(i+" "+j);
    theSprings[i+pCount] = physics.makeSpring(theParticles[i], theParticles[j], spokeStrength, spokeDamping, spokeLength);
  }    

}

void mousePressed()
{
   p.makeFixed(); 
   p.position().set( mouseX, mouseY, 0 );
}

void mouseDragged()
{
  p.position().set( mouseX, mouseY, 0 );
}

void mouseReleased()
{
   p.makeFree(); 
}

void draw()
{
  physics.tick();
    
  fill(255,10);
  rect(0,0,width,height);
  
  fill(0);
  noStroke();
  for (i=0;i<pCount;i++){
    if(i==0){
      j=pCount-1;
    }else{
      j=i-1;
    }    
    ellipse( theParticles[i].position().x(), theParticles[i].position().y(), 10, 10);
    line( theParticles[i].position().x(), theParticles[i].position().y(), theParticles[j].position().x(), theParticles[j].position().y());
  }
  
  ellipse( p.position().x(), p.position().y(), 20, 20 );
}

