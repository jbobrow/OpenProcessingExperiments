

planeta p;
int contador = 0;
int contador2 = 0;
int total = 300;
ArrayList cosas = new ArrayList();
ArrayList planetas = new ArrayList();
//PVector posPlaneta;

//declaramos variables
PVector gravedad/*,f2*/;
float fgrav = 0.2;

void setup() {
  size(600, 450);
  //smooth(); 
  noStroke();
  cursor(CROSS);
  //inicializamos variables
  gravedad = new PVector(0, fgrav);
  //posPlaneta = new PVector(width, height);
  for (int i=0; i<2; i++) {
    planeta p = new planeta(random(100, width), random(100, height), 5, random(60, 120)); 
    planetas.add(p);
  }
  //f2 = new PVector(0.2, 0);
  for (int i=0; i<total; i++) {
    cosa c = new cosa();
    cosas.add(c);
  }
}

void draw() {

  background(0, 0, 0, 1);

  contador ++;
  contador2 = contador%60;
  println(contador2);
  //contador = 0;


  for (int j=0; j<planetas.size(); j++) {
    planeta p = (planeta) planetas.get(j);

    // c.calcularAcercamientoPlaneta();
    for (int i=0; i<cosas.size(); i++) {
      cosa c = (cosa) cosas.get(i);
      //falta c.calcularAcercamiento();
      if (mousePressed) {
        c.calcularAcercamientoRaton();
      } 
      else {
        PVector disPlaneta = PVector.sub(p.posPlaneta, c.posicion);
        disPlaneta.normalize();
        disPlaneta.mult(c.velAcercamiento);
        c.addForce(disPlaneta);
      }
      p.run();
      c.run();
    }
  }
}

class planeta {
  //variables
  PVector posPlaneta;
  float sz, vel;
  //PVector sec = new PVector(0, 0);
  float angSec = 0;
  float radSec = 0;
  float randm = 0;

  //constructor
  planeta(float _x, float _y, float _v, float _sz) {
    posPlaneta = new PVector(_x, _y);
    vel = _v;
    sz = _sz;
    radSec = random(20, 300);
    randm = random(1, 4);
  }
  //funciÃ³n run (la que llamamos desde el draw)
  void run() {
    actualizar();
    dibujar();
  }
  //funciÃ³n para actualizar posPlanetaiciones
  void actualizar() {
    sz = random(60, 100);
    angSec = map(contador2, 0, 59, PI, -PI);
    posPlaneta.x = width/2 + (radSec * sin(angSec));  
    posPlaneta.y = height/2 + (radSec * cos(angSec));

    /*PVector mouseP = new PVector(mouseX, mouseY);
     PVector disP = PVector.sub(mouseP, posPlaneta);
     mouseP.normalize();
     mouseP.mult(vel);
     posPlaneta.add(disP);
     */
  }

  //funciÃ³n para dibujar
  void dibujar() {
    fill(0, 120, 255);
    ellipse(posPlaneta.x, posPlaneta.y, sz, sz);
  }
}

class cosa {

  PVector posicion, velocidad, acceleracion;
  float friccion, mySize, myMass;
  //falta velAcercamiento, maxVel;

  float velAcercamiento, maxVel;

  cosa() {
    posicion = new PVector(random(width), random(height));
    //velocidad = new PVector(random(-5,5),random(-4,4));
    velocidad = new PVector(0, 0);
    acceleracion = new PVector(0, 0);
    mySize = random(0.5, 25);
    myMass = 25-mySize;
    //myMass *= 0.05;
    friccion = 0.8;
  //  println(myMass);
    velAcercamiento = random(0.5, 10);
   // maxVel = 7.5;
    maxVel = random(2, 7.5);
  }

  void run() {
    update();
    drawMe();
  }

  void update() {  
    //Añadimos el valor de gravedad (aceleración) a la velocidadocidad y velocidadocidad a posicionición
    velocidad.add(acceleracion);
    velocidad.limit(maxVel);
    posicion.add(velocidad);
    acceleracion.mult(0);

    //comprobamo los bordes de la ventana
    //en lo horizontal, como siempre
    if ((posicion.x < mySize/2)||(posicion.x > width-mySize/2)) {
      velocidad.x *= -1;
    }
    //pero en lo vertical sólo abajo, y reduciendo cada vez la velocidadocidad, para simular fricción.

    if ((posicion.y > height-mySize/2)) {//||(posicion.y < 0)) {
      velocidad.y *= -1;
      velocidad.mult(friccion);
      //para que no se enganche:
      posicion.y = height-mySize/2;
    }
  }

  void drawMe() {
    //y finalmente, dibujamos
    fill(255, random(50,200), 0);
    ellipse(posicion.x, posicion.y, mySize, mySize);
  }

  void addForce(PVector _f) {
    //acceleracion.add(_f);
    //acceleracion.add(PVector.mult(_f,mySize*5));
    PVector f = PVector.div(_f, myMass);
    //acceleracion.add(f);//.add(f);
    acceleracion = f;
  }

  void calcularAcercamientoRaton() {
    PVector mouseVector = new PVector(mouseX, mouseY);
    PVector dis = PVector.sub(mouseVector, posicion);
    dis.normalize();
    dis.mult(velAcercamiento);
    addForce(dis);
  }
  
    void calcularAcercamientoPlaneta() {
   // PVector PlanetaVector = new PVector(mouseX, mouseY);
    PVector disPlaneta = PVector.sub(p.posPlaneta, posicion);
    disPlaneta.normalize();
    disPlaneta.mult(velAcercamiento);
    addForce(disPlaneta);
  }
}



