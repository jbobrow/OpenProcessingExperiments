
/************************************
* Create a generative logo
* Drawing shapes based on parameters
*************************************/


import controlP5.*;
import processing.pdf.*;


ControlP5 controlP5; 

float punkt1=400; //damit der begriff "punkt1" bekannt ist 
                  //und bei den reglern der wert 400 auch wirklich als startwert angenommen wird
float punkt2=400;
float punkt3=400;
float punkt4=400;

float r = 0;
float g = 255;
float b = 255;
int counter;

void setup(){
  size(800,800);
  smooth();
  
  controlP5 = new ControlP5(this);
  controlP5.addSlider("punkt1", 0,800, 400, 10,10, 200, 10);
  controlP5.addSlider("punkt2", 0,800, 400, 10,30, 200, 10);
  controlP5.addSlider("punkt3", 0,800, 400, 10,50, 200, 10);
  controlP5.addSlider("punkt4", 0,800, 400, 10,70, 200, 10);
}

void draw(){
  background(0);
  //text("press s to save and f to change color",10, height-20);
  fill(r, g, b);
  beginShape();
  vertex(400, 400);
  bezierVertex(180, 400, 280, 275, punkt3, punkt1);
  bezierVertex(200, 200, 160, 400, punkt4, punkt2);
  bezierVertex(270, 300, 100, 325, punkt2, punkt3);
  bezierVertex(270, 300, 100, 325, punkt1, punkt2);
  endShape();
  
  
  fill(b, g, r,90);
   beginShape();
  vertex(400, 400);
  bezierVertex(180, 400, 280, 275, punkt2, punkt1);
  bezierVertex(100, 200, 260, 100, punkt4, punkt2);
  bezierVertex(370, 100, 300, 225, punkt3, punkt4);
  bezierVertex(370, 100, 300, 225, punkt1, punkt3);
  endShape();
  endRecord();

}


void keyPressed(){
  if(key == 's' || key == 'S'){
    counter++;
    beginRecord(PDF,"logo"+counter+".pdf");
  }
  if(key == 'f' || key == 'F'){
    r = random(255);
    g = random(255);
    b = random(255);
  }
}

