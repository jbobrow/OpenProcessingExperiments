
/* 


 Konkuk University 
 SOS iDesign 

Name: WOO Eunhye  
 ID: 201420091

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
size (600, 600); 
setupAudio();
background(255,255,255); 
 // noLoop(); 
smooth(); 
colorMode (RGB, 600); 
img = loadImage ("c.jpg"); // put the image in the same folder as the processing file 


 } 

void draw(){ 
  
  
  colorMode(RGB,mouseX/(width/255),mouseY/(height/255),255);
println(mouseX + " : " + mouseY); 
// here you add your code with all shapes and colors.  

fill (600, 200, 300); 
strokeWeight (4); 
ellipse (308, 356, 420, 450); 
fill (0,0,0); 
ellipse (261, 357, 20, 60); 
ellipse (354, 357, 20, 60); 
 
float j = random(-10,10);
  j=random(-10,10);
 
 
noFill (); 
strokeWeight (5); 
bezier (110+j, 431+j, 118, 451, 169, 465, 190, 456); 
bezier (190, 456, 194, 450, 420, 448, 441, 461); 
bezier (441, 461, 440, 466, 495, 458, 502+j, 439+j); 
bezier (252, 141, 272, 156, 129, 339, 101, 330); 
bezier (368, 141, 357, 164, 498, 346, 516, 333); 

getVolume(); // this call fetches the microphone volume for the current frame.
 float Y = map(volume, 0, 200, 2, 100); // With the map we can use it!
 float X = map(volume, 0, 200, 2, 200); // The same we apply to create an Y variable.


fill(600, 200, 300);
ellipse(64,536,X,Y);
ellipse(525,548,X,Y);

 if (mousePressed) { 

 fill (0, 0,0); 
strokeWeight (5); 
bezier (106, 417, 115, 441, 186, 421, 184, 395); 

 float rX = random(width); 
 float rY = random(height); 
 float c = random(500); 

 fill(c);  
 stroke (255); 
 strokeWeight(random(50)); 


  //body 

  stroke(0); 
 fill (600, 200, 300); 
ellipse (308, 356, 420, 450); 


//eyes 

float eyeLeftX = constrain (mouseX,350,425);
float eyeLeftY = constrain (mouseY,383,409);
float eyeRightX = map(mouseX,0,width,350,425);
float eyeRightY = map(mouseY,0,width,383,409);



stroke(3); 
fill (random(255),random(255),random(255)); 
ellipse (eyeLeftX,  eyeLeftY, 20, 60); 
ellipse (eyeLeftX-100,  eyeLeftY, 20, 60); 


// 

fill (600, 200, 300); 
noStroke(); 
quad (258, 151, 255, 134, 99, 43, 80, 52); 
stroke (3); 
bezier (277, 156, 304, 126, 83, 5, 65, 30); 
bezier (64, 29, 38, 63, 259, 189, 276, 157); 
bezier (336, 158, 323, 111, 537, 16, 562, 46); 
bezier (561, 46,582, 65,366, 186,342, 152 ); 


translate(mouseX, mouseY ); 
  fill(mouseX+10, mouseY+10,600); 
  stroke(mouseX,100,mouseY,100); 
  beginShape(); 
  vertex(0, -50); 
  vertex(14, -20); 
  vertex(47, -15); 
  vertex(23, 7); 
  vertex(29, 40); 
  vertex(0, 25); 
  vertex(-29, 40); 
  vertex(-23, 7); 
  vertex(-47, -15); 
  vertex(-14, -20); 
  endShape(CLOSE); 

 } 


} 


