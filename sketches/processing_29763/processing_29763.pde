
import controlP5.*;
 
ControlP5 controlP5;
 
float v1;
float v2;
float farbe;
float v3;
float v4;

 
void setup() {
  size(700, 700);
  smooth();

        fill(205,0,0,127);

  controlP5 = new ControlP5(this);
   
  controlP5.addSlider("v1", 10, 390, 80, 10, 10, 200, 10);
  controlP5.addSlider("v2", 50, 350, 80, 10, 25, 200, 10);
  controlP5.addSlider("v3", 100, 200, 80, 10, 40, 200, 10);
  controlP5.addSlider("v4", 200, 250, 80, 10, 55, 200, 10);
  

    
}
 
void draw() {
    background(20,30,10,30);
        fill(205,100,0,27);
  beginShape(TRIANGLE);
  
  vertex(height/3, width/2);
  vertex(v3, v1-40);

   
  vertex(height/3, width/2);
  vertex(v4, v3);
  vertex(v2+20, v1);
   
  vertex(height/3, width/2);
  vertex(v2, v4/2);
  vertex(v1/3, v3);
  endShape();
 
  stroke(1, 0, 0);
 ellipse(width/2, height/3, v3, v4);
 ellipse(v1, v2+20, width/2, height/3);
 triangle(v3, v4, width/2, height/3, v4, v3*2);
 triangle(v4, v3*2, width/2, height/3, v4, v4/2);
}

