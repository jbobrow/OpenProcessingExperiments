
// HW #2
// Written by Kevin Kuntz
// Andrew ID: kkuntz
// © Kevin Kuntz  January 2014 Pittsburgh, Pa 15213  All Rights reserved

//Background
size(400,400);
background(80,210,210);

//Charicature
float hx = 100;
float hy = 100;
float hwd = 200;
float hht = 200;
  //hair
noStroke();
fill(115,130,130);
rect(hx + -.075 * hwd, hy + .3 * hht, 1.125 * hwd, .3*hht, 10);
  //head
noStroke();
fill(225,200,145);
rect(hx,hy,hwd,hht,25);
  //eyes
noStroke();
fill(0);
ellipse(hx + .25 * hwd, hy + .5 * hht, 10,10);
ellipse(hx + .75 * hwd, hy + .5 * hht, 10,10);
  //eyebrows and moustach
noStroke();
fill(115,130,130);
rect(hx + .0625 * hwd, hy + .3 * hht, .375 * hwd, .125 * hht, 10);
rect(hx + .5625 * hwd, hy + .3 * hht, .375 * hwd, .125 * hht, 10);
rect(hx + .125 * hwd, hy + .7 * hht, .75 * hwd, .375 * hht, 10,10,0,0);
  //ears
noStroke();
fill(225,200,145);
beginShape();
  vertex(hx, hy + .45 * hht);
  bezierVertex(hx + -.1 * hwd, hy + .46 * hht, hx + -.1 * hwd, hy + .56 * hht, hx , hy + .57 * hht);
endShape();
beginShape();
  vertex(hx + hwd, hy + .45 * hht);
  bezierVertex(hx + 1.1 * hwd, hy + .46 * hht, hx + 1.1 * hwd, hy + .56 * hht, hx + hwd, hy + .57 * hht);
endShape();
  //nose
stroke(0);
beginShape();
  vertex(hx + .62 * hwd, hy + .6 * hht);
  bezierVertex(hx + .68 * hwd, hy + .8 * hht, hx + .32 * hwd, hy + .8 * hht,  hx + .38 * hwd, hy + .6 * hht);
endShape();

//INITIALS
  //Chosen Initial from KDK is the letter D used to make the glasses
float inx = hx + .25 * hwd;
float iny = hy + .42 * hht;
float inwd = 80;
float inht = 90;

//frames
fill(0);
noStroke();
rect(hx, hy + .41 * hht,hwd,5);

//left D
noFill();
noStroke();
ellipse(inx,iny,inwd,inwd);
strokeWeight(5);
stroke(225,10,15);
fill(255,220);
beginShape();
  vertex(inx - .47 * inwd, iny);
  bezierVertex(inx - .3 * inwd, iny + .6 * inht, inx + .3 * inwd, iny + .6 * inht, inx + .47 * inwd, iny);
endShape(CLOSE);

//right D
translate(.5 * hwd, 0);
beginShape();
  vertex(inx - .47 * inwd, iny);
  bezierVertex(inx - .3 * inwd, iny + .6 * inht, inx + .3 * inwd, iny + .6 * inht, inx + .47 * inwd, iny);
endShape(CLOSE);
noFill();













