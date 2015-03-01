


PSolitaria p;
PVector gravity = new PVector(0,9.8);

float dt = 0.2;
float longPendulo = 150;

void setup() {
  size(640,360);
  p = new PSolitaria(longPendulo);
}

void draw() {
  background(0);
  p.run();
}

void keyPressed(){
  


}

// Clase pendulo: Estructura basica del péndulo

class PSolitaria {//Variables basicas para pendulo
  PVector origin;
  PVector loc;
  PVector vel;
  PVector acc;
  
  PVector peso;
  float mass = 10;
  float lengthPend;
  float angIni = radians(45);
  
  PVector tension;
  float fCent;
  float proDist;//m*g*cos
  PVector distN;
  

  PSolitaria(float longPendulo) {
    
    acc = new PVector(0,0);
    vel = new PVector(0,0);
    loc = new PVector(0,0);
    origin = new PVector(width/2, 0);
    
    lengthPend = longPendulo;
    //situamos el pendulo en su posicion inicial
    loc.set(origin.x+lengthPend*sin(angIni), origin.y+lengthPend*cos(angIni));
  
    peso = gravity.get();
    peso.mult(mass);
    //peso = gravedad * masa;
  }
  
  void AplicarFuerza() {
    
    distN = new PVector(0,0);
    PVector dist = PVector.sub(loc, origin);
        
    if(dist.mag() >= lengthPend) {//Distancia >= longPendulo
      //Fuerza centripeta = M * V^2 / R
      fCent = mass * pow(vel.mag(),2) / lengthPend;
      distN = dist;
      distN.normalize();//Normalizamos la distancia
      proDist = projection(peso, dist);
      
      tension = distN.get();
      tension.mult(-(proDist+fCent));
      
    }
    else {//Si la distancia es menor que la longPendulo, no hay tension
      tension = new PVector(0,0);
    }
    
    applyForce(tension);
    applyForce(peso);
    
  }
  
  float projection(PVector v1, PVector v2) {
    float proj = 0;
    
    if( (v1.mag() != 0) && (v2.mag() != 0) ){
      proj = v1.dot(v2) / v2.mag();
    }
    
    return proj;
  }
  
  void run() {
    update();
    display();
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force.get(), mass);
    acc.add(f);
  } 

  void update() {   
    AplicarFuerza();
    
    vel.sub(PVector.mult(acc, dt));
    loc.sub(PVector.mult(vel, dt));
    
    acc.set(0,0);
  }

  // Method to display
  void display() {//Dibuja el pendulo
    stroke(255);
    fill(255);
    
    line(origin.x, origin.y, loc.x, loc.y);
  
    ellipse(loc.x,loc.y,40,40);
  
  }
}



