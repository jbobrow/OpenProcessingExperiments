
/**
 * Colision Particula-Plano
 * 
 * Antonio Dávila
 */
 
Planos pl;
ArrayList<Particle> bolas;
PVector gravity = new PVector(0,9.8);
float dt = 0.15; 
int i = 0;

void setup() {
  size(800,600);
  
  //Planos
  pl = new Planos();
  
  // Bolas
  bolas = new ArrayList<Particle>(); 
  
}

void draw() {
  background(0);
  fill(255);
  
  text("Hacer click en cualquier parte de la ventana para crear particulas", 10, 15);
  
  Particle pf = new Particle(new PVector(width/2,height/2), 255.0);
  if(i % 13 == 0) {
    bolas.add(pf);
  }
  
  // Actualiza las partículas: colisiones y dibujado
  for (int i=0;i<bolas.size();i++){
    Particle p = bolas.get(i);
    p.update();
    p.display();
  }
 
  // Calcula Colisiones y dibuja 
  pl.update();
  pl.display(); 
}

void mousePressed()
{
  PVector pos = new PVector(mouseX, mouseY);
  Particle p = new Particle(pos);
  bolas.add(p);
}
// A simple Particle class

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float radio;
  float mass = 20;
  float Kr = 0.6;
  color c;
  float lifespan;
  float angle;
  float mag = 10;
  int n;

  Particle(PVector l) {
    acceleration = new PVector(0,0);
    velocity = new PVector(random(-1,1), random(-20,-45));
    location = l.get();
    radio = random(5,15);
    c = color(random(0,255), random(0,255), random(0,255));
  }
  
  Particle(PVector l, float dur) {
    acceleration = new PVector(0,0); 
    n = i % 7;
    angle = (60+10*n) * PI/180;
    velocity = new PVector(cos(angle), -sin(angle));
    velocity.mult(mag);
    i++;
    location = l.get();
    lifespan = dur;
    radio = random(5,15);
    c = color(random(0,255), random(0,255), random(0,255));
  }
  
  // F = m * a
  void applyForce(PVector force){
    PVector f = PVector.div(force.get(), mass);
    acceleration.add(f);
  } 
  
  float projection(PVector a, PVector b) {
    float modA = a.mag();
    float modB = b.mag();

    if (modA == 0 || modB == 0)
      return 0;
    else
      return ( a.dot(b)/modB );
    }
 
  PVector para(PVector v, float n) {
    PVector v_unit = v.get();
    v_unit.normalize();
    v_unit.mult(n);
    
    return v_unit;
  } 
  
  PVector project(PVector v, PVector v2) {
    float proj = projection(v, v2); 
    PVector res = para(v2, proj);
    
    return res;
  }
  
  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    applyForce(gravity);
    
    // Euler (semi) implicito
    velocity.add(PVector.mult(acceleration, dt));
    location.add(PVector.mult(velocity, dt));
    
    acceleration.set(0,0);
    
  }

  // Method to display
  void display() {
    stroke(c);
    fill(c);
    ellipse(location.x,location.y,radio*2,radio*2);
  }
}

// A simple Plane and Particle class

class Plano{
  PVector pto1;
  PVector pto2;
  PVector plano;  
  PVector normal;
  
  Plano(float x1, float y1, float x2, float y2)
  {
    pto1 = new PVector(x1,y1);
    pto2 = new PVector(x2,y2);
    plano = PVector.sub(pto2, pto1);
    normal = new PVector(-plano.y, plano.x);
    normal.normalize();
  }
  
  // Colisiones con el plano (pto1, pto2)
  void checkCollisions(Particle b)
  {
      PVector p1 = PVector.sub(pto1, b.location);
      PVector p2 = PVector.sub(pto2, b.location);
      
      float modPlano = plano.mag(); //Modulo del plano
      
      float proy_a = p1.dot(plano)/modPlano; //Proyeccion de p1 en el plano
      float proy_b = p2.dot(plano)/modPlano; //Proyeccion de p2 en el plano
      
      PVector uPlano = plano.get(); 
      uPlano.normalize(); //Vector plano normalizado
      
      // Vector entre la particula y el plano
      PVector dist = PVector.add(p1,PVector.mult(uPlano,proy_a*(-1)));
      float d = dist.mag(); // Distancia entre la particula y el plano
      
      if(abs(proy_a) < modPlano && abs(proy_b) < modPlano) {
        if(d < b.radio) {
          // Angulo entre la velocidad de la pelota y el plano
          float angle = PVector.angleBetween(b.velocity, plano);
        
          // Reposicionamiento de la pelota
          PVector nor = normal.get();
          if (nor.dot(b.velocity) > 0) {
            nor.mult(-1);
          }
          
          float deltaS = (b.radio + dist.dot(nor)) / sin(angle);
          PVector displ = b.para(b.velocity, deltaS);
          b.location = PVector.sub(b.location, displ);
          
          //PVector displ = PVector.mult(nor,deltaS);
          //b.location.add(displ);      
          
          // Se descompone la velocidad (normal y tangencial del plamo)
          float nv = normal.dot(b.velocity);
          PVector Vn = PVector.mult(normal, nv);
          PVector vT = PVector.sub(b.velocity, Vn);
          b.velocity = PVector.sub(vT, PVector.mult(Vn, b.Kr));
        }
      }
      // Correcciones en los extremos
      else if (abs(p1.mag()) < b.radio) {
      }
      else if (abs(p2.mag()) < b.radio) {
      }
  }
}

// Clase Planos donde se controlan las oclisiones entre los planos
// y las bolas
class Planos {
  
  ArrayList<Plano> planos;

  Planos() 
  {
    Plano p;
    planos = new ArrayList<Plano>();
    
    //Planos
    p = new Plano(0, height/2, width/2, height);
    planos.add(p);
    p = new Plano(0, height/2, width/2, 0);
    planos.add(p);
    p = new Plano(width/2, 0, width, height/2);
    planos.add(p);
    p = new Plano(width/2, height, width, height/2);
    planos.add(p);
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


