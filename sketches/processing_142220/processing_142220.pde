

/* 


 Konkuk University 


 SOS iDesign 


  


Name: Park Seeun<<------ Write your full name here! 


 ID: Park Seeun<<--------- Write your ID here! 


  


*/ 


  


PImage img;   


int value = 0;  


  


  


void setup () { 


  background (155, 216, 255); 


  size (600, 600); 


//noLoop (); 


//smooth (); 


frameRate(70); 


  


} 


  


void draw () { 


int value = 0; 


 colorMode(RGB,mouseX/(width/255),mouseY/(height/255),255); 


float eyeLeftX = constrain (mouseX,310,349); 


float eyeLeftY = constrain (mouseY,120,153); 


float eyeRightX = map(mouseX,0,width,310,349); 


float eyeRightY = map(mouseY,0,width,120,153); 


  


  


  


  fill(255, 255, 255); 


  ellipse(300, 415, 297, 297); 


  smooth(); 


  noStroke(); 


    


  fill(255, 255, 255); 


  strokeWeight(3); 


  stroke(0); 


  ellipse(300, 163, 206, 206); 


  smooth(); 


  noStroke(); 


    


  fill (252, 132, 43); 


  triangle (300, 162, 228, 193, 302, 205); 


  smooth(); 


    


  fill(252, 132, 43); 


  ellipse(300, 184, 32, 42); 


  smooth(); 


  noStroke(); 


    


  fill(value); 


  ellipse(eyeLeftX, eyeLeftY, 17, 28); 


    


  noStroke(); 


    


  fill(value); 


  ellipse(eyeLeftX-70, eyeLeftY, 17, 28); 


  


  noStroke(); 


  


    


  fill(62, 249, 164); 


  ellipse(300, 415, 20, 20); 


  smooth(); 


  noStroke(); 


    


  fill(62, 249, 164); 


  ellipse(300, 358, 20, 20); 


  smooth(); 


  noStroke(); 


    


  fill(62, 249, 164); 


  ellipse(300, 470, 20, 20); 


  smooth(); 


  noStroke(); 


    


  float  s= random(-10,10); 


  s=random(-10,10); 





  strokeWeight(6); 


  stroke(119, 61, 4); 


  smooth(); 


  line(418, 325, 504, 219); 


  line(504, 219, 546, 184); 


  line(504, 219, 504, 189); 


    


  line(174, 336, 94, 205); 


  line(116, 242, 51, 219); 


    


  


    


    


fill(255, 0, 0); 


quad(377+s, 7+s, 315, 67, 383, 114, 410+s, 30+s); 


  


fill(109, 41, 25); 


quad(349, 34, 327, 55, 388, 98, 398, 67); 


  


strokeWeight(3); 


stroke(0); 


noFill(); 


bezier(315, 67, 295, 91, 369, 135, 383, 114); 


  


if(mousePressed){  


  noStroke(); 


  fill(255, 16, 175); 


  ellipse(238, 198, 67, 67); 


   


  noStroke(); 


  fill(255, 16, 175); 


  ellipse(361, 193, 67, 67);  


    


     


  fill(5, 198, 179); 


  ellipse(300, 415, 40, 40); 


  smooth(); 


  noStroke(); 


    


  fill(5, 198, 179); 


  ellipse(300, 358, 40, 40); 


  smooth(); 


  noStroke(); 


    


  fill(5, 198, 179); 


  ellipse(300, 470, 40, 40); 


  smooth(); 


  noStroke(); 


    


  fill (255, 0, 0); 


  triangle (300, 162, 228, 193, 302, 205); 


  smooth(); 


    


  fill(255, 0, 0); 


  ellipse(300, 184, 32, 42); 


  smooth(); 


  noStroke(); 


    


    


  fill(mouseX,mouseY,0);  


 translate(mouseX, mouseY);  


 fill(mouseX,50,mouseY,50);  

stroke(255,255,255); 
strokeWeight(1); 


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


  


    


  


void mouseDragged()  


{ 


  value = value + 5; 


  if (value > 255) { 


    value = 0; 


  } 


} 


  


void keyPressed(){  


setup();  


  


} 


// Don't worry about understanding the code below! 


 // You only need to know that you will use the Volume 


/* import ddf.minim.*; 


  


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
