
// Kevin Kan HW #2 
//Copyright © 2014

size(400, 400);
background(205, 186, 222);

//Variables
float x, y, wd, ht;
x=200;
y=200;
wd=200;
ht=200;

//head
fill(237, 181, 165);
noStroke();
ellipse(x,y, wd, ht);

//ears
ellipse(x-wd*.55, y, wd*.25, ht*.25); 
ellipse(x+wd*.55, y, wd*.25, ht*.25);

//Initial "K" Glasses 
// the glasses and the bags under the eyes make the k. 
//It is kind of spread out and pretty hidden.

stroke(0,0,0);
strokeWeight(7);

//Left Eye
fill(255,255,255);
stroke(222, 175, 175);
beginShape();
  curveVertex(x-wd*.25, y-ht*.25);
  curveVertex(x-wd*.03,y);
  curveVertex(x-wd*.22, y+ht*.18);
  curveVertex(x-wd*.42, y+ht*.05);
  curveVertex(x-wd*.46, y-ht*.1);
endShape();

//Right eye
beginShape();
  curveVertex(x+wd*.25, y-ht*.25);
  curveVertex(x+wd*.03,y);
  curveVertex(x+wd*.22, y+ht*.18);
  curveVertex(x+wd*.42, y+ht*.05);
  curveVertex(x+wd*.46, y-ht*.1);
endShape();

//eyes
noStroke();
fill(103,69,36);
ellipse(x-wd*.22, y+ht*.06, wd*.15, ht*.15);
ellipse(x+wd*.22, y+ht*.06, wd*.15, ht*.15);

//frames
noFill();
stroke(0,0,0);
strokeWeight(7);
ellipse(x-wd*.23, y, .43*wd, .43*ht);
ellipse(x+wd*.23, y, .43*wd, .43*ht);

noFill();
noStroke();

//Forehead Mask
fill(237, 181, 165);
beginShape();
  vertex(x-wd*.5, y);
  vertex(x-wd*.35, y-ht*.35);
  vertex(x+wd*.35, y-ht*.35);
  vertex(x+wd*.5, y);
endShape(CLOSE);
noFill();

//Frame Cont.
stroke(0,0,0);
strokeWeight(7);
noFill();

//forehead
stroke(209,163,156);
strokeWeight(7);

//Bridge
stroke(0,0,0);
strokeWeight(7);
noFill();
beginShape();
  vertex(x-wd*.49, y-ht*.11);
  vertex(x-wd*.5, y);
  vertex(x+wd*.5, y);
  vertex(x+wd*.49, y-ht*.11);
endShape();


//eyebrows
stroke(144,144,144);
strokeWeight(20);

beginShape();
  vertex(x-wd*.1, y-ht*.08);
  vertex(x-wd*.3, y-ht*.1);
endShape();

beginShape();
  vertex(x+wd*.1, y-ht*.08);
  vertex(x+wd*.3, y-ht*.1);
endShape();

//Stache
beginShape();
  curveVertex(x-wd*.5, y+ht*.5);
  curveVertex(x-wd*.2, y+ht*.35);
  curveVertex(x, y+ht*.3);
  curveVertex(x+wd*.2, y+ht*.35);
  curveVertex(x+wd*.5, y+ht*.5);
endShape();

//Nose
fill(237, 181, 165);
noStroke();
ellipse(x, y+.24*ht, wd*1/8, ht*1/8);
  
//hair
fill(144,144,144);

ellipse(x, y-.43*ht, wd*.575, ht*.2);

//initials part II (ears)
stroke(209,163,156);
strokeWeight(7);

//Left
noFill();
beginShape();
  vertex(x-.55*wd, y-ht*.05);
  vertex(x-.55*wd, y+ht*.05);
endShape();

beginShape();
  vertex(x-.6*wd, y-ht*.04);
  vertex(x-.57*wd, y);
  vertex(x-.6*wd, y+ht*.04);
endShape();

//Right
beginShape();
  vertex(x+.55*wd, y-ht*.05);
  vertex(x+.55*wd, y+ht*.05);
endShape();

beginShape();
  vertex(x+.6*wd, y-ht*.04);
  vertex(x+.57*wd, y);
  vertex(x+.6*wd, y+ht*.04);
endShape();











