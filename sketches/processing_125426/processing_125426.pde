
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//Sets up number of places in array or array size
int num = 60;
int[] x = new int[num];
int[] y = new int[num];

int r = 0;
PImage star;

Minim minim;
AudioSample Banging1;
AudioSample Banging2;
AudioSample Banging3;
AudioSample Banging4;
AudioSample Banging5;


void setup() {
  size(800, 600);
  smooth();
  noStroke();
  minim = new Minim(this);
  Banging1 = minim.loadSample("Banging1.wav");
  Banging2 = minim.loadSample("Banging2.wav");
  Banging3 = minim.loadSample("Banging3.wav");
  Banging4 = minim.loadSample("Banging4.wav");
  Banging5 = minim.loadSample("Banging5.wav");
  star = loadImage("star.jpg");
}
  

void draw() {
  background(0);
 
  if (mousePressed == true) {
    image(star, 0, 0, 800, 600);
    x[0] = width/2 + int(random(-width/2, width/2));
    y[0] = height/2 + int(random(-height/2,height/2));
  }
 else {
    x[0] = mouseX + int(random(-r,r));
    y[0] = mouseY + int(random(-r,r));
  }

  // Replaces each spot in the array with the "mouse position" before it
  // In essence fills the array with history of "mouse position"
  for(int i = x.length-1; i>0; i--) {
    x[i] = x[i-1];
    y[i] = y[i-1];
  }
  
  // Defines an ellipse of differnet size and color for each spot in the array 
  for (int i = 0; i < x.length; i++){
    fill(240 -(i * 4));
    ellipse(x[i], y[i], 29-i, 29-i);
  }
}

void keyReleased(){

  switch(key){
  case '1':
    r = 0;
    Banging1.trigger();
    break;
  case '2':
    r = 15;
    Banging2.trigger();
    break;
  case '3':
    r = 30;
    Banging3.trigger();
    break;
  case '4':
    r = 60;
    Banging4.trigger();
    break;
  case '5':
    r = 120;
    Banging5.trigger();
    break;
  }
}


