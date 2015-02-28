
//Tarea Sistema de Particulas
//Profesor: Tomas de Camino
//Author: Mariana Mora con la asesoria directa de Paula Chavarria
//version 2, ajustes esteticos

particula[] conjunto;

int numeroparticula = 50;
void setup() {
  size (300, 300);
  smooth ();
  
  //color del background
 background (255,20,30);
//  noStroke ();
//  fill(255,200,200)
  
  conjunto = new particula[numeroparticula];
 //recorre la matriz 
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


//declara la clase particula con sus caracteristicas:
// incluyendo ubicacion, velocidad, aceleracion

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
  fill(5);
  ellipse(position.x, position.y,1,1);
}

}

