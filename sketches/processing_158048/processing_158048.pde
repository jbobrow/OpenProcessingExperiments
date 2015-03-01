
import processing.serial.*;
import org.firmata.*;
import cc.arduino.*;
Arduino arduino;
 
int l=0;
int [][] matriz = new int [1024][10];
int time=1000;
int r=20,posx=50,posy=200;
void setup(){
  size(400,400);
  frameRate(1);
  arduino = new Arduino(this, Arduino.list()[1], 57600);
  for(int ledPin=3;ledPin <=12;ledPin++){
  arduino.pinMode(ledPin, Arduino.OUTPUT);}
  for(int i=0;i<=1023;i++){
   int numero=i;
   for(int j=9; j>=0;j--){
   if(numero%2==0){
    matriz[i][j]=0;
    }else{
    matriz[i][j]=1;
    }
    numero=numero/2;
    }}
  }
  
  

    
void led(){
  l=l+1;
  arduino.digitalWrite(3,matriz[l][0]);
  arduino.digitalWrite(4,matriz[l][1]);
  arduino.digitalWrite(5,matriz[l][2]);
  arduino.digitalWrite(6,matriz[l][3]);
  arduino.digitalWrite(7,matriz[l][4]);
  arduino.digitalWrite(8,matriz[l][5]);
  arduino.digitalWrite(9,matriz[l][6]);
  arduino.digitalWrite(10,matriz[l][7]);
  arduino.digitalWrite(11,matriz[l][8]);
  arduino.digitalWrite(12,matriz[l][9]);
   }
void circulos(){
 background(255);
  color b = color(255,250,255);
  color d = color(0,255,0);
  color c = color(255, 0,0);

if(matriz[l][0]==1){
 fill(d); 
ellipse(posx,posy,r,r);
}else{
fill(b);
ellipse(posx,posy,r,r);}
 
  if(matriz[l][1]==1){
 fill(c);
ellipse(posx+30,posy,r,r);}
else{
fill(b);
ellipse(posx+30,posy,r,r);
}
  
  if(matriz[l][2]==1){
 fill(d);  
ellipse(posx+60,posy,r,r);}
else{
fill(b);
ellipse(posx+60,posy,r,r);}
  
  if(matriz[l][3]==1){
 fill(c); 
ellipse(posx+90,posy,r,r);}
else{
fill(b);
ellipse(posx+90,posy,r,r);}
  
  if(matriz[l][4]==1){
 fill(d);
ellipse(posx+120,posy,r,r);}
else{
fill(b);
ellipse(posx+120,posy,r,r);}
  
  if(matriz[l][5]==1){
 fill(c); 
ellipse(posx+150,posy,r,r);}
else{
fill(b);
ellipse(posx+150,posy,r,r);}
  
  if(matriz[l][6]==1){
 fill(d);
ellipse(posx+180,posy,r,r);}
else{
fill(b);
ellipse(posx+180,posy,r,r);}
  
  if(matriz[l][7]==1){
 fill(c);
ellipse(posx+210,posy,r,r);}
else{
fill(b);
ellipse(posx+210,posy,r,r);}
  
  if(matriz[l][8]==1){
 fill(d); 
ellipse(posx+240,posy,r,r);}
else{
fill(b);
ellipse(posx+240,posy,r,r);}
  
  if(matriz[l][9]==1){
 fill(c); 
ellipse(posx+270,posy,r,r);}
else{
fill(b);
ellipse(posx+270,posy,r,r);}
 
}

 

void draw(){

  circulos();
  led();
  delay(500);
  arduino.digitalWrite(3,0);
  arduino.digitalWrite(4,0);
  arduino.digitalWrite(5,0);
  arduino.digitalWrite(6,0);
  arduino.digitalWrite(7,0);
  arduino.digitalWrite(8,0);
  arduino.digitalWrite(9,0);
  arduino.digitalWrite(10,0);
  arduino.digitalWrite(11,0);
  arduino.digitalWrite(12,0);
  
  if(l==1023){
   l=0;}
  }
