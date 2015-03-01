
int px; // posición en x
int py; // posición en y
float vx =random(0.5, 2); // velocidad en x (aleatoria)
float vy =random(0.5, 2);// velocidad en x (aleatoria)
float b =0;
void setup() {
  size(500, 300);
 colorMode(HSB);
}

void draw() {
  b=b+0.02;
  float aleatorio=random(100, 150);
  float fondo = (127*sin(b))+127;
  background(fondo);
  px+=vx; //variacion de la posicion segun la velocidad
  py+=vy;
  if (px>width||px<0) { // cuando la bola llega al borde
    vx=vx*-1; // cambie la direccion
  }
  if (py>height||py<0) {
    vy=vy*-1;
  }
  fill(aleatorio,255,255);
  ellipse(px, py, 50, 50);
}

