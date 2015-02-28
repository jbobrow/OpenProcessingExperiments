
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
size (600, 600);
setupAudio();
 // noLoop();
smooth();
//img = loadImage ("giyung.png"); 
 }

void draw(){
  colorMode(RGB,mouseX/(width/255),mouseY/(height/255),255);
println(mouseX + " : " + mouseY);
//image (img, 0, 0);

strokeWeight(3);
fill (255, 193, 158);
beginShape();
vertex (40, 222);
vertex (87, 227);
vertex (110, 188);
vertex (159, 193);
vertex (191, 151);
vertex (231, 162);
vertex (259, 127);
vertex (301, 148);
vertex (332, 116);
vertex (373, 139);
vertex (403, 110);
vertex (438, 137);
vertex (471, 108);
vertex (508, 137);
vertex (541, 114);
vertex (516, 310);
vertex (516, 339);
vertex (519, 350);
vertex (528, 374);
vertex (531, 396);
vertex (525, 427);
vertex (512, 452);
vertex (491, 470);
vertex (472, 485);
vertex (413, 513);
vertex (414, 512);
vertex (377, 520);
vertex (316, 525);
vertex (260, 520);
vertex (214, 504);
vertex (189, 488);
vertex (168, 468);
vertex (153, 477); //ear
vertex (145, 478);
vertex (126, 471);
vertex (114, 461);
vertex (104, 442);
vertex (103, 422);
vertex (116, 405);
vertex (127, 403); //ear
vertex (97, 349);
vertex (74, 305);
vertex (40, 222);
endShape(CLOSE);
strokeWeight(4);
noFill ();
beginShape();

endShape(CLOSE);

float k = random(-8,8);
  k=random(-8,8);
  
  
bezier (237+k, 307+k, 228, 273 ,298, 239, 304+k, 263+k);
bezier (408+k, 256+k, 402, 236, 459, 226, 464+k, 241+k);

fill(255);
strokeWeight(3);
beginShape();
vertex (304,346);
vertex (328,346);
vertex (346,354);
vertex (353,372);
vertex (348, 384);
vertex (326, 391);
vertex (307, 397);
vertex (286, 404);
vertex (268,395);
vertex (267, 379);
vertex (279,359);
vertex (290,354);
vertex (304,346);
endShape(CLOSE);

beginShape();
vertex (455,316);
vertex (473,319);
vertex (486,332);
vertex (485,349);
vertex (433,367);
vertex (416,360);
vertex (417, 344);
vertex (426,329);
vertex (436,323);
vertex (455,316);
endShape(CLOSE);
strokeWeight(3);
beginShape();
fill(0);
vertex (417,397);   //nose
vertex (428,398);
vertex (425,409);
endShape(CLOSE);

float mx1 = constrain (mouseX, 288, 342); 
float my1 = constrain (mouseY, 363, 377); 
float mx2 = constrain (mouseX, 433, 477); 
float my2 = constrain (mouseY, 333, 342); 

ellipse (mx1,my1, 6, 6);
ellipse (mx2,my2, 6, 6);

getVolume(); // this call fetches the microphone volume for the current frame.
 float Y = map(volume, 0, 200, 2, 100); // With the map we can use it!
 float X = map(volume, 0, 200, 2, 200); // The same we apply to create an Y variable.

ellipse (252, 436, X, Y);
ellipse (307,424,  X, Y);
ellipse (299,459,  X, Y);
ellipse (486,383,  X, Y);
ellipse (514,369,  X, Y);
ellipse (508,405,  X, Y);

fill(103,0,0);
ellipse (417, 467, 50, 30);
fill(243, 97, 166);
ellipse (411, 473, 30, 15);

if(mousePressed){
  
  fill(random(255),random(255),random(255));
  ellipse (411, 473, 30, 15);

}

}
void keyPressed(){


 }

