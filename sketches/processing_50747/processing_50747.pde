
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/50747*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


//PImage MintGreen;

float radius = 0;
int radiusChange=-1;

Minim minim;
AudioSample aSample;

void setup() {
  size(400, 400);
  smooth();
  minim = new Minim(this);
  aSample = minim.loadSample("drip.mp3");
  //MintGreen = loadImage("MintGreen.jpg");
}


void draw() {
  if (mouseX>0||mouseY>0) {
    aSample.trigger();
  }

  noStroke();
  int centX = mouseX;
  int centY = mouseY;
  radius+=radiusChange;
  if (radius>width/5) {
    radiusChange=-2;
  }
  if (radius<0) {
    radiusChange=+2;
  }

  float x, y;
  float noisy=random(10);
  float radVar, thisRadius, rad;

  beginShape();
  stroke(mouseX, mouseY, mouseY-mouseX);

  for (float ang=0; ang<=360; ang+=1) { 
    noisy += 0.1;
    radVar=random( 30)*customNoise(noisy);
    thisRadius = radius+radVar;
    rad = radians(ang);                                  
    x = centX + (thisRadius * cos(rad));
    y = centY + (thisRadius * sin(rad)); 
    // the code that really form part of a circle
    curveVertex(x, y);
  }
  endShape(CLOSE);
}


float customNoise(float value) {
  int count = int(value%(random (15)));
  float retValue = pow(sin(value), count);
  return retValue;
}




