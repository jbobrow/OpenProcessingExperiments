
import ddf.minim.*;

color strokeColor = color(0, 10);
PImage fractal;
Minim minim;
AudioSample bells;

void setup() {
  size(1000, 666);
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  //background(360);
  fractal = loadImage("pomme.png");
  background(fractal);
  minim = new Minim(this);
  bells = minim.loadSample("bell05.mp3");
 
}
//draw
void draw()  {
  //background(0);
if(mousePressed){
  pushMatrix();
  translate(width/2, height/2);
  //map 
  int circleResolution =(int)map(mouseY+100, 0, height, 2, 10);
  int radius = mouseX-width/2;
  float angle = TWO_PI/circleResolution;
  
  //style
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
  if ( key == 'b' ) println("I love Apple");
  switch(key){
    case 'a':
    strokeColor = color(#0A0000);
    break; 
       case '2':
    strokeColor = color(#FA0317);
    break; 
       case '3':
    strokeColor = color(#1300FA);
    break; 
     case '4':
    strokeColor = color(#00FA01);
    break; 
     case '5':
    strokeColor = color(#FAD500);
    break; 
       case '6':
    strokeColor = color(#FAF8F0);
    break; 
}
}

