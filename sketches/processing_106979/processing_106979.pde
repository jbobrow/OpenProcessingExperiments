

circulo[] forma;

void setup() {
  ellipseMode(CENTER);
  size(500, 500);
  forma =new circulo[40];
  smooth();
  for (int i=0;i<=59;i++) {
    forma[i]=new circulo((int)random(20, 50), new PVector(random(0, 400), random(0, 400)), (int)random(0, 255), (int)random(0, 255), (int)random(0, 255));
  }
}

void draw() {
  background(50);
  for (int i=0;i<=59;i++) {
    forma[i].mostrar();
  }
}


class circulo {
  float v= 0;
  int x, y, z;
  PVector Velocidad;
  PVector Aceleracion;
  float diametro;//masa
  PVector pos=new PVector();
  circulo(int diametro, PVector pos, int x, int y, int z) {
    this.x=x;
    this.y=y;
    this.z=z;
    this.diametro=diametro;
    this.pos=pos;
    Aceleracion=new PVector(0, 0);
    Velocidad=new PVector(0, 0);
  }


  void mostrar() {
    
    noStroke();
    
    float viento= map(noise(v),0,1,-6,6);
    fill(x, y, z, 102);
    ellipse(pos.x, pos.y, diametro, diametro);
    PVector gravedad=new PVector(0, 0.40*diametro);
    
    PVector resistencia=Velocidad.get();
    float perder = 5.7;
    resistencia.mult(-1);
    resistencia.normalize();
    resistencia.mult(perder);//
    mause();
    aplicarFuerza(new PVector(viento,0));
    aplicarFuerza(gravedad);
    aplicarFuerza(resistencia);
    Actualizar();
    rebotar();
    v+=0.03;
  }
  void Actualizar() {//velocidad
    Velocidad.add(Aceleracion);
    Velocidad.limit(11);
    pos.add(Velocidad);
    Aceleracion.mult(0);
  }
  //fuerza
  void aplicarFuerza(PVector f) {
    PVector M=PVector.div(f, diametro);
    if (mouseButton==LEFT) {
      M.mult(-1);
      Aceleracion.add(M);
      if (mousePressed==false) {
        M.mult(-1);
        Aceleracion.add(M);
      }
    }
    Aceleracion.add(M);
  }
  void rebotar() {
    if (pos.y>height-diametro/2 || pos.y<0+diametro/2) {
      Velocidad.y=Velocidad.y*-1;
      if (pos.y>height-diametro/2) {
        pos.y=height-diametro/2;
      }if(pos.y<0+diametro/2){
        pos.y=diametro/2;
      }
    }
    if (pos.x<0+diametro/2 || pos.x>width-diametro/2) {
      Velocidad.x=Velocidad.x*-1;
      if(pos.x<0+diametro/2){
        pos.x=diametro/2;
      }if(pos.x>width-diametro/2){
        pos.x=width-diametro/2;
      }
    }
  }
  void mause() {
    if (mousePressed) {
      PVector posMouse=new PVector(mouseX, mouseY);
      PVector X=PVector.sub(posMouse, pos);
      float coe=74;
      X.normalize();
      X.mult(coe);
      aplicarFuerza(X);
    }
  }
}



