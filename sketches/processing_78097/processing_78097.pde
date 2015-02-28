
//fer diaz 

//toxi lib
import toxi.color.*;
import toxi.math.*;
PImage img, workImg;

Histogram hist;
TColor col;
TColor closest;

//cotroller acordion
import controlP5.*;
ControlP5 cp5;
Accordion accordion;
//=========================================

void setup() {
  size(1000, 500);
  smooth();
  background(255);
  noStroke();
  img=loadImage("test.jpg");
  sideImg();

frameRate(20);
  gui();
  //radio(1);
}
//==========================================

float s1=.2;

void draw() {
  fill(255);
  rect(0, 0, width/2, height);
  //background(255);
//fill(0);
  //ellipse(250, 250, 200, 200);
  workImg.updatePixels();

  // display original and posterized images
  float tol = cp5.getController("tolerance").getValue();
  if (tol != s1) {
    s1 = tol;
    sideImg();
    image(workImg, workImg.width, 0);
  }
  if (pieCHART == true) {
    pieChart();
  }
  if (histograma == true) {
    hist();
  }
   if (rotacion == true) {
   pieChartRotate();
  }
 

 if (circulos == true) {

   circles();
  }


  if (original == true) {
    image(img, width/2, 0);
  } 
  else {
    image(workImg, workImg.width, 0);
  }

}
//=====================================================


// float s1 = cp5.getController("tolerance").getValue();  
// float s2 = cp5.getController("world").getValue();



