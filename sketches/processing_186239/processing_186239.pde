
class Agente
{
  PVector pos;
  PVector vel;
  
  
  Agente(PVector start) {
    pos=start.get();
    vel=new PVector(random(-5,5),random(-5,5) );
  }
  
  void update(){
    if(random(100)<0){
      vel = new PVector(random(-5,5),random(-5,5));
    }
    pos.add(vel);
    if(pos.dist(centro)>500){
      vel.mult(-1);
    }
  }
  
  void display(){
noStroke();
    fill(255,0,0);
    ellipse(pos.x, pos.y,40, 40);
    rectMode(CENTER);
    fill(0,0,255);
    rect(pos.x,pos.y,15,15);  

  }
}
  
    Agente[] agenti = new Agente[500];
    PVector centro;
 
    void setup()
    {
      size(800,800);
      background(0);
      smooth();
      centro = new PVector(width/2,height/2);
      
      
      for(int i=0; i<agenti.length; i++){
        agenti[i] = new Agente(centro);
      }
    }
    void draw()
    {
      fill(0,20);
      rectMode(CORNER);
      rect(0,0,800,800);
      for(Agente a : agenti){
        a.update();
        a.display();
      }
    }

