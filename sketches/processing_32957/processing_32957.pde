
import controlP5.*;

ControlP5 c;

//variabili per le immagini
PImage img_01;
PImage img_02;
PImage img_03;
PImage img_04;
PImage img_05;

//variabili per le opacità
public int surface = 0;
public int stress = 0;
public int value = 0;
public int deformation = 0;
public int structure = 0;

void setup(){
  size(900,675);
  
  //controllers
  c = new ControlP5(this);
  c.addSlider("surface", 0, 255, surface, 5, 5, 190, 10);
  c.addSlider("stress", 0, 255, stress, 5, 25, 190, 10);
  c.addSlider("value", 0, 255, value, 5, 45, 190, 10);
  c.addSlider("deformation", 0, 255, deformation, 5, 65, 190, 10);
  c.addSlider("structure", 0, 255, structure, 5, 85, 190, 10);
  
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
}

void draw(){
  background(255);
  
  tint(255, surface);
  image(img_01, 0, 0);
  
  tint(255, stress);
  image(img_02, 0, 0);
  
  tint(255, value);
  image(img_03, 0, 0);
  
  tint(255, deformation);
  image(img_04, 0, 0);
  
  tint(255, structure);
  image(img_05, 0, 0);
  
  tint(255);  
}

