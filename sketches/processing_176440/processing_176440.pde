
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

float[] x = new float[100];
float[] y = new float[100];
float[] speed = new float[100];
float[] Starsize = new float[100];
float truckfrequencex = 480;
float truckfrequencey = 0;
float dashx = 230;
float dashy = 20;
float yaoix = 320;
float yaoiy = 140;
float bananax = 120;
float bananay = 200;
float youtubex = 450;
float youtubey = 300;

import ddf.minim.*;

Minim minim;
AudioPlayer player;

PImage brain;
PImage truck;
PImage dash;
PImage yaoi;
PImage banana;
PImage youtube;

void setup() {
  size(640, 480);
  background(0);
  stroke(255);
  noCursor();

  truck = loadImage("euro_truck_simulator_2___v2_by_c3d49-d7bot4e.png");
  brain = loadImage("final.png");
  dash = loadImage("FANMADE_Ax_Brütaloo_Rainbow_Dash.png");
  yaoi = loadImage("Mmm YAOI! - Large Icons SAMPLE.jpg");
  banana = loadImage("thumb.png");
  youtube = loadImage("YouTube-logo-full_color.png");
  minim = new Minim(this);
  player = minim.loadFile("Lost in Space.mp3");

  int i = 0;
  while (i<100) {
    x[i] = random(0, width);
    y[i] = random(0, height);
    Starsize[i] = random(1, 7);
    speed[i] = random(1, 10);
    i = i+1;
  }
}

void draw() {
  background(0);
  int i = 0;
  while (i<100) {
    float co = map(Starsize[i],1,7, 50,255);
    stroke(co);
    strokeWeight(Starsize[i]);
    player.play();
    image(truck, truckfrequencex, truckfrequencey, 70, 70);
    image(dash, dashx, dashy, 70, 70);
    image(yaoi, yaoix, yaoiy, 70, 70);
    image(banana, bananax, bananay, 70, 70);
    image(youtube, youtubex, youtubey, 70, 70);
    image(brain, mouseX, mouseY);
    point(x[i], y[i]);

    x[i] = x[i]-speed[i];
    truckfrequencex = truckfrequencex-0.04;
    dashx = dashx-0.05;
    yaoix = yaoix-0.07;
    bananax = bananax-0.05;
    youtubex= youtubex-0.07;

    if (x[i]<0) {
      x[i]=width;
    } 
    if (truckfrequencex<0) {
      truckfrequencex=width;
      truckfrequencey=random(0, 360);
    } 
    if (dashx<0) {
      dashx=width;
      dashy=random(0, 360);
    } 
    if (bananax<0) {
      bananax=width;
      bananay=random(0, 360);
    } 
    if (yaoix<0) {
      yaoix=width;
      yaoiy=random(0, 360);
    } 
    if (youtubex<0) {
      youtubex=width;
      youtubey=random(0, 360);
    } 
    i = i+1;
  }
}

