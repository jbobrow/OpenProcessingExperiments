
import controlP5.*;

ControlP5 cp5;
int myColor = color(0,50,0);

int sliderValue = 100;
int sliderTicks1 = 100;
int sliderTicks2 = 30;
Slider abc;

float a=1;
int CircleSize = 0;
int ShapeSides= 0;
String boundary = "circle";


void setup(){
  //Setting up background size
  size(500,500); 
  //Setting up a white background
  background(255); 
 
 
 //sliders 
 cp5 = new ControlP5(this);
 
//Slider for size of circle, smooth sliding
  cp5.addSlider("CircleSize")
  .setSize(150,25)
  .setPosition(50,50)
  .setRange(0,300);

//Slider of type of Shape, two divisions
  cp5.addSlider("ShapeSides")
     .setSize(150,25)
     .setPosition(50,100)
     .setRange(1,2)
     .setNumberOfTickMarks(2)
     ;

}


void draw(){
//two shape options
switch ( ShapeSides ){
//defining the variable size circle
    case 1:
    boundary = "circle";
     //circle with expanding size center circles copied diagonally
background(150);
ellipse(250,250,CircleSize,CircleSize);
      break;
//defining the variable size square
    case 2:
    boundary = "box";
    background(150);
//drawing a square with center origin and variable size  
    rectMode(RADIUS);  // Set rectMode to RADIUS
    rectMode(CENTER);  // Set rectMode to CENTER
    rect(250, 250, CircleSize, CircleSize);  // Draw gray rect using CENTER mode
    break;

 }


}


