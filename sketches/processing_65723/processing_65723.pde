
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import processing.opengl.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;

final int N = 30;  //numero stelle 

Stella [] stelle_c = new Stella[N];     //Stella centrale
Stella [] stelle_asx = new Stella[N];   //Stella alto a sinistra
Stella [] stelle_acx = new Stella[N];   //numero stelle alto al centro
Stella [] stelle_adx = new Stella[N];   //Stella alto a destra
Stella [] stelle_csx = new Stella[N];   //Stella centrali a sinistra
Stella [] stelle_cdx = new Stella[N];   //Stella centrali a destra
Stella [] stelle_bsx = new Stella[N];   //Stella basso a sinistra
Stella [] stelle_cc = new Stella[N];    //Stella centrali al centro
Stella [] stelle_bdx = new Stella[N];   //Stella basso a destra

color c;
float kickSize_p, kickSize, kickSize_c; 
float rd, rs, k = 0.0005;

//SETUP
void setup() {
  size(700, 700, OPENGL);
  background(0);
  smooth();
  colorMode(HSB, 400);

  minim = new Minim(this); 
  song = minim.loadFile("Summer of Love.mp3", 1024);
  song.play();
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  beat.setSensitivity(60);
}

//DRAW
void draw() {
  beat.detect(song.mix);

  //Motion blur
  fill(0, 40);
  rect(-1, -1, width+2, height+2);

  //-------------------------------------------------------------------------------------------------------------------------------------

  //Analisi dei beat
  if ( beat.isHat() ) {
    kickSize = 400;
  }
  if( beat.isKick() ) {
     kickSize_p = 200;
  }
  if ( beat.isRange(5, 20, 3)) {
    kickSize_c = 100;
  }

  kickSize_p *= 0.95;
  kickSize_c *= 0.95;
  kickSize *= 0.95;

  if (kickSize_p < 100) kickSize_p = 100;
  if (kickSize < 300) kickSize = 300;
  if (kickSize_c < 50) kickSize_c = 50;

  //-------------------------------------------------------------------------------------------------------------------------------------

  //Stella centrale
  for (int i = 0; i < N; i++) {
    stelle_c[i] = new Stella(width/2, height/2, kickSize-(i*11), 2, color(i*12+(mouseX/3), kickSize, 400));
    stelle_c[i].disegna();
    stelle_c[i].setGrandezza(kickSize);
  }

  for (int i = 0; i < N; i++) {
    //Stella alto a sinistra
    stelle_asx[i] = new Stella(0, 0, kickSize_p-(i*11), 2, color(i*15+150+(mouseY/4), 400, 400)); 

    //Stella alto al centro
    stelle_acx[i] = new Stella(0, 0, kickSize_c-(i*11), 2, color(i*15, 400, 400));

    //Stella alto a destra
    stelle_adx[i] = new Stella(0, 0, kickSize_p-(i*11), 2, color(i*15+150+(mouseY/4), 400, 400));

    //Stella centrale a sinistra
    stelle_csx[i] = new Stella(0, 0, kickSize_c-(i*11), 2, color(i*15, 400, 400));

    //Stella centrale a destra
    stelle_cdx[i] = new Stella(0, 0, kickSize_c-(i*11), 2, color(i*15, 400, 400));

    //Stella basso a sinistra
    stelle_bsx[i] = new Stella(0, 0, kickSize_p-(i*11), 2, color(i*15+150+(mouseY/4), 400, 400));

    //Stella centrale al centro
    stelle_cc[i] = new Stella(0, 0, kickSize_c-(i*11), 2, color(i*15, 400, 400));

    //Stella basso a destra
    stelle_bdx[i] = new Stella(0, 0, kickSize_p-(i*11), 2, color(i*15+150+(mouseY/4), 400, 400));
  }

  //-------------------------------------------------------------------------------------------------------------------------------------

  for (int i = 0; i < N; i++) {
    rd += k;
    rs -= k;

    //Stella alto a sinistra
    pushMatrix();
    translate(width/4, height/4);
    rotate(rd*1.2);
    stelle_asx[i].disegna();
    stelle_asx[i].setGrandezza(kickSize_p);
    popMatrix();

    //Stella alto al centro
    pushMatrix();
    translate(width/2, height/8);
    rotate(rs*1.2);
    stelle_acx[i].disegna();
    stelle_acx[i].setGrandezza(kickSize_c);
    popMatrix();

    //Stella alto a destra
    pushMatrix();
    translate(width*3/4, height/4);
    rotate(rd*1.2);
    stelle_adx[i].disegna();
    stelle_adx[i].setGrandezza(kickSize_p);
    popMatrix();

    //Stella centrale a sinistra
    pushMatrix();
    translate(width/8, height/2);
    rotate(rs*1.2);
    stelle_csx[i].disegna();
    stelle_csx[i].setGrandezza(kickSize_c);
    popMatrix();

    //Stella centrale a destra
    pushMatrix();
    translate(width*7/8, height/2);
    rotate(rs*1.2);
    stelle_cdx[i].disegna();
    stelle_cdx[i].setGrandezza(kickSize_c);
    popMatrix();

    //Stella basso a sinistra
    pushMatrix();
    translate(width/4, height*3/4);
    rotate(rd*1.2);
    stelle_bsx[i].disegna();
    stelle_bsx[i].setGrandezza(kickSize_p);
    popMatrix();

    //Stella centrale al centro
    pushMatrix();
    translate(width/2, height*7/8);
    rotate(rs*1.2);
    stelle_cc[i].disegna();
    stelle_cc[i].setGrandezza(kickSize_c);
    popMatrix();

    //Stella basso a destra
    pushMatrix();
    translate(height*3/4, height*3/4);
    rotate(rd*1.2);
    stelle_bdx[i].disegna();
    stelle_bdx[i].setGrandezza(kickSize_p);
    popMatrix();
  }
}

public void mouseClicked() {
  k *= -1;
}

//STOP
void stop() {
  song.close();
  minim.stop();
  super.stop();
}


