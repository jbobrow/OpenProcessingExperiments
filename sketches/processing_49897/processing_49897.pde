
int anzahl = 20;
int i;
int farbe1;
int farbe2;
int farbe3;
int r;
int g; 
int b;
int blumen = 1;
int pull;
int mousepos = 0;
boolean prf = true;
int ypos;
int verschiebung;
boolean screentaken = false;
boolean rmode = true;
char colMode;

void setup () {
  size(1100, 600);
  smooth ();
  rectMode (CENTER);
  noStroke ();
  colMode='a';
}

void draw () {

  background (0);
  translate (width / 2, height / 2);
  anleitung();

  if (blumen == 1) {
    pushMatrix();
    ObjBlume();
    popMatrix();
  }

  if (blumen == 2) {
    pushMatrix();
    translate(-200, 0);
    ObjBlume();
    translate(400, 0);
    ObjBlume();
    popMatrix();
  }

  /*if (blumen == 3) {
    pushMatrix();
    ObjBlume();
    translate(-300, 0);
    ObjBlume();
    translate(600, 0);
    ObjBlume();
    popMatrix();
  }*/
  if (blumen == 4) {
    pushMatrix();
    ObjBlume2();
    popMatrix();
  }

  if (blumen == 5) {
    pushMatrix();
    translate(-200, 0);
    ObjBlume2();
    translate(400, 0);
    ObjBlume2();
    popMatrix();
  }

  setblumen();
  setblumen2();
}

void colorclick() {
  if (colMode == 'a') {
    r = farbe1;
    g = farbe2;
    b = farbe3;
  }
  if (colMode == 's') {
    r = farbe2;
    g = farbe3;
    b = farbe1;
  }
  if (colMode == 'd') {
    r = farbe3;
    g = farbe1;
    b = farbe2;
  }
  if (mousePressed) {
    if (prf == true) {
      ypos = mouseY;
      prf = false;
    }

    verschiebung = ypos-mouseY;

    pull = mousepos+verschiebung/4;
  }
}

void mouseReleased() {
  prf = true;
  mousepos = pull;
}

void keyPressed() {
  if (key == 'p' && screentaken == false) {
    saveFrame("name-####.jpg");
    screentaken = true;
  }
  if (key=='a' || key=='s' || key=='d') {
    colMode=key;
  }
}

void keyReleased() {
  /*if (key == 'm') {
    rmode = !rmode;
    if (rmode) {
      rectMode (CENTER);
    }
    else {
      rectMode (CORNER);
    }
  }*/
  screentaken = false;
}


