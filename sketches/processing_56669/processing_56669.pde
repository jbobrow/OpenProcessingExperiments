
//-----------------Globals
/* These are variables that you want to exist throughout the entire sketch.*/
Particle[] particleArray = {};
float mouseJitter=75;
int numParticles=20;
int ls=20;

//-----------------Setup
/*The code in setup() will only be run once in your sketch.  Use this space to set things up like
the sketch size, background color, framerate, etc. etc.*/
void setup(){
  size(500,500);
  background(0);
  smooth();
  frameRate(30);
  fill(150,50);
}

//-----------------Main Loop
/*This is the main loop of your sketched.  This loop gets called over and over again until you quit the sketch.*/
void draw(){
  background(0);
  fill(0,50);
  stroke(0);
  rect(0,0,width,height);
  for(int i = 0; i < particleArray.length; ++i){
    Particle particleInstance = particleArray[i];
    particleInstance.update();
    particleInstance.display();
  }
  
}

//-----------------Interactions
/*Place any interactions here.  We'll go over this later*/
void mouseReleased(){
  drawParticle();
}
  
void keyPressed(){
  saveFrame("thumb.png");
  print("frame saved");
}

// ________________Defined Functs
void drawParticle(){
  for(int i=0; i<numParticles; ++i){
    Particle particleInstance = new Particle();
    particleInstance.display();
    particleArray=(Particle[])append(particleArray,particleInstance);
  }
}

//-----------------Defined Classes
/*Place any defined classes here.  We'll go over this later*/
class Particle {
  //particle properties go here
  //each particle should have a position and velocity, as well as color (at minimum; feel free to add more!)
  float x,y,velX,velY,weight;
  color strokeColor;
  int life,lifeSpan; // counter for how many times a particle is displayed
  
  //this is the constructor
  Particle() {
    x = random((mouseX-mouseJitter),(mouseX+mouseJitter));
    y = random((mouseY-mouseJitter),(mouseY+mouseJitter));
    velX=random(-5,5);
    velY=random(-15,-1);
    strokeColor = color(random(10,255),0,random(100,255));
    life=0;
    lifeSpan=ls; // defined as global
    weight=random(2,10)+3;
  }
  
  //and these are the methods
  void display() {
    if (life < lifeSpan){
      strokeWeight(weight);
      stroke(strokeColor);
      point(x,y);
    }
  }  
  
  void update() {
    x += velX;
    y += velY;
    velY+=2;
    life+=1;
  }
}

