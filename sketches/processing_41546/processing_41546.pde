
boolean move = false;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
float w = 1;
float w1 = -1;
int counter = 0;
Minim m;
AudioPlayer rain;

AudioPlayer rain_decrease;
AudioPlayer wind;
AudioPlayer low_wind;
AudioPlayer swoosh;
ArrayList particles = new ArrayList();

void setup(){
  size(700,400);
  smooth();
  cursor(CROSS);
  frameRate(50); 
 
 m = new Minim(this);
 low_wind = m.loadFile("low wind.mp3");
 low_wind.loop();
 rain = m.loadFile("rain1.wav");

 m = new Minim(this);
  wind = m.loadFile("wind.wav");
 swoosh = m.loadFile("swoosh.aif");

 
}
 
void draw(){
background(0);
  
   
    for (int k = 2; k < 40; k++){
       particles.add(new Particle(350,-500));
        if(keyPressed == true){
   
    k = k +5;
        }
    }
    
 
    for (int i = 2; i < particles.size(); i++){
    Particle p = (Particle)particles.get(i);
    

    p.update();
    p.rain();
     if(keyPressed == true){
    i = i +5;
    
     }
    
    
}
  }
  



class Particle{
  
 float x,y;
 float xSpeed,ySpeed; 
 float gravity;
 
 float bounce;


   Particle(float inX, float inY){

   x = inX;
   y = inY;
  
   gravity = 1;
   bounce = -0.18;
   
//Positions released   
  xSpeed = random(-10,10);
  ySpeed = random(-15,15);
 
 }
 
void update(){

   ySpeed += gravity;
   
   x += xSpeed;
   y += ySpeed;
 
 
 //WIND effect -
 if(mouseButton == LEFT){
   gravity = 1;
   xSpeed = random(0,100);
   ySpeed = random(0,10);
   
 }
 
   
   if( mouseButton == RIGHT && mouseX<350){
    // gravity = -1;
   }
   if(mouseButton == RIGHT && mouseX>400){
     gravity = 1;
     xSpeed = random(-400,mouseX);
     ySpeed = random(-150,mouseY);
    
     
   }

   //frameRate();
     
     
//Movement based off mousex/y or pmouseX/y ...?
   
  if((y >= height + 10)&&(ySpeed > 0)){
    ySpeed *= bounce;
  
  //abs(mouseX,mouseY,
  
  }
 }
 
void rain(){
   
 
  fill(255);
  point(x,y);
   
     
 }
}

void lightning(){

 
int st=round(random(700)); 
int end=350;
int y = 0;
int y2 = 40; 


while ( y2 < 500){

 end = (st-40) + round(random(80));
 stroke (255);
  line ( st, y, end, y2);
  y = y2;
  y2 += round(random(80));
  st = end; 
 
 end = (st-40) + round(random(80));
 stroke (255);
  line ( st, y, end, y2);
  y = y2;
  y2 += round(random(80));
  st = end;
 
 }
}

void mouseClicked() {
 lightning();
 lightning();
 if(mouseButton == RIGHT){
        rain.loop();}
 if(mouseButton == LEFT){
  swoosh.loop(0);
 }
 if(mouseButton == RIGHT){
  counter = counter + 1;
 
  if (w <=20) {
    w1 = w1 + 1;
    w = w + 2;
  }
 
  if (counter > 5) {
    wind.loop(0);
  }}
}


void mousePressed(){
 
  rect(0,0,700,400);
  fill(255,70);
  frameRate(30);
  loop();
  
 
  }
 

void mouseMoved(){
 
move = true; 
  
}






