
/*  

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
  volume = 0.8*volume + 0.2*volumeF;
}
  
//-------------------------------------
void stop(){
  in.close();
  minim.stop();
  super.stop();
  
}*/




void setup(){
  setupAudio();
  size(500, 300);
background(64, 190, 227);
smooth();
}
void draw(){
    getVolume();
  float x = map(volume,0,255,0,50);
  background(64,190,277);
//SHIRT
fill(191, 35, 37);
noStroke();
ellipse(250, 350, 150, 300);
fill(242, 182, 122); //SKIN COLOR
triangle(220, 200, 280, 200, 250, 270);
fill(170, 101, 58);
triangle(237, 240, 263, 240, 250, 270);
fill(242, 182, 122);
strokeWeight(1);
stroke(0,0,0);
line(250, 270, 250, 330);//shirt line button thing
//shirt lapelz
line(220, 200, 250, 270);
line(280, 200, 250, 270);
line(250, 270, 230, 285);
line(230, 285, 220, 200);
line(250, 270, 270, 285);
line(270, 285, 280, 200);
fill(0,0,0);
ellipse(255, 283, 5, 5);
ellipse(255, 295, 5, 5);
fill(242, 182, 122);
//LETS DRAW HIS HEAD! TOP HALF
noStroke();
ellipse(250, 100-x, 100, 90); //TOP OF HEAD
rect(200, 100-x, 100, 50); // FACE RECTANGLE
arc(250, 180, 100, 100, 0, PI); //JAW
fill(0, 0, 0);
ellipse(250, 180, 100, 40); // INSIDE OF MOUTH
fill(224, 2, 6, 70);
ellipse(250, 180, 75, 30); // INSIDE OF MOUTH
ellipse(250, 180, 50, 20); // INSIDE OF MOUTH
ellipse(250, 180, 25, 10); // INSIDE OF MOUTH
fill(242, 182, 122);
ellipse(250, 150-x, 100, 40); //UPPER LIP
 
// SOME EYES
// RIGHT EYE
fill(210, 122, 242, 170);
ellipse(217, 145-x, 16, 15); //BRUISE
fill(255, 255, 255);
ellipse(220, 130-x, 15, 30); //WHITE
fill(0, 0, 0);
ellipse(220, 130-x, 5, 10); //PUPIL
// LEFT EYE
fill(255, 255-x, 255);
ellipse(280, 130-x, 15, 30); //WHITE
fill(0, 0, 0);
ellipse(280, 125-x, 7, 13); //PUPIL
fill(210, 122, 242);
arc(280, 137-x, 15, 20, 0, PI); //EYELID
arc(280, 122-x, 13, 17, PI, 2*PI); //EYELID
strokeWeight(1);
stroke(0, 0, 0, 100);
line(275, 140-x, 284, 140-x);
noFill();
arc(283, 140-x, 15, 20, 0, PI/2); //EYEtwitch
arc(285, 142-x, 15, 20, 0, PI/2); //EYEtwitch
stroke(170, 101, 58); //beard color
noFill();
strokeWeight(12);
arc(250, 175, 100, 100, PI/4, (3*PI)/4); //BEARD
strokeWeight(4);

noStroke();
fill(170, 101, 58);
triangle(240, 200, 260, 200, 250, 230); //SOUL PATCH
arc(250, 100-x, 110, 100, PI, 2*PI);
//HAIR
triangle(195, 100-x, 240, 100-x, 175, 130-x);
triangle(240, 100-x, 260, 100-x, 245, 120-x);
triangle(260, 100-x, 270, 100-x, 255, 120-x);
triangle(270, 100-x, 290, 100-x, 295, 120-x);
triangle(290, 100-x, 305, 100-x, 310, 110-x);
triangle(195, 100-x, 200, 80-x, 185, 110-x);
triangle(200, 80-x, 230, 60-x, 185, 70-x);
triangle(215, 65-x, 230, 55-x, 185, 60-x);
triangle(300, 95-x, 300, 80-x, 315, 85-x);
triangle(300, 80-x, 270, 60-x, 310, 75-x);
triangle(240, 60-x, 270, 60-x, 285, 40-x);
}
