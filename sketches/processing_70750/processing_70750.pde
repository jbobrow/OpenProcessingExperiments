
/*
Surprised Googly Eyes
Alex Samuel
September 17, 2012
Object Arrays great eyes that follow your mouse around the screne. Click
and you'll see how shocked the eyes really are!
Code adapted from OOP Robot
by Lisa Furze. Source code can be found
here: http://www.openprocessing.org/sketch/57130.
*/



Googly [] eyes1;
Googly [] eyes2;
Googly [] eyes3;
Googly [] eyes4;
Googly [] eyes5;
Googly [] eyes6;
PImage omg;

void setup() {
  size(600, 600);
  smooth();
  noStroke();
  omg = loadImage("omg.png");

  int numSets = width;
  eyes1 = new Googly[numSets];
  for (int i = 0; i < numSets; i++) {
    eyes1[i] = new Googly(i * 100, 50, 0.01);
  }
  eyes2 = new Googly[numSets];
  for (int i = 0; i < numSets; i++) {
    eyes2[i] = new Googly(i * 100, 150, 0.01);
  }
  eyes3 = new Googly[numSets];
  for (int i = 0; i < numSets; i++) {
    eyes3[i] = new Googly(i * 100, 250, 0.01);
  }
  eyes4 = new Googly[numSets];
  for (int i = 0; i < numSets; i++) {
    eyes4[i] = new Googly(i * 100, 350, 0.01);
  }
  eyes5 = new Googly[numSets];
  for (int i = 0; i < numSets; i++) {
    eyes5[i] = new Googly(i * 100, 450, 0.01);
  }
  eyes6 = new Googly[numSets];
  for (int i = 0; i < numSets; i++) {
    eyes6[i] = new Googly(i * 100, 550, 0.01);
  }
}

void draw() {
  background(0);

  for (int i = 0; i < width; i++) {
    eyes1[i].shiftyEyes();
    eyes1[i].display();
    eyes2[i].shiftyEyes();
    eyes2[i].display();
    eyes3[i].shiftyEyes();
    eyes3[i].display();
    eyes4[i].shiftyEyes();
    eyes4[i].display();
    eyes5[i].shiftyEyes();
    eyes5[i].display();
    eyes6[i].shiftyEyes();
    eyes6[i].display();
  }

  if (mousePressed==true) {
    image(omg, 0, 0);
  }
}


