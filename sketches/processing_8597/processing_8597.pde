
import controlP5.*; //import van controlP5 library 
ControlP5 controlP5; //controlP5 object 
 
color [] colors = new color [10]; //array voor 10 verschillende kleuren 
ControlWindow controlWindow; 
 
void setup () 
{ 
  size (800,200); 
  smooth (); 
 
  controlP5 = new ControlP5 (this); 
  controlWindow = controlP5.addControlWindow("controlP5window", 200,200,200,200); 
 
  Controller klick = controlP5.addBang("klik", 100,100,25,25); // knop om te drukken 
  klick.setWindow(controlWindow); 
   
  Controller press = controlP5.addToggle("on/off",false,100,150,25,25); // knop om te drukken (alleen aan en uit) 
  press.setWindow(controlWindow); 
   
  Controller push = controlP5.addSlider("push",0,500,10,80,10,100); // knop om te trekken 
  push.setWindow(controlWindow); 
   
  Controller pull = controlP5.addKnob("pull",0,360,60,25,25); //knop om te draaien 
  pull.setWindow(controlWindow);  
} 
 
void draw () 
{ 
  background (255); 
  strokeWeight(5);
   
  for(int i=0;i<10;i++) {       
    stroke(0); 
    fill(colors[i]);  
    tekenDriehoek(10+(i*200),0); 
     
  }   
 
} 
 
void controlEvent(ControlEvent theEvent)  
{ 
  if (theEvent.controller().name()=="klik") 
 { 
  colors[0]=colors [0] + color (20,40,100); 
  if (colors[0]>255) colors [0] = color (20,40,100); 
 } 
 if (theEvent.controller().name()=="on/off")  
 {  
   if(theEvent.controller().value()==1) colors[1]= color (255,255,0); 
   else                                 colors[1]= color (0,0,0); 
 } 
  if (theEvent.controller().name()=="push") 
  { 
    colors[2]= color(200,100,theEvent.controller().value()); 
  } 
  if (theEvent.controller().name()=="pull")  
  { 
    colors[3]= color(theEvent.controller().value(),255,0); 
  } 
} 
  
void tekenDriehoek(int x, int y)
{ //  x1, y1, x2, y2, x3, y3
  triangle(x+0, y+0, x+75, y+0, x+35, y+75); 
  // x1, y1, x2, y2
  line(x+30, y+50, x+43, y+50);
  line(x+15, y+20, x+60, y+20);
  line(x+15, y+22, x+60, y+22);
}


    

