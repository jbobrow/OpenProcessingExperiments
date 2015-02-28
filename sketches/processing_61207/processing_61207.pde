
import controlP5.*;
import processing.pdf.*;
 
 
ControlP5 controlP5;
 
public float punkt1=263; //damit der begriff "punkt1" bekannt ist
                  //und bei den reglern der wert 400 auch wirklich als startwert angenommen wird
public float punkt2=330;
public float r = 150;
public float g = 150;
public float b = 150;
public float boden=320;
 
int counter;
 
void setup(){
  size(550,600);
  smooth();
  noStroke();
   
  controlP5 = new ControlP5(this);
  controlP5.addSlider("punkt1", 0,600, 400, 10,10, 200, 10);
  controlP5.addSlider("punkt2", 0,600, 400, 10,30, 200, 10);
  controlP5.addSlider("boden", 0,600, 400, 10,50, 200, 10);
  controlP5.addSlider("r", 0, 255, 150, 10,70, 200, 10);
  controlP5.addSlider("g", 0, 255, 150, 10,90, 200, 10);
  controlP5.addSlider("b", 0, 255, 150, 10,110, 200, 10);
}
 
void draw(){
  background(000);
beginShape();
fill(r,g,b, 95);
vertex(40, boden); // first point
bezierVertex(77, 171, 143, 193, 165, punkt1);
bezierVertex(183, punkt2, 236, 187, 290, punkt1);
bezierVertex(347, punkt2, 369, 228, 412, boden);
 
endShape();
   
 
beginShape();
fill(r,b,g, 95);
vertex(70, boden); // first point
bezierVertex(25, 150, 193, 193, 215, punkt1);
bezierVertex(233, punkt2, 300, 200, 340, punkt1);
bezierVertex(270, punkt2, 300, 200, 400, boden);
endShape(); 
   
   
  endRecord(); //pdf schreiben endet hier, wichtig: NACH dem was gezeichnet wurde
 
}
 
 
void keyPressed(){
  if(key == 's' || key == 'S'){
    counter++;
    beginRecord(PDF,"logo"+counter+".pdf"); //pdf schreiben
  }
}


