

import controlP5.*;
import processing.pdf.*;
int punkte = 55;
int koordinaten = 2;


ControlP5 controlP5;
int counter=0;

float punkt1x = 600;
float punkt1y = 0;
float punkt2x = 000;
float punkt2y = 600;
float punkt3x = 0;
float punkt3y = 0;

void setup(){
  size(600,600);
  smooth();
  
  controlP5 = new ControlP5(this);
  controlP5.addSlider("punkt1x", 0,600, 600, 10,10, 200, 10);
  controlP5.addSlider("punkt1y", 0,600, 0, 10,25, 200, 10);
  controlP5.addSlider("punkt2x", 0,600, 0, 10,40, 200, 10);
  controlP5.addSlider("punkt2y", 0,600, 600, 10,55, 200, 10);
  controlP5.addSlider("punkt3x", 0,600, 0, 10,70, 200, 10);
  controlP5.addSlider("punkt3y", 0,600, 0, 10,85, 200, 10);
  controlP5.addSlider("punkte", 3,100, 55, 10,100, 200, 10);
  
  
}

void draw(){
  background(0);
float[][] Seite1 = new float[punkte][koordinaten];
float[][] Seite2 = new float[punkte][koordinaten];
float[][] Seite3 = new float[punkte][koordinaten];
//initiieren 

  for (int i = 0; i < punkte; i++) {
    
      Seite1[i][0] = i*(punkt2x-punkt1x)/punkte+punkt1x;
      Seite1[i][1] = i*(punkt1y-punkt2y)/punkte+punkt2y; 
  
      Seite2[i][0] = i*(punkt3x-punkt2x)/punkte+punkt2x;
      Seite2[i][1] = i*(punkt2y-punkt3y)/punkte+punkt3y;
      
      Seite3[i][0] = i*(punkt3x-punkt1x)/punkte+punkt1x;
      Seite3[i][1] = i*(punkt1y-punkt3y)/punkte+punkt1y;
  }
  //stroke(0,255,0);
  
  for(int i=0;i<punkte;i++){
    stroke(55);
    line(Seite1[i][0],Seite1[i][1],Seite2[i][0],Seite2[i][1] );

    stroke(150);
    line(Seite1[i][0],Seite1[i][1],Seite3[i][0],Seite3[i][1] );

    stroke(255);
   line(Seite2[i][0],Seite2[i][1],Seite3[i][0],Seite3[i][1] );

  }
    endRecord();

}
void keyReleased(){
  if(key == 's' || key == 'S'){
    counter++;
    beginRecord(PDF,"nichtDeinLogo"+counter+".pdf");
  }
}

