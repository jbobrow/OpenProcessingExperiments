
/*Alejandro Sanclemente Tenorio
  12112025
  
  Febrero 17 de 2013 */

//Variables Lobo Arrastrable
int l1x=0;
int l1y=0;
int t1x=800;
int t1y=600;
int xOffset;
int yOffset;
boolean bloqueado;
boolean mouseSobre;


//Imágenes
PImage img0;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;
PImage img10;
PImage img11;
PImage img12;
PImage img13;
PImage img14;
PImage img15;
PImage img16;
PImage img17;
PImage img18;
PImage img19;
PImage img20;
PImage img21;
PImage img22;
PImage img23;
PImage img24;
PImage img25;
PImage img26;
PImage img27;

//Lobo
PImage img50;

//Final 1
PImage img30;
PImage img31;
PImage img32;
PImage img33;

//Final 2
PImage img34;
PImage img35;
PImage img36;
PImage img37;

//Final 3
PImage img38;
PImage img39;
PImage img40;
PImage img41;

//Pantalla a mostrar
int pantalla;

void setup() {
  size(800, 600);
  //IMÁGENES A CARGAR
  img0 = loadImage("0.jpg");
  img1 = loadImage("1.jpg");
  img2 = loadImage("2.jpg");
  img3 = loadImage("3.jpg");
  img4 = loadImage("4.jpg");
  img5 = loadImage("5.jpg");
  img6 = loadImage("6.jpg");
  img7 = loadImage("7.jpg");
  img8 = loadImage("8.jpg");
  img9 = loadImage("9.jpg");
  img10 = loadImage("10.jpg");
  img11= loadImage("11.jpg");
  img12= loadImage("12.jpg");
  img13 = loadImage("13.jpg");
  img14 = loadImage("14.jpg");
  img15 = loadImage("15.jpg");
  img16 = loadImage("16.jpg");
  img17 = loadImage("17.jpg");
  img18 = loadImage("18.jpg");
  img19 = loadImage("19.jpg");
  img20 = loadImage("20.jpg");
  img21= loadImage("21.jpg");
  img22= loadImage("22.jpg");
  img23 = loadImage("23.jpg");
  img24 = loadImage("24.jpg");
  img25 = loadImage("25.jpg");
  img26 = loadImage("26.jpg");
  img27 = loadImage("27.jpg");

  img30 = loadImage("19.jpg");
  img31 = loadImage("21.jpg");
  img32 = loadImage("22.jpg");
  img33 = loadImage("23.jpg");

  img34 = loadImage("20.jpg");
  img35 = loadImage("21.jpg");
  img36 = loadImage("22.jpg");
  img37 = loadImage("23.jpg");

  img38 = loadImage("21.jpg");
  img39 = loadImage("22.jpg");
  img40 = loadImage("23.jpg");

  img50 = loadImage("lobo.png");
}

void draw() {
  switch(pantalla) {
  case 0:
    image(img0, 0, 0, 800, 600);
    image(img50, l1x, l1y, t1x, t1y);

    //¿Está el mouse encima del lobo?
    if (mouseX > l1x-t1x && mouseX < l1x+t1x && mouseY > l1y-t1y && mouseY < l1y+t1y) {
      mouseSobre = true;
    } 
    else {
      mouseSobre = false;
    }

    break;

  case 1:
    image(img1, 0, 0, 800, 600);
    break;

  case 2:
    image(img2, 0, 0, 800, 600);
    break;

  case 3:
    image(img3, 0, 0, 800, 600);
    break;

  case 4:
    image(img4, 0, 0, 800, 600);
    break;

  case 5:
    image(img5, 0, 0, 800, 600);
    break;

  case 6:
    image(img6, 0, 0, 800, 600);
    break;

  case 7:
    image(img7, 0, 0, 800, 600);
    break;

  case 8:
    image(img8, 0, 0, 800, 600);
    break;

  case 9:
    image(img9, 0, 0, 800, 600);
    break;

  case 10:
    image(img10, 0, 0, 800, 600);
    break;

  case 11:
    image(img11, 0, 0, 800, 600);
    break;

  case 12:
    image(img12, 0, 0, 800, 600);
    break;

  case 13:
    image(img13, 0, 0, 800, 600);
    break;

  case 14:
    image(img14, 0, 0, 800, 600);
    break;

  case 15:
    image(img15, 0, 0, 800, 600);
    break;

  case 16:
    image(img16, 0, 0, 800, 600);
    break;

  case 17:
    image(img17, 0, 0, 800, 600);
    break;

  case 18:
    image(img18, 0, 0, 800, 600);
    break;

  case 19:
    image(img19, 0, 0, 800, 600);
    break;

  case 20:
    image(img20, 0, 0, 800, 600);
    break;

  case 21:
    image(img21, 0, 0, 800, 600);
    break;

  case 22:
    image(img22, 0, 0, 800, 600);
    break;

  case 23:
    image(img23, 0, 0, 800, 600);
    break;

  case 24:
    image(img24, 0, 0, 800, 600);
    break;

  case 25:
    image(img25, 0, 0, 800, 600);
    break;

  case 26:
    image(img26, 0, 0, 800, 600);
    break;

  case 27:
    image(img27, 0, 0, 800, 600);
    break;

  case 30:
    image(img30, 0, 0, 800, 600);
    break;

  case 31:
    image(img31, 0, 0, 800, 600);
    break;

  case 32:
    image(img32, 0, 0, 800, 600);
    break;

  case 33:
    image(img33, 0, 0, 800, 600);
    break;

  case 34:
    image(img34, 0, 0, 800, 600);
    break;

  case 35:
    image(img35, 0, 0, 800, 600);
    break;

  case 36:
    image(img36, 0, 0, 800, 600);
    break;

  case 37:
    image(img37, 0, 0, 800, 600);
    break;

  case 38:
    image(img38, 0, 0, 800, 600);
    break;

  case 39:
    image(img39, 0, 0, 800, 600);
    break;

  case 40:
    image(img40, 0, 0, 800, 600);
    break;
  }
}

void mousePressed() {
  switch (pantalla) {
  case 0:
  //Si el mouse está dentro de la pantalla y se presiona click, cambia a la siguiente pantalla.
    if (mouseButton == LEFT && mouseX > 500 && mouseX < 690 && mouseY > 387 && mouseY < 449) {
      pantalla=1;
    }
    else {
      pantalla=0;
    }

    if (mouseSobre) { 
      bloqueado = true;
    } 
    else {
      bloqueado = false;
    }
    xOffset = mouseX-l1x; 
    yOffset = mouseY-l1y; 

    break;

  case 1:
    if (mouseButton == LEFT) {
      pantalla=2;
    }
    else {
      pantalla=1;
    }
    break;

  case 2:
    if (mouseButton == LEFT) {
      pantalla=3;
    }
    else {
      pantalla=2;
    }
    break;

  case 3:
    if (mouseButton == LEFT && mouseX > 100 && mouseX < 220 && mouseY > 405 && mouseY < 470) {
      pantalla=4; //SI
    }
    if (mouseButton == LEFT && mouseX > 100 && mouseX < 220 && mouseY > 495 && mouseY < 555) {
      pantalla=12; //NO
    }
    break;

  case 4:
    if (mouseButton == LEFT) {
      pantalla=5;
    }
    else {
      pantalla=4;
    }
    break;

  case 5:
    if (mouseButton == LEFT) {
      pantalla=6;
    }
    else {
      pantalla=5;
    }
    break;

  case 6:
    if (mouseButton == LEFT && mouseX > 100 && mouseX < 220 && mouseY > 405 && mouseY < 470) {
      pantalla=7; //SI
    }
    if (mouseButton == LEFT && mouseX > 100 && mouseX < 220 && mouseY > 495 && mouseY < 555) {
      pantalla=10; //NO
    }
    break;

  case 7:
    if (mouseButton == LEFT) {
      pantalla=8;
    }
    else {
      pantalla=7;
    }
    break;

  case 8:
    if (mouseButton == LEFT) {
      pantalla=9;
    }
    else {
      pantalla=8;
    }
    break;

  case 9:
    if (mouseButton == LEFT) {
      pantalla=19;
    }
    else {
      pantalla=9;
    }
    break;

  case 10:
    if (mouseButton == LEFT) {
      pantalla=11;
    }
    else {
      pantalla=10;
    }
    break;

  case 11:
    if (mouseButton == LEFT) {
      pantalla=30;
    }
    else {
      pantalla=11;
    }
    break;

  case 12:
    if (mouseButton == LEFT) {
      pantalla=13;
    }
    else {
      pantalla=12;
    }
    break;

  case 13:
    if (mouseButton == LEFT && mouseX > 100 && mouseX < 220 && mouseY > 405 && mouseY < 470) {
      pantalla=14; //SI
    }
    if (mouseButton == LEFT && mouseX > 100 && mouseX < 220 && mouseY > 495 && mouseY < 555) {
      pantalla=17; //NO
    }
    break;

  case 14:
    if (mouseButton == LEFT) {
      pantalla=15;
    }
    else {
      pantalla=14;
    }
    break;

  case 15:
    if (mouseButton == LEFT) {
      pantalla=16;
    }
    else {
      pantalla=14;
    }
    break;

  case 16:
    if (mouseButton == LEFT) {
      pantalla=34;
    }
    else {
      pantalla=16;
    }
    break;

  case 17:
    if (mouseButton == LEFT) {
      pantalla=18;
    }
    else {
      pantalla=17;
    }
    break;

  case 18:
    if (mouseButton == LEFT) {
      pantalla=38;
    }
    else {
      pantalla=18;
    }
    break;

  case 19:
    if (mouseButton == LEFT) {
      pantalla=20;
    }
    else {
      pantalla=19;
    }
    break;

  case 20:
    if (mouseButton == LEFT) {
      pantalla=21;
    }
    else {
      pantalla=20;
    }
    break;

  case 21:
    if (mouseButton == LEFT) {
      pantalla=22;
    }
    else {
      pantalla=21;
    }
    break;

  case 22:
    if (mouseButton == LEFT) {
      pantalla=23;
    }
    else {
      pantalla=22;
    }
    break;

  case 23:
    if (mouseButton == LEFT) {
      pantalla=24;
    }
    else {
      pantalla=23;
    }
    break;

  case 24:
    if (mouseButton == LEFT) {
      pantalla=27;
    }
    else {
      pantalla=24;
    }
    break;

  case 25:
    if (mouseButton == LEFT) {
      pantalla=27;
    }
    else {
      pantalla=25;
    }
    break;

  case 26:
    if (mouseButton == LEFT) {
      pantalla=27;
    }
    else {
      pantalla=26;
    }
    break;

  case 30:
    if (mouseButton == LEFT) {
      pantalla=31;
    }
    else {
      pantalla=30;
    }
    break;

  case 31:
    if (mouseButton == LEFT) {
      pantalla=32;
    }
    else {
      pantalla=31;
    }
    break;

  case 32:
    if (mouseButton == LEFT) {
      pantalla=33;
    }
    else {
      pantalla=32;
    }
    break;

  case 33:
    if (mouseButton == LEFT) {
      pantalla=25;
    }
    else {
      pantalla=33;
    }
    break;

  case 34:
    if (mouseButton == LEFT) {
      pantalla=35;
    }
    else {
      pantalla=34;
    }
    break;

  case 35:
    if (mouseButton == LEFT) {
      pantalla=36;
    }
    else {
      pantalla=35;
    }
    break;

  case 36:
    if (mouseButton == LEFT) {
      pantalla=37;
    }
    else {
      pantalla=36;
    }
    break;

  case 37:
    if (mouseButton == LEFT) {
      pantalla=25;
    }
    else {
      pantalla=37;
    }
    break;

  case 38:
    if (mouseButton == LEFT) {
      pantalla=39;
    }
    else {
      pantalla=38;
    }
    break;

  case 39:
    if (mouseButton == LEFT) {
      pantalla=40;
    }
    else {
      pantalla=39;
    }
    break;

  case 40:
    if (mouseButton == LEFT) {
      pantalla=26;
    }
    else {
      pantalla=40;
    }
    break;
  }
}

void mouseDragged() {

  switch (pantalla) {
  case 0:
    if (bloqueado) {
      l1x = mouseX-xOffset; 
      l1y = mouseY-yOffset;
    }

    break;
  }
}

void mouseReleased() {
  switch (pantalla) {
  case 0:
  //El lobo vuelve a su posición inicial
    l1x=0;
    l1y=0;
  }
}



