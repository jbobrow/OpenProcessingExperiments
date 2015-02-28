
/**
 * drawing with a changing shape by draging the mouse.
 Autor Vanya Vasileva
 *    
 * MOUSE
 * position x          : length
 * position y          : thickness and number of lines
 * drag                : draw
 * 
 * KEYS
 * 1-3                 : stroke color
 * del, backspace      : erase and random background
 * s                   : save png
 * b                   : start sound
 */
 
import ddf.minim.*;

Minim minim;
AudioSample bells;

PImage fractal;
color strokeColor = color(0, 10);

void setup() {
  size(900, 600);
  colorMode(HSB, 360, 100, 100, 100);
  background(random(width), random(height), random(100));
  noFill();
  fractal = loadImage("india.png");
  minim = new Minim(this);
  bells = minim.loadSample("bell8.wav");
}

void draw() {
  image(fractal, 0, 0, 900, 600);
  if(mousePressed){
    pushMatrix();
    translate(width/2,height/2);

    int circleResolution = (int)map(mouseY+100,0,height,2, 10);
    int radius = mouseX-width/2;
    float angle = TWO_PI/circleResolution;

    strokeWeight(2);
    stroke(strokeColor);

    beginShape();
    for (int i=0; i<=circleResolution; i++){
      float x = 0 + cos(angle*i) * radius;
      float y = 0 + sin(angle*i) * radius;
      vertex(x, y);
    }
    endShape();
    
    popMatrix();
  }
}

void keyPressed() {
  if ( key == 'b' ) bells.trigger();
}

void keyReleased(){
  if (key == DELETE || key == BACKSPACE) background(random(width), random(height), random(100));
  if (key=='s' || key=='S') saveFrame("screenshot.png");

  switch(key){
  case '1':
    strokeColor = color(0, 10);
    break;
  case '2':
    strokeColor = color(192, 100, 64, 10);
    break;
  case '3':
    strokeColor = color(52, 100, 71, 10);
    break;
  }
}

