
import traer.physics.*;

ParticleSystem physics;
PFont font;
int numParticles = 500;
float wallx, oldwallx;
boolean wallOn = true;
boolean animate = true;
boolean closestP = false;
float wall = 0;
float wallSpeed = 20;
float minY, maxY, maxX;
float buffer = 0;
float displacement = 5;
float damping = 0.1;
float particleSize = 0;
float maxVel = 3;
int textCountdown;

void setup()
{
  size (800, 200);
  smooth();
  fill(220);
  frameRate(60);
  maxX=width*(1+buffer);
  maxY=height*(1+buffer);
  minY=height*buffer*-1;
  wallx = map(cos(wall), 1, -1, 0, width*1.0/displacement);
  physics = new ParticleSystem();
  physics.setDrag(damping/10);
  for (int i=0; i<numParticles; i++)
  {
    physics.makeParticle(1, random(wallx, maxX), random(minY, maxY), 0);
  }
  for (int i=0; i<numParticles; i++)
  {
    Particle newParticle = physics.getParticle(i);
    for (int j=0; j<physics.numberOfParticles(); j++)
    {
      Particle friend = physics.getParticle(j);
      if (friend != newParticle)
      {
        physics.makeAttraction(newParticle, friend, -5, particleSize);
      }
    }
  }
  font = loadFont("FreeSans-48.vlw");
  textSize(12);
  textFont(font);
  textCountdown = int(frameRate*10);
}

void draw()
{
  oldwallx = wallx;
  if (wallOn && animate)
  {
    wallx = map(cos(wall), 1, -1, 0, width*1.0/displacement);
    wall += 1.0/wallSpeed;
  }
  background(255);
  stroke(255, 0, 0);
  strokeWeight(5);
  line(wallx, 0, wallx, height);
  showParticles();
  if (animate)
    physics.tick();
  showText();
}

void showParticles()
{
  boolean edgeP;
  for (int i=0; i<physics.numberOfParticles(); i++)
  {
    edgeP = false;
    Particle thisParticle = physics.getParticle(i);
    float x = thisParticle.position().x();
    float y = thisParticle.position().y();
    float xvel = thisParticle.velocity().x();
    float yvel = thisParticle.velocity().y();
    if (x>maxX)
    {
      edgeP = true;
      xvel *= (1-damping)*-1;
      x = xvel+maxX;
    }
    if (y<minY | y>maxY)
    {
      edgeP = true;
      yvel *= (1-damping)*-1;
      if (y<minY) y = minY+yvel;
      else y = maxY+ yvel;
    } 
    if (x<wallx+particleSize/2.0)
    {
      edgeP = true;
      float wallvel = wallx - oldwallx;
      xvel = (1-damping)+abs(wallx-oldwallx);
      xvel += wallvel;
      x = wallx+xvel+particleSize/2.0;
    }
    if (edgeP)
      thisParticle.position().set(x, y, 0);
    xvel = constrain (xvel, maxVel*-1, maxVel);
    yvel = constrain (yvel, maxVel*-1, maxVel);
    thisParticle.velocity().set(xvel, yvel, 0);
    strokeWeight(4);
    stroke(0);
    point(x, y);
    if (closestP) closest(thisParticle);
  }
}

void closest(Particle thisParticle)
{
  float bestDistance = MAX_FLOAT;
  float testDistance;
  float x1, y1, x2, y2;
  float bestX = 0;
  float bestY = 0;
  x1 = thisParticle.position().x();
  y1 = thisParticle.position().y();
  Particle tempParticle;
  for (int i=0; i<physics.numberOfParticles(); i++)
  {
    tempParticle = physics.getParticle(i);
    if (thisParticle != tempParticle)
    {
      x2 = tempParticle.position().x();
      y2 = tempParticle.position().y();
      testDistance = dist(x1, y1, x2, y2);
      if (testDistance<bestDistance)
      {
        bestDistance = testDistance;
        bestX = x2;
        bestY = y2;
      }
    }
  }
  strokeWeight(1);
  stroke(#70D4F7);
  line(x1, y1, bestX, bestY);
}

void showText()
{
  if (textCountdown>0)
  {
    float a = constrain(map(textCountdown--, 0, frameRate, 0, 255), 0, 255);
    stroke(0, a*0.8);
    strokeWeight(1);
    fill(255, a*0.8);
    rect(0, 0, 170, 58);
    fill(0, a);
    float hz = frameRate/(wallSpeed*2*PI);
    String s1 = "Freq: "+nf(hz, 1, 2)+" Hz (Up/Down)";
    String s2 = "Displacement: "+nf(100.0/displacement, 1, 2)+"% (L/R)";
    String s3 = "Damping: "+nf(100.0*damping, 1, 2)+"% (</>)";
    textSize(12);
    text(s1, 10, 20);
    text(s2, 10, 35);
    text(s3, 10, 50);
  }
}

void keyPressed()
{
  if (key=='r') setup();
  if (key=='c') closestP = !closestP;
  if (key=='v')
  {
    wallOn = !wallOn;
  }
  if (key==' ') animate = !animate;

  if (key=='<')
  {
    damping -= 0.05;
    damping = constrain(damping, 0, 2);
    physics.setDrag(damping/10);
  }
  if (key=='>')
  {
    damping += 0.05;
    damping = constrain(damping, 0, 2);
    physics.setDrag(damping/10);
  }
  if (keyCode==UP) wallSpeed-=0.1;
  if (keyCode==DOWN) wallSpeed+=0.1;
  if (keyCode==LEFT) displacement+=0.02;
  if (keyCode==RIGHT) displacement-=0.02;
  wallSpeed = constrain(wallSpeed, 2, 50);
  displacement = constrain(displacement, 2, 20);
  textCountdown = int(frameRate*10);
}


