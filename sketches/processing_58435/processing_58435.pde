
import controlP5.*;
ControlP5 controlP5;

float[] x;
float [] y;
float [] vitY;
float [] taille;

int nbrEle = 1500;

void setup() {
  size (600, 600);
  background (0);
  noStroke();
  controlP5 = new ControlP5(this);
  Button myButton = controlP5.addButton( "Click space to defragment", 0, 0, 20, 600, 20); // Indication : fonctionnement non active

  x = new float[nbrEle]; 
  y = new float[nbrEle]; 
  vitY = new float[nbrEle]; 
  taille = new float[nbrEle]; 

  for (int i = 0; i < nbrEle; i++) {
    x[i] = random (0, width);
    y[i] = random (0, height);
    taille[i] = random (1);
  }
}

void draw () {
  fill ( 0);
  rect (0, 0, 600, 25);
  for (int i = 0; i < nbrEle; i++) {  
    vitY[i] = random (0.1, 0.5);
    y[i] += vitY[i];
    if (y[i] > width)y[i]=-20; 

    fill ( 0, 0, 255);
    rect (4*y[i], x[i], taille[i], taille[i]*4);
    fill ( 255, 67, 89);
    rect (y[i], x[i], taille[i], taille[i]*2);
    fill ( 255, 255, 255);
    rect(2*y[i], x[i], taille[i], taille[i]*4);

    if (key == ' ') { 
      fill ( 3, 250, 70);
      rect (y[i], x[i], taille[i], taille[i]*2);
      rect (4*y[i], x[i], taille[i], taille[i]*4);
    }
  }
}


