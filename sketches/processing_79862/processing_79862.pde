
import processing.funnel.*;
Arduino arduino;


float i;
 
int Circle = 30;
 
float firstDiameter = 600;
float diameterDifference = 100;
 
float xOffset = 0;
float yOffset;
 
float Speed = 0.002;
 
void setup()
{
  frameRate(30);
  size(700, 700);
  textFont(createFont("Sans", 11));
  smooth();
  //noStroke();
 //------------------------------------------------------------------------------
 arduino = new Arduino(this,Arduino.FIRMATA);
 
 Scaler scaler = new Scaler(0.002, 0.49, 0,700, Scaler.LINEAR, true);
 Convolution convolution = new Convolution(Convolution.MOVING_AVERAGE);
 
 arduino.analogPin(0).addFilter(scaler);
 arduino.analogPin(0).addFilter(convolution);
 //------------------------------------------------------------------------------
}


void draw()
{
  background(255);
  stroke(0,0,0,0);
  fill(10,200,0);
  rect(345,370,10,350);
  translate(width/2, height/2);
  pushMatrix();
  rotate(i);
  for(int j = 0; j < Circle; j++)
  {
    if(j % 2 == 0) fill(239, 239, 212); else fill(242, j * 185/Circle, 84,200);
    rotate(i);
    ellipse(0, 0, firstDiameter-arduino.analogPin(0).value,diameterDifference/*firstDiameter - j * diameterDifference, firstDiameter - j * diameterDifference*/);
    translate(xOffset,yOffset);
  }
  popMatrix();
  i += Speed;
  translate(-width/2, -height/2);
  fill(84);
  text("Press Number Keys(1-4) for different Flower!", 20, 18);
}


 
 
  void keyPressed(){
  if(key == '1') {
    Circle = 30;
    diameterDifference = 100;
    xOffset = 0;
    Speed = 0.002;
  }
  if(key == '2') {
    Circle = 23;
    diameterDifference = 13;
    xOffset = 0;
    Speed = 0.002;
  }
    if(key == '3') {
    Circle = 8;
    diameterDifference = 20;
    xOffset = 0;
    Speed = 0.001;
  }
      if(key == '4') {
    Circle = 12;
    diameterDifference = 50;
    xOffset = 0;
    Speed = 0.001;
    int j=0;
    fill(20, j * 2/Circle, 0,200);
  }
}
 
 



