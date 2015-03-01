
/**
 * Colisiones particula-particula
 * 
 * DANIEL PÉREZ ROMAN
 * 3º GIM
 */
 
Tablero pim;
ArrayList<Particle> bolas;
float dt = 0.4;
float radio = 10.0;
 

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
      p.collision(q);
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
    ellipse(place.x, place.y, 20, 20);
  }
  
  void update() //Metodo Euler(semi)
  {
    applyForce(gravity);
    vel.add(PVector.mult(a,dt));
    place.add(PVector.mult(vel,dt));
    a.set(0,0);
  }
  
  void collision(Particle p)
  {
    PVector d = PVector.sub(this.place, p.place);
    float dist = d.mag();
    
    
    if(dist < (this.rad+p.rad) )
    {
      PVector unitD = new PVector();
      unitD.set(d);
      unitD.normalize();
      //d.normalize(unitD);

      PVector n1 = PVector.mult(unitD, (this.vel.dot(d) / dist) );
      PVector t1 = PVector.sub( this.vel, n1);
      
      PVector n2 = PVector.mult(unitD, (p.vel.dot(d) / dist) );
      PVector t2 = PVector.sub( p.vel, n2);
      
      float restitucion = (this.rad + p.rad) - dist;
      
      PVector resta = PVector.sub(n1, n2);
      float vrel = resta.mag();
      
      PVector multN1 = PVector.mult(n1, -restitucion / vrel);
      this.place.add(multN1);
      
      PVector multN2 = PVector.mult(n2, -restitucion / vrel);
      p.place.add(multN2);
      
      //Velocidad de salida de primera y segunda particula
      
      //Se obtiene la masa de cada uno
      float m1 = this.masa;
      float m2 = p.masa;
      
      //Seguidamente obtenemos la projeccion de cada normal sobre la distancia de las dos particulas
      float u1 = n1.dot(d) / dist;
      float u2 = n2.dot(d) / dist; 
      
      //Velocidad de salida de la primera particula
      float v1 = ( (m1-m2)*u1 + 2*m2*u2) / (m1+m2);
      n1 = PVector.mult(unitD, v1);
      
      //Velocidad de salidad de segunda particula
      float v2 = ( (m2-m1)*u2 + 2*m1*u1) / (m1+m2);
      n2 = PVector.mult(unitD, v2);

      //Suma del vector normal y el tangencial de cada particula para obtener la dirección de salida
      this.vel = PVector.add(n1, t1);  
      p.vel = PVector.add(n2, t2);  

    }
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
    
    Plano up = new Plano(20, 20, width-20, 20);
    Plano left = new Plano(20, 20, 20, height-20);
    Plano right = new Plano(width-20, 20, width-20, height-20);
    Plano down = new Plano(20, height-20, width-20, height-20);
    
    planos.add(up);
    planos.add(left);
    planos.add(right);
    planos.add(down);
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


