
/*
Name: An Yohan 
 ID: 201420087
 
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
smooth();
colorMode (RGB, 600);
}

//head
void draw(){
println(mouseX + " : " + mouseY);
strokeWeight(3);
fill(31,32,33);
ellipse (277,309,471,396);
 
fill(110,110,110);
strokeWeight(0);
ellipse (279,283,440,333);
 
fill(200,200,200);
strokeWeight(0);
ellipse (316,246,300,225);
 
 
fill(400,400,400);
strokeWeight(0);
ellipse (344,220,100,70);
 
fill(500,500,500);
strokeWeight(0);
ellipse (367,219,50,30);
 
getVolume();
float Y = map(volume, 0, 100, 2, 10);
float X = map(volume, 0, 100, 2,10);
 
//eye 
fill(600,600,600);
ellipse (408,292,80,80);
 
ellipse (159,292,80,80);

//mouth 
strokeWeight(10);
fill(247*2.3,64*2.3,17*2.3);
ellipse(282,420,300,175);
 
strokeWeight(10);
bezier (132,416,240,499,350,499,431,416);
 
float mx1 = constrain(mouseX,146,173); 
float mx2 = constrain(mouseX,395,428); 
float my = constrain(mouseY,275,313); 
fill(0);
strokeWeight(1);
ellipse (mx1,my,X,Y);
 
 
fill(0);
strokeWeight(1);
ellipse (mx2,my,X,Y);
 
 
if (mousePressed){
   
strokeWeight(10);
fill(247*2.3,64*2.3,17*2.3);
ellipse(282,420,300,175);
bezier (132,416,290,377,351,401,431,416);
bezier (208,402,257,448,333,448,357,402);
}
}

