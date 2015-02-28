

/* 
Konkuk University 
SOS iDesign 
Name: Oh You Ri 
ID:201420090 
*/ 

void setup(){ 
size (600, 600); 
// noLoop(); 
smooth(); 
background(0); 

} 

void draw(){ 
  
  colorMode(RGB,mouseX/(width/255),mouseY/(height/255),255);
println(mouseX + " : " + mouseY); 
//image (img, 0, 0); 
// here you add your code with all shapes and colors.  
//head 
noStroke(); 
fill (0, 209, 250); 
ellipse (308, 280, 472, 472); 
//eyes 

float eyeLeftX = constrain (mouseX,420,472);
float eyeLeftY = constrain (mouseY,141,202);
float eyeRightX = map(mouseX,0,width,358,465);
float eyeRightY = map(mouseY,0,width,140,245);


fill (0); 
ellipse (eyeLeftX,eyeLeftY, 26, 26); 
ellipse (eyeLeftX-300,eyeLeftY, 26, 26); 

//nose 
ellipse (308, 245, 56, 56); 

//mouth 
fill (255); 
ellipse (363, 319, 100, 100); 
ellipse (262, 319, 100, 100); 

//the brightness of the eye 
ellipse (eyeLeftX,eyeLeftY, 10, 10); 
ellipse (eyeLeftX-300,eyeLeftY, 10, 10); 

float o = random(-8,8);
  o=random(-8,8);


//right mustache 
stroke (0); 
strokeWeight (3); 
line (386, 291, 451+o, 290+o); 
line (393, 311, 455+o, 316+o); 
line (396, 332, 449+o, 347+o); 

//left mustache 
line (234, 290, 166+o, 290+o); 
line (228, 309, 161+o, 320+o); 
line (222, 330, 163+o, 349+o); 

//bonus 
if(mousePressed){ 
float Ra = random(255); 
float Rb = random(255); 
float Rc = random(255); 
float Rd = random(100,255); 
noStroke(); 
fill (Ra,Rb,Rc); 
ellipse (308, 245, 56, 56); 
fill (0,0,Rd); 
ellipse (mouseX, mouseY, 50, 50); 


  


 } 


  


} 
/*
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
*/
