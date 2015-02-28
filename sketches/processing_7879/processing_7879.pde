
import traer.physics.*;

ParticleSystem physics;
int nparticles = 20;
Particle particles[] = new Particle[nparticles];
Particle fixedParticle;
int cellsize = 5;


void setup() 
{
  size(400,400);
	fill(255,20);
rect(0,0,width,height);
	frameRate(60);
	physics = new ParticleSystem(0,0.001);
	fixedParticle = physics.makeParticle(8,width/2,height/2,0);
    for (int i = 0; i < nparticles; i++)
    {
		Particle p = physics.makeParticle(10, random(width), random(height),0);
		physics.makeAttraction(fixedParticle, p, 5000,50);
		particles[i] = p;
	}
}

void draw(){
	// Create an alpha blended background
  fill(255, 5);
  rect(0,0,width,height);

	for (int i = 0; i < nparticles; i++)
    {
		handleBoundaryCollisions(particles[i],i);
		drawSquare(particles[i].position().x(),particles[i].position().y());

	}
	physics.tick();
   //drawGraph();
	
}
void drawSquare(float x, float y){

   //println(x + ", " + y);
   fill(150);
   int ax = (int)(x / cellsize) * cellsize;
   int ay = (int)(y / cellsize) * cellsize;
   //ellipseMode(CORNER);
   rect(ax,ay,cellsize,cellsize);
   
}
void handleBoundaryCollisions( Particle p , int i)
{
    if ( abs(p.position().x() - width/2) < 5 && abs(p.position().y() - height/2) < 5 )
      p.velocity().set( -0.9 * p.velocity().y(), -0.9 * p.velocity().x(), 0 );
      
    if ( p.position().x() < 0 || p.position().x() > width )
      p.velocity().set( -0.9*p.velocity().x(), p.velocity().y(), 0 );
    if ( p.position().y() < 0 || p.position().y() > height )
      p.velocity().set( p.velocity().x(), -0.9*p.velocity().y(), 0 );
    p.position().set( constrain( p.position().x(), 0, width ), constrain( p.position().y(), 0, height ), 0 ); 
}


void drawGraph(){
  stroke(150);
  int x = cellsize;
  int y = cellsize;
  while(x<width)
  {
    line(x,0,x, height);
    x+=10;
  }
  while(y< height)
  {
    line(0,y,width,y);
    y+=10;
  }
}

