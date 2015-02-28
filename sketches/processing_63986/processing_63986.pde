
class Estela {
  PVector pos, vel, acel, dest;
  PVector[] cola;
  int ultimo, longitudCola, radio;
  float acelMag = .3;
  color relleno;

  Estela (float pos_ini_x, float pos_ini_y, float pos_fin_x, float pos_fin_y, float vel_ini_x, float vel_ini_y) {
    this.longitudCola = 50;
    this.radio = 10; 
    this.cola = new PVector[longitudCola];
    this.pos = new PVector(pos_ini_x, pos_ini_y);
    this.vel = new PVector(vel_ini_x, vel_ini_y);
    this.acel=new PVector (0, 0);
    this.dest=new PVector (pos_fin_x, pos_fin_y);

    this.relleno = color(#ff0000);

    for (int i = 0 ; i < cola.length ; i++) {
      this.cola[i] = new PVector(this.pos.x, this.pos.y);
    }
    ultimo = 0;
  }

  Estela (PVector pos_ini, PVector pos_fin, float vel_ini_x, float vel_ini_y) {
    this.longitudCola = 50;
    this.radio = 10; 
    this.cola = new PVector[longitudCola];
    this.pos = new PVector(pos_ini.x, pos_ini.y);
    this.vel = new PVector(vel_ini_x, vel_ini_y);
    this.acel=new PVector (0, 0);
    this.dest=new PVector (pos_fin.x, pos_fin.y);

    this.relleno = color(#ff0000);

    for (int i = 0 ; i < cola.length ; i++) {
      this.cola[i] = new PVector(this.pos.x, this.pos.y);
    }
    ultimo = 0;
  }

  void draw() {
    noStroke();
    this.actualizaAcelereacion();
    this.avanza();
    for (int i = 0, j = ultimo + 1 ; i < cola.length ; i++, j++) {
      if ( j >= cola.length ) {
        j = 0;
      }
      this.pos.set(cola[j]);

      int f = (int)((float)i/(cola.length-1) * 50);
      fill(relleno, f);
      if (i==cola.length-1) fill (relleno, 255);
      ellipse(pos.x, pos.y, radio*2*(float)i/(cola.length), radio*2*(float)i/cola.length);
    }
  }

  void actualizaAcelereacion() {
    this.acel=PVector.sub(this.dest, this.cola[ultimo]);
    if (this.acel.mag() >0.1) {
      this.acel.div(this.acel.mag());
      this.acel.mult((1*acelMag));
    }
  }

  void avanza() {

    this.pos.set(cola[ultimo]);
    ultimo++;
    if ( ultimo >= cola.length ) {
      ultimo = 0;
    }
    this.vel.mult(0.95);
    this.vel.add(acel);
    this.pos.add(vel);
    cola[ultimo].set(this.pos);
    for (int i = 0, j = ultimo-1 ; i < cola.length-1 ; i++, j--) {
      if (j<0) j=cola.length-1;
      int previo = (j==cola.length-1?0:j+1);
      float distancia=PVector.dist(cola[j], cola[previo]);
      if (distancia >(radio/3)) {
        PVector aux= PVector.sub(cola[previo], cola[j]);
        float aux2= (distancia-(radio/3))/distancia;
        aux.mult(aux2);
        cola[j].add(aux);
      }
    }
  }

  boolean haLlegado(float proximidad) {
    int finalCola = ultimo+1;
    if (finalCola >= cola.length) finalCola=0;
    if (cola[finalCola].dist(dest)<proximidad) return true;
    else return false;
  }

  boolean haLlegadoPreciso (float proximidad) {
    boolean llegado=true;
    for (int i=0; i<cola.length; i++) {
      llegado = llegado & (cola[i].dist(dest)<=proximidad);
    }
    return llegado;
  }

  boolean haAlcanzado (float proximidad) {
    if (cola[ultimo].dist(dest)<proximidad) return true;
    else return false;
  }
}


