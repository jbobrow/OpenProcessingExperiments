
/**
 * Pimball
 * 
 * DANIEL PÃ�REZ ROMAN
 * ALINA HONHALA
 * 3Âº GIM
 */
 
Tablero pim;
ArrayList<Particle> bolas;
PVector gravedad = new PVector(0,0.5);
float dt = 0.6;
float radio = 25;
int i=0;

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
  
  // Actualiza las partÃ­culas: colisiones y dibujado
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
  float radio;
  
  
  Particle(PVector local, float radio_)
  {
    place = local.get();
    vel = new PVector( random(-5,5), random(-5,5) );
    a = new PVector();
    radio = radio_;
    
    i++;
  }
  
  void applyForce(PVector force)
  {
    PVector fuerza = PVector.div(force.get(),masa);
    a.add(fuerza);
  }
  
  void display()
  {
    fill(255);
    ellipse(place.x, place.y, 50, 50);
  }
  
  void update() //Metodo Euler(semi)
  {
    applyForce(gravedad);
    vel.add(PVector.mult(a,dt));
    place.add(PVector.mult(vel,dt));
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
  float Kr= 0.9;
  
  PVector dif1, dif2, VecP1Project, VecP2Project ;
  float escalar_p1Norm;
  float escalar_p1Plano, escalar_p2Plano, modulo_plano, magP1, magP2;
  float p1Project, p2Project;
  PVector perpend, unitario;
  
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
    
    unitario = new PVector();
    
    ////escalar_p1Norm = dif1.dot(normal);
    //Modulo del plano
    modulo_plano = plano.mag();

    //ProyecciÃ³n del vector 1 en el plano
    escalar_p1Plano = dif1.dot(plano);
    p1Project = escalar_p1Plano/modulo_plano;
    //VecP1Project = PVector.mult(plano, p1Project);
    //magP1 = VecP1Project.mag();
    
    escalar_p2Plano = dif2.dot(plano);
    p2Project = escalar_p2Plano/modulo_plano;
    //VecP2Project = PVector.mult(plano, p2Project);
    //magP2 = VecP2Project.mag();
    unitario.set(plano);
    unitario.normalize();
    
    //Vector distancia perpendicular entre objeto y plano
    perpend = PVector.add(dif1,PVector.mult(unitario, p1Project*(-1)));
    
    if(abs(p1Project) < modulo_plano && abs(p2Project) < modulo_plano)
    {
      if(perpend.mag() < radio){
        PVector direc_n = normal.get();
        if(direc_n.dot(b.vel)>0)
           direc_n.mult(-1);
        
        float angle = PVector.angleBetween(b.vel, plano);
        float d_s = (radio+perpend.dot(direc_n))/sin(angle);
        PVector desplazamiento = PVector.mult(direc_n, d_s);
        b.place.add(desplazamiento);
        
        float nv = normal.dot(b.vel);
        PVector vN = PVector.mult(normal,nv);
        PVector vT = PVector.sub(b.vel,vN); 
        b.vel = PVector.sub(vT,PVector.mult(vN,Kr));
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
    
    Plano arriba = new Plano(15+55, 15, width-70, 15);
    Plano derecha = new Plano(width-15, 15+90, width-15, height-15);
    Plano derecha2 = new Plano(width-70, 15+90, width-70, height-70);
    Plano izquierda = new Plano(15, 15+90, 15, height-70);
    Plano diagonal = new Plano(width-15,15+90,width-70,15);
    Plano diagonal2 = new Plano(15,15+90,15+55,15);
    
    Plano p1 = new Plano((width-55)/2-100,height-150,(width-55)/2+100,height-150);
    Plano p2 = new Plano((width-55)/2-250,height-250,(width-55)/2-100,height-150);
    Plano p3 = new Plano((width-55)/2+100,height-150,(width-55)/2+250,height-250);
    
    Plano p4 = new Plano(15,height-70,(width-55)/2-100,height-35);
    Plano p5 = new Plano((width-55)/2+100,height-35,width-70,height-70);
    
    
    //Añadimos los planos al ArrayList  
    planos.add(arriba);
    planos.add(derecha);
    planos.add(derecha2);
    planos.add(diagonal);
    planos.add(diagonal2);
    planos.add(izquierda);
    planos.add(p1);
    planos.add(p2);
    planos.add(p3);
    planos.add(p4);
    planos.add(p5);
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
  
    


