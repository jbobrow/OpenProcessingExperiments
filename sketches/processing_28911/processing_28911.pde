
import controlP5.*;
import processing.pdf.*;
 
ControlP5 controlP5;
 
public float strichstaerke;
public float farbe1;
public float farbe2;
public float farbe3;


void setup() {
  size(400,400);
  
  controlP5 = new ControlP5(this);
  controlP5.addSlider("strichstaerke",1,8.2,20,20,20,100,20);
  controlP5.addSlider("farbe1",1,255,20,20,40,100,20);
  controlP5.addSlider("farbe2",1,255,20,20,60,100,20);
  controlP5.addSlider("farbe3",1,255,20,20,80,100,20);
 
}
  
int g;


  
void draw() {
  background(255);
  stroke(0);
  fill(farbe1,farbe2,farbe3);
  g++;
    
  if (g > 11) {
    g = 0;
  }
    
 // translate( 0, -30 );
  
  for ( int k = 0; k < height/12 + 4; k++ ) {
  
    strokeJoin(MITER);
    strokeWeight(strichstaerke);
    beginShape();
  
      for ( int i = 0; i < width/20; i++ ) {
        vertex( 0 + i*40, 0 + k*15 );
        vertex( 20 + i*40, 20 + k*15 );
        vertex( 40 + i*40, 0 + k*15 );
      }
    endShape();  
  }
}


