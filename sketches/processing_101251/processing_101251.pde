
/**
5.2012 Chris Sugrue
Shakerag Workshop

Creating repulsion forces between particles and attraction between particles and mouse.

**/

ArrayList particles = new ArrayList();
float gravity = .1;
float wind    = .02;
float mouseRadius = 200;
float MAX_DIST = 100;

void setup()
{
  size(1024,768);
  for( int i = 0; i < 100; i++)
    addParticle(random(0,width),random(0,height));
    
  smooth();
}

void draw()
{
  background(0);

  
  // create repsulsion from other particles
  for( int i = 0; i < particles.size(); i++)
  {
    Particle P = (Particle)(particles.get(i));
    
    for( int j = 0; j < i; j++)
    {
      Particle J = (Particle)(particles.get(j));
      PVector diffVec = PVector.sub( P.pos, J.pos );
      float d = diffVec.mag();
      if(d < 35 )
      {
            diffVec.normalize();
            diffVec.mult(0.75);
            P.applyForce(diffVec);
            
            // apply the opposite vector to J so it also repels
            diffVec.mult(-1);
            J.applyForce(diffVec);
      }
      
      if(d < 100 )
        P.drawLine(d,J.pos.x,J.pos.y);

    }
  }
  
  
  // create a vector with mouse position
  PVector mouseP = new PVector(mouseX,mouseY);

  // create attraction force towards mouse position
  for( int i = 0; i < particles.size(); i++)
  {
    Particle P = (Particle)(particles.get(i));
    
    // calculate difference to mouse
    PVector diffVec = PVector.sub( mouseP, P.pos ); 

    // calculate distance squared (faster)
    float d = (diffVec.x*diffVec.x)+(diffVec.y*diffVec.y); //diffVec.mag();

    // normalize to get the direction
    diffVec.normalize();

    if(d < (mouseRadius*mouseRadius) && d > (10*10)) {

      float force = 0.95  * (sqrt(d) / mouseRadius);
      diffVec.mult(force);
      P.applyForce(diffVec);
     
    }

    P.update();
  }

  // draw everybody
  //smooth();
  //for( int i = 0; i < particles.size(); i++)
  //{
    //Particle P = (Particle)(particles.get(i));
    //P.render();
  //}
  
  println(frameRate);
}

void addParticle(float x, float y)
{
  Particle P = new Particle(x,y);
  particles.add(P);
}


void mouseReleased()
{
  addParticle(mouseX, mouseY);
}


void keyPressed()
{

}

class Particle {

  PVector pos,acc,vel;
  float mass;
  
  Particle(float x, float y)
  {
    pos   = new PVector(x,y);
    acc   = new PVector(0,0);
    vel   = new PVector(0,0);
    mass = 5;
  }

  void applyForce( PVector force )
  {
    force.div(mass);
    acc.add(force);
  }
  
  void update()
  {
    // apply drag
    float drag = -.25;
    PVector dragForce = PVector.mult(vel,drag);   
    applyForce(dragForce);
    
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }

  void render()
  {
    ellipse(pos.x,pos.y,30,30);
  }
  
   void drawLine(float myDist, float tx, float ty)
  {
      float a = map(myDist,MAX_DIST,0,0,255);
      stroke(255,a);
      line(pos.x,pos.y,tx,ty);
  }

}



