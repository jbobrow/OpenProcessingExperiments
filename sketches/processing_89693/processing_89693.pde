
//import ddf.minim.spi.*;
//import ddf.minim.signals.*;
//import ddf.minim.*;
//import ddf.minim.analysis.*;
//import ddf.minim.ugens.*;
//import ddf.minim.effects.*;
//
//Minim minim;
//AudioPlayer S;
//AudioPlayer I;
//AudioPlayer N;
//AudioPlayer G;
//AudioInput input;

int sizeS = 100;
int sizeI = 100;
int sizeN = 100;
int sizeG = 100;

int Y = 250;
int SX = 150;
int IX = 230;
int NX = 265;
int GX = 310;
int Soffset = 0;
int Ioffset = 0;
int Noffset = 0;
int Goffset = 0;
int posOffset = 30;
int negOffset = -30;

PFont font;
int scaleFont = 100;
int fontNormal = 100;

void setup() {
  size(500, 500);

//  minim = new Minim(this);
//  S = minim.loadFile("S.wav");
//  I = minim.loadFile("I.wav");
//  N = minim.loadFile("N.wav");
//  G = minim.loadFile("G.wav");


  font = createFont("Giddyup Std", 100);
}

void draw() {
  background(0);
  fill(255);

  textFont(font, sizeS);
  text("S", SX + Soffset, Y);
  textFont(font, sizeI);
  text("i", IX + Ioffset, Y);
  textFont(font, sizeN);
  text("n", NX + Noffset, Y);
  textFont(font, sizeG);
  text("g", GX + Goffset, Y);

  //  fill(255, 255, 255, 50);
  //  rect(SX, 175, 55, 100);
  //  rect(IX, 200, 25, 50);
  //  rect(NX, 210, 33, 40);
  //  rect(GX, 210, 45, 80);

  if (mouseX > SX && mouseX < IX) {
    if (mouseY > 175 && mouseY < 275) {
      sizeS = 200;
      sizeI = scaleFont;
      sizeN = scaleFont;
      sizeG = scaleFont;
      Soffset = 0;
      Ioffset = posOffset;
      Noffset = posOffset;
      Goffset = posOffset;
//      if (!S.isPlaying()) {
//        S.play();
//        S.rewind();
//      }
    }
  }
  else if (mouseX > IX && mouseX < NX) {
    if (mouseY > 200 && mouseY < 250) {
      sizeI = 200;
      sizeS = scaleFont;
      sizeN = scaleFont;
      sizeG = scaleFont;
      Soffset = negOffset;
      Ioffset = 0;
      Noffset = posOffset;
      Goffset = posOffset;
//      if (!I.isPlaying()) {
//        I.play();
//        I.rewind();
//      }
    }
  }
  else if (mouseX > NX && mouseX < GX) {
    if (mouseY > 210 && mouseY < 250) {
      sizeN = 200;
      sizeI = scaleFont;
      sizeS = scaleFont;
      sizeG = scaleFont;
      Soffset = negOffset;
      Ioffset = negOffset;
      Noffset = 0;
      Goffset = posOffset;
//      if(!N.isPlaying()){
//        N.play();
//        N.rewind();
//      }
    }
  }
  else if (mouseX > GX && mouseX < (GX+45)) {
    if (mouseY > 210 && mouseY < 290) {
      sizeG = 200;
      sizeI = scaleFont;
      sizeN = scaleFont;
      sizeS = scaleFont;
      Soffset = negOffset;
      Ioffset = negOffset;
      Noffset = negOffset;
      Goffset = 0;
//      if(!G.isPlaying()){
//        G.play();
//        G.rewind();
//      }
    }
  }
  else {
    sizeG = fontNormal;
    sizeI = fontNormal;
    sizeN = fontNormal;
    sizeS = fontNormal;
    Soffset = 0;
    Ioffset = 0;
    Noffset = 0;
    Goffset = 0;
  }
}

//void stop() {
//  S.close();
//  I.close();
//  N.close();
//  G.close();
//  minim.stop();
//
//  super.stop();
//}



