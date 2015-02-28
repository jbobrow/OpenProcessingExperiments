
import controlP5.*;    // import controlP5 library 
ControlP5 controlP5;   // controlP5 object 

color [] colors = new color[5];  
 
void setup() { 
  size(500,250); 
  smooth(); 
     
  controlP5 = new ControlP5(this); 
   
  controlP5.addKnob("knob1",0,360,0,20,70,80); 
  controlP5.addButton("button1",1,130,100,60,40); 
  controlP5.addToggle("toggle1",false,250,100,30,20); 
  controlP5.addSlider("slider1",0,255,128,350,50,10,100); 
  controlP5.addSlider("slider2",0,255,128,400,120,50,10); 

} 
   
void draw() {  
  background(0);
  for(int i=0;i<5;i++) {        
    stroke(255); 
    fill(colors[i]);            
    tekenOiliphant(10+(i*100),150);  
  }   
} 
 
void controlEvent(ControlEvent theEvent) { 
   
  if(theEvent.isController()) {  
     
    print("control event from : "+theEvent.controller().name()); 
    println(", value : "+theEvent.controller().value()); 
    
    if(theEvent.controller().name()=="knob1") { 
      colors[0] = color(0,theEvent.controller().value(),theEvent.controller().value()); 
    } 
     
    if(theEvent.controller().name()=="button1") { 
      colors[1] = colors[1] + color(40,0,40); 
      if(colors[1]>255) colors[1] = color(40,0,40); 
    } 
     
    if(theEvent.controller().name()=="toggle1") { 
      if(theEvent.controller().value()==1) colors[2] = color(150,150,255); 
      else                                 colors[2] = color(0,0,0); 
    } 
     
    if(theEvent.controller().name()=="slider1") { 
      colors[3] = color(theEvent.controller().value(),0,0); 
    } 
     
    if(theEvent.controller().name()=="slider2") { 
      colors[4] = color(0,theEvent.controller().value(),0); 
    } 
       

     
  }   
} 
 
void tekenOiliphant ( int x, int y)
{ stroke(1);  
    //beine
    //fill(100);
    rect(x+30, y+52, 15, 30);
    rect(x+55, y+52, 15, 30);
    //körper
    //fill(100);
    ellipse(x+50, y+52, 50, 50);
    //ohren
    //fill(255,0,255);
    ellipse(x+40, y+40, 20, 30);
    ellipse(x+60, y+40, 20, 30);
    //rüssel
    //fill(200);
    rect(x+47.5, y+40, 5, 25);
    //kopf
    //fill(200);
    ellipse(x+50, y+40, 25, 25);
    //augen
    fill(255);
    ellipse(x+45, y+35, 6, 6);
    ellipse(x+55, y+35, 6, 6);
    fill(0);
    ellipse(x+47, y+36, 2, 2);
    ellipse(x+54, y+36, 2, 2);
  

   
}

