
import controlP5.*;    // import controlP5 library 
ControlP5 controlP5;   // controlP5 object 

//array für 5 verschiedene Farben
color [] colors = new color[5];  
//2tes Fenster lässt sich steuern
ControlWindow controlWindow;

void setup() { 
  size(500,100); 
  smooth(); 
  
  controlP5 = new ControlP5(this); 
  //controlP5.setAutoDraw(false);
  //neues Fester wird aufgemacht (controller)
  controlWindow = controlP5.addControlWindow("controlP5window",100,100,500,250);
  //controlWindow.hideCoordinates();
  
  //im controller
  
  // bezeichnung : knob = drehknopf 
  // parameter  : name, minimum, maximum, default value = ausgangswert (float), x, y, durchmesser 
  Controller knob =  controlP5.addKnob("knob",0,360,0,20,70,80); 
  knob.setWindow(controlWindow);
  // bezeichnung : ein button durchführung nach loslassen 
  // parameter  : name, value = ausgangswert (float), x, y, width = breite, height = höhe
  Controller button = controlP5.addButton("button",1,130,100,60,40); 
  button.setWindow(controlWindow); 
  // bezeichnung : ein toggle (kipphebel) kann zwischen 2 positionen wechseln, true und false 
  //                true hat den wert (value) 1 und false 0. 
  // parameter  : name, default value (boolean), x, y, width, height 
  Controller toggle = controlP5.addToggle("toggle",false,250,100,30,20); 
  toggle.setWindow(controlWindow);  
  // bezeichnung : ein slider ist horizontal oder vertikal. 
  //               width is bigger, you get a horizontal slider 
  //               height is bigger, you get a vertical slider.   
  // parameter  : name, minimum, maximum, default value (float), x, y, width, height 
  Controller slider = controlP5.addSlider("slider",0,255,128,350,50,10,100); 
  slider.setWindow(controlWindow); 
  Controller dimmer = controlP5.addSlider("dimmer",0,255,128,400,120,50,10);  
  dimmer.setWindow(controlWindow); 
  
} 
   
void draw() {  
  background(0);
  //controlP5.draw();
  //setzt den array i
  for(int i=0;i<5;i++) {        
    stroke(255); 
    //farben array
    fill(colors[i]);
    //elefanten array    
    tekenOiliphant(10+(i*100),0);  
  }   
} 
 
void controlEvent(ControlEvent theEvent) { 
  /* Ereignisse, die von Steuerungen ausgelöst werden, werden automatisch
     auf die ControlEvent Methode weitergeleitet.
     Mit Sie den Namen eines Reglers kann man unterscheiden,
     welche der Controller geändert worden ist.
  */  
  
  /* überprüfen, ob das Ereignis von einem Controller ist,
     ansonsten kommt eine Fehlermeldung, wenn andere Elemente 
     der Benutzeroberfläche wie Radiobutton angeklickt werden
     die die Controller ()-Methoden nicht Unterstützung
  */  
  
  
  if(theEvent.isController()) {  
     
    print("control event from : "+theEvent.controller().name()); 
    println(", value : "+theEvent.controller().value()); 
    
   if(theEvent.controller().name()=="knob") { 
    colors[0] = color(theEvent.controller().value(),theEvent.controller().value(),0);  
    } 
     
    if(theEvent.controller().name()=="button") { 
      colors[1] = colors[1] + color(40,0,40); 
      if(colors[1]>255) colors[1] = color(40,0,40); 
    } 
     
    if(theEvent.controller().name()=="toggle") { 
      if(theEvent.controller().value()==1) colors[2] = color(0,255,255); 
      else                                 colors[2] = color(0,0,0); 
    } 
     
    if(theEvent.controller().name()=="slider") { 
      colors[3] = color(theEvent.controller().value(),0,0); 
    } 
     
    if(theEvent.controller().name()=="dimmer") { 
      colors[4] = color(0,theEvent.controller().value(),0); 
    }  
  }   
} 
 
void tekenOiliphant ( int x, int y) //der elefant
{ stroke(1);  
    //beine
    rect(x+30, y+52, 15, 30);
    rect(x+55, y+52, 15, 30);
    //körper
    ellipse(x+50, y+52, 50, 50);
    //ohren
    ellipse(x+40, y+40, 20, 30);
    ellipse(x+60, y+40, 20, 30);
    //rüssel
    rect(x+47.5, y+40, 5, 25);
    //kopf
    ellipse(x+50, y+40, 25, 25);
    //augen
    fill(255);
    ellipse(x+45, y+35, 10, 10);
    ellipse(x+55, y+35, 10, 10);
    fill(0);
    ellipse(x+47, y+36, 4, 4);
    ellipse(x+54, y+36, 4, 4);
  
}

