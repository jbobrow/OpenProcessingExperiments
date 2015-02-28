
import controlP5.*; //import van controlP5 library
ControlP5 controlP5; //controlP5 object

color [] colors = new color [10]; //array voor 10 verschillende kleuren
ControlWindow controlWindow; // functie voor twee ramen

void setup ()
{
  size (800,200);
  smooth ();

  controlP5 = new ControlP5 (this);
  controlWindow = controlP5.addControlWindow("controlP5window", 200,200,200,200); //maat van ramen

  Controller klick = controlP5.addBang("klick", 100,100,25,25); // knop om te drukken
  klick.setWindow(controlWindow);
  
  Controller press = controlP5.addToggle("press",false,100,150,25,25); // knop om te drukken (alleen aan en uit)
  press.setWindow(controlWindow);
  
  Controller push = controlP5.addSlider("push",0,500,10,80,10,100); // knop om te trekken
  push.setWindow(controlWindow);
  
  Controller pull = controlP5.addKnob("pull",0,360,60,25,25); //knop om te draaien
  pull.setWindow(controlWindow); 
}

void draw ()
{
  background (0,100,240);
  
  for(int i=0;i<4;i++) {        // vier sneeuwvlokken worden getekend
    stroke(0);
    fill(colors[i]); 
    tekenSneuw(4+(i*200),0);
    
  }  

}

void controlEvent(ControlEvent theEvent) //functie voor knoppen
{
  if (theEvent.controller().name()=="klick") //als de knop gedrukkt wordt wisselt hij tussen tien kleuren
 {
  colors[0]=colors [0] + color (20,40,100);
  if (colors[0]>255) colors [0] = color (20,40,100);
 }
 if (theEvent.controller().name()=="press") //als de knop gedrukkt wordt wordt het geel anders gaat het weer uit
 { 
   if(theEvent.controller().value()==1) colors[1]= color (255,255,0);
   else                                 colors[1]= color (0,0,0);
 }
  if (theEvent.controller().name()=="push") // kleuren wisselen
  {
    colors[2]= color(200,100,theEvent.controller().value());
  }
  if (theEvent.controller().name()=="pull") //kleuren wisselen
  {
    colors[3]= color(theEvent.controller().value(),255,0);
  }
}
 
 void tekenSneuw (int x, int y) // functie voor sneeuwlokken
 {
   rectMode (CENTER);
   stroke (255);
    rect (x+80,y+150,10,50);
    rect (x+80,y+150,50,10);
    rect (x+60,y+150,5,20);
    rect (x+100,y+150,5,20);
    rect (x+80,y+130,20,5);
    rect (x+80,y+170,20,5);

   
 }
   

