
ParticleManager pManager;
int timer=5;
int interval=10;
 
void setup(){
  size(800,600);
  pManager = new ParticleManager();
}
 
void draw(){


 
 
  backgrounding();
   
  pManager.updater(mouseX,mouseY);
  pManager.display();
   
  if(millis()-timer>interval){
    pManager.add(mouseX,mouseY);
    timer=millis();
    interval = int(random(10,20));
  }
   
}
 
void backgrounding(){
  pushStyle();
  fill(0,20);
  noStroke();
  rect(0,0,width,height);
  popStyle();
}
class Particle{
 
  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector gravity;
  float size;
  int fillIn;
  int followTime;
  PVector attractor;
  

   
  Particle(int xPos, int yPos){
    size = random(2,24);
    position = new PVector(xPos,yPos);
    velocity = new PVector(0,0);
    gravity = new PVector(0,0.002);
    acceleration = new PVector(random(-0.20,0.20),random(-0.20,0.20));
    fillIn = int(random(255,255));
    attractor = new PVector(0,0);
    followTime = millis();
  }

  
  //
  
   
  void update(int followX, int followY){
    if(millis()-followTime<2000 && millis()-followTime>100){
      attractor.set(followX,followY,0);
      attractor.sub(position);
      attractor.div(5);
      acceleration.add(attractor);
      acceleration.div(1000);
    }else{
  
    
   
 
    }
    acceleration.add(gravity);   
    velocity.add(acceleration);
    position.add(velocity);
    fillIn--;
    
   
  }
   
  void draw(){
    pushStyle();
    fill(255, 0, 255);
    noStroke();
    //stroke(240);
    ellipse(position.x,position.y,size,size);
     if (mousePressed){
       fill( random(0,0));
     ellipse(position.x,position.y,size,size);}
     
    popStyle();
    
  }
   
 
 

   
  boolean finished(){
    if(position.y>height){
      return true;
    }else{
      return false;
    }
  }
 }

class ParticleManager{
 
  ArrayList<Particle> pList = new ArrayList<Particle>();

   
  ParticleManager(){
   
  }
   
  void add(int xPos, int yPos){
    pList.add(new Particle(xPos,yPos)); 
  }
   
  void display(){
    for(int i=0; i<pList.size(); i++){
      Particle p =  (Particle) pList.get(i);
    
      p.draw();
      
    }
  }
   
  void updater(int attractorX, int attractorY){
    for(int i=0; i<pList.size(); i++){
      Particle p =  (Particle) pList.get(i);
      p.update(attractorX, attractorY);
      if(p.finished()==true){
        pList.remove(i);
      }
    }
  }
}



