
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
    normal =  new PVector(-plano.y, plano.x);
    normal.normalize();
  }
  
   void checkCollisions(Particle b){
      
      //VECTORES PARA PROYECTARLOS SOBRE EL PLANO (VER SI COLISIONA)
      PVector p1 = new PVector(b.location.x - pto1.x, b.location.y - pto1.y);
      PVector p2 = new PVector(b.location.x - pto2.x, b.location.y - pto2.y);
  
      //COSENO DEL ANGULO ENTRE TRAYECTORIA Y LA NORMAL
      float dotP1Normal = p1.dot(normal);
      
         
      float dotPlanoPlano = plano.dot(plano);
      float modPlano = plano.mag();
      
      //PROYECCIÓN ESCALAR p1 SOBRE EL PLANO:
      float dotP1Plano = p1.dot(plano);
      PVector proyP1Plano = PVector.mult(plano, dotP1Plano/dotPlanoPlano);
      float proy1 = proyP1Plano.mag();
       
      
      //PROYECCION ESCALAR p2 SOBRE EL PLANO:
      float dotP2Plano = p2.dot(plano);
      PVector proyP2Plano = PVector.mult(plano, dotP2Plano/dotPlanoPlano);
      float proy2 = proyP2Plano.mag();
      
      
      
      if(proy1 < modPlano && proy2 < modPlano){
        
        if(abs(dotP1Normal) < radio){
          
          PVector incidence = new PVector(-b.velocity.x, -b.velocity.y);
          float dotIncidencePlano = incidence.dot(normal);
          PVector temp = PVector.mult(normal, (2*dotIncidencePlano));
          b.velocity = PVector.sub(temp, incidence);
        }
      }  
  }
  
}

// Tablero del Pimball
class Tablero {
  ArrayList<Plano> planos;

  Tablero() // Constructor: Crea el pimball
  {
    int maxPlanos = 3;
    planos = new ArrayList<Plano>();
    
    //DIBUJADO DE PLANOS:
    Plano p1 = new Plano(width/4, height/2, 3*width/4, height/2);
    Plano p2 = new Plano(width/8, height/2, width/2-width/8, 3*height/4);
    Plano p3 = new Plano(7*width/8, height/2, width/2+width/8, 3*height/4);
    planos.add(p1);
    planos.add(p2);
    planos.add(p3);
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

