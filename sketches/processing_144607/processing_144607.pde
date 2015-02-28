
//bolita a;
bolita listabolitas[]=new bolita [500];
void setup () {
  size(800, 800);
  for (int i=0; i<listabolitas.length;i ++) {
    color c = color(random( 255),0, 255);
    listabolitas [i]=new bolita(random (width), random (height), 5, 2, 21, c);
  }
}

void draw () {
  background(255);
  for (int i =0; i<listabolitas.length;i ++) {
    listabolitas [i].mover ();
    listabolitas [i].dibujar ();
  }
}

class bolita {
  float velocidadx;
  float velocidady;
  int direccionx=1;
  int direcciony=1;
  int radio;
  color color1;
  float x, y;
  void mover() {
    x+= velocidadx *direccionx;
    y+= velocidady *direcciony;
    if (x>width ||x<0) {
      direccionx=-direccionx;
    }
    if (y>height ||y<0) {
      direcciony=-direcciony;
    }
  }
  void dibujar () {
    fill (color1);
    ellipse (x, y, radio, radio);
  }
  bolita (float x, float y, float vx, float vy, int r, color c) {
    this.x=x;
    this.y=y;
    this.velocidadx=vx;
    this.velocidady=vy;
    this.radio=r;
    this.color1=c;
  }
}



