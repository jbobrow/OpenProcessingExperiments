
/**
 * Colisiones particula-plano
 * 
 * DANIEL PÉREZ ROMAN
 * 3º GIM
 */
 
Tablero pim;
ArrayList<Particle> bolas;
float dt = 0.4;
float radio = 2.5;
 
void setup() {
  size(438,600);
  
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
  Particle p = new Particle(pos, radio);
  bolas.add(p);
}
class Particle
{
  float masa = 1.0;
  PVector place;
  PVector vel;
  PVector a; //aceleracion
  float rad;
  PVector gravity;
  
  
  Particle(PVector local, float r)
  {
    place = local.get();
    vel = new PVector( random(-20,20), random(-20,20) );
    a = new PVector();
    gravity = new PVector(0,0);
    rad = r;
  }
  
  void applyForce(PVector force)
  {
    PVector fuerza = PVector.div(force.get(),masa);
    a.add(fuerza);
  }
  
  void run()
  {
    update();
    display();
  }
  
  void display()
  {
    fill(255,0,0);
    ellipse(place.x, place.y, radio*2, radio*2);
  }
  
  void update() //Metodo Euler(semi)
  {
    applyForce(gravity);
    vel.add(PVector.mult(a,dt));
    place.add(PVector.mult(vel,dt));
    a.set(0,0);
  }
  
}

// A simple Plane and Particle class

class Plano{
  PVector pto1;
  PVector pto2;
  PVector plano;  
  PVector normal;
  float Kr = 0.9;
  
  PVector dif1, dif2, P1Project, VecP2Project ;
  float escalar_p1Norm;
  float escalar_p1Plano, escalar_p2Plano, modulo_plano;
  float p1, p2;
  PVector dist_col, uni;
  
  float nv, delta_s, ang;
  PVector norm_plano, Norm, Tang, reposicionar;  
  
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
    dif1 = PVector.sub(pto1,b.place); 
    dif2 =PVector.sub(pto2,b.place);
    
    uni = new PVector(0,0);
    modulo_plano = plano.mag();

    escalar_p1Plano = dif1.dot(plano);
    p1 = escalar_p1Plano/modulo_plano;
    
    escalar_p2Plano = dif2.dot(plano);
    p2 = escalar_p2Plano/modulo_plano;
    
    uni.set(plano);
    uni.normalize();
    //plano.normalize(uni);
    
    dist_col = PVector.add(dif1,PVector.mult(uni, p1*(-1)));
    
    
    if(abs(p1) < modulo_plano && abs(p2) < modulo_plano)
    {
      if(dist_col.mag() < radio){
    
        norm_plano = normal.get();
        if(norm_plano.dot(b.vel)>0)
           norm_plano.mult(-1);
        
        ang = PVector.angleBetween(b.vel, plano);
        
        delta_s = ( radio+dist_col.dot(norm_plano) ) / sin(ang);
        
        reposicionar = PVector.mult(norm_plano, delta_s);
        b.place.add(reposicionar);
        
        
        nv = normal.dot(b.vel);
        Norm = PVector.mult(normal,nv);
        Tang = PVector.sub(b.vel,Norm); 
        b.vel = PVector.sub(Tang,PVector.mult(Norm,Kr));
      }
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
      fill(100);
      strokeWeight(2);  // Beastly
      for (int i=0;i<planos.size();i++){
        Plano p = planos.get(i);
        line(p.pto1.x, p.pto1.y, p.pto2.x, p.pto2.y);
      }
  }
  
    
}


