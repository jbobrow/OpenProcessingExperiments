
import ddf.minim.*;
import ddf.minim.signals.*;


Minim minim;
AudioPlayer mySound;


Shape[] shapes = new Shape[4];

int travel = 0;
int size1 = 100;
int size2 = 100;
int size3 = 100;
int rSpeed = 2;

void setup(){
  size(800,800,P3D);
  rectMode(CORNERS);
  colorMode(HSB,5000);
   background(0);
  
  minim = new Minim(this);                      
  mySound = minim.loadFile("triple x part.mp3");  
  mySound.loop();
  
 
}

void draw(){
 stroke(travel,5000,5000,99);
 pushMatrix();
 translate(mouseX,mouseY,0);
 rotate(radians(travel+=mySound.mix.level()*rSpeed));
  
float leftLevel = mySound.left.level()*size1;
float rightLevel = mySound.right.level()*size2;
float mixLevel = mySound.mix.level()*size3;


  for(int i=0; i < shapes.length;i++){ 
   
  shapes[i] = new Shape(leftLevel,rightLevel,mixLevel,0);
  shapes[i].display();
  
    
  travel++;
  
  if (travel > 5000){
    travel = 0;
  }}
popMatrix();  
}

class Shape{
  
  float xpos;
  float ypos;
  float zpos;
  float travel;
  
Shape(float xpos_,float ypos_,float zpos_,float travel_){

xpos = xpos_;
ypos = ypos_;
zpos = zpos_;
travel = travel_;
}

void display(){
  

beginShape();
 vertex(-xpos,0,0);
 vertex(xpos,0,0);
 vertex(0,ypos,0);
 vertex(-xpos,0,0);
 vertex(0,0,zpos);
 vertex(xpos,0,0);
 vertex(0,ypos,0);
 vertex(0,0,zpos);
endShape();

}}

void keyPressed(){
  
  if ( key == 'c'){
 background(0);
  }
    
  if ( key == 'w' ){
    size1+=10;
  }
    else if ( key == 'a' ){
      size2+=10;
    }
    else if ( key == 'd' ){
      size3+=10;
    }
  
  if ( key == 'm' ){
    if (mySound.isMuted()){
      mySound.unmute();
}
    else{
      mySound.mute();
      
}}}


void stop(){

  mySound.close();   

  minim.stop();       
  super.stop();       
}



