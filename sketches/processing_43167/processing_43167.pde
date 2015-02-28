
PImage colpanno;
PImage colpad;
PImage simil;
PImage porta;
PImage portab;
PImage vi;
PImage alte;
PImage led;
PImage logo;
PImage flop;

PFont din;

int tota = 0;
int tot = 0;
int colp = 255;
int colp2 = 255;
int colp3 = 255;
int dealer = 0;
int pad = 0;
int pad2 = 0;
int pad3 = 0;
//altezza padded
int y = 5;
//int yp = 0;
int tipo = 150;

boolean portCheck;
boolean similCheck;
boolean alteCheck;
boolean ledCheck;
boolean gambeCheck;
boolean gambe2Check;
boolean logoCheck;
boolean carteCheck;

boolean giocatori6;
boolean giocatori8;
boolean giocatori10;
boolean giocatori12;

//portabicchieri
boolean port;
// 3 o 6 cm
boolean altezza;
//impianto led
boolean iled;
boolean similpelle;
boolean gambe;
boolean gambe2;
boolean logoo;
boolean carte;

///////////////////////////////////SETUP

void setup() {
  size(660, 360);
  colpanno = loadImage("colpanno.png");
  colpad = loadImage("colpad.png");
  simil = loadImage("simil.png");
  porta = loadImage("portabicchieri.png");
  portab = loadImage("portab.png");
  vi = loadImage("vi.png");
  alte = loadImage("alte.png");
  led = loadImage("led.png");
  logo = loadImage("logo.png");
  flop = loadImage("flop.png");

  din = loadFont("DINAlternate-Regular-24.vlw");
}

//////////////////////////////////DRAW
void draw() {
  smooth();
  background(255);

  /////////////padded
  noFill();
  stroke(pad, pad2, pad3);
  strokeWeight(28);
  ellipse(160, height/2, 240, 240);
  ellipse(340, height/2, 240, 240);
  rect(160, height/2-120, 180, 240);

  //////////////////panno
  noStroke();
  fill(colp, colp2, colp3);
  ellipse(160, height/2, 220, 220);
  ellipse(340, height/2, 220, 220);
  rect(160, height/2-110, 180, 220);

  //dealer
  // fill(colp, colp2, colp3);
  //rect(160, height/2+110, 180, dealer);

  //colori panno
  fill(35, 100, 15);
  rect(width-55, 50, 15, 15);
  fill(20, 20, 120);
  rect(width-75, 50, 15, 15);
  fill(230, 20, 20);
  rect(width-95, 50, 15, 15);
  fill(116, 25, 25);
  rect(width-115, 50, 15, 15);
  fill(60, 30, 5);
  rect(width-135, 50, 15, 15);
  fill(235, 200, 125);
  rect(width-155, 50, 15, 15);
  fill(90);
  rect(width-35, 50, 15, 15);

  //colori padded
  //fill(90);
  //rect(width-35, 100, 15, 15);
  //fill(35, 100, 15);
  //rect(width-55, 100, 15, 15);
  fill(20);
  rect(width-75, 95, 15, 15);
  fill(20, 20, 80);
  rect(width-95, 95, 15, 15);
  fill(100, 10, 10);
  rect(width-115, 95, 15, 15);
  fill(50, 20, 0);
  rect(width-135, 95, 15, 15);
  fill(215, 180, 105);
  rect(width-155, 95, 15, 15);


  ///////////////////////////////////////////////quadrati opzioni
  noFill();
  strokeWeight(1);
  stroke(150);
  rect(width-100, 123, 12, 12);
  rect(width-80, 148, 12, 12);
  rect(width-81, 173, 12, 12);
  rect(width-43, 173, 12, 12);
  rect(width-90, 198, 12, 12);
  rect(width-120, 223, 12, 12);
  rect(width-90, 223, 12, 12);
  rect(width-55, 223, 12, 12);
  rect(width-87, 248, 12, 12);
  rect(width-115, 273, 12, 12);

  rect(130, 14, 12, 12);
  rect(165, 14, 12, 12);
  rect(200, 14, 12, 12);
  rect(235, 14, 12, 12);

  /////////////////////////////////////////boolean

  

  if (giocatori6 == false) {
  }
  else {
    tipo = 150; 
    image(vi, 130, 14);
  }

  if (giocatori8 == false) {
  }
  else {
    tipo = 200; 
    image(vi, 165, 14);
  }

  if (giocatori10 == false) {
  }
  else {
    tipo = 250; 
    image(vi, 200, 14);
  }

  if (giocatori12 == false) {
  }
  else {
    tipo = 280; 
    image(vi, 235, 14);
  }


  if (similpelle == false) {
  }
  else {
    image(vi, width-100, 123);
  }

  //Portabicchieri
  if (port == false) {
  }
  else {
    image(porta, 52, height/2-109);
    image(vi, width-80, 148);
    //tot = tot + 80;
  }

  //altezza
  if (altezza == false) {
    iled = false;
    image(vi, width-81, 173);
    y = 6;
  }
  else {
    image(vi, width-43, 173);
    y=12;
  }

  //led
  if (iled == false) {
  }
  else {

    image(vi, width-90, 198);
  }
  //no gambe
  if (gambe == false && gambe2 == false)
  {
    image(vi, width-120, 223);
  }
  // gambe economiche
  if (gambe == false) {
  }
  else {
    gambe2 = false;
    image(vi, width-90, 223);
  }
  // gambe metallo
  if (gambe2 == false) {
  }
  else {
    gambe = false;
    image(vi, width-55, 223);
  }
  // logo
  if (logoo == true) {
    image(vi, width-87, 248);
    image(logo, 230, height/2-16);
  }

  //carte
  if (carte == false) {
  }
  else {
    image(vi, width-115, 273);
    image(flop, 220, height/2+10);
  }

  ////////////////////////////////////////TESTI

  /* image(colpanno, width-155, 35);
   image(colpad, width-155, 80);
   image(simil, width-155, 125);
   image(portab, width-155, 150);
   image(alte, width-155, 175);
   image(led, width-155, 200);*/
  textSize(9);
  fill(87, 87, 86);
  text("Seleziona colore panno.", width-155, 45);
  text("Colore padded.", width-155, 90);
  text("Similpelle", width-155, 133);
  text("Portabicchieri", width-155, 158);
  text("Altezza padded.      3cm      6cm", width-155, 183);
  text("Impianto led.", width-155, 208);
  text("Gambe      No      Eco      Metallo", width-155, 233);
  text("Stampa Logo", width-155, 258);
  text("Stampa ", width-155, 283);

  text("Numero Giocatori:       6          8         10        12", 40, 24);

  textSize(16);
  tota = tot + tipo; 
  text("Totale: " + tota, width-155, height-19);


  //disegnopadded

  fill(255);
  rect(40, height-19, 420, 4);
  fill(pad, pad2, pad3);
  rect(40, height-19-y, 420, y);


  ///Azzera
  noStroke();
  fill(200);
  rect(width-155, 0, 100, 20);
  fill(255);
  textSize(9);
  text("Azzera", width-120, 12);

  //////////////////////////////////////////////Pressed

  if (mousePressed) {
    //Panno
    //Avorio
    if (mouseX>width-155 && mouseX<width-155+15 && mouseY>50 && mouseY<65) {
      colp = 235;
      colp2=200;
      colp3 = 125;
    }
    //Marrone
    if (mouseX>width-135 && mouseX<width-135+15 && mouseY>50 && mouseY<65) {
      colp = 60;
      colp2 = 30;
      colp3 = 5;
    }
    //Bordeaux
    if (mouseX>width-115 && mouseX<width-115+15 && mouseY>50 && mouseY<65) {
      colp = 116;
      colp2 = 25;
      colp3 = 25;
    }
    //Rosso
    if (mouseX>width-95 && mouseX<width-95+15 && mouseY>50 && mouseY<65) {
      colp = 220;
      colp2=20;
      colp3 = 20;
    }
    //Blu
    if (mouseX>width-75 && mouseX<width-75+15 && mouseY>50 && mouseY<65) {
      colp = 20;
      colp2=20;
      colp3 = 120;
    }
    //Verde
    if (mouseX>width-55 && mouseX<width-55+15 && mouseY>50 && mouseY<65) {
      colp = 35;
      colp2=100;
      colp3 = 15;
    }
    //Grigio
    if (mouseX>width-35 && mouseX<width-35+15 && mouseY>50 && mouseY<65) {
      colp = 90;
      colp2=90;
      colp3 = 90;
    }
    ////////////////////////Padded

    //Avorio
    if (mouseX>width-155 && mouseX<width-155+15 && mouseY>95 && mouseY<110) {
      pad = 215;
      pad2=180;
      pad3 = 105;
    }
    //Marrone
    if (mouseX>width-135 && mouseX<width-135+15 && mouseY>95 && mouseY<110) {
      pad = 50;
      pad2 = 20;
      pad3 = 0;
    }
    //Bordeaux
    if (mouseX>width-115 && mouseX<width-115+15 && mouseY>95 && mouseY<110) {
      pad = 100;
      pad2 = 10;
      pad3 = 10;
    }
    //Blu
    if (mouseX>width-95 && mouseX<width-95+15 && mouseY>95 && mouseY<110) {
      pad = 20;
      pad2=20;
      pad3 = 80;
    }
    //Nero
    if (mouseX>width-75 && mouseX<width-75+15 && mouseY>95 && mouseY<110) {
      pad = 20;
      pad2=20;
      pad3 = 20;
    }
    //Verde
    /*if (mouseX>width-55 && mouseX<width-55+15 && mouseY>100 && mouseY<115) {
     colp = 35;
     colp2=100;
     colp3 = 15;
     }
     //Grigio
     if (mouseX>width-35 && mouseX<width-35+15 && mouseY>100 && mouseY<115) {
     colp = 90;
     colp2=90;
     colp3 = 90;
     }*/

    //portabicchieri
  }
}

//////////////////////////////////////////////////////////RELEASED
void mouseReleased() {
  //portabicchieri
  if (mouseX>width-80 && mouseX<width-80+12 && mouseY>148 && mouseY<160) {
    if (gambe == true || gambe2 == true) {
      if (port == false) {
        port = true;
        portCheck = true;
      }
      else {
        port = false;
        portCheck = true;
      }
    }
  }
  //altezza padded
  if (mouseX>width-81 && mouseX<width-69 && mouseY>173 && mouseY<185) {
    if (altezza == false) {
      altezza = true;
      alteCheck = true;
    }
    else { 
      altezza = false;
      alteCheck = true;
    }
  }
  if (mouseX>width-43 && mouseX<width-31 && mouseY>173 && mouseY<185) {
    if (altezza == false) {
      altezza = true;
      alteCheck = true;
    }
    else { 
      altezza = false;
      alteCheck = true;
    }
  }
  if (mouseX>width-90 && mouseX<width-90+12 && mouseY>198 && mouseY<198+12 && altezza==true) {
    if (iled == false) {
      iled = true;
      ledCheck = true;
    }
    else { 
      iled = false;
      ledCheck = true;
    }
  }
  //similpelle
  if (mouseX>width-100 && mouseX<width-100+12 && mouseY>123 && mouseY<123+12) {
    if (similpelle == false) {
      similpelle = true;
      similCheck = true;
    }
    else {
      similpelle = false;
      similCheck = true;
    }
  }
  //gambe NO
  if (mouseX>width-120 && mouseX<width-120+12 && mouseY>223 && mouseY<223+12) {
    if (gambe2 == true) {
      gambe2 = false;
      gambe2Check = true;
    }
    if (gambe == true) {
      gambe = false;
      gambeCheck = true;
    }
    gambe = false;
    gambe2 = false;
  }
  //Gambe economiche
  if (mouseX>width-90 && mouseX<width-90+12 && mouseY>223 && mouseY<223+12) {
    if (gambe == false) {
      gambe = true;
      gambeCheck = true;
    }
    else {
      gambe = false;
      gambeCheck = true;
    }
    if (gambe2 == true) {
      gambe2 = false;
      gambe2Check = true;
    }
  }
  //gambe metallo
  if (mouseX>width-55 && mouseX<width-55+12 && mouseY>223 && mouseY<223+12) {
    if (gambe2 == false) {
      gambe2 = true;
      gambe2Check = true;
    }
    else {
      gambe2 = false;
      gambe2Check = true;
    }
    if (gambe == true) {
      gambe = false;
      gambeCheck = true;
    }
  }
  //LOGO
  if (mouseX>width-87 && mouseX<width-87+12 && mouseY>248 && mouseY<248+12) {
    if (logoo == false) {
      logoo = true;
      logoCheck = true;
    }
    else {
      logoo = false;
      logoCheck = true;
    }
  }
  //STAMPA CARTE
  if (mouseX>width-115 && mouseX<width-115+12 && mouseY>273 && mouseY<273+12) {
    if (carte == false) {
      carte = true;
      carteCheck = true;
    }
    else {
      carte = false;
      carteCheck = true;
    }
  }

  ////////////////////AZZERA
  if (mouseX>width-155 && mouseX<width-55 && mouseY>0 && mouseY<20) {
    port = false;
    altezza = false;
    iled= false;
    similpelle= false;
    gambe= false;
    gambe2= false;
    logoo= false;
    carte= false;
    colp = 255;
    colp2 = 255;
    colp3 = 255;
    pad = 0;
    pad2 = 0;
    pad3 = 0;
    tot = 0;
  }

  if (mouseX>130 && mouseX<130+12 && mouseY>14 && mouseY<14+12) {
    if (giocatori6 == false) {
      giocatori6 = true;
      giocatori8 = false;
      giocatori10 = false;
      giocatori12 = false;
    }
  }
  if (mouseX>165 && mouseX<165+12 && mouseY>14 && mouseY<14+12) {
    if (giocatori8 == false) {

      giocatori6 = false;
      giocatori8 = true;
      giocatori10 = false;
      giocatori12 = false;
    }
  }
  if (mouseX>200 && mouseX<200+12 && mouseY>14 && mouseY<14+12) {
    if (giocatori10 == false) {
      giocatori6 = false;
      giocatori8 = false;
      giocatori10 = true;
      giocatori12 = false;
    }
  }
  if (mouseX>235 && mouseX<235+12 && mouseY>14 && mouseY<14+12) {
    if (giocatori12 == false) {
      giocatori6 = false;
      giocatori8 = false;
      giocatori10 = false;
      giocatori12 = true;
    }
  }


  /////////////////////////////////////////////////
  //Contatore prezzo 
  //portabicchieri
  if (portCheck == true) {
    if (port == true) {
      tot = tot +80;
      portCheck = false;
    }
    else {
      tot = tot - 80;
      portCheck = false;
    }
  }
  //similpelle
  if (similCheck == true) {
    if (similpelle == true) {
      tot = tot +25;
      similCheck = false;
    }
    else {
      tot = tot - 25;
      similCheck = false;
    }
  }
  //altezza
  if (alteCheck == true) {
    if (altezza == true) {
      tot = tot +70;
      alteCheck = false;
    }
    else {
      tot = tot - 70;
      alteCheck = false;
      if (iled == true) {
        tot = tot - 75;
      }
    }
  }
  //led
  if (ledCheck == true) {
    if (iled == true) {
      tot = tot +75;
      ledCheck = false;
    }
    else {
      tot = tot - 75;
      ledCheck = false;
    }
  }
  //gambe
  if (gambeCheck == true) {
    if (gambe == true) {
      tot = tot +40;
      gambeCheck = false;
    }
    else {
      tot = tot - 40;
      gambeCheck = false;
    }
  }
  //gambe2
  if (gambe2Check == true) {
    if (gambe2 == true) {
      tot = tot +60;
      gambe2Check = false;
    }
    else {
      tot = tot - 60;
      gambe2Check = false;
    }
  }
  //logo
  if (logoCheck == true) {
    if (logoo == true) {
      tot = tot +35;
      logoCheck = false;
    }
    else {
      tot = tot - 35;
      logoCheck = false;
    }
  }
  //carte
  if (carteCheck == true) {
    if (carte == true) {
      tot = tot +15;
      carteCheck = false;
    }
    else {
      tot = tot - 15;
      carteCheck = false;
    }
  }
}


