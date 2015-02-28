
/*
 Konkuk University
 SOS iDesign

Name: Your Name <<------ Write your full name here!
 ID: Your ID <<--------- Write your ID here!

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


PImage img;

void setup(){
  setupAudio();
size (600, 600);
 // noLoop();
smooth();
background(255);
//img = loadImage ("z.jpg"); 
 }

void draw(){
colorMode(RGB,mouseX/(width/255),mouseY/(height/255),255);
  println(mouseX + " : " + mouseY);
//image (img, 0, 0);

fill(255, 167, 167); 
ellipse(100, 270, 110, 110);
ellipse(500, 270, 110, 110);
ellipse(300, 263 ,400, 300);

float a = random(-10,10);
  a=random(-10,10);

line (285+a, 260+a, 315+a, 260+a);

float eyeLeftX = constrain (mouseX,365,380);
float eyeLeftY = constrain (mouseY,195,205);

fill(0);
ellipse(eyeLeftX, eyeLeftY, 30, 100);
ellipse(eyeLeftX-150, eyeLeftY, 30, 100);
float eyeRightX = map(mouseX,0,width,365,380);
float eyeRightY = map(mouseY,0,width,195,205);

getVolume(); // this call fetches the microphone volume for the current frame.
 float Y = map(volume, 0, 200, 2, 100); // With the map we can use it!
 float X = map(volume, 0, 200, 2, 200); // The same we apply to create an Y variable.

fill(random(255));
stroke(0);
ellipse(30,550,X,Y);
ellipse(550,550,X,Y);

if(mousePressed){
fill(random(255),random(255),random(255));  
ellipse(235, 200, 30, 100);
ellipse(365, 200, 30, 100);
}


 }

void keyPressed(){


 }

