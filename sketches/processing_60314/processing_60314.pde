
import controlP5.*;
ControlP5 controlP5;

boolean sw = false;
boolean rand = true;

PFont  font;
String word = "";
String textValue = "";
String texty = "";
Textfield myTextfield;


void setup() {
  size(400, 240);
  frameRate(25);
  font = loadFont("Silom-48.vlw");
  textFont(font);
  controlP5 = new ControlP5(this);
  myTextfield = controlP5.addTextfield("", 100, 50, 200, 20);
  myTextfield.setFocus(true);
}

void draw() {
  background(255,167,254);
  stroke(220);
  fill(50,200);
  textSize(24);
//  textAlign(CENTER);
  if (sw) {
    textAlign(CENTER);
    text(texty+" "+word, 200, 180);
  }
}

void controlEvent(ControlEvent theEvent) {
  //println("controlEvent: accessing a string from controller '"+theEvent.controller().name()+"': "+theEvent.controller().stringValue());
  texty = theEvent.controller().stringValue();
  println(texty);
  sw = true;
}

public void texting(String theText) {
  // receiving text from controller texting
  // println("a textfield event for controller 'texting': "+theText);
}

void randomChoice() {
  float r = random(0, 1);
  if (r < .5) {
    rand = true;
  } 
  else {
    rand = false;
  }
}

void keyPressed() {
  if (key == ENTER) {
    randomChoice(); 
    text(word, 170, 240);
    if (rand == false) {
      word = "lenyeli!";
    } 
    else {
      word = "nem nyeli le!";
    }
  }
}


