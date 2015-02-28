
//En este ejercicio podemos ver como con la coordenada
//y del mouse podemos mostrar solamente un sector de la 
//imagen que estamos copiando.

PImage img1, img2, img3;
void setup() {
    size(700, 622);
    img1 = loadImage("perro1.jpg");
    img2 = loadImage("perro2.jpg");
     img3 = loadImage("perro3.jpg");
  }
  void draw() {
    background(255);
    image(img1, 0, 0); 
    int my = constrain(mouseY-25, 0, height);
    copy(img3, 0, my, width, 50, 0, my, width, 50);
    int mx = constrain(mouseX-25, 0, width);
    copy(img2, mx, 0, 50, height, mx, 0, 50, height);
  }

