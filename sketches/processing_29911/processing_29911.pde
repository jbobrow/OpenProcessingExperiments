
// cuadrícula! (09/06/11)

Cuadrado[] lista;
int[] contador;
int cola = 100;
void setup() {
  // frameRate(100);
  size(650, 650);
  float esp = 5;
  float lado = 38;
  smooth();
  noStroke();
  int numx = int((width-esp)/(lado+esp));
  int numy = int((height-esp)/(lado+esp));
  contador = new int[numx*numy];
  lista = new Cuadrado[numx*numy];
  for (int i=0; i<numx; i++) {
    for (int j=0; j<numy; j++) {
      lista[numx*j+i] = new Cuadrado(esp+i*(lado+esp), esp+j*(lado+esp), lado);
      contador[numx*j+i] = 0;
    }
  }
}

void draw() {
  background(15);
  for (int i=0; i < lista.length; i++) {
    lista[i].refresca(i);
    lista[i].dibuja(i);
  }
  
}

class Cuadrado {
  
  float x, y, d;
  
  Cuadrado(float X, float Y, float D) {
    x = X;
    y = Y;
    d = D;
  }
    
    void refresca(int i) {
      if ((mouseX > x) && (mouseX < x+d) && 
        (mouseY > y) && (mouseY < y+d)) {
        contador[i] = cola;
      } else {
        if (contador[i] > 0) {
          contador[i]--;  
        }
      }
    }
    
    void dibuja(int i) {
      float f = map(contador[i], 0, cola, 0, HALF_PI);
      fill(20 + 215*cos(f));
      rect(x, y, d, d);
    }    
  }


