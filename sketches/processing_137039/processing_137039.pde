

color strokeColor = color(0, 10);
import ddf.minim.*;
Minim minim;
AudioSample bells;

void setup() {
  size(720, 720);
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  background(360);
 
  minim = new Minim(this);
  bells = minim.loadSample("Bell.wav");
}

void keyPressed() {
  if ( key == '1' ) bells.trigger();
  if ( key == '2' ) bells.trigger();
  if ( key == '3' ) bells.trigger();
}

//draw()
void draw() {
if(mousePressed){
  pushMatrix();
  translate(width/2, height/2);
  //map(value, start1, stop1, start2, stop2);
  int circleResolution = (int)map(mouseY+100, 0, height, 2, 10);
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

//keyPressed()

void keyReleased(){
  if (key == DELETE || key == BACKSPACE) background(360);
  if (key == 's' || key == 'S') saveFrame("disegno.jpg");
  
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

