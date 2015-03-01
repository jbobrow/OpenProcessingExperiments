
import processing.serial.*;
import cc.arduino.*;

Arduino arduino;
int ledPin,time=200;
int l=0;
int d,p=0,t;
int numeros []= new int[10];
int r=20,posx=50,posy=200;
void setup(){
  size(400,400);
  frameRate(5);
  arduino = new Arduino(this, Arduino.list()[1], 57600);
  for(ledPin=3;ledPin <=12;ledPin++){
  arduino.pinMode(ledPin, Arduino.OUTPUT);}
}

void circle(){
 background(255);
  color b = color(255,250,255);
  color d = color(0,255,0);
  color c = color(255, 0,0);

if(numeros[0]==1){
 fill(d); 
ellipse(posx,posy,r,r);
}else{
fill(b);
ellipse(posx,posy,r,r);}
 
  if(numeros[1]==1){
 fill(c);
ellipse(posx+30,posy,r,r);}
else{
fill(b);
ellipse(posx+30,posy,r,r);
}
  
  if(numeros[2]==1){
 fill(d);  
ellipse(posx+60,posy,r,r);}
else{
fill(b);
ellipse(posx+60,posy,r,r);}
  
  if(numeros[3]==1){
 fill(c); 
ellipse(posx+90,posy,r,r);}
else{
fill(b);
ellipse(posx+90,posy,r,r);}
  
  if(numeros[4]==1){
 fill(d);
ellipse(posx+120,posy,r,r);}
else{
fill(b);
ellipse(posx+120,posy,r,r);}
  
  if(numeros[5]==1){
 fill(c); 
ellipse(posx+150,posy,r,r);}
else{
fill(b);
ellipse(posx+150,posy,r,r);}
  
  if(numeros[6]==1){
 fill(d);
ellipse(posx+180,posy,r,r);}
else{
fill(b);
ellipse(posx+180,posy,r,r);}
  
  if(numeros[7]==1){
 fill(c);
ellipse(posx+210,posy,r,r);}
else{
fill(b);
ellipse(posx+210,posy,r,r);}
  
  if(numeros[8]==1){
 fill(d); 
ellipse(posx+240,posy,r,r);}
else{
fill(b);
ellipse(posx+240,posy,r,r);}
  
  if(numeros[9]==1){
 fill(c); 
ellipse(posx+270,posy,r,r);}
else{
fill(b);
ellipse(posx+270,posy,r,r);}
 
}

 void led(){
  delay(time);
  circle();
  arduino.digitalWrite(3,numeros[0]);arduino.digitalWrite(4,numeros[1]);
  arduino.digitalWrite(5,numeros[2]);arduino.digitalWrite(6,numeros[3]);
  arduino.digitalWrite(7,numeros[4]);arduino.digitalWrite(8,numeros[5]);
  arduino.digitalWrite(9,numeros[6]);arduino.digitalWrite(10,numeros[7]);
  arduino.digitalWrite(11,numeros[8]);arduino.digitalWrite(12,numeros[9]);
  circle();
 }

void draw(){
  print(l);
  l=l+1;
  delay(time);
  for(int j=0;j<=9;j++){
  numeros[j]=0;}
  led();
  for(int h=0; h<=9;h++){
  if(h==0){t=l;}
  numeros[h]= t%2;
  t = t/2;
  if(h==9){
  delay(time);
  arduino.digitalWrite(3,p);arduino.digitalWrite(4,p);
  arduino.digitalWrite(5,p);arduino.digitalWrite(6,p);
  arduino.digitalWrite(7,p);arduino.digitalWrite(8,p);
  arduino.digitalWrite(9,p);arduino.digitalWrite(10,p);
  arduino.digitalWrite(11,p);arduino.digitalWrite(12,p);
  }}
  led();
  if(l==1024){
  l=0;}}
