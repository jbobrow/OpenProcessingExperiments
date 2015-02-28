
float a = 0;
float cx = 100;
float cy = 100;

void setup() {  
  size(300,300);
  background(200);
}

void draw() {
  background(200);

  //pushMatrix(); //Guarda Sistema de coordenadas en el stack
  translate(cx,cy);

  rotate(a);

  triangle(30, 0, 0, -10, 0, 10);
  //popMatrix(); //Devuelve el sistema de coordenadas

  float dx = mouseX - cx;
  float dy = mouseY - cy;
  a = atan2(dy, dx);
  cx += (dx - 40) * 0.05;
  cy += (dy - 40) * 0.05;
}



