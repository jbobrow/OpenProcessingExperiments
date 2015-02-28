
PImage pandeiro00;
PImage pandeiro01;
PImage pandeiro02;
PImage pandeiro03;
PImage djalma00;
PImage djalma01;
PImage djalma03;
PImage djalma04;
PImage azul1;
PImage azul2;
PImage azul3;
PImage imagemMenu;

import ddf.minim.*;

Minim minim;
AudioSample pandeiro1;
AudioSample pandeiro2;
AudioSample pandeiro3;

int estado;
int MENU = 0;
int JOGANDO = 1;
boolean tecla7;
boolean tecla8;
boolean tecla9;
int nota;
boolean ida;
float ultimaBatida;
float ultimoIntervalo;
boolean sequencia;
float danca;
boolean dancando;
int ultimaMudanca;

void setup() {

  size(800, 589);
  estado = MENU;
  //carregamento de imagens
  pandeiro00 = loadImage ("teste02.png");
  pandeiro01 = loadImage ("teste01.png");
  pandeiro02 = loadImage ("teste03.png");
  pandeiro03 = loadImage ("teste04.png");
  djalma00 = loadImage ("djal0001.png");
  djalma01 = loadImage ("djal0002.png");
  djalma03 = loadImage ("djal0003.png");
  djalma04 = loadImage ("djal0004.png");
  azul1 = loadImage ("azul.png");
  azul2 = loadImage ("azul2.png");
  azul3 = loadImage ("azul3.png");
  imagemMenu = loadImage ("menu5.png");

  minim = new Minim(this);
  pandeiro1 = minim.loadSample("pandeiro1.aif", 256);
  pandeiro2 = minim.loadSample("pandeiro2.aif", 256);
  pandeiro3 = minim.loadSample("pandeiro3.aif", 256);

  ultimaBatida=0;
  ultimoIntervalo=0;
  danca=1;
}

void draw() {
  if (estado==MENU) {
    menu();
  } 
  else if (estado==JOGANDO) {
    jogando();
  }
}

void menu() {
  image (imagemMenu, 0, 0);
}

void jogando() {
  //trata entrada do jogador
  if (tecla7==true) {
    if (nota==1) {
      print("certo ");
      sequencia=true;
      danca+=0.15;
    } 
    else {
      danca-=0.001;
    }
    nota=0;
    ida=true;
  }
  if (tecla8==true) {
    if (nota==0 && ida==true) {
      print("certo ");
      sequencia=true;
      danca+=0.15;
    }
    else {
      danca-=0.001;
    }
    if (nota==2 && ida==false) {
      print("certo ");
      sequencia=true;
      danca+=0.15;
    }
    else {
      danca-=0.001;
    }
    nota=1;
  }
  if (tecla9==true) {
    if (nota==1) {
      print("certo ");
      sequencia=true;
      danca+=0.15;
    }
    else {
      danca-=0.001;
    }
    nota=2;
    ida=false;
  }

  //trata não-jogadores

  danca=danca-0.01;
  if (danca<0) {
    danca=0;
  }
  if (danca>1) {
    danca=1;
  }

  //desenha
  background(255);
  //image (azul1, 0, 0);
  djalma();
  if (nota==0) {
    image (pandeiro01, 0, 0);
  }
  if (nota==1) {
    image (pandeiro02, 0, 0);
  }
  if (nota==2) {
    image (pandeiro03, 0, 0);
  }
  if (tecla7==false && tecla8==false && tecla9==false &&
    millis()-ultimaBatida>600) {
    background(255);
    image (azul1, 0, 0);  
    djalma();
    image (pandeiro00, 0, 0);
  }
}

void keyPressed() {
  tecla7=false;
  tecla8=false;
  tecla9=false;
  if (key=='7') {
    tecla7=true;
    pandeiro1.trigger();
  }
  if (key=='8') {
    tecla8=true;
    pandeiro2.trigger();
  }
  if (key=='9') {
    tecla9=true;
    pandeiro3.trigger();
  }
  if (key == ' ') {
    estado = JOGANDO;
  }
    if (keyCode == TAB) {
    estado = MENU;
  }

  //confere ritmo
  float atual=millis();
  if (key=='7' || key=='8' || key=='9') {
    if (atual-ultimaBatida>ultimoIntervalo-100 &&
      atual-ultimaBatida<ultimoIntervalo+100) {
      print("acertou ");
      danca+=0.1;
      if (danca>1) {
        danca=1;
      }
    } 
    else {
      print("errou ");
    }
    ultimoIntervalo=atual-ultimaBatida;
    ultimaBatida = atual;
    //print("ultimoIntervalo= " + ultimoIntervalo);
  }
}

void djalma() {
  if (danca<0.1) {
    image (azul1, 0, 0);
    image (djalma00, 630, 10);
  }

  if (danca>=0.1 && danca<0.4) {
    image (azul2, 0, 0); 
    image (djalma01, 630, 20);
  }

  if (danca>=0.4 && danca<=1) {
    if (dancando==true) {
      image (azul3, 0, 0);
    }
    else {
      image (azul2, 0, 0);
    }
    if (millis()-ultimaMudanca>400) {
      dancando=!dancando;
      ultimaMudanca=millis();
    } 
    if (dancando==true) {
      image (djalma03, 605, 25);
    }
    else {
      image (djalma04, 605, 25);
    }
    if (millis()-ultimaMudanca>400) {
      dancando=!dancando;
      ultimaMudanca=millis();
    }
  }
}

void keyReleased() {

  if (key=='7') {
    tecla7=false;
  }
  if (key=='8') {
    tecla8=false;
  }
  if (key=='9') {
    tecla9=false;
  }
}

void stop()
{
  // always close Minim audio classes when you are done with them
  pandeiro1.close();
  minim.stop();

  pandeiro2.close();
  minim.stop();

  pandeiro3.close();
  minim.stop();

  super.stop();
}



