
//Ramiro Plano - Estructuras modulares

int cantidad=13;
int tamanio=10;
int angulo1, angulo2;
boolean inicio=true;
boolean sentido=true;

void setup() {
  size(400, 400);
  smooth();
  background(0);
}
void draw() {
  if(inicio) {
    translate(10, 10);
    for (int i=0;i<cantidad;i++) {
      for (int j=0;j<cantidad;j++) {
        if ((i+j)%2==0) {
          lineCircle(i*(tamanio*3)+tamanio, j*(tamanio*3)+tamanio, tamanio, angulo1);
        }
        else {     
          lineCircle(i*(tamanio*3)+tamanio, j*(tamanio*3)+tamanio, tamanio, angulo2);
        }
      }
    }

    if (sentido) {
      stroke(255, 0, 0);
      angulo1++;
      angulo2--;
    } 
    else {
      stroke(0, 0, 255);
      angulo1--;
      angulo2++;
    }
    if (angulo1<=0||angulo1>=360) {
      sentido=!sentido;
    }
    println("angulo="+angulo1);
  }
}


void mousePressed() {
  sentido=!sentido;
}

void keyPressed() {
  if (key == 'f' || key == 'F') {
    saveFrame("RPmod####.jpg");
  }
  if (key == ' ') {
    inicio=!inicio;
  }
}

void lineCircle(int x, int y, int tam, int ang) {
  pushMatrix();
  translate(x, y);
  rotate(radians(ang));
  line(0, 0, tam, tam);
  popMatrix();
}                 
