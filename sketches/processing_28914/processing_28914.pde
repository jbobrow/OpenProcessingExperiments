
import controlP5.*;
import processing.pdf.*;

float franz = 80;
float fritz = 80;
boolean record;
 
ControlP5 controlP5;

void setup() {
  size(800, 800);
  smooth();
  
  controlP5 = new ControlP5(this);
   
  controlP5.addSlider("franz", 0, 800, 80, 10,10, 200, 10);
  controlP5.addSlider("fritz", 0, 800, 80, 10,25, 200, 10);

 }
 
 
void draw() {
  if(record){
    beginRecord(PDF, "Logo-####.pdf");
    record = true;
  }
  
  background(255);
  stroke(0);
  
  line(fritz+100, 60, 100, franz);
  line(100, franz, 140, 150);
  line(140, 150, franz, 200);
  line(franz, 200, fritz+100, 60);
  line(100, franz,franz, 200);
  line(fritz+100, 60, 170, 250);
  line(140, 150, 30, 45);
  line(franz, 200, 30, 45);
  line(30, 45, 200, franz+30);
  line(200, franz+30,170, 250);
  line(170, 250, 230, 160);
  line(230, 160, 175, franz);
  line( 100, franz, 170, 250);
  line(230, 160, franz, 200);
  line(fritz+100, 60, 30, 45);
  line(30, 45, 175, franz );
 
  println("huhu");
 if(record){
   endRecord();
   record = false;
 }
 
}

void keyPressed(){
    
  if (key == 's'){
  record = true;
  }
}








