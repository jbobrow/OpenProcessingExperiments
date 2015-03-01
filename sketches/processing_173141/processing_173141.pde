
//float labdasok [] = new float [50];
PImage elet;
PImage gameover;
int pontok = 0;
int hanyLabda = -1;
float gyorsulasiertek = 1.05 ;
int Xkoratmero = 20;
int Ykoratmero = 20;
int hanyElet = 5;
int utoAzAljatol = 50;
int utoVastagsag = 15;
int utoSzelesseg = 100;
int KOROK_SZAMA = 10;
float korX []= new float [KOROK_SZAMA];
float korY []= new float [KOROK_SZAMA];
float korXsebesseg []= new float [KOROK_SZAMA];
float korYsebesseg []= new float [KOROK_SZAMA];
void setup () {
  size(900, 600);
  elet = loadImage ("http://black-treasure-chi.com/pix/szivecske.gif");
  gameover = loadImage ("http://www.51allout.co.uk/wp-content/uploads/2013/05/Game-over-yoshi.jpg");
  rectMode(CENTER);
  noCursor();
  for (int i = 0; i < korX.length; i++) {
    korX[i] =  -100; 
    korY[i] =  -100;
    korXsebesseg[i]= (int(random (2)) - 0.5) * 10.0;
    korYsebesseg[i]= (int(random (2)) - 0.5) * 10.0;
    /*korX[0] = 400;
     korY[0] = 300;*/
  }
}
void draw() { 
  if (hanyElet >=0) {

    for ( int i = 0; i< korX.length; i ++) {
      if ( korX[i] > -10 ) {
        if ((korX[i] <= Xkoratmero/2) || (korX[i] >= width - Xkoratmero/2)  || (korX [i] <= Xkoratmero/2) || (korX[i] >= width - Xkoratmero/2) ) {
          korXsebesseg[i] = -  korXsebesseg[i] ;
        }
        if (korY[i] <= Ykoratmero/2) {
          korYsebesseg[i] = - (korYsebesseg[i] * gyorsulasiertek);
          korXsebesseg[i] *= gyorsulasiertek;
        }
        if ((korY[i] >= height - utoAzAljatol - Ykoratmero/2 - utoVastagsag/2) && (korX[i] >= mouseX - utoSzelesseg/2) && (korX[i] <= mouseX + utoSzelesseg/2)) {
          korYsebesseg[i] = - korYsebesseg[i];
        }
        if (korY[i] >= height- Ykoratmero/2) {
          veszitEgyEletet ();
        }
        korX[i] += korXsebesseg[i];
        korY[i] += korYsebesseg[i];
      }
    }
    rajzoljPalyat();
    eletKirajzolas();
  } else {
    meghaltal();
  }
  szamoldapontokat();
  irdki();
}
void mouseReleased() {
  hanyLabda ++;
  korX[hanyLabda]=width/2;
  korY[hanyLabda]=height/2;
}
void veszitEgyEletet() {
  hanyElet --;
  for (int i = 0; i<korX.length; i++) {
    korX[i] = -100; 
    korY[i] = -100;
    korXsebesseg[i]= (int(random (2)) - 0.5) * 10.0;
    korYsebesseg[i]= (int(random (2)) - 0.5) * 10.0;
  }
  hanyLabda =-1;
}
void meghaltal() {
  if (hanyElet < 0) {
    background(#FFFFFF);
    image (gameover, 0, 0, 900, 600);
    //rect(830, 560, 70, 40);
  }
}
void szamoldapontokat() {
  for (int i = 0; i < korX.length; i++) {
    if ((korY[i] >= height - utoAzAljatol - Ykoratmero/2 - utoVastagsag/2) && (korX[i] >= mouseX - utoSzelesseg/2) && (korX[i] <= mouseX + utoSzelesseg/2)) {
      pontok += 50;
    }
  }
}
void eletKirajzolas() {
  for (int i = 0; i < hanyElet; i++) {
    image (elet, 0 + i * elet.width, height - elet.height);
  }
}
void rajzoljPalyat() {
  background(#03FCC0);
  fill(#000000);
  rect( mouseX, height - utoAzAljatol, utoSzelesseg, utoVastagsag, 7);
  for (int i = 0; i < korX.length; i++) {
    fill(#FFFFFF);
    ellipse(korX[i], korY[i], Xkoratmero, Ykoratmero);
  }
}
void keyPressed() {
  if ( key == ' ') {
    hanyElet = 6;
    hanyLabda = -1;
    pontok = 0;
    for (int i = 0; i < korX.length; i++) {
      korX[i] = -100;
      korY[i] = -100;
      korXsebesseg[i]= (int(random (2)) - 0.5) * 10.0;
      korYsebesseg[i]= (int(random (2)) - 0.5) * 10.0;
    }
  }
}
void irdki() {
  fill(#000000);
  textAlign(RIGHT);
  textSize(40);
  text("" + pontok, 860, 590);
}



