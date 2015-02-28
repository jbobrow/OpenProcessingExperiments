
//new tab
PImage flower1;
// array -  first give it a name then a legnth
ArrayList Flower;

import processing.serial.*;
import cc.arduino.*;
int flexPin1 = 9;
int flexPin2 = 13;

//
 int flexReading = 13;//map(arduino.analogRead(flexPin), 370, 450, 9, 13);
  int flexSensorReading = 9; //arduino.analogRead(flexSensorPin); 

Arduino arduino;

int sensorValue;

void setup() {

  size(1350, 563);

  arduino = new Arduino(this, Arduino.list()[0], 57600);
  noFill();
  noStroke();
  for (int i = 9; i <= 13; i++){
    arduino.pinMode(i, Arduino.INPUT);
 }
 
 //initialize first step
 Flower = new ArrayList();
 Flower.add(new Flower(width/2, height/2));
 flower1 = loadImage("flower1.png");    
}


void draw() {

  //background(255);
  
    if (arduino.digitalRead(flexPin1) == Arduino.HIGH){
      Flower.add(new Flower(mouseX, mouseY));
      //fill(255);
      stroke(0);
}
    else {
      fill(0);
      noStroke();
    }
    
 // 
PImage myImage = loadImage("d12.png");
imageMode(CENTER);
image(myImage, width/2, height/2);
color getColor = myImage.get(mouseX, mouseY);
//noStroke();
//
   
   //I'm going to have a array of strawberry
 for(int i = 0; i < Flower.size(); i ++){
   Flower myFlower = (Flower) Flower.get(i);
   //this where you put it
   //draw the array
   myFlower.move();
   myFlower.display();
  
 }
    println(arduino.digitalRead(flexPin1));

    rectMode(CENTER);
    rect(width/2, height/2, 20, 20);

}

void loop(){
 //Ensure to turn off ALL LEDs before continuing 
 for (int i=9; i<14; i++){ //changed i=4 to i=9
   arduino.digitalWrite(i, arduino.LOW); 
    
    
     
     //Serial.println(arduino.flexSensorReading);
  }
}

