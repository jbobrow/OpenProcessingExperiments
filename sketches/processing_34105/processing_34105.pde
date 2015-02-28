
////////////////////////////////////////
////RICARDO MUÑOZ/////2011//////////////
////////////////////////////////////////

PImage foto;

int tolerancia = 256;//tolerancia al blanco
int tam = 30; // size divider = 255 / tam
int transp = 255; // transparencia elipses

//declare arrays for mouse position in x and y, length = 30
float mx[] = new float[30];
float my[] = new float[30];


////////SET UP//////////////

void setup() {

  size (640, 480);

  foto = loadImage ("photo1.jpg");//image load

  noStroke();
  background (255);
  smooth();

  image (foto, 0, 0);
}

void draw() {

  int x = mouseX;
  int y = mouseY;

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
    println (mouseX + mouseY);
  }
}


