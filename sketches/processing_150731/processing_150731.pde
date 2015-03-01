
/**
 * Simple Pimball
 * 
 * Pablo Casanova y Juan Carlos Leal
 */
 
Tablero pim;
ArrayList<Particle> bolas;
int i=0;
float dt = 0.2;
float radius = 16;
float score = 0;
PVector vInicial=new PVector(0,0);

void setup() {
  size(800,500);
  
  // Campo: Extremos de la pantalla
  pim = new Tablero();
  
  // Bolas
  bolas = new ArrayList<Particle>();
  int maxBolas = 7;
  PVector pos1 = new PVector(width/2,height/2);

  for (int i = 0; i < maxBolas; i++){
  Particle p = new Particle(pos1, radius);
  bolas.add(p); 
  }
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
  Particle p = new Particle(pos, radius);
  bolas.add(p);
}


/*
 * Clase para describir las diferentes partículas
 *
**/

class Particle{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass = 2;
  float radius;
  PVector gravity = new PVector(0,0);
  color c;
  Particle(PVector pos, float r){
    acceleration = new PVector(0, 0);
    location = pos.get();
    velocity = new PVector(random(10,30), random(-10,16));
    radius = r;
    i++;   
     c = color(random(0,255), random(0,255), random(0,255));
  }

  //F = m * a
  void applyForce(PVector f){
    PVector force = PVector.div(f.get(), mass);
    acceleration.add(force);
  }

  void run(){
    update();
    display();
  }  
  
  //Método para actualizar la posición
  void update(){
    applyForce(gravity);    
    velocity.add(PVector.mult(acceleration, dt));
    location.add(PVector.mult(velocity, dt));
    acceleration = new PVector(0,0); 
  }

  //Método para el display
  void display(){
    
    stroke(120);
    strokeWeight(1);
    fill(c);
    ellipse(location.x, location.y, radius*2, radius*2);  
 
    /*
    imageMode(CENTER);
    image(img,location.x,location.y);  
    */
  }
  
  
}
class Plano{
  PVector pto1;  //Principio Plano
  PVector pto2;  //Final Plano
  PVector plano;  
  PVector normal;
  float Kr= 0.9;
  
  Plano(float x1, float y1, float x2, float y2)
  {
    pto1 = new PVector(x1,y1);
    pto2 = new PVector(x2,y2);
    plano = PVector.sub(pto2, pto1);
    normal =  new PVector(-plano.y, plano.x);
    normal.normalize();
  }
  
  // Colisiones con el plano (pto1, pto2)
  void checkCollisions(Particle p)
  {
    //Comienzo del plano y final del plano
    PVector xp1 = PVector.sub(pto1, p.location);
    PVector xp2 = PVector.sub(pto2, p.location);
    PVector dist;
    PVector planoUnit = new PVector (0,0);
    
    //Calculamos el modulo del plano
    float modPlano = plano.mag();
    //Proyeccion de los vecotres en el vector Plano
    float proj1= xp1.dot(plano)/modPlano;
    float proj2= xp2.dot(plano)/modPlano;
    planoUnit.set(plano);
    planoUnit.normalize();
    
    //Vector distancia perpendicular entre el objeto y el plano
    dist = PVector.add(xp1,PVector.mult(planoUnit,proj1*(-1)));
   
    // Check collision
    if(abs(proj1) < modPlano && abs(proj2) < modPlano){
      if(dist.mag() < p.radius){   
        PVector dirNorm = normal.get();
        if(dirNorm.dot(p.velocity)>0)
          dirNorm.mult(-1);
         
        //Reposicionamiento 
        float angle = PVector.angleBetween(p.velocity,plano);
        float deltaS = (p.radius+dist.dot(dirNorm))/sin(angle);
        PVector desp1 = PVector.mult(dirNorm,deltaS);
        p.location.add(desp1);
        //Calculo de Velocidad de Salida
        float nv = normal.dot(p.velocity);
        PVector vN = PVector.mult(normal,nv);
        PVector vT = PVector.sub(p.velocity,vN); 
        p.velocity = PVector.sub(vT,PVector.mult(vN,Kr));
        
       
      }  
    }
    //Casos en los que las particulas rebotan en los extremos del plano
    else if (abs(xp1.mag()) <p.radius){
     
    }
    else if (abs(xp2.mag())<p.radius){
    
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
    
    Plano arriba = new Plano (15,15,width-15,15);
    Plano abajo = new Plano (15,height-15,width-15,height-15);
    Plano derecha = new Plano (15,15,15,height-15);
    Plano izquierda = new Plano (width-15,15,width-15,height-15);
    planos.add(arriba);
    planos.add(abajo);
    planos.add(derecha);
    planos.add(izquierda);
   
  }
 
  

  void update()
  {
    for (int i = planos.size()-1; i >= 0; i--) {
       Plano p = planos.get(i);
       for (int j = 0; j < bolas.size(); j++){
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
      for (int i = 0; i < planos.size(); i++){
        Plano p = planos.get(i);
          
        line(p.pto1.x, p.pto1.y, p.pto2.x, p.pto2.y);
      }

  }
}


