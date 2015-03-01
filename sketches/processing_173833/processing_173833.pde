
// Trazos radiales" 2014 / Jaime Rodriguez

Orbit one[];
int cantidad = 200;

void setup() {
  size(800, 800);
  smooth();
  inicio();
}

void draw() {
  noStroke();
  noCursor();
  fill(255, 20);

  for ( int i = 0; i < cantidad; i++) {
    if (i != 0) {
      one[i].update(mouseX, mouseY);
      one[i].display();
    }
  }
}

void inicio() {
  one = new Orbit[ cantidad ];
  for (int i = 0; i < cantidad; i++) { 
    one[i] = new Orbit(i);
  }
}


class Orbit {

  /////atributos

  int locx;
  int locy;
  float radio;

  float t;
  float c;
  float x;
  float y;

  boolean limit;
  float vel_radial;
  float vel_ang;
  float pos_radial;

  float minimo;
  float maximo;

  float id;

  /////constructor

  Orbit(int _id) {

    locx = width/2;
    locy = height/2; 

    limit = true;
    vel_ang = random(-0.01, 0.01);
    vel_radial = random(-0.5, 0.5);
    pos_radial = random(-PI, PI);
    minimo = 3;
    maximo=400;
    radio = random(minimo, maximo);

    id = _id;

    c = 20;
    t = random(1, 4);
  }

  /////metodos
  void update(int locx, int locy) {
    pos_radial +=vel_ang;

    if (limit) {
      radio +=vel_radial;
    } else {
      radio -=vel_radial;
    }

    if (radio > maximo) {
      limit = false;
    }
    if (radio < minimo) {
      limit = true;
    }

    x =  locx+(radio * sin(pos_radial));
    y =  locy+(radio * cos(pos_radial));
  }

  void display() {
    noStroke();
    fill(c, 30);

    ellipse(x, y, t, t);
    noStroke();
  }
}





