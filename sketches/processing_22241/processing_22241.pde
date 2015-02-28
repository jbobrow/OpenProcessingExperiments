
//Adam Oaks

import ddf.minim.*;
import peasy.*;

PeasyCam cam;
Minim minim;     
AudioPlayer mySound;


Wave myWave;

float cellSize = 25;
float push = 0;
float counter = 0;

void setup() {
  size(800, 300,P3D);
  background(255);
  fill(220,0,0,100);
  noStroke();
  smooth();
  lights();
  myWave = new Wave();

  cam = new PeasyCam(this,600, 0, 0, 600);

  minim = new Minim(this);    
  mySound = minim.loadFile("wave1.mp3",1000); 
  mySound.play();
}

void draw() {

  myWave.update();
  myWave.display();
}

class Wave {

  Wave() {
  } 

  void update() {

    push++;
    counter++;
    if(counter >= cellSize) {
      counter = 0;
    }
  }


  void display() {

    if(counter == 0) {

      float leftLevel = mySound.left.level() * 3000;
      translate(push,0,0);
      box(cellSize/2,leftLevel,cellSize*2);
    }
  }
}

void stop()
{
  mySound.close(); 
  minim.stop();
  super.stop();
}


