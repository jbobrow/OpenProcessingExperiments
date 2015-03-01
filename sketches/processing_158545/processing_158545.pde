
PImage imagen;

void setup() {
  size(716, 716);
  imagen =loadImage("pipa.jpg");
}

void draw() {
  tint(255, 126);
 // image(imagen, mouseX, 0, 150, 150);
  for (int i = 0; i < 716; i = i+15) {
    for (int j = 0; j < 716; j = j+15) {
      color elColor = imagen.get(i,j);
      fill(elColor);
      ellipse(i, j,10,10);
      
    }
  }
}



