
import processing.pdf.*;

void setup() {
  size(1024, 768);
background(182,214,228);  
PShape h;
h = loadShape("wolke.svg");
shapeMode(CENTER);
smooth();
shape(h, 400, 300, 700, 550);

}


float winkel = 0;
float drehgeschwindigkeit = 200;
  
void draw() {
  float d = dist(pmouseX, pmouseY, mouseX, mouseY);


  PShape s;
s = loadShape("flugzeug.svg");
shapeMode(CENTER);
smooth();



      if (mousePressed) {    
    winkel = winkel+drehgeschwindigkeit;

     //ABFOLGE: translate, rotate, scale
    translate(mouseX, mouseY); //Koordinatensystem auf Maus-Mitte
    rotate(radians(winkel));
    scale(1); //Koordinatensystem skalieren - Doppelt so groß -2 - wenn v. Geschw. abhängig
  s.disableStyle();
  fill(random(255), random(255), random(255));
  shape(s, pmouseX, pmouseY, 150, 150);
      }
}
void keyPressed(){
  
  if(key == 'p'){
    beginRecord(PDF, "flieger.pdf");
    colorMode(HSB, 100);
  }
  if(key == 'e')
  {
    endRecord();
  }
}


