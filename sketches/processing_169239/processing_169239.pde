
/*Toilet Paper Proyect
art by Alejandra Bermúdez
code by Emiliano Monserrate*/

int y = 0;
int noticias = 1; // determina la noticia que aparece
int aviso = 0; // avisa de si se ha pulsado previamente el papel

PImage paperwater;
PImage noticia01;
PImage noticia02;
PImage noticia03;
PImage noticia04;
PImage noticia05;
PImage noticia06;
PImage noticia07;
PImage noticia08;
PImage noticia09;
PImage noticia10;
PImage noticia11;
PImage noticia12;
PImage noticia13;
PImage noticia14;
PImage noticia15;
PImage noticia16;
PImage noticia17;
PImage noticia18;
PImage noticia19;
PImage noticia20;
PImage noticia21;
PImage noticia22;
PImage noticia23;
PImage noticia24;
PImage noticia25;
PImage noticia26;
PImage noticia27;
PImage noticia28;
PImage noticia29;
PImage noticia30;
PImage noticia31;
PImage noticia32;
PImage noticia33;
PImage noticia34;
PImage noticia35;
PImage noticia36;
PImage noticia37;
PImage noticia38;
PImage noticia39;
PImage noticia40;
PImage noticia41;
PImage noticia42;
PImage noticia43;
PImage noticia44;
PImage noticia45;
PImage noticia46;
PImage noticia47;
PImage noticia48;
PImage noticia49;
PImage noticia50;


boolean overButton (int posx, int posy, int ancho, int alto) {
  if(mouseX > posx && mouseX < posx+ancho && mouseY > posy && mouseY < posy+alto) {
    return true;
  }
  else {
    return false;
  }
}

void setup() {
  
  size(700, 750);
  background(0);
  
  paperwater = loadImage("paperwater.png");
  noticia01 = loadImage("noticia01.jpg");
  noticia02 = loadImage("noticia02.jpg");
  noticia03 = loadImage("noticia03.jpg");
  noticia04 = loadImage("noticia04.jpg");
  noticia05 = loadImage("noticia05.jpg");
  noticia06 = loadImage("noticia06.jpg");
  noticia07 = loadImage("noticia07.jpg");
  noticia08 = loadImage("noticia08.jpg");
  noticia09 = loadImage("noticia09.jpg");
  noticia10 = loadImage("noticia10.jpg");
  noticia11 = loadImage("noticia11.jpg");
  noticia12 = loadImage("noticia12.jpg");
  noticia13 = loadImage("noticia13.jpg");
  noticia14 = loadImage("noticia14.jpg");
  noticia15 = loadImage("noticia15.jpg");
  noticia16 = loadImage("noticia16.jpg");
  noticia17 = loadImage("noticia17.jpg");
  noticia18 = loadImage("noticia18.jpg");
  noticia19 = loadImage("noticia19.jpg");
  noticia20 = loadImage("noticia20.jpg");
  noticia21 = loadImage("noticia21.jpg");
  noticia22 = loadImage("noticia22.jpg");
  noticia23 = loadImage("noticia23.jpg");
  noticia24 = loadImage("noticia24.jpg");
  noticia25 = loadImage("noticia25.jpg");
  noticia26 = loadImage("noticia26.jpg");
  noticia27 = loadImage("noticia27.jpg");
  noticia28 = loadImage("noticia28.jpg");
  noticia29 = loadImage("noticia29.jpg");
  noticia30 = loadImage("noticia30.jpg");
  noticia31 = loadImage("noticia31.jpg");
  noticia32 = loadImage("noticia32.jpg");
  noticia33 = loadImage("noticia33.jpg");
  noticia34 = loadImage("noticia34.jpg");
  noticia35 = loadImage("noticia35.jpg");
  noticia36 = loadImage("noticia36.jpg");
  noticia37 = loadImage("noticia37.jpg");
  noticia38 = loadImage("noticia38.jpg");
  noticia39 = loadImage("noticia39.jpg");
  noticia40 = loadImage("noticia40.jpg");
  noticia41 = loadImage("noticia41.jpg");
  noticia42 = loadImage("noticia42.jpg");
  noticia43 = loadImage("noticia43.jpg");
  noticia44 = loadImage("noticia44.jpg");
  noticia45 = loadImage("noticia45.jpg");
  noticia46 = loadImage("noticia46.jpg");
  noticia47 = loadImage("noticia47.jpg");
  noticia48 = loadImage("noticia48.jpg");
  noticia49 = loadImage("noticia49.jpg");
  noticia50 = loadImage("noticia50.jpg");
  noticia51 = loadImage("noticia51.jpg");
  noticia52 = loadImage("noticia52.jpg");
  noticia53 = loadImage("noticia53.jpg");
  noticia54 = loadImage("noticia54.jpg");
  noticia55 = loadImage("noticia55.jpg");
  noticia56 = loadImage("noticia56.jpg");
  noticia57 = loadImage("noticia57.jpg");
  noticia58 = loadImage("noticia58.jpg");
  noticia59 = loadImage("noticia59.jpg");
}

void draw() {
  
  imageMode(CENTER);
  
  fill(0);
  noStroke();
  rect(0, 400, 1000, 600);
  
  if(noticias == 1) { image(noticia01, 378, 230 + y, 390, 340); }
  if(noticias == 2) { image(noticia02, 378, 230 + y, 390, 340); }
  if(noticias == 3) { image(noticia03, 378, 230 + y, 390, 340); }
  if(noticias == 4) { image(noticia04, 378, 230 + y, 390, 340); }
  if(noticias == 5) { image(noticia05, 378, 230 + y, 390, 340); }
  if(noticias == 6) { image(noticia06, 378, 230 + y, 390, 340); }
  if(noticias == 7) { image(noticia07, 378, 230 + y, 390, 340); }
  if(noticias == 8) { image(noticia08, 378, 230 + y, 390, 340); }
  if(noticias == 9) { image(noticia09, 378, 230 + y, 390, 340); }
  if(noticias == 10) { image(noticia10, 378, 230 + y, 390, 340); }
  if(noticias == 11) { image(noticia11, 378, 230 + y, 390, 340); }
  if(noticias == 12) { image(noticia12, 378, 230 + y, 390, 340); }
  if(noticias == 13) { image(noticia13, 378, 230 + y, 390, 340); }
  if(noticias == 14) { image(noticia14, 378, 230 + y, 390, 340); }
  if(noticias == 15) { image(noticia15, 378, 230 + y, 390, 340); }
  if(noticias == 16) { image(noticia16, 378, 230 + y, 390, 340); }
  if(noticias == 17) { image(noticia17, 378, 230 + y, 390, 340); }
  if(noticias == 18) { image(noticia18, 378, 230 + y, 390, 340); }
  if(noticias == 19) { image(noticia19, 378, 230 + y, 390, 340); }
  if(noticias == 20) { image(noticia20, 378, 230 + y, 390, 340); }
  if(noticias == 21) { image(noticia21, 378, 230 + y, 390, 340); }
  if(noticias == 22) { image(noticia22, 378, 230 + y, 390, 340); }
  if(noticias == 23) { image(noticia23, 378, 230 + y, 390, 340); }
  if(noticias == 24) { image(noticia24, 378, 230 + y, 390, 340); }
  if(noticias == 25) { image(noticia25, 378, 230 + y, 390, 340); }
  if(noticias == 26) { image(noticia26, 378, 230 + y, 390, 340); }
  if(noticias == 27) { image(noticia27, 378, 230 + y, 390, 340); }
  if(noticias == 28) { image(noticia28, 378, 230 + y, 390, 340); }
  if(noticias == 29) { image(noticia29, 378, 230 + y, 390, 340); }
  if(noticias == 30) { image(noticia30, 378, 230 + y, 390, 340); }
  if(noticias == 31) { image(noticia31, 378, 230 + y, 390, 340); }
  if(noticias == 32) { image(noticia32, 378, 230 + y, 390, 340); }
  if(noticias == 33) { image(noticia33, 378, 230 + y, 390, 340); }
  if(noticias == 34) { image(noticia34, 378, 230 + y, 390, 340); }
  if(noticias == 35) { image(noticia35, 378, 230 + y, 390, 340); }
  if(noticias == 36) { image(noticia36, 378, 230 + y, 390, 340); }
  if(noticias == 37) { image(noticia37, 378, 230 + y, 390, 340); }
  if(noticias == 38) { image(noticia38, 378, 230 + y, 390, 340); }
  if(noticias == 39) { image(noticia39, 378, 230 + y, 390, 340); }
  if(noticias == 40) { image(noticia40, 378, 230 + y, 390, 340); }
  if(noticias == 41) { image(noticia41, 378, 230 + y, 390, 340); }
  if(noticias == 42) { image(noticia42, 378, 230 + y, 390, 340); }
  if(noticias == 43) { image(noticia43, 378, 230 + y, 390, 340); }
  if(noticias == 44) { image(noticia44, 378, 230 + y, 390, 340); }
  if(noticias == 45) { image(noticia45, 378, 230 + y, 390, 340); }
  if(noticias == 46) { image(noticia46, 378, 230 + y, 390, 340); }
  if(noticias == 47) { image(noticia47, 378, 230 + y, 390, 340); }
  if(noticias == 48) { image(noticia48, 378, 230 + y, 390, 340); }
  if(noticias == 49) { image(noticia49, 378, 230 + y, 390, 340); }
  if(noticias == 50) { image(noticia50, 378, 230 + y, 390, 340); }
  if(noticias == 51) { image(noticia51, 378, 230 + y, 390, 340); }
  if(noticias == 52) { image(noticia52, 378, 230 + y, 390, 340); }
  if(noticias == 53) { image(noticia53, 378, 230 + y, 390, 340); }
  if(noticias == 54) { image(noticia54, 378, 230 + y, 390, 340); }
  if(noticias == 55) { image(noticia55, 378, 230 + y, 390, 340); }
  if(noticias == 56) { image(noticia56, 378, 230 + y, 390, 340); }
  if(noticias == 57) { image(noticia57, 378, 230 + y, 390, 340); }
  if(noticias == 58) { image(noticia58, 378, 230 + y, 390, 340); }
  if(noticias == 59) { image(noticia59, 378, 230 + y, 390, 340); }

  rect(0, 0, 1000, 245);
  image(paperwater, 400, 400, 1000, 700);
  
  imageMode(CORNER);
  
  noFill();
  stroke(255, 0, 0);
  //rect(180, 340, 400, 500);
  
  if(overButton(180, 340, 400, 500) == true) {
    if (mousePressed == true) { 
      if(y < mouseY - 200) { y = y + 10; }
      if(y > mouseY - 200) { y = y - 10; }
      aviso = 1;
    }
  }
  
  if((mousePressed == false)&& (aviso == 1)) { y = y + 5; }
  
  if(y > 800) {
    y = 0;
    noticias = noticias + 1;
    aviso = 0;
  }
  
  if (noticias > 59) { noticias = 1; }
  
}


