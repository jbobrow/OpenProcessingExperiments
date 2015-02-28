
//audio handler paolo code
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
}
void setup(){
  setupAudio();
  size(500, 500);
}

void draw(){
  background(50, 50, 50);
  getVolume();

smooth();
//rounding
strokeCap(ROUND);
// define variable earShrinkage
float earShrinkage = map(volume, 0,100, 0,100);
//inner gray ears
noStroke();
fill(75, 75, 75);
triangle(125, 250,  225, 175,  100, earShrinkage+75);
triangle(375, 250,  275, 175,  400, earShrinkage+75);

//outer black ear
stroke(1);
fill(0, 0, 0);
triangle(175, 250,  225, 175,  100, earShrinkage+75);
triangle(325, 250,  275, 175,  400, earShrinkage+75);

//hexangonal head
fill(0, 0, 0);
beginShape();
vertex(115, 175);  //1 first vertex upper left (ordered clockwise)
vertex(386, 175);  //2
vertex(386, 325);  //3
vertex(300, 405);  //4
vertex(192, 405);  //5
vertex(120, 325);  //6
vertex(115, 175);  //7
endShape();

//nosey!
noStroke();
fill(55, 55, 55);
triangle(220, 320,  280, 320,  250, 345);

//mouth
strokeWeight(5);
stroke(55, 55, 55);
line(200, 375, 300, 375);

//whisker variables defined
float whisker = map(volume, 0,100, 0,50);
float whiskerY = map(volume,0,100,0,25);

//left whishers
stroke(75, 75, 75);
strokeWeight(3);
strokeCap(ROUND);
line(175, 360,  75-whisker, 390+whiskerY);
line(185, 350,  55-whisker, 350);
line(175, 340,  75-whisker, 325-whiskerY); 

//right whiskers
line(325, 360,  425+whisker, 390+whiskerY);
line(315, 350,  455+whisker, 350);
line(325, 340,  425+whisker, 325-whiskerY);

// cat cheeks
noFill();
stroke(55, 55, 55);
strokeWeight(3);
ellipse(200, 350, 100, 50);
ellipse(300, 350, 100, 50);

//cat freckles! (left)
stroke(75, 75, 75);
point(200, 350);
point(215, 350);
point(230, 350);
point(207.5, 360);
point(222.5, 360);
point(192.5, 340);
point(205.7, 340);
point(222.5, 340);

//right cheek freckles
point(300, 350);
point(285, 350);
point(270, 350);
point(292.5, 360);
point(277.5, 360);
point(307.5, 340);
point(295.5, 340);
point(277.5, 340);

//iris...declaring/defining float variable eyeSize
              
               //(volume, scale of volume (0-100), rescale of volume 
float eyeSize = map(volume, 0,100, 50,100);

noStroke();
fill(216, 175, 39);
// (xy, ellipse center) var*1.4 (keep oval), var
ellipse(200, 250, eyeSize*1.4, eyeSize); 
//ellipse(200, 250,  75, 50);
ellipse(300, 250, eyeSize*1.4, eyeSize); 

//black pupil
fill(0, 0, 0);
ellipse(200, 250,  eyeSize*.75, eyeSize);
ellipse(300, 250,  eyeSize*.75, eyeSize);

}

                
                
