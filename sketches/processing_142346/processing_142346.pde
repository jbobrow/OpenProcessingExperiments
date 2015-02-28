
/* 


Konkuk University

SOS iDesign 
Name:JU Hwiyeon   
ID: 201420109 

*/ 
// Don't worry about understanding the code below!
 // You only need to know that you will use the Volume
 import ddf.minim.*;

 Minim minim;
 AudioInput in;
 float volume = 0;
 float volumeF = 0;

 //-------------------------------------
 void setupAudio(){
 minim = new Minim(this);
 in = minim.getLineIn(Minim.MONO, 512);
 }

 //-------------------------------------
 void getVolume(){
 volumeF = in.right.level()*1000;
 volume = 0.8*volume + 0.8*volumeF; // Sensitivity = standard is 0.2*volumeF
 }

 //-------------------------------------
 void stop(){
 in.close();
 minim.stop();
 super.stop();
 } 

int value = 255; 
void setup(){ 
 
size (600, 600); 
setupAudio();
smooth(); 
} 

void draw(){ 
   background(280,400,600); 
  colorMode(RGB,mouseX/(width/600),mouseY/(height/600),600); 

beginShape(); 
fill(251,202,4); 
vertex(316,0); 
vertex(244,600); 
vertex(501,600); 
vertex(600,96); 
vertex(600,0); 
endShape(); 

  strokeWeight(4); 
  fill(random(600),250,400); 
   stroke(value); 
   ellipse(214,430,240,220); 


  fill(255,255,255); 
  strokeWeight (5); 
   stroke(value); 
  smooth(); 
  quad(192,600,89,219,307,219,525,600); 
  bezier (89,219,89,191,112,191,128,217); 
  bezier (311,219,298,188,274,188,272,218); 

  fill(64,151,238); 
   stroke(value); 
  quad (135,385,400,385,524,600,192,600); 

  fill(249,213,185); 
   stroke(value); 
  ellipse(235,299,160,120); 
  noStroke(); 
  fill(38,108,179); 
  quad(138,387,160,387,223,600,195,600); 
  fill(200,200,200); 
  quad(93,222,115,222,160,383,136,383); 
  bezier(92,218,91,193,105,193,107,218); 

  //FIN EYE 

    float mX3 = constrain(mouseX,189,197); 
  float mY3 = constrain(mouseY,273,288); 
  float mY4 = constrain(mouseY,273,288); 
  float mX4 = constrain(mouseX,275,284); 

  fill(0); 
  noStroke(); 
  ellipse(mX3,mY3,10,20); 
  ellipse(mX4,mY4,10,20); 

  strokeWeight(3); 
  stroke(value); 
  fill(249,213,200); 
  quad(120,410,118,600,145,600,145,410); 

  strokeWeight(3); 
  stroke(value); 
  fill(38,108,179); 
  quad(120,410,118,480,145,480,145,410); 

  smooth(); 
  strokeWeight(5); 

  fill(135,235,133); 
  quad(116,386,144,386,170,469,142,469); 

  strokeWeight(3); 
  noFill(); 
 stroke(value); 
 
 float v = random(-5,5);
  v=random(-5,5);
  bezier(195+v,302+v,227,323,275,324,291+v,302+v); 

  //jake's eye 

  noStroke(); 
  fill(0); 
  ellipse(394,85,60,60); 

  noStroke(); 
  fill(0); 
  ellipse(480,85,60,60); 

  float mX = constrain(mouseX,386,402); 
  float mY = constrain(mouseY,80,93); 
  float mY2 = constrain(mouseY,80,93); 
  float mX2 = constrain(mouseX,472,487); 
  fill(255,255,255); 
  noStroke(); 
  ellipse(mX,mY,40,40); 
  ellipse(mX2,mY2,40,40); 

  println(mouseX + " : " + mouseY); 

  stroke(0); 
  fill(255,20,20);     
  ellipse(440,130,50,40); 

  strokeWeight(3); 
  smooth(); 
  stroke(0,0,0); 
  fill(251,202,4); 
  ellipse(450,114,21,40); 

    smooth(); 
  stroke(0,0,0); 
  fill(251,202,4); 
  ellipse(416,114,21,40); 

 smooth(); 
  stroke(0,0,0); 
  fill(251,202,4); 
  ellipse(436,104,60,20); 

getVolume(); // this call fetches the microphone volume for the current frame.
 float Y = map(volume, 0, 200, 2, 100); // With the map we can use it!
 float X = map(volume, 0, 200, 2, 200); // The same we apply to create an Y variable.


  fill(0); 
  ellipse(430,113,X,Y); 



strokeWeight(3); 
noFill(); 
bezier(364,38,349,59,343,60,331,38); 


if(mousePressed){ 

  translate(mouseX, mouseY); 
  fill(random(600),450,100,600); 
  stroke(600); 
  strokeWeight(1); 
  ellipse(0,0,100,100); 


} 


} 

void mouseMoved() { 
if (value == 0) { 
value = 255; 
} 
else {
value = 0;  


}  


}  


