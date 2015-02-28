
//tomo el valor de color del pixel
//según donde este el mouse

PImage prueba;
int col;
void setup() {
  size(400, 400);
  noStroke();
  prueba = loadImage("ejercicio2.jpg");
  col = 0;
  colorMode(HSB);
}
void draw() {
  //color c = prueba.get(mouseX, mouseY);
  col = (col + 1)% 256;
  fill(col, 255, 255, 50);
  triangle(0, 0, 0, height, width, height);
  fill(255, col, 255, 50);
  rect(0, 0, width, height, width, 0);
  blend(prueba, 0, 0, width, height, 0, 0, width, height, MULTIPLY);
}


