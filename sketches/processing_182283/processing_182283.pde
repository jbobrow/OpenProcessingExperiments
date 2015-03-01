
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/932*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

int FPS = 30;
int NUM_PARTICLES = 200;
int w=512;
color backgroundColor;
particle[] Particles = new particle[NUM_PARTICLES];

int startDelay=30;
int accelerationFrames=3;
int power=4;
float accelerationMult=1.005;


void setup(){
  size(w,w, P2D);
  noStroke();
  background(0);
  frameRate(FPS);
  for(int i = 0; i < NUM_PARTICLES; i++)  {    Particles[i] = new particle();}
  fill(255);

}
 
void draw(){//if(frameCount%30==0)println(frameRate);
if(frameCount<startDelay){  ellipse(w/2,w/2,frameCount/2,frameCount/8);ellipse(w/2,w/2,frameCount/8,frameCount/2); return;}
  noStroke();
  fill(0,0,0,150);
  rect(0,0,w,w);

     if (mousePressed&&mouseButton==LEFT){ Particles[0].mass=300;Particles[0].position.x=mouseX;Particles[0].position.y=mouseY;Particles[0].velocity.x=0;Particles[0].velocity.y=0;}
     else Particles[0].mass=0;
  for(int i = 1; i < NUM_PARTICLES; i++)  {    Particles[i].update(); }
}
 
class particle{
  PVector position;
  PVector velocity;
  float mass;
 
  particle()  {
    position = new PVector();
    velocity = new PVector();
    position.x = w/2;
    position.y = w/2;
    velocity.x = random(-power,power);
    velocity.y = random(-power,power);
    mass = random(1,2);
  }
 
  void followGravity(PVector location, float mass1, float mass2){
    PVector unitVector = new PVector();
    unitVector = location.get();
    unitVector.sub(position);
    float dist = location.dist(position);
    unitVector.normalize();
    PVector force = new PVector();
    double g = -0.06673;
    g *= ((mass1*mass2)/(dist));
    force.x = (float)(g*(double)unitVector.x);
    force.y = (float)(g*(double)unitVector.y);
//    float magnitude = force.mag();
    velocity.sub(force);
    if(frameCount<startDelay+accelerationFrames){
    velocity.x*=accelerationMult;
    velocity.y*=accelerationMult;
}
  }
 
  void update()  {
    for(int i = 0; i < NUM_PARTICLES; i++) { if(position.x != Particles[i].position.x || position.y != Particles[i].position.y)
      {  followGravity(Particles[i].position, mass,Particles[i].mass); }
    }
    
    velocity.mult(0.9);
    position.add(velocity);
    PVector center = new PVector(w/2,w/2);
    if(position.dist(center)>w/2)    {
      PVector normalVec = new PVector();
      normalVec=position.get();
      normalVec.sub(center);
      normalVec.normalize();
      normalVec.mult(10);
      velocity.sub(normalVec);
    }
    render();
  }
 
   void render()  {
    stroke(255,255,255);
    strokeWeight(mass);
//    pushMatrix();
//    translate(position.x,position.y);
    point(position.x,position.y);
//    rect(0,0,2,2);
//    popMatrix();
  }
}

 void keyPressed(){frameCount=0;setup();}  
 void mousePressed(){if(mouseButton==RIGHT){frameCount=0;setup();}} 
