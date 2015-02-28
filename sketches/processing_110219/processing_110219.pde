
class Misil {
  float x;
  float y;
  //float vel = 1;
  int tam;
  int tipo;
  int tiempoAtractor = 200;

  Misil(float x_, float y_, int tipo_) {
    x = x_;
    y = y_;
    tipo = tipo_;
    if (tipo == 2 || tipo == 3) 
      tam = 20; 
    else tam = 10;
  }

  void ataque() {
    if ( !paso() ) { 
      x -= velocidad;
    }
  }

  void atractor(Nave n, int tipo_) {
    if (tipo == tipo_) {
      x = lerp(x, n.getX()+100, 0.03);
      y = lerp(y, n.getY(), 0.03);
    }
  }

  boolean paso() {
    if (x<-2*tam) 
      return true;
    else 
      return false;
  }

  void draw() {
    switch(tipo) {
    case 0 : //misil
      noStroke();
      fill(255);
      rect(x, y, tam, tam);
      break;
    case 1 : //bonus
      noStroke();
      fill(0, 50, 255);
      rect(x, y, tam, tam);
      break;
    case 2 : //vida
      noStroke();
      fill(255, 0, 0);
      rect(x, y, tam, tam);
      fill(255);
      textSize(24);
      text("♥", x, y+tam);
      break;
    case 3: //atractor
      float c = map(sin(frameCount/10.0), -1, 1, 0, 255);
      fill(c, 0, 0);
      rect(x, y, tam, tam);
      fill(0, 0, c);
      textSize(30);
      text("A", x, y+tam);
    }
  }  

  //GETTERS Y SETTERS
  float getX() {
    return x;
  }
  float getY() {
    return y;
  }
  int getTam() {
    return tam;
  }
  int getTipo() {
    return tipo;
  }
}


