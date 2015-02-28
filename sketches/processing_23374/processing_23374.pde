
//clase particulas: producto final de la ventana
class particula01 {

  //Variables propias 
  PVector pos, vel, acc;
  ArrayList mySystem;//hacemos una lista de array que contenga el sistema de particulas 
  float sz;
  color myFill, myStroke;
  int ttl=100;

  particula01(float _x, float _y, color _myFill, color _myStroke) {
    pos = new PVector(_x,_y);
    vel = new PVector(0,0);
    acc = new PVector(10,0);
    sz = random(6,12);
    acc = new PVector(random(-0.1,0.1),random(-0.1,0.1));
    myFill = _myFill;
    myStroke = _myStroke;
  } 

  //Una funcion principal para todas
  void run() {
    update();
    display();
  }

  //Actualizamos posiciones, velocidad y tiempo de vida
  void update() {
    pos.add(vel);//aÃ±adimos el vector velocidad al de posicion
    vel.add(acc);//aÃ±adimos el vector acceleracion al de velocidad
    ttl--;
  }
  //dibujamos
  void display() {
    fill(myFill);
    stroke(myStroke);
    ellipse(pos.x,pos.y,sz,sz);
  }
}


