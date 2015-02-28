
/*** CIRCULO ***/ 
class Circulo extends Figura implements Circuleable, Senable {
    
  Circulo(float x, float y) {
    super(x, y);
  }
  
  void poner() {
    super.poner();
    fill(124,190,50);
    noStroke();
    ellipse(super.posX, super.posY, super.tam , super.tam);
  }
  
}

/*** CUADRADO ***/ 
class Cuadrado extends Figura implements Lineable, Circuleable {
  float angulo, anguloVel;
  Cuadrado(float x, float y) {
    super(x, y); angulo = 0; anguloVel = random(0.1, 0.5);
  }
  
  void poner() {
    super.poner();
    fill(50,155,215);
    noStroke();
    rect(super.posX, super.posY, super.tam , super.tam);
    /*
    pushMatrix();
      translate(posX, posY);
      rotate(angulo);
      rect(1, 1, super.tam , super.tam);
    popMatrix();
    angulo+=anguloVel;*/
    
  }
  
}

/*** LINEA ***/ 
class Linea extends Figura implements Circuleable {
    
  Linea(float x, float y) {
    super(x, y);
    super.tam = 600;
  }
  
  void poner() {
    super.poner();
    stroke(255,2,100);
    line(super.posX, super.posY, super.posX, super.posY+10);
  }
  
}

/*** PUNTO ***/ 
class Punto extends Figura implements Lineable, Senable {
    
  Punto(float x, float y) {
    super(x, y);
  }
  
  void poner() {
    super.poner();
    stroke(255,2,100,100);
    line(super.posX, super.posY, width/2, height/2);
  }
  
}

/*** TRIANGULO ***/ 
class Triangulo extends Figura implements Lineable, Senable {
    
  Triangulo(float x, float y) {
    super(x, y);
  }
  
  void poner() {
    super.poner();
    fill(255,2,100);
    triangle (super.posX-(super.tam/2), super.posY+(super.tam/2), super.posX, super.posY-(super.tam/2), super.posX+(super.tam/2), super.posY+(super.tam/2));
  }
  
}

