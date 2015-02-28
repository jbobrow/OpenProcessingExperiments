
//import controlP5.*;
//
//ControlP5 cp5;


float counter = 270;
int frequency = 7;
int amp = 20;

float xPos;
float yPos;

Dot d1;
Dot d2;
Dot d3;
Dot d4;
Dot d5;
Dot d6;
Dot d7;
Dot d8;
Dot d9;

int myPos;
float angle;

void setup(){

  frameRate(30);
  background(200);
  size(500,500);
  smooth();
//  
//  cp5 = new ControlP5(this);
//  cp5.addSlider("frequency",1,16,7,50,50,100,10);
//  cp5.addSlider("amp",1,30,20,50,100,100,10);
  
  
    fill(0);

  
  d1 = new Dot();
  d2 = new Dot();
  d3 = new Dot();
  d4 = new Dot();
  d5 = new Dot();
  d6 = new Dot();
  d7 = new Dot();
  d8 = new Dot();
  d9 = new Dot();
}

void draw(){
  noStroke();
  fill(200,4);
  rect(0,0,500,500);
  
  pushMatrix();
  translate(250,250);
  
   noFill();
  stroke(240);
  strokeWeight(10);
  ellipse(0,0,400,400);
  
  d1.display(0);
  d2.display(6);
  d3.display(12);
  d4.display(120);
  d5.display(126);
  d6.display(132);
  d7.display(240);
  d8.display(246);
  d9.display(252);
  
 
  
  popMatrix();
}

class Dot {

  Dot(){

  }
    
    void display(int startPos) {
      myPos = startPos;
      angle = counter+myPos;
      float radius = 200;
      radius += amp*(sin(radians(counter*frequency)));
      float savedX = xPos;
      float savedY = yPos;
      xPos = radius * cos(radians(angle));
      yPos = radius * sin(radians(angle));
      fill(50,70,0);
      stroke(255);
      strokeWeight(2);
      ellipse(xPos,yPos, 20,20);
      counter += .1;
    }
  }
