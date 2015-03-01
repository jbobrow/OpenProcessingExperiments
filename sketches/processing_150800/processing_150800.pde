
// Ejercicio: Simular el modelo de péndulo introducido.
//ALINA HONHALA / 3º GIM

Pendulo2 pendulo;

PVector g = new PVector(0,9.8); //gravedad
float dt = 0.4;
float longP = 400;

void setup() 
{
  size(800,640);
  pendulo = new Pendulo2(longP);
}

void draw() 
{
  background(#008B8B);
  pendulo.run();
}
class Pendulo2 
{
  PVector gravedad;
  PVector peso;
  float masa = 10;
  float longitudP;
  PVector place; //localización
  PVector vel; //velocidad
  PVector a; //aceleración
  
  Pendulo2(float longP) 
  {
    gravedad = g.get();
    peso = new PVector(0,0);
    longitudP = longP;
    place = new PVector(0,0);
    vel = new PVector(0,0);
    a = new PVector(0,0);
    
    place.x = width/2 + longitudP * sin(radians(50)); //Origen + localización
    place.y = longitudP * cos(radians(50));
    
    peso.x = masa * gravedad.x; //Peso = masa * gravedad
    peso.y = masa * gravedad.y;
  }
  
  void calcularFuerza() 
  {
   
    PVector norm = new PVector(0,0);
    PVector tension;
    float fCentr;
    float proj_dir;
    PVector dir = new PVector(0,0); //cuerda
    
    dir.x = place.x - (width/2);
    dir.y = place.y;
    
    //Fcp = m*v*v / r
    fCentr = masa * vel.mag() * vel.mag() / longitudP;
    norm.set(dir);
    norm.normalize(); //norm = vector unitario en la direccion de la cuerda
    //dir.normalize(norm); 
    proj_dir = proyeccion(peso, dir); //proj_dir = m*g*cos(ang) -> Proyección
    tension = PVector.mult(norm, ( -(proj_dir+fCentr)) );
      
    applyForce(peso);
    applyForce(tension);
  }
  
  void applyForce(PVector force) 
  {
    PVector fuerza = PVector.div(force.get(), masa); // F = m * a
    a.add(fuerza);
  }
  
  float proyeccion(PVector vector1, PVector vector2) 
  {
    float pr = 0;
    if( (vector1.mag() != 0) && (vector2.mag() != 0) ){
      pr = vector1.dot(vector2) / vector2.mag();
    }
    return pr;
  }
  
  //Actualizamos la localización | Utilizamos Euler (semi)
  void update() 
  {   
    calcularFuerza();
    vel.sub(PVector.mult(a, dt)); // v = v - acel*dt
    place.sub(PVector.mult(vel, dt)); // x = x - v*dt
    a.set(0,0);
  }
  
  void display() 
  {
    stroke(0, 0, 0);
    strokeWeight(2);
    fill(255);
    line(width/2, 0, place.x, place.y); //dibujo de cuerda
    ellipse(place.x,place.y,50,50); //dibujo de la pelota
  }
  
  void run() 
  {
    update();
    display();
  }
  
}




