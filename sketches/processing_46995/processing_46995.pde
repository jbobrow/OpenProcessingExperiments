
void setup() {
  size(300, 300);
}
void draw() {
  background(204,150,100);
  float x = mouseX; // Asigno la coordenada X del ratón a la variable X
  float y = mouseY;  // Asigno la coordenada Y del ratón a la variable Y
  line(x, y, x+20, y-40);
  line(x+10, y, x+30, y-40);
  line(x+20, y, x+40, y-40);
}     

