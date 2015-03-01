
//STEVEN BOLAÑOS ARANGO
//Programación (Trabajo Final)
//Master Universitario en Artes Digitales - UPF
//Diciembre 2014


Imagen [] imagenes = new Imagen[0];
//clases son un el plural. Es una clase imagen donde saco varias imagenes.
PImage master;
PImage master_th;
PImage mini;
String texto = "\"La idea no es vivir para siempre, la idea es crear algo que si lo haga\" Andy Warhol.";
//PImage fondo;


void setup () {

  size (1440, 500);
  smooth ();
  master = loadImage ("master.png");
  master_th = loadImage ("master_th.png");
  mini= loadImage("mini.png");
  //fondo= loadImage("fondo.jpg");
  noCursor();
  }


void draw () {
  background (250); 
  //imageMode(CORNER);
  //image(fondo, 0, 0);
  if (imagenes.length<400) {
    imagenes = (Imagen []) append(imagenes, new Imagen());
  }
  //va creando secuencialmente el objeto hasta llegar al limite. Es una funcion para el array.
  //segun entiendo, la funcion APPEND expande un array en un elemento y agrega los datos a la nueva posición.
  //El tipo de datos del elemento de parámetro debe ser el mismo que el tipo 
  //de datos de la matriz. SomeClass [] items = (SomeClass []) append (originalArray, elemento)

  for (int i=0; i<imagenes.length; i++) {
    imagenes[i].update();
  }
  fill(80);
  //textSize(18);
  text (texto, 500, 15);
  //text (texto, 500, 15, mouseX, 20);
  //preguntar al profesor sobre esa funcion TEXT (start y stop) que no entiendo como usarla.
  image(master, mouseX, mouseY); //la imagen es solo una vez por draw, no es necesaior que este dentro del for
}

class Imagen {

  float x;
  float y;
  float velX; 
  float velY;
  int tipoComportamiento;


  Imagen () {
    x = random(width);
    // y = random(height);
    y= random(30, height);
    //x= width/2;
    //y=height/2;
    velX = random (-8, 8);
    velY = random (-8, 8);
    tipoComportamiento=(int)random(0, 2); //crea numero entre 0 y 1, no incluye el 2
    //esoty creando dos tipos de comprotamiento, uno 0 y otro 1
  }

  void update () {
    if (tipoComportamiento==0) {
      image(mini, x, y);
      //ellipse (x, y, 8, 8);
    }
    if (tipoComportamiento==1) {
      if (mousePressed==true) {
        println("estoy hacienco click");
        image(master_th, x, y);
      } else {
        fill (random(255), random(255), random(255));
        ellipse (x, y, 10, 10);
        println("no estoy hacienco click");
      }
    }
    x+=velX;
    y+=velY;
    //y = y+velY; es lo mismo

    //fuera de la condicion de comportamientos porque se aplica para todo.
    if (x>width||x<0) {
      velX= -velX;
    }

    if (y>height||y<30) {
      velY= -velY;
      if (y<30) {
        y=32;
      }
    }

    //image(master, mouseX, mouseY); se pasa para afuera del update para que no lo haga con cada particula
  }
}


