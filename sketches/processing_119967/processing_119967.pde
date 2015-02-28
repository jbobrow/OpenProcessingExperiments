
//Variables
PImage index;
PImage pared;
int nivel;
PFont tag;
PFont juego;
String tipear = "";
String apodo = "";

//Variables Paint
int pX=0, pY=0;
int hue=255, saturation=255, brightness=0;
int sepRect=25, sepX=10, sepY=572;
int btX=365, btY=570;
int gdbX=335, gdbY=570;
int masgX=395, masgY=570;
int mengX=425, mengY=570;
int grosor=10;

void setup () {
  size(900, 600);
  background(255);
  index= loadImage("index.jpg");
  pared= loadImage("pared.jpg");

  nivel=0;

  tag = createFont("tag.ttf", 30);
  juego = createFont("Minecraftia.ttf", 45);
}

void draw () {
  if (nivel ==0) {
    Bienvenida();
  }
  if (nivel ==1) {
    Introducite();
  }
  if (nivel ==2) {
    Vandaliza();
  }
  if (nivel ==3) {
    Consagracion();
  }
  else
    if (nivel==4) {
      Policia();
    }
}

void Bienvenida() {
  background(0);
  //cambiar imagen por ladrillos con rect en illustrator
  image(index, 0, 0);
  fill(0);
  textFont(juego);
  textSize(20);
  text("ENTER para vandalizar >>", 25, 550);
}

void Introducite() {
  background(0);
  fill(255);
  textFont(juego);
  textSize(25);
  text("Introducite en la calle con tu apodo:", 15, 50);
  text("Apretá la flecha derecha ('->') para continuar.", 15, 75);
  textFont(tag);
  textSize(75);
  text(tipear, 25, 100);
}

void Vandaliza() {
  colorMode (HSB); //"Hue (0/360), Saturation (0/100), Brightness(0/100)"
  //background(0, 0, 255);
  //image(pared, 0, 0);
  textFont(juego);
  textSize(15);
  text("Cuidado con la policía...", 15, 20); //contador? policia sorpresa???
  fill(0);
  textFont(tag);
  text(apodo, 15, 5);
  Paint();
}

void Paint() {
  smooth();
  colorMode (HSB); //"Hue (0/360), Saturation (0/100), Brightness(0/100)"
  int i=0;
  int gama[]= {
    0, 0, 200, 174, 150, 127, 106, 85, 66, 48, 31, 15, 0
  };
  int sat[]= {
    0, 0, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255
  };
  int brillo[]= {
    0, 125, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255
  };

  if (mousePressed) {
    //FUNCIONES
    //Dibuja linea
    strokeWeight(grosor);
    stroke(hue, saturation, brightness);
    line(mouseX, mouseY, pX, pY);//linea continua

    //Borrar todo
    if (mouseX>btX && mouseY>btY && mouseX<btX+18 && mouseY<btY+18) {
      image(pared, 0, 0);
    }

    //Goma de borrar
    if (mouseX>gdbX && mouseX<gdbX+18 && mouseY>gdbY && mouseY<gdbY+18) {
      if (mouseButton==LEFT) {
        saturation = 0;
      }
      else {
        background(0, 0, 255);
      }
    }

    //Seleccionar el color
    for (i=0;i<13;i++) {
      if (mouseX>sepX+i*sepRect && mouseY>sepY && mouseX<40+i*sepRect && mouseY<sepY+15) {
        if (mouseButton==LEFT) {
          hue = gama[i];
          saturation= sat[i];
          brightness= brillo[i];
        }
        else {
          background(gama[i], 255, 255);
        }
      }
    }

    //+Grosor
    if (mouseX>masgX && mouseY>masgY && mouseX<masgX+18 && mouseY<masgY+18) {
      if (mouseButton==LEFT) {
        grosor = grosor+2;
      }
    }
    //-Grosor
    if (mouseX>mengX && mouseX<mengX+18 && mouseY>mengY && mouseY<mengY+18) {
      if (mouseButton==LEFT) {
        grosor = grosor-2;
      }
    }
    if (grosor<=0) {
      grosor=1;
    }
  }

  pX=mouseX;
  pY=mouseY;

  //BOTONES
  //BOTONERA
  noStroke();
  fill(255);
  rect(0, 560, 460, 40);
  //BT
  strokeWeight(1);
  fill(255);
  noStroke();
  rect(btX, btY, 18, 18);
  stroke(0);
  line(btX, btY, btX+18, btY+18);
  line(btX, btY+18, btX+18, btY);
  fill(0, 0, 0);

  //GdB
  fill(0, 0, 255);
  rect(gdbX, gdbY, 18, 18);

  //Colores
  for (i=0;i<13;i++) {
    noStroke();
    fill(gama[i], sat[i], brillo[i]);
    rect(sepX+i*sepRect, sepY, 18, 18);
  }

  //+Grosor
  strokeWeight(1);
  fill(255);
  noStroke();
  rect(masgX, masgY, 18, 18);
  stroke(0);
  line(masgX+18/2, masgY, masgX+18/2, masgY+18);
  line(masgX, masgY+18/2, masgX+18, masgY+18/2);
  fill(0, 0, 0);
  //-Grosor
  strokeWeight(1);
  fill(255);
  noStroke();
  rect(mengX, mengY, 18, 18);
  stroke(0);
  line(mengX, mengY+18/2, mengX+18, mengY+18/2);
  fill(0, 0, 0);
}

void Consagracion() {
}

void Policia() {
}

void keyPressed() {
  if (keyCode == ENTER) { //pasar a Nivel1
    nivel=1;
  }
  if (keyCode == RIGHT) { //pasar a Nivel2
    apodo = tipear;
    nivel=2;
  }

  //Apodo
  //Borrar y escribir
  if (key == BACKSPACE) {
    if (tipear.length() > 0) {
      tipear = tipear.substring(0, tipear.length()-1);
      fill (0);//fondo negro
      rect(140, 100, 640, 480);
    }
  }
  else if (textWidth(tipear+key) < width) {
    tipear = tipear+key;
      }
}

