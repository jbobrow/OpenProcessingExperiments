
/* @pjs preload="363.gif, 364.gif, 366.gif, 367.gif, 368.gif, 369.gif, 370.gif, 371.gif, 372.gif, 373.gif, 374.gif, 375.gif, 376.gif, 377.gif, 378.gif, 379.gif, 380.gif, 381.gif, 382.gif, 383.gif, 384.gif, 385.gif, 386.gif, 387.gif, big.gif, color_map_madrid.jpg"; 
 */



PImage universitaria, castellana, ventas, lapaznorth, lapazsouth, atocha, principepio, latina, moncloa, republica, salamanca, alcala, retiro, cortes, psol, opera, granvia, chueca, sanfrancisco, embajadores, plazadeespana, toledo, chamartin, barajas, map, cmap;

boolean buniversitaria, bcastellana, bventas, blapaznorth, blapazsouth, batocha, bprincipepio, blatina, bmoncloa, brepublica, bsalamanca, balcala, bretiro, bcortes, bsol, bopera, bgranvia, bchueca, bsanfrancisco, bembajadores, bplazadeespana, btoledo, bchamartin, bbarajas;
boolean home =true;

color uni = color(255, 255, 0);
color unijs = color(254, 255, 0);
color cha = color(255, 255, 0);
color chajs = color(255, 245, 0);
color cas = color(255, 255, 0);
color casjs = color(255, 235, 0);
color rep = color(255, 255, 0);
color repjs = color(254, 225, 1);
color bar = color(255, 255, 0);
color barjs = color(254, 215, 0);
color ven = color(255, 255, 0);
color venjs = color(253, 205, 0);
color pri = color(255, 255, 0);
color prijs = color(254, 194, 0);
color mon = color(255, 255, 0);
color monjs = color(255, 185, 1);
color sal = color(255, 255, 0);
color saljs = color(255, 175, 0);
color pla = color(255, 255, 0);
color plajs = color(254, 165, 1);
color chu = color(255, 255, 0);
color chujs = color(255, 154, 0);
color alc = color(255, 255, 0);
color alcjs = color(254, 143, 1);
color ope = color(255, 255, 0);
color opejs = color(255, 125, 1);
color gra = color(255, 255, 0);
color grajs = color(255, 134, 0);
color sol = color(255, 255, 0);
color soljs = color(255, 115, 0);
color cor = color(255, 255, 0);
color corjs = color(254, 106, 0);
color ret = color(255, 255, 0);
color retjs = color(255, 95, 1);
color pazn = color(255, 255, 0);
color paznjs = color(255, 85, 0);
color lat = color(255, 255, 0);
color latjs = color(255, 75, 0);
color san = color(255, 255, 0);
color sanjs = color(204, 204, 204);
color tol = color(255, 255, 0);
color toljs = color(102, 102, 102);
color emb = color(255, 255, 0);
color embjs = color(254, 0, 0);
color ato = color(255, 255, 0);
color atojs = color(1, 0, 254);
color pazs = color(255, 255, 0);
color pazsjs = color(0, 255, 0);


float xCenter, yCenter;
float xDestination, yDestination;

void setup() {
  universitaria = loadImage("363.gif");
  castellana = loadImage("364.gif");
  ventas = loadImage("366.gif");
  lapaznorth = loadImage("367.gif");
  lapazsouth = loadImage("368.gif");
  atocha = loadImage("369.gif");
  principepio = loadImage("370.gif");
  latina = loadImage("371.gif");
  moncloa = loadImage("372.gif");
  republica = loadImage("373.gif");
  salamanca = loadImage("374.gif");
  alcala = loadImage("375.gif");
  retiro = loadImage("376.gif");
  cortes = loadImage("377.gif");
  psol = loadImage("378.gif");
  opera = loadImage("379.gif");
  granvia = loadImage("380.gif");
  chueca = loadImage("381.gif");
  sanfrancisco = loadImage("382.gif");
  embajadores = loadImage("383.gif");
  plazadeespana = loadImage("384.gif");
  toledo = loadImage("385.gif");
  chamartin = loadImage("386.gif");
  barajas = loadImage("387.gif");
  map = loadImage("big.gif");
  cmap = loadImage("color_map_madrid.jpg");
  size(499, 650);
}

void draw() {
  background(0);
  color c = cmap.get(mouseX, mouseY);
  println(red(c) +" "+ green(c) + " " + blue(c));
  imageMode(CENTER);

  // Easing para el mapa
  xCenter = xCenter + (xDestination-xCenter)*0.05;
  yCenter = yCenter + (yDestination-yCenter)*0.05;
  translate(xCenter, yCenter);
  image (map, width/2, height/2);
  //image (colors, width/2, height/2);

  if (cmap.get(mouseX, mouseY)== uni  || cmap.get(mouseX, mouseY)== unijs ) {
    ellipse (40, 54, 10, 10);
  }

  if (buniversitaria) {
    // here comes the code when the person has click the photo
    // pushMatrix();
    //mouseMoved (instead of mouseDragged)
    // translate(...
    image(universitaria, width/2, height/2, width*1.5, height*1.5);
    println(mouseX + " " + mouseY);
    if (dist(mouseX, mouseY, 300, 300) < 50) {
      fill(255, 100);
    }
    else noFill();
    ellipse(300, 300, 30, 30);
    //popMatrix()
    //color c = cuniversitaria.get (mouseX, mouseY); make color map
    //if
  }

  if (cmap.get(mouseX, mouseY)== cha  || cmap.get(mouseX, mouseY)== chajs ) {
    ellipse (150, 20, 10, 10);
  }
  if (bchamartin) {
    image(chamartin, width/2, height/2, width*1.5, height*1.5);
  }

  if (cmap.get(mouseX, mouseY)== cas  || cmap.get(mouseX, mouseY)== casjs ) {
    ellipse (200, 56, 10, 10);
  }
  if (bcastellana) {
    image(castellana, width/2, height/2, width*1.5, height*1.5);
  }

  if (cmap.get(mouseX, mouseY)== rep  || cmap.get(mouseX, mouseY)== repjs ) {
    ellipse (330, 110, 10, 10);
  }
  if (brepublica) {
    image(republica, width/2, height/2, width*1.5, height*1.5);
  }

  if (cmap.get(mouseX, mouseY)== bar  || cmap.get(mouseX, mouseY)== barjs ) {
    ellipse (420, 15, 10, 10);
  }
  if (bbarajas) {
    image(barajas, width/2, height/2, width*1.5, height*1.5);
  }

  if (cmap.get(mouseX, mouseY)== ven  || cmap.get(mouseX, mouseY)== venjs ) {
    ellipse (437, 130, 10, 10);
  } 
  if (bventas) {
    image(ventas, width/2, height/2, width*1.5, height*1.5);
  }

  if (cmap.get(mouseX, mouseY)== pri  || cmap.get(mouseX, mouseY)== prijs ) {
    ellipse (40, 300, 10, 10);
  }
  if (bprincipepio) {
    image(principepio, width/2, height/2, width*1.5, height*1.5);
  }

  if (cmap.get(mouseX, mouseY)== mon  || cmap.get(mouseX, mouseY)== monjs ) {
    ellipse (150, 165, 10, 10);
  }
  if (bmoncloa) {
    image(moncloa, width/2, height/2, width*1.5, height*1.5);
  }

  if (cmap.get(mouseX, mouseY)== sal  || cmap.get(mouseX, mouseY)== saljs ) {
    ellipse (360, 235, 10, 10);
  }
  if (bsalamanca) {
    image(salamanca, width/2, height/2, width*1.5, height*1.5);
  }

  if (cmap.get(mouseX, mouseY)== pla  || cmap.get(mouseX, mouseY)== plajs ) {
    ellipse (100, 290, 10, 10);
  }
  if (bplazadeespana) {
    image(plazadeespana, width/2, height/2, width*1.5, height*1.5);
  }

  if (cmap.get(mouseX, mouseY)== chu  || cmap.get(mouseX, mouseY)== chujs ) {
    ellipse (240, 295, 10, 10);
  }
  if (bchueca) {
    image(chueca, width/2, height/2, width*1.5, height*1.5);
  }

  if (cmap.get(mouseX, mouseY)== alc  || cmap.get(mouseX, mouseY)== alcjs ) {
    ellipse (320, 330, 10, 10);
  }
  if (balcala) {
    image(alcala, width/2, height/2, width*1.5, height*1.5);
  }

  if (cmap.get(mouseX, mouseY)== ope  || cmap.get(mouseX, mouseY)== opejs ) {
    ellipse (60, 400, 10, 10);
  }
  if (bopera) {
    image(opera, width/2, height/2, width*1.5, height*1.5);
  }

  if (cmap.get(mouseX, mouseY)== gra  || cmap.get(mouseX, mouseY)== grajs ) {
    ellipse (155, 334, 10, 10);
  }
  if (bgranvia) {
    image(granvia, width/2, height/2, width*1.5, height*1.5);
  }

  if (cmap.get(mouseX, mouseY)== sol  || cmap.get(mouseX, mouseY)== soljs ) {
    ellipse (180, 400, 10, 10);
  }
  if (bsol) {
    image(psol, width/2, height/2, width*1.5, height*1.5);
  }

  if (cmap.get(mouseX, mouseY)== cor  || cmap.get(mouseX, mouseY)== corjs ) {
    ellipse (250, 410, 10, 10);
  }
  if (bcortes) {
    image(cortes, width/2, height/2, width*1.5, height*1.5);
  }

  if (cmap.get(mouseX, mouseY)== ret  || cmap.get(mouseX, mouseY)== retjs ) {
    ellipse (310, 470, 10, 10);
  }
  if (bretiro) {
    image(retiro, width/2, height/2, width*1.5, height*1.5);
  }

  if (cmap.get(mouseX, mouseY)== pazn  || cmap.get(mouseX, mouseY)== paznjs ) {
    ellipse (420, 390, 10, 10);
  }
  if (blapaznorth) {
    image(lapaznorth, width/2, height/2, width*1.5, height*1.5);
  }

  if (cmap.get(mouseX, mouseY)== lat  || cmap.get(mouseX, mouseY)== latjs ) {
    ellipse (40, 610, 10, 10);
  }
  if (blatina) {
    image(latina, width/2, height/2, width*1.5, height*1.5);
  }

  if (cmap.get(mouseX, mouseY)== san  || cmap.get(mouseX, mouseY)== sanjs ) {
    ellipse (60, 440, 10, 10);
  }
  if (bsanfrancisco) {
    image(sanfrancisco, width/2, height/2, width*1.5, height*1.5);
  }

  if (cmap.get(mouseX, mouseY)== tol  || cmap.get(mouseX, mouseY)== toljs ) {
    ellipse (57, 550, 10, 10);
  }
  if (btoledo) {
    image(toledo, width/2, height/2, width*1.5, height*1.5);
  }

  if (cmap.get(mouseX, mouseY)== emb  || cmap.get(mouseX, mouseY)== embjs ) {
    ellipse (220, 490, 10, 10);
  }
  if (bembajadores) {
    image(embajadores, width/2, height/2, width*1.5, height*1.5);
  }

  if (cmap.get(mouseX, mouseY)== ato  || cmap.get(mouseX, mouseY)== atojs ) {
    ellipse (280, 560, 10, 10);
  }
  if (batocha) {
    image(atocha, width/2, height/2, width*1.5, height*1.5);
  }

  if (cmap.get(mouseX, mouseY)== pazs  || cmap.get(mouseX, mouseY)== pazsjs ) {
    ellipse (420, 530, 10, 10);
  }
  if (blapazsouth) {
    image(lapazsouth, width/2, height/2, width*1.5, height*1.5);
  }
}

void mouseReleased () {
  buniversitaria = false;
  bcastellana = false;
  bventas = false;
  blapaznorth = false;
  blapazsouth = false;
  batocha = false;
  bprincipepio = false;
  blatina = false;
  bmoncloa = false;
  brepublica = false;
  bsalamanca = false;
  balcala = false;
  bretiro = false;
  bcortes = false;
  bsol = false;
  bopera = false;
  bgranvia = false;
  bchueca = false;
  bsanfrancisco = false;
  bembajadores = false;
  bplazadeespana = false;
  btoledo = false;
  bchamartin = false;
  bbarajas = false;

  if (home) {
    home =false;

    if (cmap.get(mouseX, mouseY)== uni  || cmap.get(mouseX, mouseY)== unijs ) {
      //image(universitaria, width/2, height/2, width/2, height/2);
      buniversitaria = true;
    }

    if (cmap.get(mouseX, mouseY)== cha  || cmap.get(mouseX, mouseY)== chajs ) {
      //image(chamartin, width/2, height/2, width/2, height/2);
      bchamartin = true;
    }

    if (cmap.get(mouseX, mouseY)== cas  || cmap.get(mouseX, mouseY)== casjs ) {
      //image(castellana, width/2, height/2, width/2, height/2); 
      bcastellana = true;
    }

    if (cmap.get(mouseX, mouseY)== rep  || cmap.get(mouseX, mouseY)== repjs ){
      //image(republica, width/2, height/2, width/2, height/2);
      brepublica = true;
    }

    if (cmap.get(mouseX, mouseY)== bar  || cmap.get(mouseX, mouseY)== barjs ) {
      //image(barajas, width/2, height/2, width/2, height/2);
      bbarajas = true;
    }

    if (cmap.get(mouseX, mouseY)== ven  || cmap.get(mouseX, mouseY)== venjs ) {
      //image(ventas, width/2, height/2, width/2, height/2);
      bventas = true;
    }

    if (cmap.get(mouseX, mouseY)== pri  || cmap.get(mouseX, mouseY)== prijs ) {
      //image(principepio, width/2, height/2, width/2, height/2);
      bprincipepio = true;
    }

    if (cmap.get(mouseX, mouseY)== mon  || cmap.get(mouseX, mouseY)== monjs ) {
      //image(moncloa, width/2, height/2, width/2, height/2);
      bmoncloa = true;
    }

    if (cmap.get(mouseX, mouseY)== sal  || cmap.get(mouseX, mouseY)== saljs ) {
      //image(salamanca, width/2, height/2, width/2, height/2);
      bsalamanca = true;
    }

    if (cmap.get(mouseX, mouseY)== pla  || cmap.get(mouseX, mouseY)== plajs ) {
      //image(plazadeespana, width/2, height/2, width/2, height/2);
      bplazadeespana = true;
    }

    if (cmap.get(mouseX, mouseY)== chu  || cmap.get(mouseX, mouseY)== chujs ) {
      //image(chueca, width/2, height/2, width/2, height/2);
      bchueca = true;
    }

    if (cmap.get(mouseX, mouseY)== alc  || cmap.get(mouseX, mouseY)== alcjs ) {
      //image(alcala, width/2, height/2, width/2, height/2);
      balcala = true;
    }

    if (cmap.get(mouseX, mouseY)== ope  || cmap.get(mouseX, mouseY)== opejs ) {
      //image(opera, width/2, height/2, width/2, height/2);
      bopera = true;
    }

    if (cmap.get(mouseX, mouseY)== gra  || cmap.get(mouseX, mouseY)== grajs ) {
      //image(granvia, width/2, height/2, width/2, height/2);
      bgranvia = true;
    }

    if (cmap.get(mouseX, mouseY)== sol  || cmap.get(mouseX, mouseY)== soljs ){
      //image(sol, width/2, height/2, width/2, height/2);
      bsol = true;
    }

    if (cmap.get(mouseX, mouseY)== cor  || cmap.get(mouseX, mouseY)== corjs ) {
      //image(cortes, width/2, height/2, width/2, height/2);
      bcortes = true;
    }

    if (cmap.get(mouseX, mouseY)== ret  || cmap.get(mouseX, mouseY)== retjs ) {
      //image(retiro, width/2, height/2, width/2, height/2);
      bretiro = true;
    }

    if (cmap.get(mouseX, mouseY)== pazn  || cmap.get(mouseX, mouseY)== paznjs ) {
      //image(lapaznorth, width/2, height/2, width/2, height/2);
      blapaznorth = true;
    }

    if (cmap.get(mouseX, mouseY)== lat  || cmap.get(mouseX, mouseY)== latjs ) {
      //image(latina, width/2, height/2, width/2, height/2);
      blatina = true;
    }

    if (cmap.get(mouseX, mouseY)== san  || cmap.get(mouseX, mouseY)== sanjs ) {
      //image(sanfrancisco, width/2, height/2, width/2, height/2);
      bsanfrancisco = true;
    }

    if (cmap.get(mouseX, mouseY)== tol  || cmap.get(mouseX, mouseY)== toljs ) {
      //image(toledo, width/2, height/2, width/2, height/2);
      btoledo = true;
    }

    if (cmap.get(mouseX, mouseY)== emb  || cmap.get(mouseX, mouseY)== embjs ) {
      //image(embajadores, width/2, height/2, width/2, height/2);
      bembajadores = true;
    }

    if (cmap.get(mouseX, mouseY)== ato  || cmap.get(mouseX, mouseY)== atojs ){
      //image(atocha, width/2, height/2, width/2, height/2);
      batocha = true;
    }

    if (cmap.get(mouseX, mouseY)== pazs  || cmap.get(mouseX, mouseY)== pazsjs ) {
      //image(lapazsouth, width/2, height/2, width/2, height/2);
      blapazsouth = true;
    }
  }
  else {
    home = true;
    xDestination = 0; 
    yDestination = 0;
  }
}

void mouseMoved() {
  if (home  == false) { 


    xDestination = xDestination + mouseX - pmouseX;
    yDestination = yDestination + mouseY - pmouseY;
  }
}



