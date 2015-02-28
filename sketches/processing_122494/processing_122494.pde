
//Grid & Destroy
//Ale González, 2013

import toxi.physics2d.behaviors.*;
import toxi.physics2d.*;
import toxi.geom.*;

VerletPhysics2D physics;

//General
int 
  W = 750, 
  H = 750, 
  springLength, 
  springForce,
  attNumber = 50,
  attRange  = 50,
  background= -1;

float
  attForce = .1;

//Rectangular display
int 
  offY = 5,
  offX = 10;

//Polar display
float
  offA = TWO_PI/180,
  maxRadius = 300,
  minRadius  = 150,
  offR = 20.,
  CX = W*.5,
  CY = H*.5;

void setup() 
{
    size(W, H);
    stroke(#0A0C2E, 5); 
    smooth();
    springLength = 15;
    springForce  = 1;
    polarGrid();  
}

void draw() 
{
    physics.update();
    for(VerletSpring2D current : physics.springs) line( current.a.x, current.a.y, current.b.x, current.b.y);
}

void rectangularGrid()
{
    background(#eeeeee);
    physics = new VerletPhysics2D();
    for (int y = 0; y < height; y+=offY) {
        physics.addParticle(new VerletParticle2D(0, y));
        for (int x = 5; x <= width; x+=offX) {
          VerletParticle2D previous = physics.particles.get(physics.particles.size()-1);
          VerletParticle2D current  = new VerletParticle2D(x, y);
          physics.addParticle(current);
          physics.addSpring(new VerletSpring2D(previous, current, springLength, springForce));
        }
    }
    destroy();
}

void polarGrid()
{
    background(background);
    physics = new VerletPhysics2D();
    float a = TWO_PI / 360;
    int W = width/2;
    int H = height/2;
    for (float r = minRadius; r < maxRadius; r += offR) {
        physics.addParticle(new VerletParticle2D(r, 0));
        for (float alfa = offA; alfa <= TWO_PI; alfa += offA) {
          VerletParticle2D current  = new VerletParticle2D(CX + cos(alfa)*r, CY + sin(alfa)*r);
          physics.addSpring(new VerletSpring2D(physics.particles.get(physics.particles.size()-1), current, springLength, springForce));
          physics.addParticle(current);
        }
    }
    destroy();
}

void destroy()
{
    for (int i = 0; i < attNumber; i++) {
        VerletParticle2D p = new VerletParticle2D(int(random(width)), int(random(height)));
        p.lock();
        physics.addParticle(p);
        int kind = random(1)<.5? 1 : -1;
        ParticleBehavior2D b = new AttractionBehavior(p, attRange, kind * attForce);
        physics.addBehavior(b);
    }
}

void mouseClicked()
{
     if (mouseButton == LEFT) rectangularGrid();
     else                     polarGrid(); 
}



