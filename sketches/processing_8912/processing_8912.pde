

import controlP5.*;
ControlP5 controlP5;

float R; 
PImage b;
int s= 1;
int speed= 1;
int value = 0;
boolean t1 = true;
boolean t2 = true;
boolean t3 = true;



 
void setup(){ 
size(400,400); 
background(255,50,200); 
//noCursor();
smooth();
controlP5 = new ControlP5(this);
controlP5.addToggle("t1");
controlP5.addToggle("t2");
controlP5.addToggle("t3");}


 
void draw() { 
  
background(200,50,50); 


// verander achtergrond kleur
if(t2) {
   background(0,50,50 );
  }

// teken gezichtje
if(t1) {
    fill(10, 200, 10);
    ellipse(200,200, 150,150);
    fill(0);
    ellipse(180,180, 10, 10);
    ellipse(220,180, 10, 10);}


    
    

    
   

R=random(400);


// als muis ingedrukt is kleurverandering rondjes
  if (mousePressed == true) {
    fill(0, 200, 30);
  } else {
    fill(100, 20, 255);
  }


//rondjes aan uit
if(t3) { 
  

{
for(int a=0; a<400; a=a+200)
for(int b=0; b<400; b=a+1){
      ellipse(R, a, 40, 40);
      ellipse(R, a, 30, 30);
      ellipse(R, a, 20, 20);
      ellipse(R, a, 10, 10);
 
  a= a+50;
  b= b+50;}
}}

//for(int a=0; a<400; a=a+5) {
  //ellipse(R, a, 20, a);

}






