
Pelota b; // declarar el objeto
Pelota c;
Pelota d;
Pelota e;
Pelota f;
Pelota g;
Pelota h;
Pelota i;
Pelota j;
Pelota k;
Rectangulo l;
Rectangulo m;
Rectangulo n;

void setup() {
   background(10);
 
  size(800, 600);
  b = new Pelota(1.0,150,100,0,120,100); // creación del objeto y donde puedo cambiar las variables
  c = new Pelota(1.0,350,300,0,130,150);
  d = new Pelota(1.0,550,500,0,70,80);
  e = new Pelota(1.0,450,400,0,90,90);
  f = new Pelota(1.0,250,200,0,67,89);
  g = new Pelota(1.0,550,100,255,188,0);
  h = new Pelota(1.0,450,200,255,224,44);
  i = new Pelota(1.0,350,300,255,200,10);
  j = new Pelota(1.0,250,400,255,150,0);
  k = new Pelota(1.0,150,500,255,170,50);
  l = new Rectangulo(1.0,150,150,255,255,255);
  m = new Rectangulo(1.0,300,270,255,255,255);
  n = new Rectangulo(1.0,500,400,255,255,255);
  noStroke();
  ellipseMode(RADIUS);
}

void draw() {
 
  b.update();
  b.display();
  c.update();
  c.display();
  d.update();
  d.display();
  e.update();
  e.display();
  f.update();
  f.display();
  g.update();
  g.display();
  h.update();
  h.display();
  i.update();
  i.display();
  j.update();
  j.display();
  k.update();
  k.display();
  l.update();
  l.display();
  m.update();
  m.display();
  n.update();
  n.display();
  
  if(mousePressed) {
   b.speed += 0.5;
   c.speed += 0.5;
   d.speed += 0.5;
   e.speed += 0.5;
   f.speed += 0.5;
   g.speed += 0.5;
   h.speed += 0.5;
   i.speed += 0.5;
   j.speed += 0.5;
   k.speed += 0.5;
   l.speed += 0.5;
   m.speed += 0.5;
   n.speed += 0.5;
   
  }
}

void keyPressed(){
  saveFrame("##.jpg");
}

class Pelota { // bloque de la clase, el nombre de la clase siempre en mayúscula
  // aquí se pone los elementos que quiero trabajar
  float xpos;
  float ypos;
  float speed;
  float radius = 130;
  float direction = 1;
  int rojo,verde,azul;

  // el constructor se debe llamar igual que la clase.
  Pelota(float s, float x, float y, int ro, int ve, int az) { //constructor
    speed = s;
    xpos = x;
    ypos = y;
    rojo = ro;
    verde = ve;
    azul = az;
    
  }
 void update() {
    xpos += speed * direction;
    if ((xpos > width-radius) || (xpos < radius)) {
      direction *= -1;
    }
  }
  void display () {
    fill(rojo,verde,azul,100);
    ellipse(xpos, ypos, radius, radius);
 
  }
}

class Rectangulo { // bloque de la clase, el nombre de la clase siempre en mayúscula
  // aquí se pone los elementos que quiero trabajar
  float xpos;
  float ypos;
  float speed;
  float ancho = 150;
  float alto = 50;
  float direction = 1;
  int rojo,verde,azul;

  // el constructor se debe llamar igual que la clase.
  Rectangulo(float s, float x, float y, int ro, int ve, int az) { //constructor
    speed = s;
    xpos = x;
    ypos = y;
    rojo = ro;
    verde = ve;
    azul = az;
    
  }
 void update() {
    xpos += speed * direction;
    if ((xpos > width-ancho) || (xpos < ancho)) {
      direction *= -1;
    }
  }
  void display () {
    fill(rojo,verde,azul,180);
    rect(xpos, ypos, ancho, alto);
 
  }
}
