
// Escala

/*
 * La escala es relativa, los objetos parecen más grandes
 * o más pequeños por su tamaño, posicion y contexto.
 
 * Del mismo se puede jugar a un cambio de posición, 
 * realizando solo un cambio de escala. Este ejercicio 
 * simula un salto o bote tridimensional mediante un simple
 * cambio de escala
*/

// CONSTANTES
float lap=.001;
float v0=-10;
float gravity=10;
float d0 = 5;

float radius;
float distance;
float t;
float velocity;
float x;
boolean forward;

void setup() {
  size(192,157);
  radius = width/2;
  distance = d0;
  t = 0;
  velocity=v0;
  x = width*.25;
  forward = true;
}

void draw() {
  background(128);
  t+=lap;
  velocity+=gravity*t;
  distance+=velocity*t;
  if (forward) {
    x+=.5;;
  }
  else {
    x-=.5;
  }
  if (distance<=1) {
    distance=1;
    velocity=0;
    println(t);
    t=0;
  }
  if (distance>=d0) {
    distance=d0;
    velocity=v0;
    println(t);
    t=0;
    forward=!forward;
  }
  ellipse(x,height*.5,radius/distance,radius/distance);
}

