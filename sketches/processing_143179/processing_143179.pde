
Name: JANG jin seon
 ID: 201420105

*/
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
smooth();
colorMode (RGB, 255);
 //img = loadImage ("miniunn.jpg");
 
}
 

void draw(){
 println(mouseX + " : " + mouseY);
 //image (img, 0, 0);



 noStroke();
 fill(0,0,0);
 rect(94,375,25,40);
 
 noStroke();
 fill(247,231,50);
 ellipse(299,394,400,550);

 noStroke();
 fill(247,231,50);
 rect(98,374,400,300);
 
 noStroke();
 fill(0,0,0);
 rect(94,375,40,60);
 
 noStroke();
 fill(0,0,0);
 rect(481,378,30,60);

  
 stroke(111,110,100);
 strokeWeight(40);
 fill(247,231,50);
 ellipse(220,400, 160, 200);

 noStroke();
 fill(255,255,255);
 ellipse(220,400,120,150);
  
float mx1 = constrain (mouseX, 160, 272);
float mx2 = constrain (mouseX, 330, 432);

 noStroke();
 fill(0,0,0);
 ellipse(mx1,400,50,60);
 
 
 stroke(111,110,110);
 strokeWeight(40);
 fill(247,231,50);
 ellipse(382,399,160,200);
 
 noStroke();
 fill(255, 255, 255);
 ellipse(382, 399, 120,150);
 
noStroke();
 fill(0,0,0);
 ellipse(mx2,399,50,60);
 
 
 

 getVolume(); 
 float Y = map(volume, 0, 200, 2, 100); 
 float X = map(volume, 0, 200, 2, 200);
 
 noStroke();
 fill(255,0,0);
 ellipse(301,599,X,Y);

 
 noStroke();
 fill(255,255,255);
 rect(266,560,30,20);
 
 noStroke();
 fill(255,255,255);
 rect(300,560, 30,20);
 
 fill(0,0,0);
 bezier(299,116, 302,98,311,77,329,52);
 
 fill(0,0,0);
 bezier(292,116,290,103,291,87,302,64);
 
 
 
 }

void keyPressed(){


 }

