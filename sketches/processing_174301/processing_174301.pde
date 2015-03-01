
/*
MOUSE
position x : length
position y : thickness and number of lines to be drawn
drag : draw

KEYS
1: Red
2: Teal
3: Peach
del, backspace: erase
s : save png
*/

//PImage Variable
PImage fedsquare;

//Minim Library File
import ddf.minim.*;

// Global Variables
Minim minim;
AudioSample wooshy;
color strokeColor = color(200,420); 

// Setup()
void setup() {
  size(800, 800);
  fedsquare = loadImage("fedsquare.jpg");
  minim = new Minim(this);
  wooshy = minim.loadSample("wooshy.wav");
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  }
  
// Draw()
void draw(){
  background(fedsquare);
if(mousePressed){
  pushMatrix();
  translate(width/2, height/2);
  
  // Map (value, start1, stop1, start2, stop2)
  int circleResolution = (int)map(mouseY+100, 0, height, 2, 20);
  int radius = mouseX-width/2;
  float angle = TWO_PI/circleResolution;
  
  // Style
  strokeWeight(5);
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

// Keypressed
void keyPressed() {
  if (key == '1') wooshy.trigger();
  if (key == '2') wooshy.trigger();
  if (key == '3') wooshy.trigger();
  if (key == 's') wooshy.trigger();

}
void keyReleased(){
  if (key == DELETE || key == BACKSPACE) background(0);
  if (key == 's' || key == 'S') saveFrame("stupid.png");
  
  switch(key){
   case '1':
    strokeColor = color(0, 91, 89);
    break;
   case '2':
    strokeColor = color(171, 79, 82);
    break;
   case '3':
    strokeColor = color(42, 56, 98);
    break;   
  }
}


