
import ddf.minim.*;

color strokeColor = color(0, 10);
PImage fractal;
Minim minim;
AudioSample apple;
AudioSample apple1;

void setup() {
  size(1000, 666);
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  //background(360);
  fractal = loadImage("pomme.png");
  background(fractal);
  minim = new Minim(this);
  apple = minim.loadSample("ila.mp3");
  apple1 = minim.loadSample("jmlp.mp3");
 
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
  if ( key == 'a' ) apple.trigger();
  strokeColor = color(#34C924);
  switch(key){
  case 'p':
  apple1.trigger();
  strokeColor = color(#FFD700);
  } 
}

