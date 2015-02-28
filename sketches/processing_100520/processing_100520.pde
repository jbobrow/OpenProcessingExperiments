

//Definir variables
PImage imgInicial;      //Clic derecho para avanzar, izquierdo para retroceder
PImage img00;           //Partes de la espiral(8)
PImage img0;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
int x;

int espiral=-1;       //Pantalla inicial
int dir=1;              //Mostrar espirales (1 clic derecho, -1 clic izquierdo)

void setup() {
  size(800, 600);
  imgInicial = loadImage("Inicio.jpg");    //Carga de imágenes
  img00 = loadImage("Fibonacci.png");      //Partes de la espiral(8)
  img0 = loadImage("Fibonacci.png");
  img1 = loadImage("Fibonacci.png");
  img2 = loadImage("Fibonacci.png");
  img3 = loadImage("Fibonacci.png");
  img4 = loadImage("Fibonacci.png");
  img5 = loadImage("Fibonacci.png");
  img6 = loadImage("Fibonacci.png");
}

void draw() {

  background(0);      //Fondo negro

  //--------------------------------------------///
  if (espiral==-1) {
    image(imgInicial, 0, 0);
  }


  //--------------------------------------------///
  if (espiral==0 || espiral==1 || espiral==2 || espiral==3 || espiral==4  || espiral==5) {
    pushMatrix();
    rotate(radians(10));        //Rotar 10 radianes a la der
    fill(0);

    pushMatrix();
    tint(1, 188, 181);          //Cambia tono de color a las imagenes a azul verdoso
    translate(467, 215);        //Desplaza el centro para rotar desde ahí
    for (int i=0; i<3; i++) {    //Repite la imagen 3 veces
      rotate(radians(-10));      //Rota 10 radianes a la izq
      image(img00, -32, 5);      //Ubica la imagen en ese punto
      img00.resize(5, 17);       //Cambia el tamaño de la imagen
    }
  
    popMatrix();

    pushMatrix();
    translate(460, 225);        //Desplaza el centro para rotar desde ahí
    for (int i=0; i<10; i++) {    //Repite la imagen 10 veces
      rotate(radians(10));      //Rota 10 radianes a la der
      image(img0, -24, -10);    //Ubica la imagen en ese punto
      img0.resize(10, 22);      //Cambia el tamaño de la imagen
     }
    popMatrix();
    

    pushMatrix();
    translate(462, 237);          //Desplaza el centro para rotar desde ahí
    for (int i=0; i<10; i++) {     //Repite la imagen 10 veces
      rotate(radians(-9));      //Rota 9 radianes a la izq
      image(img1, 23, -5);      //Ubica la imagen en ese punto
      img1.resize(15, 28);      //Cambia el tamaño de la imagen
    }
    popMatrix();


    pushMatrix();
    translate(447, 250);          //Desplaza el centro para rotar desde ahí
    for (int i=0; i<8; i++) {      //Repite la imagen 8 veces
      rotate(radians(10));        //Rota 10 radianes a la der
      image(img2, 40, -35);       //Ubica la imagen en ese punto
      img2.resize(20, 37);        //Cambia el tamaño de la imagen
    }
    popMatrix();


    pushMatrix();
    translate(447, 200);          //Desplaza el centro para rotar desde ahí
    for (int i=0; i<9; i++) {    //Repite la imagen 9 veces
      rotate(radians(10));      //Rota 10 radianes a la der
      image(img3, 10, 70);        //Ubica la imagen en ese punto
      img3.resize(25, 46);      //Cambia el tamaño de la imagen
    }
    popMatrix();

    pushMatrix();
    translate(497, 210);          //Desplaza el centro para rotar desde ahí
    for (int i=0; i<9; i++) {      //Repite la imagen 9 veces
      rotate(radians(10));        //Rota 10 radianes a la der
      image(img4, -162, -5);       //Ubica la imagen en ese punto
      img4.resize(30, 55);        //Cambia el tamaño de la imagen
    }
    popMatrix();

    pushMatrix(); 
    translate(497, 300);          //Desplaza el centro para rotar desde ahí
    for (int i=0; i<14; i++) {    //Repite la imagen 14 veces
      rotate(radians(7));          //Rota 7 radianes a la der
      image(img5, -58, -288);      //Ubica la imagen en ese punto
      img5.resize(35, 69);        //Cambia el tamaño de la imagen
    }
    popMatrix();

    pushMatrix();
    translate(362, 300);          //Desplaza el centro para rotar desde ahí
    for (int i=0; i<14; i++) {    //Repite la imagen 14 veces
      rotate(radians(7));        //Rota 7 radianes a la der
      image(img6, 350, -90);      //Ubica la imagen en ese punto
      img6.resize(40, 86);        //Cambia el tamaño de la imagen
    }
    popMatrix();

    popMatrix();
  }
  //----------------------------------------------//
  if (espiral==1 || espiral==2 || espiral==3 || espiral==4 || espiral==5) {  //Muestra la espiral 1 durante toda la ejecución

    pushMatrix();
    tint(2, 200, 7);
    translate(475, -205);
    rotate(radians(70));
    fill(0);


    pushMatrix();
    translate(467, 215);

    for (int i=0; i<3; i++) {
      rotate(radians(-10));
      image(img00, -32, 5);
      img00.resize(5, 17);
    }
    popMatrix();

    pushMatrix();
    translate(460, 225);
    for (int i=0; i<10; i++) {
      rotate(radians(10));
      image(img0, -24, -10);
      img0.resize(10, 22);
    }
    popMatrix();

    pushMatrix();
    translate(462, 237);
    for (int i=0; i<10; i++) {
      rotate(radians(-9));
      image(img1, 23, -5);
      img1.resize(15, 28);
    }
    popMatrix();


    pushMatrix();
    translate(447, 250);
    for (int i=0; i<8; i++) {
      rotate(radians(10));
      image(img2, 40, -35);
      img2.resize(20, 37);
    }
    popMatrix();


    pushMatrix();
    translate(447, 200);
    for (int i=0; i<9; i++) {
      rotate(radians(10));
      image(img3, 10, 70);
      img3.resize(25, 46);
    }
    popMatrix();

    pushMatrix();
    translate(497, 210);
    for (int i=0; i<9; i++) {
      rotate(radians(10));
      image(img4, -162, -5);
      img4.resize(30, 55);
    }
    popMatrix();

    pushMatrix();
    translate(497, 300);
    for (int i=0; i<14; i++) {
      rotate(radians(7));
      image(img5, -58, -288);
      img5.resize(35, 69);
    }
    popMatrix();

    pushMatrix();
    translate(362, 300);
    for (int i=0; i<14; i++) {
      rotate(radians(7));
      image(img6, 350, -90);
      img6.resize(40, 86);
    }
    popMatrix();

    popMatrix();
  }

  //----------------------------------------------//
  if (espiral==2 || espiral==3 || espiral==4 || espiral==5) { //Muestra la espiral 2 desde su aparición hasta el final 

    pushMatrix();
    tint(194, 2, 187);
    translate(890, 100);
    rotate(radians(130));
    fill(0);


    pushMatrix();
    translate(467, 215);

    for (int i=0; i<3; i++) {
      rotate(radians(-10));
      image(img00, -32, 5);
      img00.resize(5, 17);
    }
    popMatrix();

    pushMatrix();
    translate(460, 225);
    for (int i=0; i<10; i++) {
      rotate(radians(10));
      image(img0, -24, -10);
      img0.resize(10, 22);
    }
    popMatrix();

    pushMatrix();
    translate(462, 237);
    for (int i=0; i<10; i++) {
      rotate(radians(-9));
      image(img1, 23, -5);
      img1.resize(15, 28);
    }
    popMatrix();


    pushMatrix();
    translate(447, 250);
    for (int i=0; i<8; i++) {
      rotate(radians(10));
      image(img2, 40, -35);
      img2.resize(20, 37);
    }
    popMatrix();


    pushMatrix();
    translate(447, 200);
    for (int i=0; i<9; i++) {
      rotate(radians(10));
      image(img3, 10, 70);
      img3.resize(25, 46);
    }
    popMatrix();

    pushMatrix();
    translate(497, 210);
    for (int i=0; i<9; i++) {
      rotate(radians(10));
      image(img4, -162, -5);
      img4.resize(30, 55);
    }
    popMatrix();

    pushMatrix();
    translate(497, 300);
    for (int i=0; i<14; i++) {
      rotate(radians(7));
      image(img5, -58, -288);
      img5.resize(35, 69);
    }
    popMatrix();

    pushMatrix();
    translate(362, 300);
    for (int i=0; i<14; i++) {
      rotate(radians(7));
      image(img6, 350, -90);
      img6.resize(40, 86);
    }
    popMatrix();

    popMatrix();
  }

  //----------------------------------------------//
  if (espiral==3 || espiral==4 || espiral==5) {    //Muestra la espiral 3 desde su aparición hasta el final 

    pushMatrix();
    tint(110, 2, 200);
    translate(835, 615);
    rotate(radians(190));
    fill(0);


    pushMatrix();
    translate(467, 215);

    for (int i=0; i<3; i++) {
      rotate(radians(-10));
      image(img00, -32, 5);
      img00.resize(5, 17);
    }
    popMatrix();

    pushMatrix();
    translate(460, 225);
    for (int i=0; i<10; i++) {
      rotate(radians(10));
      image(img0, -24, -10);
      img0.resize(10, 22);
    }
    popMatrix();

    pushMatrix();
    translate(462, 237);
    for (int i=0; i<10; i++) {
      rotate(radians(-9));
      image(img1, 23, -5);
      img1.resize(15, 28);
    }
    popMatrix();


    pushMatrix();
    translate(447, 250);
    for (int i=0; i<8; i++) {
      rotate(radians(10));
      image(img2, 40, -35);
      img2.resize(20, 37);
    }
    popMatrix();


    pushMatrix();
    translate(447, 200);
    for (int i=0; i<9; i++) {
      rotate(radians(10));
      image(img3, 10, 70);
      img3.resize(25, 46);
    }
    popMatrix();

    pushMatrix();
    translate(497, 210);
    for (int i=0; i<9; i++) {
      rotate(radians(10));
      image(img4, -162, -5);
      img4.resize(30, 55);
    }
    popMatrix();

    pushMatrix();
    translate(497, 300);
    for (int i=0; i<14; i++) {
      rotate(radians(7));
      image(img5, -58, -288);
      img5.resize(35, 69);
    }
    popMatrix();

    pushMatrix();
    translate(362, 300);
    for (int i=0; i<14; i++) {
      rotate(radians(7));
      image(img6, 350, -90);
      img6.resize(40, 86);
    }
    popMatrix();

    popMatrix();
  }

  //----------------------------------------------//
  if (espiral==4 || espiral==5) {    //Muestra la espiral 4 desde su aparición hasta el final 

    pushMatrix();
    tint(0, 0, 200);
    translate(355, 820);
    rotate(radians(250));
    fill(0);


    pushMatrix();
    translate(467, 215);

    for (int i=0; i<3; i++) {
      rotate(radians(-10));
      image(img00, -32, 5);
      img00.resize(5, 17);
    }
    popMatrix();

    pushMatrix();
    translate(460, 225);
    for (int i=0; i<10; i++) {
      rotate(radians(10));
      image(img0, -24, -10);
      img0.resize(10, 22);
    }
    popMatrix();

    pushMatrix();
    translate(462, 237);
    for (int i=0; i<10; i++) {
      rotate(radians(-9));
      image(img1, 23, -5);
      img1.resize(15, 28);
    }
    popMatrix();


    pushMatrix();
    translate(447, 250);
    for (int i=0; i<8; i++) {
      rotate(radians(10));
      image(img2, 40, -35);
      img2.resize(20, 37);
    }
    popMatrix();


    pushMatrix();
    translate(447, 200);
    for (int i=0; i<9; i++) {
      rotate(radians(10));
      image(img3, 10, 70);
      img3.resize(25, 46);
    }
    popMatrix();

    pushMatrix();
    translate(497, 210);
    for (int i=0; i<9; i++) {
      rotate(radians(10));
      image(img4, -162, -5);
      img4.resize(30, 55);
    }
    popMatrix();

    pushMatrix();
    translate(497, 300);
    for (int i=0; i<14; i++) {
      rotate(radians(7));
      image(img5, -58, -288);
      img5.resize(35, 69);
    }
    popMatrix();

    pushMatrix();
    translate(362, 300);
    for (int i=0; i<14; i++) {
      rotate(radians(7));
      image(img6, 350, -90);
      img6.resize(40, 86);
    }
    popMatrix();

    popMatrix();
  }

  //----------------------------------------------//
  if (espiral==5) {      //Muestra la espiral 5 desde su aparición hasta el final 

    pushMatrix();
    tint(0, 130, 190);
    translate(-60, 510);
    rotate(radians(310));
    fill(0);


    pushMatrix();
    translate(467, 215);

    for (int i=0; i<3; i++) {
      rotate(radians(-10));
      image(img00, -32, 5);
      img00.resize(5, 17);
    }
    popMatrix();

    pushMatrix();
    translate(460, 225);
    for (int i=0; i<10; i++) {
      rotate(radians(10));
      image(img0, -24, -10);
      img0.resize(10, 22);
    }
    popMatrix();

    pushMatrix();
    translate(462, 237);
    for (int i=0; i<10; i++) {
      rotate(radians(-9));
      image(img1, 23, -5);
      img1.resize(15, 28);
    }
    popMatrix();


    pushMatrix();
    translate(447, 250);
    for (int i=0; i<8; i++) {
      rotate(radians(10));
      image(img2, 40, -35);
      img2.resize(20, 37);
    }
    popMatrix();


    pushMatrix();
    translate(447, 200);
    for (int i=0; i<9; i++) {
      rotate(radians(10));
      image(img3, 10, 70);
      img3.resize(25, 46);
    }
    popMatrix();

    pushMatrix();
    translate(497, 210);
    for (int i=0; i<9; i++) {
      rotate(radians(10));
      image(img4, -162, -5);
      img4.resize(30, 55);
    }
    popMatrix();

    pushMatrix();
    translate(497, 300);
    for (int i=0; i<14; i++) {
      rotate(radians(7));
      image(img5, -58, -288);
      img5.resize(35, 69);
    }
    popMatrix();

    pushMatrix();
    translate(362, 300);
    for (int i=0; i<14; i++) {
      rotate(radians(7));
      image(img6, 350, -90);
      img6.resize(40, 86);
    }
    popMatrix();

    popMatrix();
  }
}

void mousePressed() {
  if (mouseButton==RIGHT)      //Al presionar el clic derecho avanza
    espiral+=1*dir;           //La dirección indica si es hacia adelante o atrás (1 o -1)
    dir=1;    


  if (espiral==5) {            //Al llegar a la espiral 5
    dir=0;                     //no avanza más
  }


  if (mouseButton==LEFT&&espiral>0) { //Al presionar el clic izquierdo retrocede, luego de pasar la pantalla inicial
    dir=-1;             //La dirección indica si es hacia adelante o atrás (1 o -1)
    espiral+=1*dir; 


    if (espiral==0) {          //Al llegar a la espiral 0
      dir=0;                   //no retrocede más
    }
  }
}



