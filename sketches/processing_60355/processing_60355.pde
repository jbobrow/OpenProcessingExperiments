
/** -- Controls --
Mouse Click - Toggle mouse force --
q - Toggle particle force -- 
w - Toggle collisions -- 
e - Toggle gravity -- 
a - Reverse mouse force -- 
r - Randomize particles
* */

Particle firstParticle;

int numParticles = 50;

PVector gravity;
float forceMultiplier;
float particleChargeMin;
float particleChargeMax;
boolean useMouseForce = false;
boolean useParticleForce = true;
boolean useGravity = false;
boolean useCollisions = true;

float angle = 0;

void setup()
{
  size(300, 300);
  noStroke();
  fill(200);
  smooth();
  frameRate(30);
  
  gravity = new PVector(0, 0.5);
  forceMultiplier = 10;
  particleChargeMin = -3;
  particleChargeMax = 3;
  
  useParticleForce = true;
  
  BuildParticles();
}

void draw()
{
  background(0);
  
  PVector pos;
  PVector pos2;
  PVector diff;
  float distance;
  PVector force;
  
  angle += 0.05;
  if(angle > TWO_PI)
    angle -= TWO_PI;
    
  float offSin = sin(angle);
  float offCos = cos(angle);
  //TODO: add variables for the bezier curve offeset whose values are based on sin and cos values over time
  
  //Loop through the particles and update positions and check collision
  Particle thisParticle = firstParticle;
  while(thisParticle != null)
  {      
    pos = thisParticle.GetPosition();   
    //Compare every particle to this one for adding forces
    Particle thisParticle2 = firstParticle;  
    while(thisParticle2 != null)
    {
      //if position is the same, ignore the particle to avoid comparing to the same one or a divide by zero.
      pos2 = thisParticle2.GetPosition();
      if(pos.x == pos2.x && pos.y == pos2.y)
      {
        thisParticle2 = thisParticle2.next;
        continue; 
      }
      
      //apply an amount of acceleration to other particles depending on distance     
      if(useParticleForce)
      {          
        diff = new PVector(pos2.x - pos.x, pos2.y - pos.y);
        distance = sqrt(diff.x * diff.x + diff.y * diff.y);
        float multiplier = thisParticle2.charge * thisParticle.charge;
        force = new PVector(multiplier * (diff.x/distance),
                            multiplier * (diff.y/distance));
         
        force.div(max(1, distance));
        thisParticle2.AddAcceleration(force);
        
        float zapDist = 8 * abs(multiplier);
        if(distance < zapDist)
        {
          stroke(thisParticle.R, thisParticle.G, thisParticle.B);
          noFill();
          bezier(pos.x, pos.y,
                 pos.x  + (10 * offSin) + random(-5, 5), pos2.y + (10 * offCos) + random(-5, 5), 
                 pos2.x + (10 * offCos) + random(-5, 5), pos.y  + (10 * offSin) + random(-5, 5),
                 pos2.x, pos2.y);
          
          fill(0);
          noStroke();
        }
      }   
      
      thisParticle2 = thisParticle2.next;
    }
    
    if(useGravity)
      thisParticle.AddAcceleration(gravity);
    
    if(useMouseForce)
    {
      diff = new PVector(mouseX - pos.x, mouseY - pos.y);
      distance = sqrt(diff.x * diff.x + diff.y * diff.y);
      force = new PVector(forceMultiplier * 2 * (diff.x/distance), forceMultiplier * 2 * (diff.y/distance));
      force.div(max(1, distance));
      thisParticle.AddAcceleration(force);
      
      if(distance < 100)
      {
        stroke(16);
        noFill();
        bezier(pos.x, pos.y,
               pos.x  + random(-7, 7), pos.y  + random(-7, 7), 
               mouseX + random(-7, 7), mouseY + random(-7, 7),
               mouseX, mouseY);
        
        fill(0);
        noStroke();
      }
    }
    thisParticle.Tick();
    if(useCollisions)
      DoCollisions(1);
    thisParticle.DrawParticle();
      
    thisParticle = thisParticle.next;
  }  
}

void DoCollisions(int aIterations)
{
  PVector pos1;
  PVector pos2;
  float distX;
  float distY;
  float actualDist;
  float targetDist;
  
  for(int i = 0; i < aIterations; i++)
  {
    //iterate through all particles
    Particle thisParticle1 = firstParticle;
    while(thisParticle1 != null)
    {
      
      //inner iteration of all particles to compare to the current particle of the outer iteration
      Particle thisParticle2 = firstParticle;
      while(thisParticle2 != null)
      {   
        pos1 = thisParticle1.GetPosition();
        pos2 = thisParticle2.GetPosition();
        if(pos1.x == pos2.x && pos1.y == pos2.y)
        {
          thisParticle2 = thisParticle2.next;
          continue;
        }       
        
        //enforce a distance contstraint between two particles when their distance
        //is less than the sum of their radii.
        distX = pos1.x - pos2.x;
        distY = pos1.y - pos2.y;
        actualDist = sqrt(distX * distX + distY * distY);
        targetDist = thisParticle1.GetRadius() + thisParticle2.GetRadius();
        if(actualDist < targetDist)
        {
          float pCos = distX/actualDist;
          float pSin = distY/actualDist;
          
          float error = targetDist - actualDist;
          PVector newPos1 = new PVector(pos1.x + (error * 0.5) * pCos,
                                        pos1.y + (error * 0.5) * pSin);
          PVector newPos2 = new PVector(pos2.x - (error * 0.5) * pCos,
                                        pos2.y - (error * 0.5) * pSin);
                                        
          thisParticle1.SetPosition(newPos1);
          thisParticle2.SetPosition(newPos2);
          
          //exchange the velocities of the particles because that is the result of a totally
          //inelastic collision where the mass of the two is equal.
          //becuase the particles are circles, the angle isn't quite right, but it's fine for this
          PVector vel1 = thisParticle1.GetVelocity();    
          PVector vel2 = thisParticle2.GetVelocity();
          thisParticle1.SetVelocity(vel2);
          thisParticle2.SetVelocity(vel1);
          
        }       
        
        thisParticle2 = thisParticle2.next;
      }
      
      thisParticle1 = thisParticle1.next;
    }
  }
}

void mousePressed()
{
  useMouseForce = !useMouseForce;
}

void BuildParticles()
{
  firstParticle = new Particle(new PVector(200, 200), particleChargeMin, particleChargeMax);
  Particle prevParticle = firstParticle;
  for(int i = 0; i < numParticles; i++)
  {
    prevParticle.next = new Particle(new PVector(random(0, width), random(0, height)), particleChargeMin, particleChargeMax);
    prevParticle = prevParticle.next;
  }
}

void keyTyped()
{
 if(key == 'q' || key == 'Q')
   useParticleForce = !useParticleForce;   
 else if(key == 'w' || key == 'W')
   useCollisions = !useCollisions;
 else if(key == 'e' || key == 'E')
   useGravity = !useGravity;
 else if(key == 'a' || key == 'A')
   forceMultiplier *= -1;   
 else if(key == 'r' || key == 'R')
   BuildParticles();
}


