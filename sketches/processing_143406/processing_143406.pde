
/* @pjs font="Neutra Display Titling.ttf, NeutraText-LightAlt.ttf"; 
 preload="dos.png, dosazul.png, dosverde.png, foto.png, hamburguesa.png, leyenda.png, luna.png, madrid.jpg, mapa_color.png, mapa_vacio.jpg, tres.png, tresazul.png, tresverde.png, uno.png, unoazul.png, unoverde.png"; 
 */

PImage madrid;
PImage mapa;
PImage colormap;
PImage img;
PImage img2;
PImage img3;

float xCentro, yCentro;
float xDestino, yDestino;

PImage leyenda;
PImage uno, dos, tres;
PImage unoazul, dosazul, tresazul;
PImage unoverde, dosverde, tresverde;
PFont neutra;
PFont neutraT;
float x, y;
float x2=200, y2=200;

int borde = 20;
int w =300;
int h = 300;
int tam = 50;
int pagina = 0;

void setup() {
  size (400, 400);

  img= loadImage ("hamburguesa.png");
  img2 = loadImage ("luna.png");
  img3 = loadImage ("foto.png");
  mapa = loadImage ("mapa_vacio.jpg");
  colormap = loadImage ("mapa_color.png");
  leyenda = loadImage ("leyenda.png");
  madrid = loadImage ("madrid.jpg");
  uno = loadImage ("uno.png");
  dos= loadImage ("dos.png");
  tres = loadImage ("tres.png");

  unoazul = loadImage ("unoazul.png");
  dosazul= loadImage ("dosazul.png");
  tresazul = loadImage ("tresazul.png");

  unoverde = loadImage ("unoverde.png");
  dosverde= loadImage ("dosverde.png");
  tresverde = loadImage ("tresverde.png");


  neutra = createFont ("NeutraText-LightAlt", 32);
  neutraT = createFont ("Neutra Display Titling", 32);
}

void draw() {

  if (pagina == 0 ) {
    image (madrid, 0, 0);
  }


  if (pagina == 1) {
    vermapa();
  }
}



void mouseReleased  () {
  if (pagina == 0) {
    pagina = 1;
  }
}

void vermapa() {
  background (255);


  color c = colormap.get (floor (mouseX-xCentro), floor (mouseY-yCentro));
println(red(c) + " " + green(c) + " " + blue(c));

  //mover leyenda 
  //tint(255, 255);

  translate(xCentro, yCentro);


  image(mapa, 0, 0);
  pushMatrix();
  //tint(255, 5);
 // image(colormap, 0, 0);
  popMatrix();





  //Puntos
  pushMatrix();
  noStroke();
  //Rojos
  pushMatrix();
  fill(235, 96, 121);
  ellipse ( 373, 118, 36, 36);
  ellipse ( 651, 195, 36, 36);
  ellipse ( 420, 280, 36, 36);
  popMatrix();
  //Azules
  pushMatrix();
  fill(123, 172, 211);
  ellipse ( 361, 171, 36, 36);
  ellipse ( 492, 211, 36, 36);
  ellipse ( 625, 276, 36, 36);
  popMatrix();

  //Verdes
  pushMatrix();
  fill(182, 210, 121);
  ellipse ( 464, 289, 36, 36);
  ellipse (603, 210, 36, 36);
  ellipse ( 861, 441, 36, 36);
 
  popMatrix();
 
  popMatrix();
  //easing para el mapa
  xCentro = xCentro + (xDestino-xCentro)*0.1;
  yCentro = yCentro + (yDestino-yCentro)*0.1;


  //color map

  pushMatrix();
  translate(-xCentro-150, -yCentro);
  // fichas de los puntos
  //ROJOS
  if (c == color (207, 97, 120) || c == color(236,96,122)) {
    ficha();
  }
  if (c == color (159, 81, 101)|| c == color(181,79,102)) {
    ficha1();
  }
  if (c == color (109, 56, 70)|| c == color(124,53,69)) {
    ficha2();
  }
  //Azules

  if (c == color (138, 171, 208)|| c == color(123,173,207)) {
    fichaazul();
  }
  if (c == color (94, 145, 205)|| c == color(58,147,203)) {
    fichaazul1();
  }
  if (c == color (48, 70, 94)|| c == color(29,69,92)) {
    fichaazul2();
  }

  //Verdes

  if (c == color (189, 209, 126)|| c == color(181,210,133)) {
    fichaverde();
  }
  if (c == color (133, 149, 68)|| c == color(126,150,73)) {
    fichaverde1();
  }
  if (c == color (94, 102, 64)|| c == color(90,102,65)) {
    fichaverde2();
  }

popMatrix();





  //Leyenda
  if ( c == color ( 192, 190, 190)|| c == color(194,191,191)) {
    //tint(255, 255);
    image(leyenda, 40, -40);
  }

  if (mouseX>35) {
    pushMatrix();
    textFont (neutra);
    pushMatrix();
    fill(255);
    rect (0, 0, 30, 90);
    popMatrix();

    fill(0);
    textSize(20);
    translate (10, 5);
    rotate (radians(90));
    text("Leyenda", 3, 3);
    popMatrix();
  }  
  if (mouseX<35) {
    Leyenda();
  }

  x= x+ (x2-x)* .1;
  y = y + (y2-y) * .1;
}



void Leyenda() { 

  pushMatrix();
  textFont (neutra);
  pushMatrix();
  fill(255);
  rect (8, 0, 30, 90);
  popMatrix();

  fill(0);
  textSize(20);
  translate (18, 10);
  //tint(255, 255);
  rotate (radians(90));
  text("Leyenda", 3, 3);
  popMatrix();
}


//Ficha

void ficha() {

  fill(255, 200);
  rect(mouseX, mouseY, 270, 200);

  fill(0);
  pushMatrix();
  textFont (neutraT);
  textSize (20);
  fill (255);
  noStroke ();
  fill(50);
  //tint(255, 255);
  image(img, mouseX, mouseY, tam, tam);
  image(uno, mouseX, mouseY+borde*3, 30, 30);
  text("La ciudad invisible", mouseX+2*borde*2, mouseY+2*borde);
  popMatrix();
  pushMatrix();
  textFont (neutra);
  textSize (15);
  String s = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vulputate nulla a varius fermentum. Praesent leo eros, sollicitudin ut pulvinar at";
  fill(50);
  text(s, mouseX+2*borde*2, mouseY+3*borde, 150, 200);
  popMatrix();
}


void mouseDragged() {
  xDestino = xDestino + mouseX -pmouseX;
  yDestino =yDestino + mouseY -pmouseY;
  x2= mouseX;
  y2= mouseY;

  if (xDestino > 0) {
    xDestino = 0;
  }
  if (xDestino < -mapa.width+width) {
    xDestino =-mapa.width+width;
  }
  if (yDestino < -mapa.height+height) {
    yDestino =-mapa.height+height;
  }

  if (yDestino > 0) {
    yDestino = 0;
  }
}


//ROJOS

//Petit comité

void ficha1() {
  
  fill(255, 200);
  rect(mouseX, mouseY, 270, 200);
  tint(255, 255);
  fill(0);
  pushMatrix();
  textFont (neutraT);
  textSize (20);
  fill (255);
  noStroke ();
  fill(50);
  image(img, mouseX, mouseY, tam, tam);
  image(dos, mouseX, mouseY+borde*3, 30, 30);
  text("Petit Comité", mouseX+2*borde*2, mouseY+2*borde);
  popMatrix();
  pushMatrix();
  textFont (neutra);
  textSize (15);
  String s = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vulputate nulla a varius fermentum. Praesent leo eros, sollicitudin ut pulvinar at";
  fill(50);
  text(s, mouseX+2*borde*2, mouseY+3*borde, 150, 200);
  popMatrix();
  
}


//National Geographic

void ficha2() {

  fill(255, 200);
  rect(mouseX, mouseY, 270, 200);
  tint(255, 255);
  fill(0);
  pushMatrix();
  textFont (neutraT);
  textSize (20);
  fill (255);
  noStroke ();
  fill(50);
  image(img, mouseX, mouseY, tam, tam);
  image(tres, mouseX, mouseY+borde*3, 30, 30);
  text("National Geo", mouseX+2*borde*2, mouseY+2*borde);
  popMatrix();
  pushMatrix();
  textFont (neutra);
  textSize (15);
  String s = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vulputate nulla a varius fermentum. Praesent leo eros, sollicitudin ut pulvinar at";
  fill(50);
  text(s,  mouseX+2*borde*2, mouseY+3*borde, 150, 200);
  popMatrix();
}






//AZUL

//Cibeles

void fichaazul() {

  fill(255, 200);
  rect(mouseX, mouseY, 270, 200);
  tint(255, 255);
  fill(0);
  pushMatrix();
  textFont (neutraT);
  textSize (20);
  fill (255);
  noStroke ();
  fill(50);
  image(img2, mouseX, mouseY, tam, tam);
  image(unoazul, mouseX, mouseY+borde*3, 30, 30);
  text("Cibeles", mouseX+2*borde*2, mouseY+2*borde);
  popMatrix();
  pushMatrix();
  textFont (neutra);
  textSize (15);
  String s = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vulputate nulla a varius fermentum. Praesent leo eros, sollicitudin ut pulvinar at";
  fill(50);
  text(s, mouseX+2*borde*2, mouseY+3*borde, 150, 200);
  popMatrix();
}


//Sala Bash

void fichaazul1() {

  fill(255, 200);
  rect(mouseX, mouseY, 270, 200);
  tint(255, 255);
  fill(0);
  pushMatrix();
  textFont (neutraT);
  textSize (20);
  fill (255);
  noStroke ();
  fill(50);
  image(img2, mouseX, mouseY, tam, tam);
  image(dosazul, mouseX, mouseY+borde*3, 30, 30);
  text("Sala Bash", mouseX+2*borde*2, mouseY+2*borde);
  popMatrix();
  pushMatrix();
  textFont (neutra);
  textSize (15);
  String s = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vulputate nulla a varius fermentum. Praesent leo eros, sollicitudin ut pulvinar at";
  fill(50);
  text(s, mouseX+2*borde*2, mouseY+3*borde, 150, 200);
  popMatrix();
}


//Elástico

void fichaazul2() {

  fill(255, 200);
  rect(mouseX, mouseY, 270, 200);
  tint(255, 255);
  fill(0);
  pushMatrix();
  textFont (neutraT);
  textSize (20);
  fill (255);
  noStroke ();
  fill(50);
  image(img2, mouseX, mouseY, tam, tam);
  image(tresazul, mouseX, mouseY+borde*3, 30, 30);
  text("Elástico", mouseX+2*borde*2, mouseY+2*borde);
  popMatrix();
  pushMatrix();
  textFont (neutra);
  textSize (15);
  String s = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vulputate nulla a varius fermentum. Praesent leo eros, sollicitudin ut pulvinar at";
  fill(50);
  text(s, mouseX+2*borde*2, mouseY+3*borde, 150, 200);
  popMatrix();
}





//Verde

//Sala de las Alhajas

void fichaverde() {

  fill(255, 200);
  rect(mouseX, mouseY, 270, 200);
  tint(255, 255);
  fill(0);
  pushMatrix();
  textFont (neutraT);
  textSize (20);
  fill (255);
  noStroke ();
  fill(50);
  image(img3, mouseX, mouseY, tam, tam);
  image(unoverde, mouseX, mouseY+borde*3, 30, 30);
  text("Sala de las Alhajas",mouseX+2*borde*2, mouseY+2*borde);
  popMatrix();
  pushMatrix();
  textFont (neutra);
  textSize (15);
  String s = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vulputate nulla a varius fermentum. Praesent leo eros, sollicitudin ut pulvinar at";
  fill(50);
  text(s, mouseX+2*borde*2, +mouseY+3*borde, 150, 200);
  popMatrix();
}


//Museo REINA SOFÍA

void fichaverde1() {

  fill(255, 200);
  rect(mouseX, mouseY, 270, 200);
  tint(255, 255);
  fill(0);
  pushMatrix();
  textFont (neutraT);
  textSize (20);
  fill (255);
  noStroke ();
  fill(50);
  image(img3, mouseX, mouseY, tam, tam);
  image(dosverde, mouseX, mouseY+borde*3, 30, 30);
  text("Museo REINA SOFÍA", mouseX+2*borde*2, mouseY+2*borde);
  popMatrix();
  pushMatrix();
  textFont (neutra);
  textSize (15);
  String s = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vulputate nulla a varius fermentum. Praesent leo eros, sollicitudin ut pulvinar at";
  fill(50);
  text(s, mouseX+2*borde*2, mouseY+3*borde, 150, 200);
  popMatrix();
}


//Elástico

void fichaverde2() {

  fill(255, 200);
  rect(mouseX, mouseY, 270, 200);
  tint(255, 255);
  fill(0);
  pushMatrix();
  textFont (neutraT);
  textSize (20);
  fill (255);
  noStroke ();
  fill(50);
  image(img3, mouseX, mouseY, tam, tam);
  image(tresverde, mouseX, mouseY+borde*3, 30, 30);
  text("CAIXAFORUM ", mouseX+2*borde*2, mouseY+2*borde);
  popMatrix();
  pushMatrix();
  textFont (neutra);
  textSize (15);
  String s = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vulputate nulla a varius fermentum. Praesent leo eros, sollicitudin ut pulvinar at";
  fill(50);
  text(s, mouseX+2*borde*2, mouseY+3*borde, 150, 200);
  popMatrix();
}





