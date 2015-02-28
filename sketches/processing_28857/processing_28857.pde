
import controlP5.*;
import processing.pdf.*;
 int punkte = 55;
int koordinaten = 2;

 
ControlP5 controlP5;
 
float punkt1=400; //damit der begriff "punkt1" bekannt ist
                  //und bei den reglern der wert 400 auch wirklich als startwert angenommen wird

float punkt3=100;
float punkt4=100;

float punkt1x = 600;
float punkt1y = 432;
float punkt2x = 600;
float punkt2y = 543;
float punkt3x = 0;
float punkt3y = 243;

 
float r = 0;
float g = 255;
float b = 255;
int counter;
 
void setup(){
  size(1200,800);
  smooth();
   
  controlP5 = new ControlP5(this);
  controlP5.addSlider("punkt1", 0,800, 400, 10,10, 200, 10);
 // controlP5.addSlider("punkt2", 0,800, 400, 10,30, 200, 10);
 // controlP5.addSlider("punkt3", 0,800, 400, 10,50, 200, 10);
//  controlP5.addSlider("punkt4", 0,800, 400, 10,70, 200, 10);
  controlP5 = new ControlP5(this);
  controlP5.addSlider("punkt1x", 0,600, 600, 10,10, 200, 10);
  controlP5.addSlider("punkt1y", 0,600, 0, 10,25, 200, 10);
  controlP5.addSlider("punkt2x", 0,600, 0, 10,40, 200, 10);
  controlP5.addSlider("punkt2y", 0,600, 600, 10,55, 200, 10);
  controlP5.addSlider("punkt3x", 0,600, 0, 10,70, 200, 10);
  controlP5.addSlider("punkt3y", 0,600, 0, 10,85, 200, 10);
  controlP5.addSlider("punkte", 3,100, 55, 10,100,200, 10);

}
 
void draw(){
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

  background(255);
  //text("press s to save and f to change color",10, height-20);
 
 // fill(r, g, b);
  beginShape();
 
 // ellipse( 280, 275, punkt3, punkt1);
//  ellipse( 160, 400, punkt4, punkt2);
//  bezierVertex(270, 300, 100, 325, punkt2, punkt3);
 // bezierVertex(270, 300, 100, 325, punkt1, punkt2);
  endShape();
   
   
//  fill(b, g, r,90);
   beginShape();
 vertex(400, 400);

 // bezierVertex(100, 200, 260, 100, punkt4, punkt2);
 // bezierVertex(370, 100, 300, 225, punkt3, punkt4);
   for(int i=0;i<punkte;i++){

 stroke(0);
 strokeWeight(0.5);
    ellipse(Seite1[i][0],Seite1[i][1],Seite3[i][0],Seite3[i][1] );
    fill(0,255,0,10);
 
   }
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


