

//pdf
import processing.pdf.*;
//illu (svg)
PShape s;

//einmalige voreinstellung
void setup() {
  //grösse
  size(640, 640);
  //hintergund
  background(#ffffff);
  frameRate(30);
  //anti-aliasing
  smooth();
  //svg laden (muss auch über sketch "add file.." geladen werden
  s = loadShape("shape.svg");
}


float winkel = 0;
float drehgeschwindigkeit = 10;


void draw() {

  winkel = winkel + drehgeschwindigkeit;
  float d = dist( pmouseX,pmouseY, mouseX, mouseY);
  
  float dicke = 30-d;
  if (dicke < 0) dicke = 0;
  
  
  if (mousePressed){
    
  //verschiebt das koordinaten system somit ist mous immer nullpunkt
  // translate / rotate / scale //REIHNFOLGE EINHALTEN
  translate(mouseX, mouseY);
  rotate(radians(winkel));
  //strokeWeight(dicke);
  //line(0, 0, 0, d*10+20);
  //ellipse(0, d*10+20, 10, 10);
  shape(s, 0, 0);
}


}

void keyPressed() {
println ("Aufnahme beginnt Taste gedrückt: " + key);
if (key == 'p') beginRecord(PDF, "Lines.pdf");

println ("Aufnahme bgeendet Taste gedrückt: " + key);
if (key == 'e') endRecord();
}

