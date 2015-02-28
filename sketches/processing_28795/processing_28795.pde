
import controlP5.*;
import processing.pdf.*;
 
ControlP5 controlP5;
 
float variable;
float variable2;
float farbe;
float variable3;
float variable4;
float variable5;
float variable6;

float r = 0;
float g = 255;
float b = 50;
int counter;
 
void setup() {
  size(1000, 1000);
    stroke(255);
  smooth();

 
  controlP5 = new ControlP5(this);
   
  controlP5.addSlider("variable", 10, 390, 80, 10,10, 200, 10);
  controlP5.addSlider("variable2", 50, 350, 80, 10,25, 200, 10);
  controlP5.addSlider("variable3", 100, 200, 150, 10,40, 200, 10);
  controlP5.addSlider("variable4", 200, 350, 80, 10,55, 200, 10);
  controlP5.addSlider("variable5", 150, 390, 80, 10,70, 200, 10);
  controlP5.addSlider("variable6", 30, 350, 80, 10,85, 200, 10);
    
}
 
void draw() {
  background(255);
  fill(r, g, b);

  

  
  beginShape(TRIANGLE_FAN);
vertex(variable5, variable6);
vertex(variable/3, variable4);
vertex(variable3/2, variable4/2);
vertex(height/2, width/2);
vertex(variable2, variable4);
vertex(variable/2, variable4/4);
vertex(height/4, width/2);
endShape();
 
  stroke(0, 0, 0);

 triangle(variable, variable2+20, width/2, height/2, variable2, variable-50);
 triangle(variable3, variable4/2, width/2, height/2, variable4, variable3*2);
 triangle(variable5, variable6*2, width/2, height/2, variable6, variable5/2);
}

 
 
void keyPressed(){
  if(key == 's' || key == 'S'){
    counter++;
    beginRecord(PDF,"logo"+counter+".pdf");
  }
  if(key == 'f' || key == 'F'){
    r = random(255);
    g = random(255);
    b = random(255);
  }
}

