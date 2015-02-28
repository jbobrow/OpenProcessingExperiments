
/*
Survol des controleurs controlP5 simples.
*/

import controlP5.*; // Importer la logitheque.

ControlP5 controlP5; // Déclarer une instance de la logitheque.


void setup() {
  size(300,300);
  smooth();

  // Creer une instance de ControlP5 et la lier a ce sketch (this).
  controlP5 = new ControlP5(this);

  // Ajouter un Numberbox.
  // addNumberbox(String theName, float theDefaultValue, int theX, int theY, int theWidth, int theHeight).
  controlP5.addNumberbox("numberBox",128,10,10,40,14);

  // Ajouter un Toggle.
  // addToggle(String theName, boolean theDefaultValue, float theX, float theY, int theWidth, int theHeight) 
  controlP5.addToggle("toggle",false,10,48,14,14);

  // Ajouteur un Button.
  // addButton(String theName, float theValue, int theX, int theY, int theW, int theH) 
  controlP5.addButton("button",128,10,86,40,19);

  // Ajouter un Slider.
  // addSlider(String theName, float theMin, float theMax, float theDefaultValue, int theX, int theY, int theW, int theH) 
  controlP5.addSlider("slider",0,255,128,10,120,100,14);

  // Ajouter un Knob.
  // addKnob(String theName, float theMin, float theMax, float theDefaultValue, int theX, int theY, int theDiameter) 
  controlP5.addKnob("knob",0,255,128,10,148,28);

  // Ajouter un TextField
  // addTextfield(String theName, int theX, int theY, int theW, int theH) 
  controlP5.addTextfield("textField",10,196,100,20);

  // Ajouter un Range.
  // addRange(String theName, float theMin, float theMax, float theBottom, float theTop, int theX, int theY, int theW, int theH) 
  controlP5.addRange("range",0, 255, 55,200, 10,246,100,14);

  // Ajouter un Slider2D.
  // addSlider2D(String theName, int theX, int theY, int theW, int theH)  
  controlP5.addSlider2D("slider2D",160,10,100,100);
}

void draw() {
  background(0);
}


