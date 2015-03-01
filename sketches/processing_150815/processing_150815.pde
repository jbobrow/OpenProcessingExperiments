
/**
 * Tabla Hash
 * 
 * Antonio Dávila
 */
 
Tabla tHash;
ArrayList<Particle> bolas;
PVector gravity = new PVector(0,9.8);
float dt = 0.5; 

int cell_s = 120;       // Tamaño de celda (4 particulas máximo por celda)
int t_s;               // Tamaño de tabla
int Nparticles = 350;   // Numero de particulas

void setup() {
  size(800,600);
  
  // Tamaño de la tabla = Numero Particulas * 2
  t_s = Nparticles*2;
  
  // Bolas
  bolas = new ArrayList<Particle>(); 
  
  for (int i=0; i<Nparticles; i++){
    PVector pos = new PVector(random(0, width), random(0, height));
    Particle p = new Particle(pos);
    bolas.add(p);   
  }
  
}

void draw() {
  background(0);
  fill(255);
  
  // Se crea la tabla hash cada vez
  tHash = new Tabla(cell_s, t_s);
  
  // Actualiza las partículas
  for (int i=0;i<bolas.size();i++){
    Particle p = bolas.get(i);
    tHash.insertar(p.location, p); 
    p.update();
    
    
    // Array de particulas vecinas, accediendo segun el valor hash a los distintos tipos de vecinos
    ArrayList<Particle> vecinos = new ArrayList<Particle>();
    PVector l = p.location.get();
    
    // La misma celda
    vecinos.addAll(tHash.comprobar(l));
    
    //Celda derecha
    l = p.location.get();
    l.x += cell_s;
    vecinos.addAll(tHash.comprobar(l));
    
    // Celda izquierda
    l = p.location.get();
    l.x -= cell_s;
    vecinos.addAll(tHash.comprobar(l));
    
    // Celda superior
    l = p.location.get();
    l.y -= cell_s;
    vecinos.addAll(tHash.comprobar(l));
    
    // Celda inferior
    l = p.location.get();
    l.y += cell_s;
    vecinos.addAll(tHash.comprobar(l));
    
    //Esquinas
    l = p.location.get();
    l.x += cell_s;
    l.y += cell_s;
    vecinos.addAll(tHash.comprobar(l));
    l = p.location.get();
    l.x -= cell_s;
    l.y -= cell_s;
    vecinos.addAll(tHash.comprobar(l));
    l = p.location.get();
    l.x += cell_s;
    l.y -= cell_s;
    vecinos.addAll(tHash.comprobar(l));
    l = p.location.get();
    l.x -= cell_s;
    l.y += cell_s;
    vecinos.addAll(tHash.comprobar(l));
    
    
    // Se comprueban las colisiones con el arraylist obtenido de la suma de las celdas vecinas de la tabla hash
    for (int j=0; j<vecinos.size(); j++){
      Particle q = vecinos.get(j);
      if (p != q){
        //stroke(255);
        //line(p.location.x, p.location.y, q.location.x, q.location.y);
        p.collision(q);
      }
    }
    
    p.display();
  }
  
  fill(255);
  text("frate: " + frameRate, 15, 15);
  text("Nº Particulas: " + Nparticles, 15, 30);
  
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

  Particle(PVector l) {
    acceleration = new PVector(0,0);
    velocity = new PVector(random(-1,1), random(-1,1));
    location = l.get();
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
  
  void collision(Particle b){
    PVector dist = PVector.sub(location, b.location);
     
    // Detección    
    if (dist.mag() < (radio + b.radio) ) {
      // normal velocity vectors just before the impact
      PVector normalVelo1 = project(velocity, dist);
      PVector normalVelo2 = project(b.velocity, dist);
     
      // tangential velocity vectors
      PVector tangentVelo1 = PVector.sub(velocity, normalVelo1);
      PVector tangentVelo2 = PVector.sub(b.velocity, normalVelo2);
      
      // Restitución
      float L = radio + b.radio - dist.mag();
      float vrel = PVector.sub(normalVelo1, normalVelo2).mag();
      location.add(PVector.mult(normalVelo1, -L/vrel));
      b.location.add(PVector.mult(normalVelo2, -L/vrel));
      
      
      // Velocidades de salida
    
      float m1 = mass;
      float m2 = b.mass;
      //Escalar u
      float u1 = projection(normalVelo1, dist);
      float u2 = projection(normalVelo2, dist);
      //Módulo v
      float v1 = ((m1-m2*Kr)*u1+(m2+m2*Kr)*u2)/(m1+m2);
      float v2 = ((m2-m1*Kr)*u2+(m1+m1*Kr)*u1)/(m1+m2);
      //Vector normal
      normalVelo1 = para(dist, v1);
      normalVelo2 = para(dist, v2);
      
      //Vector v
      velocity = PVector.add(normalVelo1, tangentVelo1);
      b.velocity = PVector.add(normalVelo2, tangentVelo2);  
    }  
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    //applyForce(gravity);
    
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

class Tabla {
  ArrayList<ArrayList<Particle>> th;
  int cell_size;
  int t_size;

  Tabla(int tam_celda, int tam_tabla){
    cell_size = tam_celda;
    t_size = tam_tabla;
    
    th = new ArrayList<ArrayList<Particle>>();
    
    for(int i = 0; i < t_size; i++){
      th.add(new ArrayList<Particle>());
    }
  }
 
  int hash(PVector p){
    // Calculo del valor hash
    
    int xd = (int)floor(p.x/cell_size);
    int yd = (int)floor(p.y/cell_size);
    int zd = (int)floor(p.z/cell_size);
    
    int h = (73856093 * xd + 19349663 * yd + 83492791 * zd) % t_size;
        
    if (h < 0)
      h += t_size;
    
    return h;
  }
  
  int insertar(PVector v, Particle p){
    int valor_hash = hash(v);
    
    // Se inserta la particula segun el valor hash obtenido
    th.get(valor_hash).add(p);
    
    return valor_hash;
  }
  
  ArrayList comprobar(PVector v){
    int valor_hash = hash(v);
    
    //Se devuelve el array de particulas segun el valor hash obtenido
    return th.get(valor_hash);
  }
} 


