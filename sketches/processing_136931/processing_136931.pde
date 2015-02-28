
particula[] conjunto;

int numeroparticula = 50;
void setup() {
  size (300, 300);
  smooth ();
  conjunto = new particula[numeroparticula];
  
  for (int i=0; i<numeroparticula; i++)
  {
  PVector ini = new PVector (width/2, height/2); 
   particula actual = new particula(ini);
  conjunto[i] = actual;
  }
  
  
}

void draw () {
  
  for (int i=0; i<numeroparticula; i++)
  {
    particula actual = conjunto[i];
    
    
  actual.display();
  actual.update();
}
  
}
class particula{
 PVector position;
PVector velocity;
PVector acceleration;

particula (PVector initial) {
  position = initial.get();
  velocity = new PVector(random(-1, 1), random (-1, 1));
  acceleration = new PVector(0, 0.006);
}
void update() {
  position.add(velocity);
  velocity.add(acceleration);
}

void display() {
  fill(0);
  ellipse(position.x, position.y,1,1);
}

}


