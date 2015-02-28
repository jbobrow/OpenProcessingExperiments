
PImage foto;
int tolerancia = 256;//tolerancia al blanco
int tam = 25; // size divider = 255 / tam
int transp = 255; // transparencia elipses

void setup() {
  foto = loadImage ("fotoTest2.jpg");//image load
  size (400, 400);
  noStroke();
  background (255);
  smooth();

  image (foto, 0, 0);
}

void draw() {

  int x = int (random(foto.width));
  int y = int (random(foto.height));

  // get colors, draw an ellipse using those colors
  color colores = foto.get(x, y);
  //fill (colores, 100);
  //ellipse (x, y, 20, 20);
  float rojo = red(colores);//get red value
  float verde = green(colores);//get green value
  float azul = blue(colores);//get blue value

  if ((rojo < tolerancia) && (verde < tolerancia) && (azul < tolerancia)) {

    fill(rojo, 0, 0, transp);
    ellipse (x, y-(1/tam - 5), rojo/tam, rojo/tam);

    fill(0, verde, 0, transp);
    ellipse (x-(1/tam), y, verde/tam, verde/tam);

    fill(0, 0, azul, transp);
    ellipse (x+(1/tam + 5), y, azul/tam, azul/tam);
  }

  //print values
  println("color = " + colores);
  println("red = " + rojo);
  println("green = " + verde);
  println("blue = " + azul);
}


