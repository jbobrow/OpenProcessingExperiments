
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/28834*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
import controlP5.*;
import processing.pdf.*;

ControlP5 controlP5;


public int quadrat1 = 100;
public int quadrat2 = 100;
public int quadrat3 = 100;
public int Transparenz = 100;
PShape logo;

void setup() {

  logo = loadShape("logo.svg");
  size(800,800);
  smooth();
  
  controlP5 = new ControlP5(this);
  controlP5.addSlider("quadrat1", 100,150,10,10, 400,20);
  controlP5.addSlider("quadrat2", 100,150,10,40, 400,20);
  controlP5.addSlider("quadrat3", 100,150,10,70, 400,20);
  controlP5.addSlider("Transparenz", 0,500,10,100, 400,20);


}

void draw() {

  background(0);
  noFill();


  
  stroke(255,255,255, Transparenz);
  rect(240,235, quadrat1, quadrat1);

  
  
  stroke(#2eff90, Transparenz);
  rect(260, 255, quadrat2, quadrat2);
  
  
  stroke(255,237,0, Transparenz);
  rect(235, 260, quadrat3, quadrat3);
  
  shape(logo, 200, 400, 250, 250);
  
}

void mousePressed() {
  
  strokeWeight(random(1,30));
  
}


void keyPressed() {
  if (key == 's') { saveFrame("Screenshot-####.tif");}
  
  if (key == 'p') {
    beginRecord(PDF, "zeichnung-####.pdf");
  background(#ffffff);
  }
  
  if (key == 'e') {endRecord(); }
}



