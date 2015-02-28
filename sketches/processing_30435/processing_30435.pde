
Circulos[] circle;
int circlecantidad = 150;
int circleelejido=2;
int onoff=0;
color verde= color(20, 40, 40, 80);
int sizecircle=10;

void setup() {
  randomSeed(6);
  size(600, 600);
  colorMode(HSB, 360, 100, 100);
  background(200);
  smooth();
  noStroke();
  //array de objetos
  circle = new Circulos[circlecantidad];
  for (int i = 0 ; i < circlecantidad; i++) {
    circle[i] = new Circulos(random(width), random(height), verde);
  }

}

void draw() {
  background(200);
  for (int i = 0;i < circlecantidad;i++) {
    circle[circleelejido].eleccion();  
    circle[i].mostrar();
    circle[i].later(); 
    circle[i].latertamanio();
  }
}



class Circulos {
  float x, y;
  float varposx, varposy;
  float inctamanio, vartam;
  color colorcircle;


  Circulos(float xpos, float ypos, color colores) {
    x=xpos;
    y=ypos;
    colorcircle=colores;
  }
  void mostrar() {
    fill(colorcircle);
    ellipse(x + varposx, y + varposy, sizecircle + inctamanio + vartam, sizecircle + inctamanio + vartam);
  }

  void later() {
    varposx+= random(-1, 1);
    varposy+= random(-1, 1);
  }
  void latertamanio() {
    inctamanio += random(-0.5, 0.5);
  }

  void eleccion() {
    if (mousePressed==true) {
      colorcircle=color(20, 80, 100);
      vartam+=(200-vartam)* 0.005;
    }
    if (mousePressed==false) {
      colorcircle=verde;
      vartam+=(1-vartam)*0.0007;
    }
  }
}


