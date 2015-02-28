
//PRIMERO EL SKETCH PRINCIPAL
//ARRAYS
float[] xpos = {
  random(0, 500), random(0, 500), random(0, 500), random(0, 500), random(0, 500), random(0, 500), random(0, 500), random(0, 500), random(0, 500)
  };
float[] ypos = {
  random(0, 700), random(0, 700), random(0, 700), random(0, 700), random(0, 700), random(0, 700), random(0, 700), random(0, 700), random(0, 700)
  };
//DECLARACION DE VARIABLES
    int i;
int x=0;
int y=0;
int n;
float ini;
float fin;
//LLAMANDO A LAS CLASES
triangulo k;
radar a, b, c, d, e, f, g, h, j;
//SETUP
void setup() {
  //frameRate(10);
  size(500, 700);
  background(255);
  k = new triangulo (250, 350, 0.7);
  a = new radar (xpos[0], ypos[0], 1, 0, 100, 150);
  b = new radar (xpos[1], ypos[1], 2, 0, 100, 150);
  c = new radar (xpos[2], ypos[2], 3, 0, 100, 150);
  d = new radar (xpos[3], ypos[3], 4, 0, 100, 150);
  e = new radar (xpos[4], ypos[4], 5, 100, 100, 100);
  f = new radar (xpos[5], ypos[5], 6, 255, 50, 70);
  g = new radar (xpos[6], ypos[6], 7, 255, 50, 70);
  h = new radar (xpos[7], ypos[7], 7, 255, 50, 70);
  j = new radar (xpos[8], ypos[8], 7, 255, 50, 70);
}
//DRAW
void draw() {

//TRIANGULOS DE FONDO
  if (i==0) {
    for (n=0;n<50;n++) {
      k.update();
      k.display();
    }
  }

//CLASES
  a.update();
  a.display();

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

  j.update();
  j.display();
  
//LINEAS CONECTORAS
  if (i==0) {
    pushMatrix();
    stroke(100);
    strokeWeight(0.5);
    noFill();
    beginShape(TRIANGLE_STRIP);
    vertex(250, 0);
    vertex(xpos[0], ypos[0]);
    vertex(xpos[1], ypos[1]);
    vertex(xpos[2], ypos[2]);
    vertex(xpos[3], ypos[3]);
    vertex(xpos[4], ypos[4]);
    vertex(xpos[5], ypos[5]);
    vertex(xpos[6], ypos[6]);
    vertex(xpos[7], ypos[7]);
    vertex(xpos[8], ypos[8]);
    vertex(250, 700);
    endShape(CLOSE);
    popMatrix();
  }

//"PUNTOS DE VERTICE"
  noStroke();
  fill(100);
  ellipse(xpos[i], ypos[i], 3, 3);
  if (i<8) {
    i++;
  }
}

//AHORA, CLASE RADAR
class radar {
  float dis;
  float xpos;
  float ypos;
  float ini=-1;
  float fin=-1;
  float s;
  float rot;
  float t=random(0.2, 1.3);
  int c1;
  int c2;
  int c3;
//CONSTRUCTOR
  radar(float x, float y, float r, int ro, int g, int b) {
    xpos = x;
    ypos = y;
    rot = r;
    c1 = ro;
    c2 = g;
    c3 = b;
  }
//UPDATE
  void update() {
    ini+=random(0.1, 0.5);
    fin+=random(0.5, 1);
    dis = random(10, 200);
    s = random (5, 20);
    c1-=5;
    c2-=5;
    c3-=5;
    if (fin>TWO_PI) {
      ini=2*fin;
      
    }
  }
//DISPLAY
  void display() {
    pushMatrix();
    translate(xpos, ypos);
    rotate(rot);
    scale(t);
    noFill();
    stroke(c1, c2, c3);
    strokeWeight(s);
    strokeCap(SQUARE);
    arc(0, 0, dis, dis, ini, fin);
    popMatrix();
  }
}
//AHORA, CLASE TRIANGULO PARA EL FONDO
class triangulo {
  int a=0;
  int xpos;
  int ypos;
  float t;
  float r;
  float str;
//CONSTRUCTOR
  triangulo(int x, int y, float s) {
    xpos=x;
    ypos=y;
    str=s;
  }
//UPDATE
  void update() {
    t=random(1, 800);
    r=random(0, 5);
  }
//DISPLAY
  void display() {
    noFill();
    stroke(200);
    strokeWeight(str);
    pushMatrix();
    translate(xpos, ypos);
    //scale(t);
    rotate(r);
    beginShape();
    vertex(a, a-15-t);
    vertex(a+15+t, a+10+t);
    vertex(a-15-t, a+10+t);
    endShape(CLOSE);
    popMatrix();
  }
}

// END OF LINE
