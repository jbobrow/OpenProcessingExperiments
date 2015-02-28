
PImage meninas;
Cuadro [][]cuadros;
void setup() {
  size(600, 600, P2D);
  background(0);
  meninas= loadImage("panda3.jpg");
  cuadros = new Cuadro[meninas.width][meninas.height];
  for (int i = 0; i< meninas.width; i++) {
    for (int j= 0; j< meninas.height; j++) {
      color c1 = meninas.get(i, j);
      float r= red(c1);
      float g= green(c1);
      float b= blue(c1);  
      cuadros[i][j]= new Cuadro(color(r, g, b), i*1.9, j*1.9);
    }
  }
}
void draw() {
  for (int i = 0; i< meninas.width; i++) {
    for (int j= 0; j< meninas.height; j++) {
      cuadros[i][j].dibuja();
      cuadros[i][j].mueve();
    }
  }
}
class Cuadro {
  int ancho=4 ;
  int largo= 4;
  float x, y;
  color col;
  Cuadro(color col, float x, float y) {
    this.col = col;
    this.x = x;
    this.y = y;
  }
  void mueve() {
    x += random(4)-2;
    y += random(4)-2;
  }
  void dibuja() {
    //noStroke();
    fill(this.col);
    rect(x, y, ancho, largo);
    //save("panditas.jpg");
  }
}


