

// sketch:  PG_LorenzAttractor.pde
// version: 2013-07-14

import java.util.Iterator;                   
import java.util.LinkedList;

int numPVectors = 10000;                     // line length
int speed = 10;                              // number of lines to add
float a = 10.0,  b = 28.0,  c = 8.0 / 3.0;   // Lorenz-Attractor parameters
float d = 0.75f;                             // distance between two points

LinkedList<PVector> particleList = new LinkedList<PVector>();

public void setup() 
{
  size(512, 512, P3D);
  frameRate(30);
  stroke(color(0, 0, 0, 33));
  strokeWeight(2.0f);
  smooth();
  initParticles();
}

public void draw() 
{
  background(255);
  advanceParticles(speed);
  drawParticles();
}

void keyPressed ()
{
  if(key == 's') save("LorenzAttractor.png");
}

void initParticles()
{
  PVector p = new PVector(random(3),random(3), random(3));
  for (int i = 0; i < numPVectors; i++) 
  {
    PVector q = new PVector(p.x, p.y, p.z);
    addParticle(q);
    p.set(q);
  }
}

void advanceParticles(int count) 
{ 
  for (int ni = 1; ni<count; ni++)
  {
    PVector p = particleList.pollFirst();   // take and remove the first PVector from list
//    print (ni + " ");
    p.set(particleList.peekLast());         // copy values from the most advanced PVector
    addParticle(p);                        // advance and add to the end of the list
  }
//  println();
}

void addParticle(PVector p) 
{
  PVector step = new PVector();
  step.x = a * (p.y - p.x);      // use Lorenz formula
  step.y = p.x * (b - p.z) - p.y;
  step.z = p.x * p.y - c * p.z;
  step.mult (d / step.mag());    // step *= d / |step|;
  p.add(step);                   // p = p + step;
  particleList.add(p);
}

void drawParticles()
{
  pushMatrix();
  translate (width / 2.0, height / 2.0);
  scale(8);
  rotateX(mouseY * 2*PI / height);
  rotateY(mouseX * 2*PI / width);
  Iterator<PVector> it = particleList.iterator();
  PVector q, p = it.next();  // first point
  while (it.hasNext ()) 
  {
    q = it.next();           // second point
    stroke(color(   (q.x - p.x) * 255.0, (q.y - p.y) * 255.0, (q.z - p.z) * 255.0, 88));
    line(p.x, p.y, p.z - 30, q.x, q.y, q.z - 30);
    p.set(q);
  }
  popMatrix();
}


