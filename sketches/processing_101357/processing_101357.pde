

int n=50;
Circulo[] circulos = new Circulo [n]; //construimos el array de objetos "Circulo"

void setup() {
  size (1024, 576);
  //size(displayWidth, displayHeight);

  for (int i=0; i<n; i++) {
    circulos [i] = new Circulo (); //creamos la instancia del objeto "n" veces
    circulos [i].x=random (0, width);
    circulos [i].y=random (0, height);
    circulos [i].vx=random (-2, 2);
    circulos [i].vy=random (-2, 2);
    circulos [i].tam=(int)random (10, 100);
    circulos [i].red=(int) random (127, 255);
    circulos [i].gre=(int) random (0,127);
    circulos [i].blu= (int)random (0, 127);
    circulos [i].alf=127;
  }
}


void draw() {
  background(0);

  for (int i=0; i<n; i++) {
    circulos [i].actualizar ();
    circulos [i].dibujar ();
    circulos [i].pintar ();
    for (int j=i; j<n; j++) {
      
      float d=dist(circulos[i].x, circulos[i].y, circulos[j].x, circulos[j].y);
      
      if (d<150) {
      stroke (255);
      strokeWeight(.5);
      line (circulos[i].x, circulos[i].y, circulos[j].x, circulos[j].y);
      
    }
    }
  }
}

class Circulo {

  float x;
  float y;
  float vx;
  float vy;
  int tam;
  int red;
  int blu;
  int gre;
  int alf;


  Circulo() {
   // println("circulo creado!!");
  }

  void actualizar() {
    x+=vx;
    y+=vy;

    if (x < 0 || x >width) {
      vx=-vx;
    }
    if (y <0 || y >height) {
      vy=-vy;
    }
  }

  void dibujar() {
    smooth();
    noStroke();
    ellipse(x, y, tam, tam);
  }

  void pintar() {
    noStroke ();
    fill(red, gre, blu, alf);
    
  }
}



