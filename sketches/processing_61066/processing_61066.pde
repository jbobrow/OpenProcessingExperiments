
import controlP5.*;
import processing.pdf.*;
int punkte= 30;
int coordinate = 2;


ControlP5 controlP5;
int counter=0;

float punkt1x = 330;
float punkt1y = 180;
float punkt2x = 400;
float punkt2y = 400;
float punkt3x = 0;
float punkt3y = 0;
float r = 255;
float g = 255;
float b = 255;

void setup() {
  size(600, 400);
  smooth();

  controlP5 = new ControlP5(this);
  controlP5.addSlider("punkt1x", 0, 600, 330, 10, 10, 100, 10);
  controlP5.addSlider("punkt1y", 0, 400, 180, 10, 25, 100, 10);
  controlP5.addSlider("punkt2x", 0, 400, 400, 10, 40, 100, 10);
  controlP5.addSlider("punkt2y", 0, 400, 400, 10, 55, 100, 10);
  controlP5.addSlider("punkt3x", 0, 400, 0, 10, 70, 100, 10);
  controlP5.addSlider("punkt3y", 0, 400, 0, 10, 85, 100, 10);
  controlP5.addSlider("punkte", 0, 100, 30, 10, 100, 100, 10);
  controlP5.addSlider("r", 0, 255, 255, 10, 130, 100, 10);
  controlP5.addSlider("g", 0, 255, 255, 10, 145, 100, 10);
  controlP5.addSlider("b", 0, 255, 255, 10, 160, 100, 10);
}

void draw() {
  background(r, g, b);
  float[][] Seite1 = new float[punkte][coordinate];
  float[][] Seite2 = new float[punkte][coordinate];
  float[][] Seite3 = new float[punkte][coordinate];

  for (int i = 0; i < punkte; i++) {

    Seite1[i][0] = i*(punkt2x-punkt1x)/punkte+punkt1x;
    Seite1[i][1] = i*(punkt1y-punkt2y)/punkte+punkt2y; 

    Seite2[i][0] = i*(punkt3x-punkt2x)/punkte+punkt2x;
    Seite2[i][1] = i*(punkt2y-punkt3y)/punkte+punkt3y;

    Seite3[i][0] = i*(punkt3x-punkt1x)/punkte+punkt1x;
    Seite3[i][1] = i*(punkt1y-punkt3y)/punkte+punkt1y;
  }

  for (int i=0;i<punkte;i++) {
    stroke(55);
    line(Seite1[i][0], Seite1[i][1], Seite2[i][0], Seite2[i][1] );

    stroke(150);
    line(Seite1[i][0], Seite1[i][1], Seite3[i][0], Seite3[i][1] );

    stroke(255);
    line(Seite2[i][0], Seite2[i][1], Seite3[i][0], Seite3[i][1] );
  }
  endRecord();
}

void keyPressed() {

  if (key== 's' || key == 'S') {
    println("Frame abspeichern");
    saveFrame("logo_####.tif");
  }

  if (key == 'b' || key == 'B') {
    beginRecord(PDF, "thislogoisawesome.pdf");
  }

  if (key == 'e' || key == 'E') {
    endRecord();
  }
}


