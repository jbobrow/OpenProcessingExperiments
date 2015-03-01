
import processing.serial.*;
import cc.arduino.*;

Arduino arduino;
int ledPin =1;
int time=1000;
int r=20,posx=50,posy=200;


void setup()
{ size(400,400);
frameRate(20);

  //println(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[0], 57600);
  arduino.pinMode(ledPin, Arduino.OUTPUT);
}

void circle(){
  background(255);
  
  color d = color(0,255,0);
  color c = color(255, 0,0);

if(ledPin==2){
 fill(d); 
ellipse(posx,posy,r,r);}
 
  if(ledPin==3){
 fill(c);
ellipse(posx+30,posy,r,r);}
  
  if(ledPin==4){
 fill(d);  
ellipse(posx+60,posy,r,r);}
  
  if(ledPin==5){
 fill(c); 
ellipse(posx+90,posy,r,r);}
  
  if(ledPin==6){
 fill(d);
ellipse(posx+120,posy,r,r);}
  
  if(ledPin==7){
 fill(c); 
ellipse(posx+150,posy,r,r);}
  
  if(ledPin==8){
 fill(d);
ellipse(posx+180,posy,r,r);}
  
  if(ledPin==9){
 fill(c);
ellipse(posx+210,posy,r,r);}
  
  if(ledPin==10){
 fill(d); 
ellipse(posx+240,posy,r,r);}
  
  if(ledPin==11){
 fill(c); 
ellipse(posx+270,posy,r,r);}
}

void draw(){
  circle(); 
  ledPin=ledPin+1;
  circle();  
  arduino.digitalWrite(ledPin, 1);
  circle();
  delay(time);
  arduino.digitalWrite(ledPin, 0);
  circle();
  delay(time);
  circle();
 if(ledPin==12){
 ledPin=1;}
}
 
   
