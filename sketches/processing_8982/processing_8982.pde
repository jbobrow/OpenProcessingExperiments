
import controlP5.*;   //zo importeer je alles van controlP5
ControlP5 controlP5;

//Rijtje met kleuren met array
color [] colors = new color[7];

int [] xPosities = new int[7];
int [] yPosities = new int[7];

int schermX = 500;
int schermY = 500;

void setup(){
  size(schermX,schermY);
  smooth();
 
 controlP5 = new ControlP5(this);
 
 //Bang: wanneer je er op drukt gebeurt er iets
 //naam knop, x, y, width, height
  controlP5.addBang("bang1",10,350,20,20);
    
  // Button na het indrukken gbeurt er iets
  // naam knop, value (float), x, y, width, height
  controlP5.addButton("button1",1,70,350,60,20);
  
  // Toggle: is aan óf uit / true of false
  // Naam knop, default value (boolean), x, y, width, height
  controlP5.addToggle("toggle1",false,170,350,20,20);
  
  // Slider: wanneer je naar rechts beweegt bij een horizontale slider 
  //               wordt het meer en bij een verticale slider wordt het
  //               meer als je omhoog beweegt.  
  // Naam knop, minimum, maximum, default value (float), x, y, width, height
  controlP5.addSlider("slider1",0,255,128,10,200,10,100);
  controlP5.addSlider("slider2",0,255,128,225,350,100,10);
  
  // Ronde knop die om zijn kan as draaien waardoor er iets kan veranderen
  // Naam knop, minimum, maximum, default value (float, x, y, diameter
  controlP5.addKnob("knob1",0,360,0,350,230,70);
  
  // Numberbox: een box dat een nummer weergeeft. Wanneer je hem indrukt en met
  // de muis naar boven of beneden beweegt wordt de waarde groter of kleiner.
  // Naam knop, default value (float), x, y,  width, height
  controlP5.addNumberbox("numberbox1",50,170,160,60,14);
 
  for(int i=0; i < 7; i++) {
   xPosities[i] = int(random(0,5))*100;
   yPosities[i] = int(random(0,5))*100; 
  } 
 }


void draw(){
 background(0);
 

 //int xwaarde=int(map(mouseX, 0, schermX, 0, 255));
 //int ywaarde=int(map(mouseY, 0, schermY, 0, 255));
 //fill(255,xwaarde,ywaarde);
 
 for(int i=0; i < 7; i++){ // want zeven kleuren in array
 stroke(255);
  fill(colors[i]);
   tekenHartje(xPosities[i],yPosities[i]); //refereert terug naar de functie van tekenhartje
 }
}

void tekenHartje(int x,int y){
  noStroke();
  //triangle(x1, y1, x2, y2, x3, y3);
  triangle(x+31,y+58,x+131,y+58,x+81,y+125);
  //ellipse(x, y, width, height) 
  ellipse(x+56,y+46,55,55);
  ellipse(x+106,y+46,55,55);
}

void controlEvent(ControlEvent theEvent) {
  
  if(theEvent.isController()) { 
    
    print("control event from : "+theEvent.controller().name());
    println(", value : "+theEvent.controller().value());
    
    if(theEvent.controller().name()=="bang1") {
      colors[0] = colors[0] + color(40,40,0);
      if(colors[0]>255) colors[0] = color(40,40,0);    
    }
    
    if(theEvent.controller().name()=="button1") {
      colors[1] = colors[1] + color(40,0,40);
      if(colors[1]>255) colors[1] = color(40,0,40);
    }
    
    if(theEvent.controller().name()=="toggle1") {
      if(theEvent.controller().value()==1) colors[2] = color(0,255,255);
      else                                 colors[2] = color(0,0,0);
    }
    
    if(theEvent.controller().name()=="slider1") {
      colors[3] = color(theEvent.controller().value(),0,0);
    }
    
    if(theEvent.controller().name()=="slider2") {
      colors[4] = color(0,theEvent.controller().value(),0);
    }
      
    if(theEvent.controller().name()=="knob1") {
      colors[5] = color(0,0,theEvent.controller().value());
    }
    
    if(theEvent.controller().name()=="numberbox1") {
      colors[6] = color(theEvent.controller().value());
    } 
    
  }  
}

