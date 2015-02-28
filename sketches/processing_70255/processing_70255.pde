
// Crysta Leong
// Creative Computing, Friday Fall 2012
// September 13, 2012


background(255,249,203);
size(194,309);

noStroke();
//red flannel
fill(255,0,0);
rect(0,250,120,59);
//yellow stripes
strokeWeight(4);
stroke(254,215,78);
line(0,290,120,290);
strokeWeight(6);
line(20,250,20,309);
strokeWeight(20);
line(70,250,70,309);
stroke(0);

//black object
fill(40);
stroke(40);
beginShape();
curveVertex(130,0);//control vertext(invisible)
curveVertex(150,0);//point
curveVertex(194,180);//point
curveVertex(0,255);//point
curveVertex(0,0);//point
curveVertex(150,0);//point that brings it around
curveVertex(80,120);//control vertext(invisible)
endShape(CLOSE);

//green object
fill(89,165,135);
stroke(88,96,58);
strokeWeight(3);
beginShape();
curveVertex(100,300);//control vertext(invisible)
curveVertex(70,270);//point
curveVertex(220,140);//point
curveVertex(160,350);//point
curveVertex(220,350);//point
curveVertex(70,270);//point that brings it around
curveVertex(300,100);//control vertext(invisible)
endShape();

//RIGHT HAND
//arm
stroke(140);
strokeWeight(2);
fill(234,174,14);
beginShape();
vertex(110,0);
vertex(160,0);
vertex(155,85);
vertex(130,75);
vertex(110,0);
endShape();
stroke(50);
fill(219,137,84);
//thumb
beginShape();
vertex(130,75);
vertex(132,75);
vertex(140,85);
vertex(117,150);
vertex(113,148);
vertex(130,75);
endShape();
noStroke();
//fingers
//1
beginShape();
vertex(132,140);
vertex(142,135);
vertex(134,170);
vertex(110,167);
vertex(118,160);
vertex(130,160);
vertex(132,150);
endShape();
//2
beginShape();
vertex(145,135);
vertex(150,130);
vertex(142,175);
vertex(120,190);
vertex(120,185);
vertex(137,165);
vertex(145,135);
endShape();
//3
beginShape();
vertex(150,130);
vertex(155,125);
vertex(157,165);
vertex(148,195);
vertex(145,193);
vertex(148,165);
vertex(150,130);
endShape();
//4
beginShape();
vertex(160,125);
vertex(165,130);
vertex(167,160);
vertex(160,175);
vertex(157,178);
vertex(160,160);
vertex(160,125);
endShape();


//back of hand
beginShape();
vertex(130,78);
vertex(155,85);
vertex(165,130);
vertex(132,140);
vertex(130,78);
endShape();

fill(219,102,20);
//LEFT HAND
beginShape();
vertex(0,0);
vertex(60,0);
vertex(90,55);
vertex(75,130);
vertex(50,130);
vertex(0,50);
vertex(0,0);
endShape();

//RIGHT LEG
stroke(80);
strokeWeight(3);
beginShape();
curveVertex(50,200);//control vertext(invisible)
curveVertex(55,115);//point
curveVertex(85,145);//point
curveVertex(0,270);//point
curveVertex(0,140);//point
curveVertex(55,115);//point that brings it around
curveVertex(0,100);//control vertext(invisible)
endShape(CLOSE);

//LEFT LEG
stroke(50);
strokeWeight(2);
beginShape();
curveVertex(50,10);//control vertext(invisible)
curveVertex(0,25);//point
curveVertex(55,105);//point
curveVertex(0,175);//point
curveVertex(0,150);//point
curveVertex(0,25);//point that brings it around
curveVertex(0,100);//control vertext(invisible)
endShape(CLOSE);

//lines in leg
strokeWeight(2);
line(0,80,15,75);
line(15,75,27,75);
//line in hand
strokeWeight(3);
line(17,0,25,58);
strokeWeight(1);
line(47,60,60,80);
line(60,80,59,112);
line(60,55,70,83);
line(70,83,65,112);
line(70,55,80,83);
line(80,83,73,115);
