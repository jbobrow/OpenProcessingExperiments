
////////////////////////////////////////
////RICARDO MUÑOZ/////2011//////////////
////////////////////////////////////////

PImage foto;
int tolerancia = 256;//tolerancia al blanco
int tam = 40; // size divider = 255 / tam
int transp =260; // transparencia elipses

////////SET UP//////////////

void setup() {
  foto = loadImage ("photo1.jpg");//image load
  size (640, 480);
  noStroke();
  background (255);
  smooth();

  image (foto, 0, 0);
}

////////DRAW//////////////

void draw() {

  int x = int (random(foto.width));
  int y = int (random(foto.height));

  color colores = foto.get(x, y);   // get colors, draw an ellipse using those colors

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

    //print values
    println("color = " + colores);
    println("red = " + rojo);
    println("green = " + verde);
    println("blue = " + azul);
  }
}


