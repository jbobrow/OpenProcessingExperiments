
import controlP5.*;
import processing.pdf.*;

PFont font;
ControlP5 controlP5;

float punkt = 205;
float a = 390;
float t = 509;
float farbe = 255;
float r = 0;
float g = 177;
float b = 230;

void setup() {
  size(800,800);
  smooth();
  
  controlP5 = new ControlP5(this);
  controlP5.addSlider("punkt", 0, 800, 205, 10, 10, 200, 10);
  controlP5.addSlider("a", 0, 800, 390, 10, 30, 200, 10);
  controlP5.addSlider("t", 0, 800, 509, 10, 50, 200, 10);
  controlP5.addSlider("farbe", 0, 255, 255, 10, 90, 200, 10);
  controlP5.addSlider("r", 0, 255, 0, 10, 110, 200, 10);
  controlP5.addSlider("g", 0, 255, 177, 10, 130, 200, 10);
  controlP5.addSlider("b", 0, 255, 230, 10, 150, 200, 10);
  font = loadFont("WalkwayBlack-200.vlw"); 
  textFont(font); 
  textMode(SCREEN);
}

void draw () {
  background(r, g, b);
  fill(farbe);
  ellipse(width/2, punkt, 55, 55);
  text("A", 336, a);
  text("T", 346, t);
 
}

void keyPressed(){
  
  if (key== 's' || key == 'S') {
    println("Frame abspeichern");
    saveFrame("punktat_####.tif");
  }

  if(key == 'b' || key == 'B'){
    beginRecord(PDF,"punktat.pdf"); 
  }
  
  if(key == 'e' || key == 'E'){
    endRecord(); 
  }
}


