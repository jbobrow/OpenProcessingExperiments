
/* @pjs preload="MAR.png, audrey.png, bigote.png, cigarro.png, dali.jpeg, dali.jpg, gregory.jpg, hat.png, manchu.jpg, marilyn.jpg, robert.jpg"; 
 */

PImage cigarro, MAR, audrey, gregory, hat, robert, bigote, dali, manchu ;
PFont fuente;
int page;
float xRect=50, yRect=680;
float diam=500;
float diam1=500;
float diam2=500;
int vel=2;
int yVel;

void setup() {
  size (600, 700);
  fuente=loadFont("FuturistFixedWidth-Regular-35.vlw");
  cigarro=loadImage("cigarro.png");
  MAR=loadImage("MAR.png");
  audrey=loadImage("audrey.png");
  gregory=loadImage("gregory.jpg");
  hat=loadImage("hat.png");
  robert=loadImage("robert.jpg");
  bigote=loadImage("bigote.png");
  dali=loadImage("dali.jpg");
  manchu=loadImage("manchu.jpg");
}

void draw() {


  if (page== 0) {
    pageZero();
  }

  if (page== 1) {
    pageOne();
  }

  if (page== 2) {
    pageTwo();
  }

  if (page== 3) {
    pageThree();
  }

  if (page== 4) {
    pageFour();
  }

  if (page== 5) {
    pageFive();
  }

  if (page== 6) {
    pageSix();
  }

  if (page== 7) {
    pageSeven();
  }

  if (page== 8) {
    pageEight();
  }
}

void pageZero() {
  fill(0);
  textFont(fuente);
  textAlign(CENTER, CENTER);
  text("EMPEZAR JUEGO", width/2, height/2);
}

void pageOne() {
  PImage frag=cigarro.get(mouseX, mouseY, 20, 20);
  image(frag, mouseX, mouseY);
  fill(255);
  noStroke();
  rect(xRect, yRect, 500, 10);
  fill(0);
  rect(xRect, yRect, diam, 10);

  diam=diam-1;
  if (diam==0) {
    page=2;
  }
}

void pageTwo() {
  fill(255);
  rect(0, 0, 600, 700);
  fill(0);
  textFont(fuente);
  textAlign(CENTER);
  text("¿DE QUIÉN ERA ESA MANO?", 50, 50, 500, 200);
  image( MAR, 50, 200, 200, 400);
  image( audrey, 350, 200, 200, 400);
}

void pageThree() {
  fill(255);
  rect(0, 0, 600, 700);
  PImage frag=hat.get(0, yVel, 600, 75);
  image(frag, 0, yVel);
  fill(255);
  noStroke();
  rect(xRect, yRect, 500, 10);
  fill(0);
  rect(xRect, yRect, diam1, 10);

  yVel=yVel+vel;
  if (yVel>500||yVel<0) {
    vel=-vel;
  }

  diam1=diam1-1;
  if (diam1==0) {
    page=4;
  }
}


void pageFour() {
  fill(255);
  rect(0, 0, 600, 700);
  fill(0);
  textFont(fuente);
  textAlign(CENTER);
  text("¿QUÉ ACTOR LLEVABA ESE SOMBRERO?", 50, 50, 500, 200);
  image( robert, 50, 200, 200, 400);
  image( gregory, 350, 200, 200, 400);
}

void pageFive() {
  image(bigote, 0, 0, 600, 700);
  fill(255);
  noStroke();
  rect(xRect, yRect, 500, 10);
  fill(0);
  rect(xRect, yRect, diam2, 10);


  if (mouseY<350) {
    fill(255);
    rect(0, 0, 600, 350);
  }

  else {
    fill(255);
    rect(0, 348, 600, 330);
  }



  diam2=diam2-1;
  if (diam2==0) {
    page=6;
  }
}

void pageSix() {
  fill(255);
  rect(0, 0, 600, 700);
  fill(0);
  textFont(fuente);
  textAlign(CENTER);
  text("¿A QUIÉN LE PERTENECE ESTE BIGOTE?", 50, 50, 500, 200);
  image( dali, 50, 200, 200, 400);
  image( manchu, 350, 200, 200, 400);
}

void pageSeven() {
  fill(0);
  textFont(fuente);
  textAlign(CENTER, CENTER);
  text("TE HAS EQUIVOCADO!", width/2, height/2);
}

void pageEight() {
  fill(0);
  textFont(fuente);
  textAlign(CENTER);
  text("FIN DEL JUEGO", width/2, height/2);
}



void mouseReleased() {
  background(255);
  if (page == 0) {
    page = 1;
  }


  else if (page==2) {
    if (overButton(50, 200, 200, 400)) {
      page=3;
    }
    if (overButton(350, 200, 200, 400)) {
      page=7;
    }
  }


  else if (page==4) {
    if (overButton(50, 200, 200, 400)) {
      page=7;
    }
    if (overButton(350, 200, 200, 400)) {
      page=5;
    }
  }

  else if (page==6) {
    if (overButton(50, 200, 200, 400)) {
      page=7;
    }
    if (overButton(350, 200, 200, 400)) {
      page=8;
    }
  }

  background(255);
  if (page == 8) {
    page = 0;
  }
}

// Utils: overButton
boolean overButton(float x_, float y_, float w_, float h_) {
  boolean tmp = false;
  if (mouseX > x_ && mouseX < x_+w_ && mouseY > y_ && mouseY < y_+h_) {
    tmp = true;
  }
  return tmp;
}



