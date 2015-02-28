
/*
Konkuk University
SOS iDesign

Name: choi in seo <<------ Write your full name here!
ID: Your ID 201420113<<--------- Write your ID here!

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
  //img = loadImage ("kk.jpg");
size (600, 600);
setupAudio();
// noLoop();
smooth();


background(600,600,600);
 // put the image in the same folder as the processing file
}

void draw(){
println(mouseX + " : " + mouseY);
//image (img, 0, 0);
// here you add your code with all shapes and colors.

fill(255);
rectMode(CORNERS);

float v = random(-10,10);
  v=random(-10,10);


rect(290,94,319+v,216+v);

fill(599.25,535.8,0);
beginShape();
vertex (253,298);
vertex (229,320);
vertex (236,334);
vertex (250,331);
vertex (260,444);
vertex (286,444);
vertex (289,428);
vertex (333,423);
vertex (331,447);
vertex (353,445);
vertex (356,428);
vertex (353,329);
vertex (376,327);
vertex (380,311);
vertex (365,279);
endShape(CLOSE);

noFill();

fill(255);
ellipse (308, 219, 188, 188);

float mx1 = constrain (mouseX, 285, 295);
float mx2 = constrain (mouseX, 365, 375);
float my = constrain (mouseY, 215, 225);

ellipse (mx1, my, 50, 50);
ellipse (mx2, my, 50, 50);


getVolume(); // this call fetches the microphone volume for the current frame.
float Y = map(volume, 0, 200, 2, 100); // With the map we can use it!
float X = map(volume, 0, 200, 2, 200); // The same we apply to create an Y variable.


fill(0);
ellipse (291, 219, X, Y);
noFill();

fill(0);
ellipse (371, 219, X, Y);
noFill();

line(347, 240, 346, 243);

rectMode(CORNERS);
rect(328,257,333,265);
rect(338,257,333,265);
rect(348,257,333,265);
rect(358,257,333,265);




}
