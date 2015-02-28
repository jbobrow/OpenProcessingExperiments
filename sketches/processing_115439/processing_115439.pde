
class Spring {
  Particle p;
  Particle q;
  float restLength;
  float springConstant;
 
  Spring (Particle p1, Particle p2) {
    p = p1;
    q = p2;
 
    float dx = p.px - q.px;
    float dy = p.py - q.py;
    restLength = sqrt(dx*dx + dy*dy);
    springConstant = 0.1;
  }
 
  void update() {
    float dx = p.px - q.px;
    float dy = p.py - q.py;
    float dh = sqrt(dx*dx + dy*dy);
 
    if (dh > 1) {
      float distention = dh - restLength;
      float restorativeForce = springConstant * distention; // F = -kx
      float fx = (dx/dh) * restorativeForce;
      float fy = (dy/dh) * restorativeForce;
      p.addForce (-fx, -fy);
      q.addForce ( fx, fy);
    }
  }
 
  void render() {
    stroke(255);
    line(p.px, p.py, q.px, q.py);
  }
}
class Blob
{
  ArrayList<Particle> myParticles;
  ArrayList<Spring> mySprings;
  int nPoints;
  float radius;
  Particle center;
  Particle point1;
  Particle p;
  boolean attraction;
 
  
  Blob(int np, float r,boolean a)
  {
    myParticles = new ArrayList<Particle>();
    mySprings = new ArrayList<Spring>();
    nPoints=np;
    radius=r;
    
    
     for (int i=0; i<nPoints; i++) {
    float t = (float)i/nPoints * TWO_PI;
    float rx = width/2 + radius * cos(t);
    float ry = width/2 + radius * sin(t);
    myParticles.add( new Particle(rx, ry));
  }

 
  // stitch the particles together into a blob.
  mySprings = new ArrayList<Spring>();
  for (int i=0; i<(nPoints/2); i++) {
    Particle p = myParticles.get(i);
    Particle q = myParticles.get((i+1)%nPoints);
    Spring s0 = new Spring (p, q);
    mySprings.add (s0);
  }
    int connections[] = {2,3,5,7,11};
  for (int j=1; j<connections.length; j++) {
    for (int i=0; i<nPoints; i++) {
      Particle p = myParticles.get(i);
      Particle q = myParticles.get((i+ connections[j])%nPoints);
      Spring s0 = new Spring (p, q);
      mySprings.add (s0);
    }
  }
  
   p=new Particle(0,0);
   p=myParticles.get(0);
   float particlex=p.px;
   float particley=p.py;
   center=new Particle(particlex-radius,particley-radius);
 
  }
  
  void update(float mr)
  {
     float gravityForceX = 0;
  float gravityForceY = -0.1;
  float mutualRepulsionAmount=mr;
  
  

    for (int i=0; i<myParticles.size(); i++) {
    myParticles.get(i).bPeriodicBoundaries = false;
    myParticles.get(i).update(); // update all locations
  }
   for (int i=0; i<myParticles.size(); i++) {
     float dx=myParticles.get(i).px-mouseX;
     float dy=myParticles.get(i).py-mouseY;
     float dh=sqrt(dx*dx+dy*dy);
     
     float componentInX = dx/dh;
        float componentInY = dy/dh;
        float proportionToDistanceSquared = 1.0/(dh);
         
        float repulsionForcex = mutualRepulsionAmount * componentInX * proportionToDistanceSquared;
        float repulsionForcey = mutualRepulsionAmount * componentInY * proportionToDistanceSquared;
    myParticles.get(i).addForce(-repulsionForcex,-repulsionForcey);
  }
  // update the springs
  for (int i=0; i<mySprings.size(); i++) {
    mySprings.get(i).update(); // draw all springs
  }
  
  center=new Particle(myParticles.get(0).px-radius,myParticles.get(0).py);
  }
  
  void render()
  {
    // Render the springs and particles
  /*for (int i=0; i<mySprings.size(); i++) {
    mySprings.get(i).render(); // draw all springs
  }
  for (int i=0; i<myParticles.size(); i++) {
    myParticles.get(i).render(); // draw all particles
  }*/
  noStroke();
  fill(255,100);
  
  float controlStartX=myParticles.get(0).px;
  float controlStartY=myParticles.get(0).py;
  float controlEndX=myParticles.get(nPoints-1).px;
  float controlEndY=myParticles.get(nPoints-1).py;
  beginShape();
  curveVertex(controlStartX,controlStartY);
  for(int i=0;i<nPoints;i++)
  {
    float x=myParticles.get(i).px;
    float y=myParticles.get(i).py;
    curveVertex(x,y);
    
  }
  curveVertex(controlEndX,controlEndY);
  endShape();
  
   //center=new Particle((myParticles[0].px)-radius,(myParticles[0].py)-radius);
  // fill(255,0,0);
  // ellipse(center.px,center.py,5,5);
  // fill(0,255,0);
  // ellipse(myParticles.get(0).px,myParticles.get(0).py,5,5);
  }
  
 /* Particle getClosest()
  {
    Particle c;
    float disX=0.0;
    float smallestDis=0.0;
    for(int i=0;i<myParticles.size();i++)
    {
     disX=sqrt(myParticles.get(i).px-mouseX)+myParticles.get(i).py-mouseY);
     if(disX<=smallestDis)
     {
       smallestDis=disX;
       c=myParticles.get(i);
     }
    }
  }*/
  
  Particle getFurthest(Egg e)
  {
   float dist=0.0;
   float maxDist=0.0;
   Particle far=new Particle(0.0,0.0);
   for(int i=0;i<myParticles.size();i++)
  {
   dist=sqrt(abs(myParticles.get(i).px-e.centerX)+abs(myParticles.get(i).py-e.centerY));
   if(dist>=maxDist)
   {
    maxDist=dist;
    far=myParticles.get(i);
   }
  }
 return far;
  }

  
  
}
class Egg
{
 float centerX;
 float centerY; 
 boolean breach;
 Sperm suitor1;
 Sperm suitor2;

 
 Egg()
 {
  centerX=mouseX;
  centerY=mouseY;
 breach=false; 
 suitor1=new Sperm(.1,this);
 suitor2=new Sperm(.1,this);
 
   
 }
 
 Egg(Sperm a,Sperm b)
 {
   centerX=mouseX;
   centerY=mouseY;
   breach=false;
   suitor1=a;
   suitor2=b;
   
 }

 
 void update()
 {
   centerX=mouseX;
   centerY=mouseY;
 }
 
 
 void render()
 {
   float alpha=sin(millis()/250.0);
   alpha=map(alpha,-1,1,0,200);
   float alphaJump=map(alpha,50,200, 0,10);
 
 if(!isBreached())
 {
 fill(255,alpha);
  noStroke();
  ellipse(centerX,centerY,50,50);
  ellipse(centerX,centerY,47,47);
  ellipse(centerX,centerY,45,45);
  ellipse(centerX,centerY,43,43);
  ellipse(centerX,centerY,40,40);
  ellipse(centerX,centerY,37,37);
  ellipse(centerX,centerY,35,35);
  ellipse(centerX,centerY,33,33);
  ellipse(centerX,centerY,30,30);
  ellipse(centerX,centerY,27,27);
  ellipse(centerX,centerY,25,25);
  ellipse(centerX,centerY,20,20); 
 }
 else
 {
   alpha=map(alpha,0,200,50,255);
 fill(255,alpha);
 float alphaBeat=sin(millis()/70.0);
 alphaBeat=map(alphaBeat,-1,1,0,20);
  noStroke();
  ellipse(centerX,centerY,50+alphaJump,50+alphaJump);
  ellipse(centerX,centerY,20+alphaBeat,20+alphaBeat);
 
 //center embryo
  
 }

   /*noStroke();
  ellipse(centerX,centerY,50,50);
  ellipse(centerX,centerY,20,20); */
 }
 
 

}
/*Rachel Moeller
Sperm and Egg simulation

Using Golan Levin's particles and springs/blob
*/

//these are really one sperm that spirals out from the center
Sperm spermie;
Sperm joe;
Egg eggie;
boolean breach;
ArrayList<Particle> particles;
float numParticles;

 
void setup() {
  size(400, 400);
  eggie=new Egg();
 spermie=new Sperm(9,eggie);
 joe=new Sperm(6,eggie);
 eggie=new Egg(spermie,joe);
 
   particles=new ArrayList<Particle>();
   numParticles=10;
   for(int i=0;i<numParticles;i++)
   {
     particles.add(new Particle(eggie.centerX,eggie.centerY));
   }   
}
 
 boolean isBreached()
  {
  ArrayList<Sperm> sperms=new ArrayList<Sperm>();
  sperms.add(spermie);
  sperms.add(joe);
  
  for(int i=0;i<sperms.size();i++)
  {
    float spermX=sperms.get(i).base.center.px;
    float spermY=sperms.get(i).base.center.py;
    if(spermX>eggie.centerX-25 && spermX<eggie.centerX+25 && spermY>eggie.centerY-25 &&spermY<eggie.centerY+25)
    {
      breach=true;
      return true;
    }
  }
  breach=false;
  return false;
 }
 void encircleUpdate(float alphaJump)
 {
  eggie.centerX=eggie.centerX+alphaJump;
  eggie.centerY=eggie.centerY+alphaJump;
 }
 void encircle()
 {
   
   float alpha=sin(millis()/250.0);
   float alphaJump=map(alpha,-1,1,0,10);
   float alphaColor=map(alpha,-1,1,0,255);
  fill(255,alphaColor); 
  ellipse(eggie.centerX,eggie.centerY-30-alphaJump,5,5);
  ellipse(eggie.centerX,eggie.centerY+30+alphaJump,5,5);
 }
 
 
void draw() {
  background (0);
  
  if(!isBreached())
  {
 spermie.update();
 joe.update();
    spermie.render();
    joe.render();
    eggie.update();
    eggie.render();
  }
  else
  {
  spermie.update();
  spermie.renderBreach();
  joe.renderBreach();
  
  eggie.update();
  eggie.render();
  encircle();
  }

 
}

class Particle {
  float px;
  float py;
  float vx;
  float vy;
  float damping;
  float mass;
  boolean bLimitVelocities = true;
  boolean bPeriodicBoundaries = false;
 
  // Constructor for the Particle
  Particle (float x, float y) {
    px = x;
    py = y;
    vx = vy = 0;
    damping = 0.93;
    mass = 1.0;
  }
 
  // Add a force in. One step of Euler integration.
  void addForce (float fx, float fy) {
    float ax = fx / mass;
    float ay = fy / mass;
    vx += ax;
    vy += ay;
  }
 
  // Update the position. Another step of Euler integration.
  void update() {
    vx *= damping;
    vy *= damping;
    limitVelocities();
    handleBoundaries();
    px += vx;
    py += vy;
  }
 
 
  void limitVelocities() {
    if (bLimitVelocities) {
      float speed = sqrt(vx*vx + vy*vy);
      float maxSpeed = 6.0;
      if (speed > maxSpeed) {
        vx *= maxSpeed/speed;
        vy *= maxSpeed/speed;
      }
    }
  }
 
  void handleBoundaries() {
    if (bPeriodicBoundaries) {
      if (px > width ) px -= width;
      if (px < 0     ) px += width;
      if (py > height) py -= height;
      if (py < 0     ) py += height;
    }
    else {
      if (px+vx > width ) {
        vx = -vx;
        px = min(px, width);
      }
      if (px+vx < 0     ) {
        vx = -vx;
        px = max(px, 0);
      }
      if (py+vy > height) {
        vy = -vy;
        py = min(py, height);
      }
      if (py+vy < 0     ) {
        vy = -vy;
        py = max(py, 0);
      }
    }
  }
 
  void render() {
    ellipse(px, py, 7, 7);
  }
}

class Sperm
{
  Blob base;
  Blob northPole;
  Tail tail;
  Tail tail1;
  float repulsionAmount;
  Egg target;
  Particle tparticle;
  
  Sperm(float rp, Egg t)
  {
    target=t;
    repulsionAmount=rp;
    base=new Blob(25,10,true);
    tail=new Tail(base.point1,base,target,repulsionAmount);
    tparticle=new Particle(0,0);
  }
  
  void update()
  {
    float distanceToEgg=sqrt(abs((mouseX-base.center.px))+abs((mouseY-base.center.py)));
    base.update(this.repulsionAmount);
    Particle a=base.myParticles.get(8);
    Particle b=base.myParticles.get(20);
   tail.update(a,distanceToEgg,target);
  tparticle=base.getFurthest(target);
  }
  
  void render()
  {
    base.render();
    tail.render(target);
   }
  
  void renderBreach()
  {
   
  }
  
  
}
class Tail
{
  Particle origin;
  Particle a;
  Particle b;
  Particle c;
  Particle d;
  Particle e;
  Particle f;
  Particle end;
  ArrayList<Particle> train;
  ArrayList<Spring> sprangs;
  float distanceX;
  float distanceY;
  Blob blob;
  Blob base;
  float repulsion;
  
  Tail(Particle o,Blob bl,Egg egg,float rp)
  {
    origin=new Particle(egg.centerX,egg.centerY);
    blob=bl;
    base=new Blob(5,4,true);
    repulsion=rp;
  }
  /* blob=bl;
   origin=o;
   distanceX=10;
   distanceY=5;
   
     a=new Particle(0,0);
   b=new Particle(0,0);
   c=new Particle(0,0);
   d=new Particle(0,0);
   e=new Particle(0,0);
   f=new Particle(0,0);
   end=new Particle(0,0);
 
   
   
   /*a=new Particle(origin.px,origin.py);
   b=new Particle(a.px+distanceX,a.py);
   c=new Particle(b.px+distanceX,b.py);
   d=new Particle(c.px+distanceX,c.py);
   e=new Particle(d.px+distanceX,d.py);
   f=new Particle(e.px+distanceX,e.py);
   end=new Particle(f.px+distanceX,f.py);*/
  
   /*train=new ArrayList<Particle>();
   train.add(origin);
   train.add(a);
   train.add(b);
   train.add(c);
   train.add(d);
   train.add(e);
   train.add(f);
   train.add(end);
   
   sprangs=new ArrayList<Spring>();
   for(int i=0;i<train.size();i++)
   {
     if(i<train.size()-1)
     {
     sprangs.add(new Spring(train.get(i),train.get(i+1)));
     }
   }
  }*/
  
  void update(Particle o, float divAmount,Egg egg)
  {
    //float t;
    //t=sin(millis()/(divAmount*10));
    float ex=egg.centerX;
    float ey=egg.centerY;
    
    float sx=blob.center.px;
    float sy=blob.center.px;
    
    float disy=ey-sy;
    float disx=ex-sx;
    
    float posX=disx*-.2;
    float posY=disy*-.2;
  
    base.update(this.repulsion-2);
    
    
 
    
      
  /* float ex=egg.centerX;
   float ey=egg.centerY;
   
   float sx=blob.center.px;
   float sy=blob.center.py;
   
   float disy=ey-sy;
   float disx=ex-sx;
   float ca=.02;
   float posx=-disx*ca;
   float posy=-disy*ca;
  
    origin=blob.center;
    a=new Particle(origin.px*posx,origin.py*posy+t);
   b=new Particle(a.px,a.py+t);
   c=new Particle(b.px+posx,b.py+posy+t);
   d=new Particle(c.px+posx,c.py+posy+t);
   e=new Particle(d.px+posx,d.py+posy+t);
   f=new Particle(e.px+posx,e.py+posy+t);
   end=new Particle(f.px+distanceX,f.py+distanceY+t);
    //origin=new Particle(posx,posy);
     /*a=new Particle(origin.px+posx,origin.py+posy+t);
   b=new Particle(a.px+posx,a.py+posy+t);
   c=new Particle(b.px+posx,b.py+posy+t);
   d=new Particle(c.px+posx,c.py+posy+t);
   e=new Particle(d.px+posx,d.py+posy+t);
   f=new Particle(e.px+posx,e.py+posy+t);
   end=new Particle(f.px+distanceX,f.py+distanceY+t);*/
   
  /* train.set(0,origin);
   train.set(1,a);
   train.set(2,b);
   train.set(3,c);
   train.set(4,d);
   train.set(5,e);
   train.set(6,f);
   train.set(7,end);
   
   for(int i=0;i<train.size();i++)
   {
     train.get(i).addForce(.4,.3);
   }
   
    
    
    for(int i=0;i<sprangs.size();i++)
    {
      sprangs.get(i).update();
    }*/
  }
  
  void render(Egg egg)
  {
    noStroke();
    fill(255,200);
    base.render();
    
    fill(255);
   // ellipse(origin.px,origin.py,3,3);
    //ellipse(a.px,a.py,3,3);
   /* ellipse(b.px,b.py,3,3);
    ellipse(c.px,c.py,3,3);
    ellipse(d.px,d.py,3,3);
    ellipse(e.px,e.py,3,3);
    ellipse(f.px,f.py,3,3);
    ellipse(end.px,end.py,3,3);*/
   //line(origin.px,origin.py,end.px,end.py);
   
  }
  
  void renderBreach(Egg egg)
  {
    float throb=sin(millis()/200.0);
    
    //particles go clockwise
    origin=new Particle(egg.centerX,egg.centerY-60);
    a=new Particle(egg.centerX,egg.centerY-60);
    b=new Particle(egg.centerX,egg.centerY-60);
    c=new Particle(egg.centerX,egg.centerY-60);
    d=new Particle(egg.centerX,egg.centerY-60);
    e=new Particle(egg.centerX,egg.centerY-60);
    f=new Particle(egg.centerX,egg.centerY-60);
    end=new Particle(egg.centerX,egg.centerY-60);
    
    fill(255,0,0);
    ellipse(egg.centerX,egg.centerY-60,4,4);
  }
  
  
  
}


