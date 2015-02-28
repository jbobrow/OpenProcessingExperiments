
/*
Konkuk University
SOS iDesign

Name:PARK Jeung Eun <<------- Write your full name here!
Id: wjddms6847<<--------- Write your ID here!

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
size (600,600);
//noLoop();
smooth();
//img=loadImage ("jake.jpg");
background(113,93,17);


}

void draw(){
  
  colorMode(RGB,mouseX/(width/255),mouseY/(height/255),255);
println(mouseX + " : " + mouseY);
//image(img, 0, 0);

stroke(0);
strokeWeight(3);


fill(252,202,15);
strokeWeight(4);
ellipse(300,300,500,500);

getVolume(); // this call fetches the microphone volume for the current frame.
 float Y = map(volume, 0, 200, 2, 100); // With the map we can use it!
 float X = map(volume, 0, 200, 2, 200); // The same we apply to create an Y variable.
fill(252,56,38);
ellipse(294,423,X,Y);



noFill();
float h = random(-10,10);
  h=random(-10,10);
bezier(152,384,154,352,158,349,171,313);
bezier(435,387,439,358,437,345,430,312);
bezier(255,248,282,244,315,239,355,257);
bezier(152,384,152,419,183,431,212,419);
bezier(212,419,239,401,253,372,263+h,338+h);
bezier(331+h,340+h,336,365,350,411,371,423);
bezier(371,423,404,441,431,424,435,387);




noFill();
fill(0);
ellipse(295,318,100,60);
ellipse(175,233,160,160);
fill(255);
ellipse(197,213,90,90);
ellipse(129,245,50,50);
fill(0);
ellipse(419,233,160,160);
fill(255);
ellipse(437,215,90,90);
ellipse(370,249,50,50);

float mx1 = constrain (mouseX, 80, 125);
float mx2 = constrain (mouseX, 475, 520);
float my = constrain (mouseY, 320, 380);

strokeWeight (5);
point (mx1-10, my-6);
point (mx1+10, my-6);
point (mx1, my+12);

point (mx2-10, my-6);
point (mx2+10, my-6);
point (mx2, my+12);

if(mousePressed){
  fill(random(255),random(255),random(255));
  ellipse(197,213,90,90);
  ellipse(437,215,90,90);
  
  noStroke();
  fill (random(255),random(255),mouseY);
  triangle(mouseX, mouseY-40, mouseX-40, mouseY+30, mouseX+40, mouseY+30);
}




 

}


