
PImage foto;
void setup() {
  foto = loadImage("george.jpg");
  size(500, 500);
}
void draw() {
  //image(foto, 0, 0);
  color c = foto.get(mouseX,mouseY);
  float brillo = brightness(c);
  fill(c);
  ellipse(mouseX,mouseY,brillo*0.1,brillo*0.1);
}



