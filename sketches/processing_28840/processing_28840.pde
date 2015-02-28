
import controlP5.*;
import generativedesign.*;

ControlP5 controlP5;

Ball[] meineBaelle;
Attractor meinAttraktor; 

int anzahl = 2;

  float groesse = 2;
  float strength = 1;


void setup() {
  size(400,400);
  smooth();
  
  controlP5 = new ControlP5(this);


  meineBaelle = new Ball[anzahl]; //array meineBaelle initialisiert

  for (int i=0; i<anzahl; i++) {
    meineBaelle[i] = new Ball(); //neuen Ball an Position i erstellen
    meineBaelle[i].x =random(width);
    meineBaelle[i].y =random(height);
    meineBaelle[i].farbe = color(random(100), 50, 0);
    meineBaelle[i].damping = .01;
    meineBaelle[i].setBoundary(0,0,width,height);
    meineBaelle[i].durchmesser =random(20,40);
  }

  meinAttraktor = new Attractor(); //neuen Attraktor erstellen
  meinAttraktor.strength = .4;
  meinAttraktor.mode = Attractor.TWIRL;
  
  controlP5.addSlider("strength", -50, 50, 10, 10, 10, 200, 20);
  controlP5.addSlider("groesse", 0.1, 2, 2, 10, 40, 200, 20);
  
}

void draw() {
  background(255);
  meinAttraktor.strength = strength;
  meinAttraktor.x = mouseX;
  meinAttraktor.y = mouseY;  

  for (int i=0; i<anzahl; i++) {

    if(mousePressed) {
      meinAttraktor.attract(meineBaelle[i]);
    }  

    meineBaelle[i].update(); //neue Position berechnen

    meineBaelle[i].zeichnen();
  }
}


//zichnet an Position von Ball eine Ellipse mit Durchmesser durchmesser
class Ball extends Node {

  float durchmesser;
  color farbe;
  
  void zeichnen() {
    fill(farbe);
    ellipse(x,y, durchmesser*groesse, durchmesser*groesse);
  }
}


