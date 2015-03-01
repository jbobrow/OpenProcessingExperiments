
PVector gravedad = new PVector(0,9.8);
float pendulo_long = 250;
float dt = 0.3;
Pendulo pend;

void setup() 
{
  size(800,500);
  pend = new Pendulo(pendulo_long);
}

void draw() 
{
  background(160);
  pend.run();
}
void keyPressed()
{
  if (key==' ')
     pend = new Pendulo(pendulo_long);
}

class Pendulo 
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float longitud;
  float masa=20;
  PVector peso;
  float ang = radians(45);
  
  Pendulo(float l)
  {
    location = new PVector(0,0);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    longitud=l;
    location.set((width/2)+longitud*sin(ang),longitud*cos(ang));
    
    peso = PVector.mult(gravedad,masa);
  }
  void run() 
  {
    update();
    display();
  }
  void computoFuerzas() 
  {
    PVector distancia = new PVector(0,0);
    PVector distanciaUnitaria = new PVector(0,0);
    PVector ft;
    float fcp;
    float mgcos;
    distancia.x = location.x-(width/2.0);
    distancia.y = location.y;
    fcp= masa * (velocity.mag()*velocity.mag() / longitud);
      
    distanciaUnitaria.set(distancia);  
    distanciaUnitaria.normalize(); 
    mgcos = proyeccion(peso, distancia);
      
    ft = distanciaUnitaria.get();
    ft.mult(-(mgcos+fcp));
   
    applyForce(peso);
    applyForce(ft);
  }
  float proyeccion(PVector v1, PVector v2) 
  {
    float proy = 0;
    
    if( (v1.mag() != 0) && (v2.mag() != 0) )
    {
      proy = v1.dot(v2) / v2.mag();
    }
    
    return proy;
  }

  void applyForce(PVector force) 
  {
    PVector f = PVector.div(force.get(), masa);
    acceleration.add(f);
  } 

  void update() 
  {   
    computoFuerzas();
    
    // EULER (SEMI)
    velocity.sub(PVector.mult(acceleration, dt));
    location.sub(PVector.mult(velocity, dt));
    
    acceleration.set(0,0);
  }

  // Method to display
  void display() 
  {
    stroke(50, 0, 250);
    strokeWeight(5);
    fill(180, 0, 180);
    
    //Cuerda
    line(width/2.0, 0, location.x, location.y);
    
    //Bola
    ellipse(location.x,location.y,40,40);
    
    fill(255);
    text("frame rate: " + frameRate, 15, 15);
  }
}  


