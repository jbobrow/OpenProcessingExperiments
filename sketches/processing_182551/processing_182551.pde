
class Agente
{
  PVector pos;
  PVector vel;

  Agente (PVector start) {
    pos = start.get();
    vel = new PVector( random(-1,1), random(-1,1) );
  }

  void update() {
    
    pos.add(vel);
    if (pos.x<0 || pos.x>width || pos.y<0 || pos.y>height) {
      rimbalzo=true;
      vel.mult(-1);               
  
    }
  }

  void display() {
   
                    
    ellipse( pos.x,pos.y, 20,20 );              
    
    fill(255,0,0);
    ellipse(pos.x, pos.y, 20, 20);
    
  }
}



Agente[] agenti = new Agente[100];
PVector centro;
boolean rimbalzo; 

void setup()
{
  size(720, 720);
  
  centro = new PVector(width/2, height/2);
  
  for (int i=0;  i<agenti.length;  i++) {
    agenti[i] = new Agente( centro );
  }
  
 
  
}

void draw()
{
  
                 
  fill(random(255), 10);              
  rect(-10, -10, width+10, height+10);  
  fill(255);
  
  
  for (Agente a : agenti) {
    a.update();
    if(rimbalzo){
     stroke(random(255),random(255),random(255));
     rimbalzo= false; 
    }
    a.display();
  }
 
  }
   
