
class Burbuja {
  
  float x, y;
  boolean comida;
  float r;
  int fc0;
  PImage burbuja;
  
  Burbuja() {
    fc0 = 300;
    x = random(100,width-100);
    y = height-50;//random(200,height-100);
    r = 10;
    burbuja = loadImage("burbuja.png");
  }
  
  void idle() {
    if (comida) {
      x = random(100,width-100);
      y = random(200,height-100);      
      fc0 = frameCount;
      comida = false;
    }
  }
  
  void draw() {
    if (frameCount > fc0 && !comida) {
      image(burbuja, x - burbuja.width*.5, y - burbuja.height*.5);
    }
  }
  
}



