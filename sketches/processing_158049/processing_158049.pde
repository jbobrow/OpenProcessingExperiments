
import processing.serial.*;

import org.firmata.*;
import cc.arduino.*;
Arduino arduino;

float posx=365,posy=365,mov=random(0,4); // ////variables enteras
int r=20;
int jugador1=0,jugador2=0;


void setup (){ ////// configuracion
  size(650,512);
  frameRate(60); //////cuadros por segundo
  //println(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[0], 57600);
  
}
void draw(){ // ////dibuja
 background(255);
 int px = arduino.analogRead(0);
 int px1 =arduino.analogRead(1);
  color c = color(255, 129, 129);  // Define color 'c'
fill(c);  // Use color variable 'c' as fill color
noStroke(); 

  ellipse(posx,posy,2*r,2*r);
  rect(px/2,0,150,10);
  rect(px1/2,640,150,10);

   if (mov==1){ //movimientos
      posx=posx+3;
      posy=posy-1;}
    if(mov==2){
      posx=posx-1;
      posy=posy-3;}
    if(mov==3){
      posx=posx-1;
      posy=posy+3;}
    if(mov==4){
      posx=posx+3;
      posy=posy+1;}
   
   //limites izquierdo
    if(posx<=r){
    if (mov==3){
    mov=4;}
    if(mov==2){
    mov=1;}}
  
   //limite superior
   if((posy<=r+10)&&(posy>=0)&&(posx<=px+150)&&(px<=posx)){
     if(mov==1){
     mov=4;}
     if(mov==2){
       mov=3;}}
   
   //limite inferior
   if((posy>=650-r+10)&&(posy>=650)&&(posx<=px+150)&&(px<=posx)){
     if(mov==4){
     mov=1;}
     if(mov==3){
     mov=2;}}
   
   //limite derecho
   if(posx>=512-r){
     if(mov==1){
      mov=2;}
     if(mov==4){
     mov=3;}}
     
     ////reiniciara juego
     if((posx>0)&&(posx<-10)){
     mov=random(0,4);
     posx=325;
     posy=325;
     jugador1=jugador1+1;}
     if((posx>650)&&(posx<660)){
     mov=random(0,4);
     posx=325;
     posy=325;
     jugador2=jugador2+1;}
     
     print(jugador1);
     print(jugador2);}
 

