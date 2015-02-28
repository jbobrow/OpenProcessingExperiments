
float posx = 500;
float posy = 300;
int velocitatcamio = 3;
float incrementx = 0;
float incrementy = 0;

float xbola = 500;
float ybola = 100;

float velx = 0;
float vely = 0;

int mida=40;

int coloroda = 0;

int puntbola = 0;
int puntcamio = 0;

void setup() {
  size(1000, 600);
  background(0, 255, 255);
  rectMode(CENTER);
}

void draw() {
  background(0, 255, 255);
  incrementx=(mouseX-posx)/20;
  incrementy=(mouseY-posy)/20;
  posx=posx+random(-velocitatcamio, velocitatcamio)+incrementx;
  posy=posy+random(-velocitatcamio, velocitatcamio)+incrementy;
  camio();
  if (posx < 50+velocitatcamio) {
    posx = posx+velocitatcamio;
  }
  if (posx > width-50-velocitatcamio) {
    posx = posx-velocitatcamio;
  }
  if (posy < 80+velocitatcamio) {
    posy = posy+velocitatcamio;
  }
  if (posy > height-35-velocitatcamio) {
    posy = posy-velocitatcamio;
  }

  if (xbola-50 < posx && xbola+50 > posx && ybola-50 < posy && ybola+50 > posy) {
    background(255);
    puntbola = puntbola+1;
  }
  fill(255, 255, 255);
  bolaboja();

  textSize(22);
  text("PUNTS CAMIO " + int(puntcamio), 10, 40);
  text("PUNTS BOLA " + int(puntbola), 10, 80);
}

void mousePressed() {
  strokeWeight(3);
  if (posx > xbola) {
    stroke(0, 0, 255);
    line(posx-50, posy, posx-150, posy);
    line(posx-50, posy, posx-150, posy+100);
    line(posx-50, posy, posx-150, posy-100);
    posx=posx+150;
    if (xbola < posx && xbola > posx-400 && ybola-200 < posy && ybola+200 > posy) {
      background(255, 0, 0);
      if (coloroda > 255) {
        coloroda=0;
      }
      else {
        coloroda = coloroda+30;
      }
      puntcamio = puntcamio+1;
    }
  }
  else {
    stroke(50, 0, 0);
    line(posx+50, posy, posx+150, posy);
    line(posx+50, posy, posx+150, posy+100);
    line(posx+50, posy, posx+150, posy-100);
    posx=posx-150;
    if (xbola < posx+400 && xbola > posx && ybola-200 < posy && ybola+200 > posy) {
      background(255, 0, 0);
      if (coloroda > 255) {
        coloroda=0;
      }
      else {
        coloroda = coloroda+30;
      }
      puntcamio = puntcamio+1;
    }
  }
}

//CAMIO////////////////////////////////////////////////////////////////////////////
void camio() {
  //escape//
  noStroke();
  fill(0, 0, 0);
  if (posx < xbola) {
    rect(posx+50, posy, 30, 10, 5);
  }
  else {
    rect(posx-50, posy, 30, 10, 5);
  }


  //llum//
  stroke(0, 0, 0);
  fill(255, posy/3, 0);
  if (posx < width/2) {
    ellipse(posx+5, posy-50, 20, 40);
  }
  else {
    ellipse(posx-5, posy-50, 20, 40);
  }

  //cos//
  noStroke();
  fill(255-posx/4, 0, posx/4);
  rect(posx, posy, 100, 50, 15);
  ellipse(posx, posy-20, 80, 75);

  //rodes//
  noStroke();
  fill(coloroda, coloroda, -coloroda);
  ellipse(posx-30, posy+20, 25+posx/50, 25+posx/50);
  ellipse(posx+30, posy+20, 45-posx/50, 45-posx/50);

  //lvidre//
  fill(posx/4, posx/4, 255);
  if (posx > width/2) {
    rect(posx+10, posy-30, 35, 25, 3, 50, 3, 3);
  }
  else {
    rect(posx-10, posy-30, 35, 25, 50, 3, 3, 3);
  }
}

/////////////////////////BOLABOJA////////////////////////////////////

void bolaboja() {


  fill(0);
  ellipse(xbola, ybola, mida, mida);
  velx=velx+random(-1.5, 1.5);
  xbola=xbola+velx;
  ybola=ybola+vely;
  vely=vely+1;
  if (velx>10) {
    velx=velx-1;
  }
  if (velx<-10) {
    velx=velx+1;
  }
  if (xbola>width-mida) {
    velx=velx*-1;
  }
  if (xbola<mida) {
    velx=velx*-1;
  }
  if (ybola>height-mida) {
    vely=(vely*-1)+1;
  }
}



