
//Adam Oaks

//import processing.pdf.*;
import ddf.minim.*;

Minim minim;     
AudioPlayer mySound;


Wave myWave;

float cellSize = 25;
float push = 0;
float counter = 0;

void setup() {
  size(1200, 500);
//  beginRecord(PDF, "wave.pdf");
  background(255);
  fill(220,0,0);
  noStroke();
  smooth();
  lights();
  myWave = new Wave();



  minim = new Minim(this);    
  mySound = minim.loadFile("wave1.mp3"); 
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
      rect(push,height/2,cellSize/2,-leftLevel);
    }
  }
}


void stop()
{
  mySound.close(); 
  minim.stop();
  super.stop();
}

/*void keyPressed() {
  if((key=='s')||(key=='S')) {
endRecord();
    println("saved");
  }
}*/


