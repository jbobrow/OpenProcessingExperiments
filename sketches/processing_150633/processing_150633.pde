
/*void setup(){
size(100,100); // Tamaño de ventana de la aplicación
noFill(); // Sin relleno en los círculos
}

void draw(){ // Se repite a cada frame - todo lo q se repite e
dibujaCirculoAleatorio();
}

void dibujaCirculoAleatorio(){
int r = int(random(50));
// Color del trazo
stroke(random(255), random(255), random(255));

ellipse (random(100),random(100), r,r);
}*/

/*
void setup() {
size(100,100); // Tamaño de ventana de la aplicación
  noFill();
}
void draw(){ // Se repite a cada frame
Circulo c = new Circulo();
c.dibuja();
}
// Clase círculo
class Circulo{
// Atributos
int r = int(random(50));
int x = int(random(100));
int y = int(random(100));
color c = color(random(255), random(255), random(255));
// Métodos
void dibuja(){
stroke(c);
ellipse(x, y, r, r);
}
}*/


void setup() {
  size(500,500); // Tamaño de ventana de la aplicación
  poligono(50,50,50,5);
}
void draw(){ // Se repite a cada frame
  //poligono(50,50,50,5);
}

void poligono(float c1, float c2, int r, int nlados){
  
  float grados = 360 /nlados;
  float x=0,y=0,x0=0,y0=0;
  x0= x0+c1;
  y0= y0+c2;

  
  for (int i=0;i<=nlados; i++){
    x = c1 + cos(radians(i*grados)) * r;
    y = c2+ sin(radians(i*grados)) * r;
    line (x0,y0, x,y);
   x0=x;
   y0=y;
  }

}


