

import controlP5.*; // importeren bibliotheek
ControlP5 controlP5; // control P5 object

int myColorBackground = color(230); // achtergrond kleur

void setup() {
  size(600,200); // afmeting scherm
  smooth();
    
  controlP5 = new ControlP5(this);
  Radio r = controlP5.addRadio("radio",20,20);
  r.deactivateAll(); // deactiveAll om niet meteen de eerste button actief te maken
  r.add("ZWART",0); // namen van de buttons
  r.add("ROOD",1);
  r.add("GROEN",2);
  r.add("BLAUW",3);
  r.add("GRIJS",4);
  
}

void draw() {
    
  background(myColorBackground); // de achtergrond

}

void radio(int theID) {
  switch(theID) {
    case(0):
      myColorBackground = color(31,31,31);   // als je nu op een button klikt wordt de kleur geladen van de naam die je klikt 
      break;  
    case(1):
      myColorBackground = color(231,61,61);
      break;  
    case(2):
      myColorBackground = color(62,218,120);
      break;  
    case(3):
      myColorBackground = color(63,110,231);
      break;  
    case(4):
      myColorBackground = color(146,146,146);
      break;
  }
  println("Frank te Riet");
}

