

class Gota {
 float x, y, a, b;
 float speed;
 
 Gota() {
  x = random(width);
  y = random(height);
  a = 2;
  b = 5;
  speed = random(5,15);
 }
  
 void display() {
   fill(255);
   noStroke();
   ellipse(x,y,a,b);
 }
  
 void fall() {
   y = y + speed;
 }
  
 void stop(Sombrilla u) {
  if (y > 400) {
    y = 0;
  }
   
  if (y > u.y-5 && x > u.x-49 && x < u.x+49) {
    y = 0;
  }
   
 }
}
class Sombrilla {
  float x, y, a, b;
 
  Sombrilla() {
    x = 0;
    y = 0;
    a = 100;
    b = 100;
  }
 
  void display() {
    x = mouseX;
    y = mouseY;
     
     
    fill(128,64,0);
    rect(x,y,5,50);
    fill(128,64,0);
    noStroke();
    arc(x,y,a,b, PI, TWO_PI);
  }
}
Sombrilla sombrilla;

Gota [] gotas = new Gota[800];
 
void setup() {
  size(900,400);
  smooth();
  for (int i = 0; i < gotas.length; i++) {
    gotas [i] = new Gota();
  }
    sombrilla = new Sombrilla();
   
}
 
void draw() {
  background(0);
  for (int i = 0; i < gotas.length; i++) {
    gotas[i].display();
    gotas[i].fall();
    gotas[i].stop(sombrilla);
 
  }
   
  sombrilla.display();
  
 
}

/*void draw()
{ 

  a = map(90,0,width,0,9);
  beginShape();
  for(int i=0; i<360; i++)
  {
    float y = height/2 -cos( radians(i) )*r;
    float x = width/2- sin( radians(i) ) * pow(sin(radians(i)/2), a) *r;
    vertex(x/5,y/5);
  }
  endShape();
}

Profe, 
1. Originalmente tratamos de hacer las gotas con coordenadas polares, pero al crear la clase, no nos funciona, no sabemos si es debido a las funciones matematicas o algun 
otro inconveniente, esa pate del codigo es la que se encuentra anterior a este comentario, debido a esto creamos otra clase de lluvia sin funciones matematicas.
2. El juego se trata, como ya previamente le habiamos comentado, de una sombrilla, y al caer la lluvia esta la detiene, (la sombrilla se puede mover).
3. Nos guiamos de el siguiente link donde muestra una animacion de unas pelotas que al caer rebotan.  http://processing.org/learning/topics/arraylistclass.html
*/

