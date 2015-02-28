
/* REALITAT VIRTUAL - PROCESSING 
 PRÀCTICA 1: rellotge 
 */

//SEGONS
PVector segons = new PVector(0, 0);
float angSegons =  5;
float radiSegons = 150;
int sz = 30;

//MINUTS
PVector minuts = new PVector(0, 0);
float angMinuts =  5;
float radiMinuts = 100;

//HORES
PVector hores = new PVector(0, 0);
float angHores =  5;
float radiHores = 50;

void setup() {
  size (500, 500);
}

void draw() {

  background(255);

  ////////////////////////////////////////////////////////
  ///////// SEGONS  /////////////////////////////////////
  ///////////////////////////////////////////////////////

  angSegons = map(second(), 0, 59, 0, -TWO_PI);
  angSegons += PI; 

  segons.x = width/2 + radiSegons * sin(angSegons);
  segons.y = height/2 + radiSegons * cos(angSegons);

  stroke (0);
  line(250, 250, segons.x, segons.y);
  stroke(0);
  ellipse(segons.x, segons.y, sz, sz);

  ////////////////////////////////////////////////////////
  ///////// MINUTS  /////////////////////////////////////
  ///////////////////////////////////////////////////////

  angMinuts = map(minute(), 0, 59, 0, -TWO_PI);
  angMinuts += PI; 

  minuts.x = width/2 + radiMinuts * sin(angMinuts);
  minuts.y = height/2 + radiMinuts * cos(angMinuts);

  line(250, 250, minuts.x, minuts.y);
  stroke(0);
  ellipse(minuts.x, minuts.y, sz, sz);

  ////////////////////////////////////////////////////////
  ///////// HORES  //////////////////////////////////////
  ///////////////////////////////////////////////////////


  angHores = map(hour(), 0, 59, 0, -TWO_PI);
  angHores += PI; 

  hores.x = width/2 + radiHores * sin(angHores);
  hores.y = height/2 + radiHores * cos(angHores);

  stroke(255, 0, 0);
  line(250, 250, hores.x, hores.y);
  stroke(255, 0, 0);
  ellipse(hores.x, hores.y, sz, sz);
}

