
int col1 = 100;

// DEFINIZIONE DELLA  CLASSE Agente

class Agente
{
    PVector pos;
    PVector vel;
   
    Agente (PVector start) 
    {
        pos = start.get();
        vel = new PVector( random(-0.5,0.5), random(-0.5,0.5) );
    }
   
    void update() 
    {
        if (random(100)<1) 
        {
            vel = new PVector( random(-0.5,0.5), random(-0.5,0.5) );
        }
        pos.add(vel);
        if (pos.dist(centro) > 350) 
        {
            vel.mult(-1);                // inverte la direzione
        }
    }
   
    void display() 
    {
        noStroke();
        fill (col1, 100, 255, random(150,200));
        bezier(width/2.0, height/2.0, pos.x+100, pos.y+35, pos.x-50, pos.y+35, width/2.0, height/2.0); 
    }
}
 
// USO DELLA CLASSE Agente

Agente[] agenti = new Agente[70];
PVector centro;
 
void setup()
{
    size(720, 720);
    colorMode(HSB);
    centro = new PVector(width/2, height/2);
   
    for (int i=0;  i<agenti.length;  i++) 
    {
        agenti[i] = new Agente( centro );
    }
}
 
void draw()
{
    background(0);
    for (Agente a : agenti) 
    {
      a.update();
      a.display();
    }
    switch (key) {
      case 'q' :
      col1 +=50;
      case 'w' :
      col1 -=50;
      }
      
}



