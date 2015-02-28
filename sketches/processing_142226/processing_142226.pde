
/*
Konkuk University
SOS iDesign

Name: Your Name <<------ Write your full name here!
ID: Your ID <<--------- Write your ID here!

*/

PImage img;

int value = 0;

void setup(){
size (600, 600);
// noLoop();
smooth();
colorMode (RGB);
background(255,255,255);
 // put the image in the same folder as the processing file
}

void draw(){
  
  colorMode(RGB,mouseX/(width/255),mouseY/(height/255),255);
println(mouseX + " : " + mouseY);

// here you add your code with all shapes and colors. 


strokeWeight(5);
//face


//head

fill(255,255,255);
ellipse(293,273,475,475);

//left arm
line(222,504,189,562);
line(189,562,213,576);
line(235,517,211,600);

//right arm
line(383,495,423,562);
line(423,562,394,575);
line(375,515,400,600);



 if(mousePressed){

 float a=random(255); 
 float b=random(255); 
 float c=random(100); 

fill(247,140,231);

//face
float eyeLeftX = constrain (mouseX,205,387);
float eyeLeftY = constrain (mouseY,282,450);
float eyeRightX = map(mouseX,0,width,358,465);
float eyeRightY = map(mouseY,0,width,140,245);

ellipse(eyeLeftX,eyeLeftY,358,358);

//hand

float x = random(-5,5);
  x=random(-5,5);
fill(value);
ellipse(197+x,585+x,36,36);
ellipse(414+x,583+x,36,36);

fill(constrain(mouseX,mouseY,a),b,c); 
strokeWeight(5); 
ellipse(pmouseX,pmouseY,100,100); 



}
}

void keyPressed(){ 


setup(); 


 


} 
 void mouseDragged() {
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getAmount();
  println(e);
}

void mouseMoved() {
  value = value + 5;
  if (value > 255) {
    value = 0;
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
