
import processing.serial.*;
Serial myPort;
PImage imgCloseFly;
PImage imgOpenFly;
int sensorValue;

void setup(){
  size(600, 600);
  println(Serial.list());
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  imgCloseFly = loadImage("closefly.png");
  imgOpenFly = loadImage("openfly.png");
  
}



void draw(){
  background(0);
  //image(imgOpenFly, width/2, height/2);
  //image(imgCloseFly, width/2, height/2+50);

  
}

void serialEvent(Serial myPort){
  int inByte = myPort.read();
  sensorValue = inByte;
  
 // println(inByte);
  
  if (sensorValue < 50){
    println("on");
    image(imgOpenFly, width/2, height/2);
    delay(2);
    image(imgCloseFly, width/2, height/2);
  }
  else {
    println("off");
    //image(imgkiss, 50, 50);
  }
}





