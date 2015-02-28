
import traer.physics.*;

ParticleSystem physics;
int nparticles =15;
Particle particles[] = new Particle[nparticles];
Particle fixedParticle;
int cellsize = 10;
int count = 0;

void setup() 
{
  size(600,600,P3D);
background(150);
frameRate(120);
physics = new ParticleSystem(0,0.001);
fixedParticle = physics.makeParticle(8,width/2,height/2,0);
        makeParticles();
  
}


void makeParticles()
{
    for (int i = 0; i < nparticles; i++)
    {
Particle p = physics.makeParticle(10, random(width), random(height),0);
physics.makeSpring(fixedParticle, p, .01,.05,2);
particles[i] = p;
}

}

void addParticle(){
                Particle p = physics.makeParticle(10, random(width), random(height),0);
physics.makeSpring(fixedParticle, p, 1,1,1);
              nparticles++;
particles[nparticles+1] = p;

}
void draw(){
  
  
background(150);
for (int i = 1; i < nparticles; i++)
    {
handleBoundaryCollisions(particles[i],i);
drawSquare(particles[i].position().x(),particles[i].position().y());
count++;
if(count > 50000)
{
  makeParticles();

}
println(count);
stroke(255,50);
line(particles[i].position().x(),particles[i].position().y(),particles[i-1].position().x(),particles[i-1].position().y());
                
                

}
           
physics.tick();
   //drawGraph();
}
void drawSquare(float x, float y){

   //println(x + ", " + y);
   fill(255);
   //int ax = (int)(x / cellsize) * cellsize;
   //int ay = (int)(y / cellsize) * cellsize;
   //ellipseMode(CORNER);
  fill(255);
  ellipse(x,y,cellsize,cellsize);
   noFill();
   ellipse(x,y,cellsize+10,cellsize+10);
   
   int num = (int)random(1,nparticles);
//line(x,y,particles[num].position().x(),particles[num].position().y());
  // line(x,y,particles[num].position().x(),particles[num].position().y());
   
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

void mousePressed(){
  makeParticles();
   //for (int i = 1; i < nparticles; i++)
  //  {
  //    particles[i].position().set(mouseX+random(-10,10),mouseY+random(-10,10),0);
  //  }
  
}


