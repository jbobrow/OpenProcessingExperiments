
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/29142*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
 
import controlP5.*;
import processing.pdf.*;


ControlP5 controlP5; 

public float punkt1=233; 
public float punkt2=30;
public float r = 150;
public float g = 150;
public float b = 150;
public float boden=550;

int counter;

void setup(){
  size(800,550);
  smooth();
  
  controlP5 = new ControlP5(this);
  controlP5.addSlider("boden", 0,400, 400, 10,50, 430, 10);
  controlP5.addSlider("r", 0, 255, 150, 10,70, 330, 10);
  controlP5.addSlider("g", 0, 255, 150, 10,90, 230, 10);
  controlP5.addSlider("b", 0, 255, 150, 10,110, 100, 10);
}

void draw(){
  background(255);
beginShape();
fill(r,g,b, 95);
vertex(59, boden); // first point
bezierVertex(77, 171, 143, 193, 165, punkt1);
bezierVertex(183, punkt2, 236, 187, 290, punkt1);
bezierVertex(347, punkt2, 369, 228, 412, boden);

endShape();
  

beginShape();
fill(r,b,g, 80);
vertex(0, boden); // first point
bezierVertex(100, 0, 193, 193, 215, punkt1);
bezierVertex(250, punkt2, 250, 187, 340, punkt1);
bezierVertex(320, punkt2, 429, 228, 462, boden);
endShape();  
  
  
  endRecord(); //pdf schreiben endet hier
}


void keyPressed(){
  if(key == 's' || key == 'S'){
    counter++;
    beginRecord(PDF,"logo"+counter+".pdf"); //pdf schreiben
  }
}

