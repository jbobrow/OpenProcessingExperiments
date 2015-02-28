
// DEFINIZIONE DELLA  CLASSE Agente
 
class Agente
{
  PVector pos;
  PVector vel;
 
  Agente (PVector start) {
    pos = start.get();
    vel = new PVector( random(-1,1), random(-1,1) );
  }
 
  void update() {
    if (random(100)<10) {
      vel = new PVector( random(-1,1), random(-1,1) );
    }
    pos.add(vel);
    if (pos.x<0 || pos.x>width || pos.y<0 || pos.y>height) {  //++
      vel.mult(-1);               
    }
  }
 
  void display() {
    strokeWeight (1);
    stroke(255);
    point(pos.x, pos.y);
  }
}
 
// USO DELLA CLASSE Agente
 
Agente[] agenti = new Agente[50];
PVector centro;
 
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
     
   
  background (0);
  for (Agente a : agenti) {
     
    a.update();
    a.display();
  }
   
  for (int i=0; i < agenti.length; i+=2) {       //++                 //++
    PVector p1 = agenti[i].pos;
    PVector p2 = agenti[i+1].pos;                //++
    noStroke();
    fill(224,70);    //++
    triangle( width/2, height/2,p1.x,p1.y, p2.x,p2.y );
    }
}



