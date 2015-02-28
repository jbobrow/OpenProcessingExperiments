
import controlP5.*;

ControlP5 c;

//variabili per le immagini
PImage img_01;
PImage img_02;
PImage img_03;
PImage img_04;
PImage img_05;
PImage img_06;
PImage img_07;
PImage img_08;
PImage img_09;

//variabili per le opacità
public int sunglare = 0;
public int surface = 0;
public int opening = 0;
public int deformation1 = 0;
public int deformation2 = 0;
public int step = 0;
public int redundancy = 0;
public int thickening = 0;
public int structura = 0;

void setup(){
  size(900,675);
  
  //controllers
  c = new ControlP5(this);
  c.addSlider("sunglare", 0, 255, sunglare, 5, 5, 120, 10);
  c.addSlider("surface", 0, 255, surface, 5, 25, 120, 10);
  c.addSlider("opening", 0, 255, opening, 5, 45, 120, 10);
  c.addSlider("deformation1", 0, 255, deformation1, 5, 65, 120, 10);
  c.addSlider("deformation2", 0, 255, deformation2, 5, 85, 120, 10);
  c.addSlider("step", 0, 255, step, 5, 105, 120, 10);
  c.addSlider("redundancy", 0, 255, redundancy, 5, 125, 120, 10);
  c.addSlider("thickening", 0, 255, thickening, 5, 145, 120, 10);
  c.addSlider("structura", 0, 255, structura, 5, 165, 120, 10);
  
  //Set colore del valore interno allo slider
    //c.setColorValue(100);
  //Set colore dell'etichetta
  c.setColorLabel(0);
  
  //images
  img_01 = loadImage("P1.png");
  img_02 = loadImage("P2.png");
  img_03 = loadImage("P3.png");
  img_04 = loadImage("P4.png");
  img_05 = loadImage("P5.png");
  img_06 = loadImage("P6.png");
  img_07 = loadImage("P7.png");
  img_08 = loadImage("P8.png");
  img_09 = loadImage("P9.png");
}

void draw(){
  background(255);
  
  tint(255, sunglare);
  image(img_01, 0, 0);
  
  tint(255, surface);
  image(img_02, 0, 0);
  
  tint(255, opening);
  image(img_03, 0, 0);
  
  tint(255, deformation1);
  image(img_04, 0, 0);
  
  tint(255, deformation2);
  image(img_05, 0, 0);
  
   tint(255, step);
  image(img_06, 0, 0);
  
  tint(255, redundancy);
  image(img_07, 0, 0);
  
  tint(255, thickening);
  image(img_08, 0, 0);
  
  tint(255, structura);
  image(img_09, 0, 0);
  
  tint(255);  
}

