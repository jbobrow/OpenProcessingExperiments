
PImage Wolv;
 
int a=30;
 
 
void setup() {
  size(500, 667);
 
  Wolv = loadImage("Wolv.jpg");
}
 
void draw() {
  image(Wolv, 0, 0);
  
  //zoom
  if (mouseButton == LEFT)
      noStroke();
      copy(mouseX, mouseY, 40, 40, mouseX, mouseY, 3*a, 3*a);
  
  //cambio colore
    if (mouseButton == RIGHT)
      filter(INVERT);

}



