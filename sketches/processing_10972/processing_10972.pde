
class Rectangulo {
  
  PVector posicion;
  PVector desplaza;
  PVector incremento;
  
  //Constructor
  Rectangulo(int posx, int posy, float x, float y) {
    posicion = new PVector(posx,posy);
    desplaza = new PVector(x,y);
    incremento = new PVector(.01,.01);
  }
  
  void mover() {
    desplaza.add(incremento);
    posicion.add(desplaza);
  }
  
  void mostrar(color c) {
    fill(c);
    rectMode(CENTER);
    rect(posicion.x,posicion.y,40,40);
  }
  
  void colisionOrillas() {
    if ((posicion.x > width-25) || (posicion.x < 0)) {
      desplaza.x = -desplaza.x;
    }
    if ((posicion.y > height-25) || (posicion.y < 0)){
      desplaza.y = -desplaza.y;
    }
  }
}

  
    

