
Konkuk University
SOS iDesign

Name: KIM Hyemi
ID: 201420076 
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
colorMode (RGB, 600);
// img = loadImage ("bmo.jpg"); // put the image in the same folder as the processing file

}

void draw(){
println(mouseX + " : " + mouseY);
//image (img, 0, 0);


background(180, 392, 348);

noStroke();
fill(384,508,406);
rect (45, 36, 510, 413);

noStroke();
fill(180,392,348);
rect(51, 479, 292, 30);

noStroke();
fill(76, 280, 444);
ellipse (499,494,30,30);

noStroke();
fill(120, 408, 192);
ellipse (485, 650, 35, 35);

noStroke();
fill(116, 422, 168);
ellipse (486, 592, 50, 50);

noStroke();
fill(120, 474, 506);
triangle(407, 527, 377, 590, 436, 590);

noStroke();
fill(510, 454, 218);
rect(73, 582, 101, 18);

noStroke();
fill(510, 454, 218);
rect(102, 558, 38, 36);


stroke(10);
fill(0,0,0);
bezier (239, 204, 267, 218, 340, 218, 369, 204);

noStroke();
fill(120, 244, 214);
rect(57, 472, 212, 48);

float mx1 = constrain (mouseX, 80, 125);
float mx2 = constrain (mouseX, 475, 520);
float my = constrain (mouseY, 120, 188);

getVolume();
float Y = map(volume, 0, 200, 2, 100);
float X = map(volume, 0, 200, 2, 100);



noStroke();
fill(0,0,0);
ellipse(mx1,my, Y, X);

noStroke();
fill(0,0,0);
ellipse(mx2,my, X, Y);

float dia =50;


if(mousePressed){
  strokeWeight(5);
  stroke(pmouseX,100,pmouseY,50);
  fill(mouseX,mouseY,0);
  ellipse(mouseX,mouseY,dia,dia);
  ellipse(mouseX,height-mouseY,dia,dia);
  ellipse(width-mouseX,mouseY,dia,dia);
    ellipse(width-mouseX,height-mouseY,dia,dia);
 

}
 



}

void keyPressed(){
setup();

}
