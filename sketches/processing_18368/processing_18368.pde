
import ddf.minim.*;
import controlP5.*;


Minim minim;
AudioPlayer player;


ControlP5 controlP5;

int valRed = 0;
int valGreen = 0;
int valBlue = 0;
int valSensitivity = 0;
float valCircle = 0;
int valTrinagle = 0;

Knob colKnobA;
Knob colKnobB;
Knob colKnobC;
Knob colKnobD;
Knob colKnobE;
Knob colKnobF;

void setup () {
  // Sketch einstellen
  size (1000, 700);
  smooth();
  noFill();

  controlP5 = new ControlP5(this);
  colKnobA = controlP5.addKnob("valRed",0,255,0,930,50,0);
  colKnobB = controlP5.addKnob("valGreen",0,255,0,930,100,0);
  colKnobC = controlP5.addKnob("valBlue",0,255,0,930,150,40);
  colKnobD = controlP5.addKnob("valSensitivity",0,500,250,930,200,40);
  colKnobE = controlP5.addKnob("valCircle",1,6,1,930,250,40);
  colKnobF = controlP5.addKnob("valTrinagle",1,5,1,930,300,40);
  
  fill(10);
  rect(900,0,100,700);

  minim = new Minim (this);
  player = minim.loadFile ("Sample.mp3");
  player.play ();

  background (0);
}

void draw () {
 
  stroke(255,valTrinagle);
  triangle(450,150,250,450,650,450);
  


  // Kreisgröße Abhängig von Lautstärke
  float dim = player.mix.level () * valSensitivity;  
  
  
  fill(10);
  rect(900,0,100,700);

  stroke(50,50);
  fill(0,valBlue,valBlue,2);
  ellipse (870-dim*4, 30+dim*3, dim*valCircle, dim*valCircle);

  stroke(50,50);
  fill(valBlue,0,valBlue,2);
  ellipse (450, 670-dim*3, dim*valCircle, dim*valCircle);

  stroke(50,50);
  fill(valBlue,valBlue,0,2);
  ellipse (30+dim*4, 30+dim*3, dim*valCircle, dim*valCircle);

   }



