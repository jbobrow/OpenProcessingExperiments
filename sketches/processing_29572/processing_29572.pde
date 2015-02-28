
import controlP5.*;
ControlP5 controlP5;

PFont font;
PImage b;
float x;
float answer;
Textfield myTextfield;
String textValue = "";

void setup() {
  size(800, 500);
  smooth();
  b = loadImage("background.jpg");
  controlP5 = new ControlP5(this);
  myTextfield = controlP5.addTextfield("", 360, 283, 140, 40);
  answer = 3 * (x/4 + 2) -32; 
}

void draw() {
  image(b, 0, 0);
  fill(240, 220);
  font = loadFont("EraserDust-50.vlw"); 
  textFont(font); 
  text("x=", 305, 320);
  text("  3(x/4 + 2) -32 = "+ answer, 70, 170); 
  textValue = myTextfield.getText(); 
  if(!textValue.equals("")) {
    x=Float.parseFloat(textValue);
  }
  textValue = myTextfield.getText(); 
  myTextfield.setFocus(true);
  if (keyPressed) {
    if (key == ENTER) { 
      answer = 3 * (x/4 + 2) -32 ;
    }
  }
}


