

// smilies
//veranderen kleur als muis zich bewegt
//button pressed = veld met "jana"
//button1 pressed = achtergronkleur verandert


import controlP5.*; //import libraries


int [] waardenX = new int[30]; 
int [] waardenY = new int[30]; 
 
int r; //rot
int g; //grün
int n; //blau (b schon vergben deshalb n)

ControlP5 controlP5;
ControlFont font;
controlP5.Button b;
int buttonValue = 1;
boolean isOpen;



void setup() 
{ size (500,500); //hintergrund größe
  smooth(); 
   
  for(int i=0;i<30;i++) 
  { waardenX[i] = 100*int(random(0,5));  // damit die objekte nicht über das viereck hinaus gehen
    waardenY[i] = 100*int(random(0,5));  //damit die objekte nicht über das viereck hinausgehen
  } 

frameRate(30);
  controlP5 = new ControlP5(this);
  // knopf
  controlP5.addButton("button",10,0,0,80,20).setId(1); //größe vom knopf
  b = controlP5.addButton("buttonValue",4,100,190,80,20);
  b.setId(2);
  b.setWidth(200); //  Breite, Textfeld und text ineinander passend
  b.setHeight(200); // Höhe

  font = new ControlFont(createFont("Times",20),20); // schriftart
  font.setSmooth(true);

  b.captionLabel().setControlFont(font); // schrift
  b.captionLabel().setControlFontSize(80); // schriftgröße
  b.captionLabel().toUpperCase(false);
  b.captionLabel().set("Jana"); // text : Jana
 
  controlP5.addBang("button1",80,0,20,20); //knopf "button1" hinzugefügt
} 
 
 void draw () 
{ background(r ,g,n); //farbenwechsel möglich, da alle farben da sind
  stroke(0); 
  strokeWeight(3); //dicke des striches
     
  for(int i=0;i<25;i++) 
  { tekenSmilie(waardenX[i], waardenY[i]); //objekt smilie zeichnen
  } 
 b.position().x += ((isOpen==true ? 0:-200) - b.position().x) * 0.2;
 
}

public void controlEvent(ControlEvent theEvent) // kontrolle knopf erscheint!
  {  println(theEvent.controller().id());
  }

public void button(float theValue)
  {println("a button event. "+theValue);
  isOpen = !isOpen; //mehrmals anklickbar & mehrmals auf und zu
  controlP5.controller("button").setCaptionLabel((isOpen==true) ? "close":"open"); //wdh.
  } 
 
 void tekenSmilie(int x, int y) 
 {  
    //grundobjekt kreis
    fill(0,100,100); 
    ellipse (x+50,y+50,60,60); 
    
     //maus verändert durch bewegung farbe der smilies
    fill(mouseX,100,mouseY); 
    ellipse (x+50,y+50,60,60); //körper
    ellipse (x+40,y+45,15,15); //linkes auge
    ellipse (x+60,y+45,15,15); //rechtes auge
    fill(0);
    line (x+40,y+65,x+60,y+60); //mund
  } 
  
 // hintergrundfarbe veränderung mit button1 gedrückt
  void button1(float theValue)  
 {   
  loop();  
  r = int (random (0,255));  
   g = int (random (0,255)); 
  n = int (random (0,255)); 
 }   


