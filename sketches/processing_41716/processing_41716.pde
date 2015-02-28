
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioPlayer rustle;
AudioPlayer rustle2;
AudioPlayer rustle3;
AudioPlayer scream;


int totalVines = 40;
float[] xpos1 = new float[totalVines];
float[] ypos1 = new float[totalVines];
float[] theta1 = new float[totalVines];

int L = 3;
int xpos = width/2;
int ypos = height/2;

int g = 138;

int transparency = 30;
int fingerSize = 20;

int fade = 1;
int fadeg = 1;
int thetaRate = 5;
float rate = 30.0;
int blackout = 0;
float tscream = 0;


void setup() {

  size(700, 400);
  background(0);
  smooth();

  cursor(HAND);
  m = new Minim(this);
  rustle = m.loadFile("Rustle.wav");
  rustle2 = m.loadFile("Rustle.aif");
  rustle3 = m.loadFile("Rustle2.wav");
  scream = m.loadFile("Scream.wav");
  rustle.loop(0);
  rustle2.loop(0);
  rustle3.loop(0);
}

void draw() {
  
  if (dist(pmouseX, pmouseY, mouseX, mouseY) == 0) {

    }
  if (!scream.isPlaying() && !rustle.isPlaying()) {
    rustle.loop(0);
    rustle2.loop(0);
    rustle3.loop(0);
    cursor(HAND);
  }
  fill(0, 0, 0, 10);
  rect(0, 0, 700, 400);

  stroke(112, g, 99, transparency);
  strokeWeight(2);

  transparency = transparency + fade;


  if (transparency > 70) {
    fade = fade - 1;
  }
  else if (fade < 30) {
    fade = fade+1;
  }

  g = g + fadeg;

  if (g > 186) {
    fadeg = fadeg - 1;
  }
  else if (g < 138) {
    fadeg = fadeg + 1;
  }

  float xpos2[] = new float[totalVines];
  float ypos2[] = new float[totalVines];



  for (int count = 1; count < 40; count = count + 1) {

    float theta2 = random(-PI/thetaRate, PI/thetaRate);

    theta1[count] = (atan2(mouseY - ypos1[count], mouseX -
      xpos1[count])  + theta2);
    xpos2[count] = xpos1[count]+L*cos(theta1[count]) + theta2;
    ypos2[count] = ypos1[count]+L*sin(theta1[count]) + theta2;

    line(xpos1[count], ypos1[count], xpos2[count], ypos2[count]);

    xpos1[count] = xpos2[count];
    ypos1[count] = ypos2[count];

    if (xpos1[count] > 700 || xpos1[count] <0 || ypos1[count] > 400 ||
      ypos1[count] < 0) {
      xpos2[count] = random(10, 700);
      ypos2[count] = 0;
      theta1[count]=theta1[count]+random(-PI/rate, PI/rate);
    }


    if (dist(xpos1[count], ypos1[count], mouseX, mouseY) < 10) { 

      xpos1[count] = random(10, 400);
      ypos1[count] = height;
      tscream = tscream + 0.24;
      fill(0, 0, 0, tscream);
      rect(0, 0, 700, 400);
      if (tscream > 30) {
        tscream = 0;
      }

      if (!scream.isPlaying() && frameCount > 100) {

        rustle.pause();
        rustle2.loop(0);
        rustle3.loop(0);

        scream.loop(0);
        noCursor();
      }
    }
  }
}


