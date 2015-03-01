
class Agente
{
  PVector pos;
  PVector vel;
  
  
  Agente(PVector start) {
    pos=start.get();
    vel=new PVector(random(-3,3),random(-3,3) );
  }
  
  void update(){
    if(1<0){
      vel = new PVector(random(-3,3),random(-3,3));
    }
    pos.add(vel);
    if(pos.dist(centro)>400){
      vel.mult(-1);
    }
  }
  
  void display(){
noStroke();
    fill(255,0,0);
    ellipse(pos.y,pos.x,40,40);
    rectMode(CENTER);
    fill(0,0,random(255));
    rect(pos.x,pos.y,20,20);  

  }
}
  
    Agente[] agenti = new Agente[500];
    PVector centro;
 
    void setup()
    {
      size(600,600);
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
      rect(0,0,600,600);
      for(Agente a : agenti){
        a.update();
        a.display();
      }
    }

