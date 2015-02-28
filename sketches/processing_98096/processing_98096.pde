
/*
* Inspired by the "BrownianMovement" sketch
* http://processing.org/learning/topics/brownian.html
* this is my take on recording "noise" generated movement. 
*
* Made by @ramayac
*/

class Gusano {

  int cola = 100;
  int rango = 6;
  PVector[] linea = new PVector[cola];

  Gusano(float x, float y) {
    for (int i = 0; i < linea.length; i++) {
      linea[i] = new PVector(x, y);
    }
  }

  void update() {
    for (int i = 1; i < linea.length; i++) {
      linea[i-1].x = linea[i].x;
      linea[i-1].y = linea[i].y;
      //linea[i-1]= linea[i]; //no sirve
    }

    linea[linea.length-1].x += noise(linea[linea.length-1].x)*rango; //random(-rango, rango);
    linea[linea.length-1].y += noise(linea[linea.length-1].y)*rango; //random(-rango, rango);

    boolean fuerapantalla = false;
    if (linea[linea.length-1].x > width) {
      linea[linea.length-1].x = linea[linea.length-1].x-width;
    }
    if (linea[linea.length-1].y > height) {
      linea[linea.length-1].y = linea[linea.length-1].y-height;
    }
  }

  void draw() {
    for (int i = 1; i < linea.length; i++) {
      float val = float(i)/linea.length * 204.0 + 51;
      stroke(val);
      float d = dist(linea[i-1].x, linea[i-1].y, linea[i].x, linea[i].y);
      if (d < rango) {
        line(linea[i-1].x, linea[i-1].y, linea[i].x, linea[i].y);
      }
    }
  }
}

Gusano[] gusanitos = new Gusano[50];

void setup() {
  size(540, 260);

  for(int i = 0; i < gusanitos.length; i++){
    gusanitos[i] = new Gusano(random(0, width), random(0, height));
  }

  smooth();
  frameRate(30);
}

void draw() {
  background(51);
  
  for(int i = 0; i < gusanitos.length; i++){
    gusanitos[i].update();
    gusanitos[i].draw();
  }
}
