
import processing.pdf.*;

void setup() {
  size(400,400);
  smooth();
  colorMode(HSB, 100);
    //HSB=Farbe, Sättigung, Helligkeit. alle werte gehen bist max. 100
}

void draw() {
  if(mousePressed==true){
  float durchmesser=dist(pmouseX,pmouseY,mouseX,mouseY);
  //dist errechnet einen abstand zwischen zwei punkten
  fill(random(80,100),100,50,durchmesser);

  stroke(random(80,100),100,50);
  ellipse(mouseX,mouseY,durchmesser,durchmesser);
  //random(width) und (height) heißt zufälliger wert im bereich der breite/höhe der fläche
  //float ist eine fliesskommazahl
  float dicke=10-durchmesser;
  if(dicke<1){
  dicke=1;
  }
  strokeWeight(dicke);
}
//println gibt unten im schwarzen was aus.
}
void keyPressed() {
  if(key=='s'){
    saveFrame("screenshot-####.tif");
    //achtung: "" bei strings '' bei tasten
  }
  if(key=='p'){
    beginRecord(PDF,"zeichnung####.pdf");
    colorMode(HSB,100);
    background(0,0,100);
  }
  if(key=='e'){
    endRecord();
  }
}

