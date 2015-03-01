
//Ejercicio: Implementar el emisor (fuente)
//ALINA HONHALA / 3º GIM

Particula2 p;

PVector g = new PVector(0,9.8); //gravedad
float dt = 0.1;
int i = 0;

void setup() 
{
  size(800,640);
  PVector center = new PVector(width/2, height/2);
  p = new Particula2(center);
}

void draw() 
{
  background(#008B8B);
  p.addP();
  p.run();
}
class Particula
{
  float masa = 10;
  float angulo;
  PVector vecAngulo;
  float mag = 15;
  float vida = 400;
  int n;
  PVector place; //localización
  PVector vel; //velocidad
  PVector a; //aceleración
  
  Particula(PVector place2)
  {
    n = i%7;
    angulo = (60+10*n) * PI/180;
    vecAngulo = new PVector(cos(angulo), sin(angulo));
    vel = PVector.mult(vecAngulo,mag); //velocidad = mag * angulo
    i++;
    
    place = place2.get();
    a = new PVector(0,0);
  }
  
  //Utilizamos Euler (semi)
  void update() 
  {
    vida = vida - 1.0;
    applyForce(g);
    vel.sub(PVector.mult(a, dt)); // v = v - acel*dt
    place.sub(PVector.mult(vel, dt)); // x = x - v*dt
    a.set(0,0);
  }

  void display() 
  {
    stroke(255,vida);
    fill(255,vida);
    ellipse(place.x,place.y,5,5);
  }  
  
  boolean tiempo_vida()
  {
    if(vida<0.0)
      return true; //la partícula debe desaparecer
    else
      return false;
  }
  
  void run() 
  {
    update();
    display();
  }

  void applyForce(PVector force)
  {
    PVector fuerza = PVector.div(force.get(), masa); // a = F / m
    a.add(fuerza);
  } 

  
  
}
class Particula2
{
  ArrayList<Particula> particulas;
  PVector local;
  
  Particula2(PVector place)
  {
    particulas = new ArrayList<Particula>();
    local = place.get();
  }
  
  void addP() //Añadir particula
  {
    Particula p = new Particula(local);
    particulas.add(p);
  }
  
  void run()
  {
    for(int i=particulas.size()-1; i>=0; i--)
    {
      Particula part = particulas.get(i);
      part.run();
      
      if(part.tiempo_vida())
        particulas.remove(i); //eliminamos la particula si su tiempo de vida es cero
      
    }
  }
  
  
  
}


