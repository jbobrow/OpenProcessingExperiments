
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

fill(255,180,220);
ellipse(162,156,63,121);
ellipse(431,154,63,121);
fill(255,100,150);
ellipse(162,156,35,63);
ellipse(431,154,35,63);
fill(255,180,220);
rectMode (CORNERS);
rect(97,153,491,459);

fill(255,100,150);
ellipse(286,323,121,82);
fill(255,100,100);
ellipse(411,323,63,38);
ellipse(170,328,63,38);
fill(200,50,100);
ellipse(262,323,25,25);
ellipse(318,323,25,25);

float mx1 = constrain (mouseX,155,206);
float mx2 = constrain (mouseX,375,431);
float my = constrain (mouseY,252,297);

fill(0,0,0);
ellipse(mx1,my,31,31);
ellipse(mx2,my,31,31);


if (mousePressed) {
  
  fill(random(255),random(255),random(255));
ellipse(411,323,63,38);
ellipse(170,328,63,38);
}

getVolume(); // this call fetches the microphone volume for the current frame.
float Y = map(volume, 0, 200, 2, 100); // With the map we can use it!
float X = map(volume, 0, 200, 2, 200); // The same we apply to create an Y variable.

fill(0);
ellipse (291, 219, X, Y);
noFill();

fill(0);
ellipse (371, 219, X, Y);
noFill();




}
