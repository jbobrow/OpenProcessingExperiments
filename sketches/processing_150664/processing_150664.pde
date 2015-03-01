
/**
 * Pimball
 * 
 * DANIEL PÉREZ ROMAN
 * ALINA HONHALA
 * 3º GIM
 */
 
Tablero pim;
ArrayList<Particle> bolas;
float dt = 0.5;
float radio = 2.5;

void setup() {
  size(800,600);
  
  // Campo: Extremos de la pantalla
  pim = new Tablero();
  
  // Bolas
  bolas = new ArrayList<Particle>(); 
  
}

void draw() {
  background(0);
  fill(255);
  
  // Actualiza las partículas: colisiones y dibujado
  for (int i=0;i<bolas.size();i++){
    Particle p = bolas.get(i);
    p.update();
    for (int j=i+1;j<bolas.size();j++){
      Particle q = bolas.get(j);
      //p.collision(q);
    }
    p.display();
  }
 
 // Calcula Colisiones y dibuja el Pimball 
  pim.update();
  pim.display(); 
}

void mousePressed()
{
  PVector pos = new PVector(mouseX, mouseY);
  Particle p = new Particle(pos);
  bolas.add(p);
}

class Particle
{
  float masa = 3.0;
  PVector place;
  PVector vel;
  PVector a; //aceleracion
  
  
  Particle(PVector local)
  {
    place = local.get();
    vel = new PVector( random(-5,5),random(-5,5) );
    a = new PVector();
  }
  
  void applyForce(PVector force)
  {
    PVector fuerza = PVector.div(force.get(),masa);
    a.add(fuerza);
  }
  
  void display()
  {
    fill(255);
    ellipse(place.x, place.y, 5, 5);
  }
  
  void update() //Metodo Euler(semi)
  {
    vel.sub(PVector.mult(a,dt));
    place.sub(PVector.mult(vel,dt));
    a.set(0,0);
  }
  
  void run()
  {
    update();
    display();
  }


}
// A simple Plane and Particle class

class Plano{
  PVector pto1;
  PVector pto2;
  PVector plano;  
  PVector normal;
  
  PVector dif1, dif2, VecP1Project, VecP2Project ;
  float escalar_p1Norm;
  float escalar_p1Plano, escalar_p2Plano, modulo_plano, magP1, magP2;
  float p1Project, p2Project;
  
  Plano(float x1, float y1, float x2, float y2)
  {
    pto1 = new PVector(x1,y1);
    pto2 = new PVector(x2,y2);
    plano = PVector.sub(pto2, pto1);
    normal =  new PVector(-plano.y, plano.x);
    normal.normalize();
  }
  
  // Colisiones con el plano (pto1, pto2)
  void checkCollisions(Particle b)
  {
    //dif = place - pto
    dif1 = new PVector(b.place.x - pto1.x, b.place.y - pto1.y);
    dif2 = new PVector(b.place.x - pto2.x, b.place.y - pto2.y);
    
    escalar_p1Norm = dif1.dot(normal);
    modulo_plano = plano.dot(plano);

    escalar_p1Plano = dif1.dot(plano);
    p1Project = escalar_p1Plano/modulo_plano;
    VecP1Project = PVector.mult(plano, p1Project);
    magP1 = VecP1Project.mag();
    
    escalar_p2Plano = dif2.dot(plano);
    p2Project = escalar_p2Plano/modulo_plano;
    VecP2Project = PVector.mult(plano, p2Project);
    magP2 = VecP2Project.mag();
    
    if(magP1 < modulo_plano && magP2 < modulo_plano)
    {
      if(abs(escalar_p1Norm) < radio)
      b.vel.mult(-1);
    }
    
  
  }
}

// Tablero del Pimball
class Tablero {
  
  ArrayList<Plano> planos;

  Tablero() // Constructor: Crea el pimball
  {
    int maxPlanos = 6;
    planos = new ArrayList<Plano>();
    
    for (int i=0;i<maxPlanos;i++){
      Plano p = new Plano(random(0, width/2), random(0, height),random(width/2, width),random(0, height));
      planos.add(p);
    }
  }
    
  void update()
  {
    for (int i = planos.size()-1; i >= 0; i--) {
       Plano p = planos.get(i);
       for (int j=0;j<bolas.size();j++){
          Particle b = bolas.get(j);
          p.checkCollisions(b);  
       }
    }
  }
  
  void display()
  {
      stroke(255);
      fill(255);
      strokeWeight(1);  // Beastly
      for (int i=0;i<planos.size();i++){
        Plano p = planos.get(i);
        line(p.pto1.x, p.pto1.y, p.pto2.x, p.pto2.y);
      }
  }
  
    
}


