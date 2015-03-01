
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
  int maxBolas = 15;
  

  for (int i = 0; i < maxBolas; i++){
  PVector pos1 = new PVector(random(300,500),random(200,400));
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
    //Colisiones partícula-partícula
  void collision(Particle p){
    PVector dif = PVector.sub(this.location, p.location);
    PVector d= new PVector(0,0);
    d.set(dif);
    float dist = d.mag();
    
    //Check Collision
    if(dist < this.radius + p.radius){
      // Calculamos la velocidad normal
      PVector w1 = new PVector(0,0);
      w1.set(d);
      w1.normalize();
      PVector vNormal1 = PVector.mult(w1,this.velocity.dot(d)/dist);
      PVector vNormal2 = PVector.mult(w1,p.velocity.dot(d)/dist);
      
      // Calculamos la velocidad tangencial
      PVector vTang1 = PVector.sub(this.velocity, vNormal1);
      PVector vTang2 = PVector.sub(p.velocity, vNormal2);
     
      // Restitución
      float L = (this.radius + p.radius) - dist;
      float vrel = (PVector.sub(vNormal1, vNormal2)).mag();
      //Vector distancia perpendicular entre las dos partículas
      this.location = PVector.add(this.location,PVector.mult(vNormal1, -L/vrel));
      p.location = PVector.add(p.location,PVector.mult(vNormal2,-L/vrel));
      
      //Componentes de la velocidad normal después del impacto
      float m1 = this.mass;
      float m2 = p.mass;
      float u1 = vNormal1.dot(d)/dist;
      float u2 = vNormal2.dot(d)/dist;
      float v1 = (((m1-m2)*u1)+(2*m2*u2))/(m1+m2);
      float v2 = (((m2-m1)*u2)+(2*m1*u1))/(m1+m2);
      
      //Vectores de la velocidad normal después de la colisión
      vNormal1 = PVector.mult(w1, v1);
      vNormal2 = PVector.mult(w1, v2);
      
      //Velocidad final
      this.velocity = PVector.add(vNormal1, vTang1);
      p.velocity = PVector.add(vNormal2, vTang2);
    }     
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


