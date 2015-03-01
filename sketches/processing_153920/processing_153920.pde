
class Agente
{
  PVector pos;
  PVector vel;

  Agente (PVector start) {
    pos = start.get();
    vel = new PVector( random(-3,3), random(-3,3) );
  }

  void update() {
    if (random(100)<10) {
      vel = new PVector( random(-3,3), random(-3,3) );
    }
    pos.add(vel);
    if (pos.dist(centro) > 300) {
      vel.mult(-2);

    }
  }

 void display() {
 
   stroke(random(255));
   stroke (random(100,180), random(20,200), random(150,250));
    line(pos.x, pos.y,width/2, height/2);
 

  }
}

// USO DELLA CLASSE Agente

// Agente[] agenti = new Agente[500];
Agente[] agenti = new Agente[30];     //++
PVector centro;

void setup()
{
  size(800, 800);
  background (0);
  centro = new PVector(width/2, height/2);
  
  for (int i=0;  i<agenti.length;  i++) {
    agenti[i] = new Agente( centro );
  }
  
  colorMode(HSB);   //++
  background(255);  //++
}

void draw()
{
  noStroke();                 //++
  fill(255, 0);              //++
  rect(100, 100, width, height);  //++

  for (Agente a : agenti) {
    a.update();
//    a.display();
  }
  
  for (int i=0; i < agenti.length; i+=2) {       //++
    PVector p1 = agenti[i].pos;                  //++
    PVector p2 = agenti[i+1].pos;                //++
    float c = map( i, agenti.length,0, 0,255 );  //++
    stroke( c, 255-c, 255 );                     //++ 
    ellipse(p1.x,p2.y,p1.x,p2.y);               //++ 
  }
}

