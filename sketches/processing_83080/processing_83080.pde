
Pelota a, b, c, d, e, f, g, h;  // Declarar el Objeto
triangulo [] MiTriangulo = new triangulo[1];
Triesfera [] MiTriesfera = new Triesfera[1];

void setup() {

  size(1024, 700);
  background(255);
  frameRate(8);

  for (int i=0; i<MiTriangulo.length;i++) {
    MiTriangulo[i] = new triangulo();
    MiTriangulo[i].calcularTriangulo();
  }
  for (int i=0; i<MiTriesfera.length;i++) {
    MiTriesfera[i] = new Triesfera();
    MiTriesfera[i].calcularTriesfera();
  }
  ellipseMode(RADIUS);
  a = new Pelota(10, 0, 500, 30, 70, 179, 247);    // creacion Objeto
  b = new Pelota(15, 10, 400, 60, 64, 156, 188 );
  c = new Pelota(30, 20, 300, 90, 174, 234, 255);
  d = new Pelota(40, 30, 800, 40, 0, 45, 73);
  e = new Pelota(15, 40, 1000, 70, 27, 66, 155);
  f = new Pelota(10, 50, 900, 80, 72, 237, 186);
  g = new Pelota(60, 60, 1000, 50, 255, 255, 255);
  h = new Pelota(10, 70, 1000, 100, 113, 188, 244);
}

void draw() {

  for (int i=0; i<MiTriangulo.length;i++) {
    MiTriangulo[i].dibujarTriangulo();
  }
  for (int i=0; i<MiTriesfera.length;i++) {
    MiTriesfera[i].dibujarTriesfera();
  }
  a.update(); // cian
  a.display();
  b.update(); // azul deslavado
  b.display();
  c.update(); // calipso
  c.display();
  d.update(); // azul marino
  d.display();
  e.update(); // azul electrico
  e.display();
  f.update(); // calipso verdoso
  f.display();
  g.update(); // celeste grisaseo
  g.display();
  h.update(); // blanco
  h.display();
}
class Pelota {    

  float xpos;    
  float ypos;
  float grande;
  float radius;
  float speed;
  float direction = 1;
  float diam;
  int rojo, verde, azul; 

  Pelota (float s, float x, float g, float d, int ro, int ve, int az) {  // Constructor
    speed = s;
    xpos = x;
    grande = g;
    ypos = 200;
    diam = d;
    rojo = ro;
    verde = ve;
    azul = az;
  }

  void update() {
    radius += 0.1;
    ypos = ypos + 20;
    xpos += speed * direction;
    if ((xpos > width) || (xpos < 0)) {
      direction *= -1;
    }
  }

  void display() {
    strokeWeight(random(0.5, 4));
    stroke(255);
    fill(rojo, verde, azul, SCREEN);
    ellipse(xpos, noise(ypos)*grande, noise(radius)*diam, noise(radius)*diam);
  }
}

class triangulo {
  color[] elColor = new color[30];

  triangulo() {
  }

  void calcularTriangulo() {
    for (int i = 0; i < elColor.length; i++) {
      elColor [i] = color (int(random(0, 72)), int(random(66, 237)), int(random(120, 255)), MULTIPLY);
    }
  }

  void dibujarTriangulo() {

    pushMatrix();
    beginShape();
    strokeWeight(random(0.5, 4));
    stroke(255);
    fill(elColor[20], 70);
    vertex(512, 350);
    quadraticVertex(random(-100, 1100), random(-150, 1200), random(-200, 1300), random(-250, 1400));
    quadraticVertex(random(-250, 1100), random(-100, 1200), random(-200, 1300), random(-150, 1400));
    endShape(CLOSE);
    popMatrix();
  }
}
class Triesfera {
  color[] daleColor = new color[30];

  Triesfera() {
  }

  void calcularTriesfera() {
    for (int i = 0; i < daleColor.length; i++) {
      daleColor [i] = color (int(random(0, 72)), int(random(66, 237)), int(random(120, 255)), MULTIPLY);
    }
  }

  void dibujarTriesfera() {
    fill(daleColor[10]);
    ellipse(512, 350, random(10, 50), random(10, 50));
    pushMatrix();
    beginShape(LINES);
    strokeWeight(random(1, 3));
    stroke(255);
    noFill();
    vertex(512, 350);
    vertex(random(-100, 1100), random(-150, 1200));
    vertex(random(-100, 1100), random(-150, 1200));
    vertex(random(-100, 1100), random(-150, 1200));
    endShape();
    popMatrix();
    pushMatrix();
    beginShape(LINES);
    strokeWeight(random(0.5, 2));
    stroke(daleColor[10]);
    noFill();
    vertex(random(-100, 1100), random(-150, 1200));
    vertex(random(-100, 1100), random(-150, 1200));
    vertex(random(-100, 1100), random(-150, 1200));
    endShape();
    popMatrix();
  }
}
