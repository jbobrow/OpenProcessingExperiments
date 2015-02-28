
//Assignment 1
//Name: Graham Barrett
//E-mail: rbarrett@haverford.edu
//Course: CS 110 - Section 01
// Submitted: 9/12/2012
//The first sketch created for CS -110 for Assignment 1
// This is a sketch of a Dalmatian Dog head

size(1000,1000);
background(150,100,150);
smooth();

// head
stroke(0);
fill(255);
ellipse(500,500,500,500);

// ear 1
fill(255);
stroke(255);
ellipse(280,215,240,240);

// eardrum 1
fill(255,150,150);
ellipse(320,270,102,102);

// spot 1
fill(10);
stroke(255);
ellipse(215,150,50,55);

// spot 2
fill(10);
stroke(255);
ellipse(190,250,40,60);

// ear 2
fill(255);
stroke(255);
ellipse(720,215,240,240);

// eardrum 2
fill(255,150,150);
ellipse(680,270,102,102);

// spot 3
fill(10);
ellipse(680,165,100,94);

// nose
fill(75);
stroke(50);
ellipse(500,500,150,65);

// nostril 1
fill(0);
stroke(50);
ellipse(470,515,50,25);

// nostril 2
fill(0);
stroke(50);
ellipse(530,515,50,25);

// eye 1
fill(255);
stroke(0);
ellipse(440,385,50,175);

// pupil 1
fill(0);
stroke(255);
ellipse(450,418,20,76);

// spot 4
fill(10);
ellipse(585,360,165,145);

// eye 2
fill(255);
stroke(0);
ellipse(560,385,50,175);

// pupil 2
fill(0);
stroke(255);
ellipse(550,418,20,76);

// spot 5
fill(10);
ellipse(310,500,120,150);

// spot  6
fill(10);
stroke(255);
ellipse(515,270,20,20);

// spot 7
fill(10);
stroke(255);
ellipse(738,500,30,80);

// mouth
fill(255,0,0);
stroke(75);
ellipse(500,650,350,150);

// tongue
fill(255,150,150);
stroke(255,0,0);
ellipse(540,675,170,110);

// tongue line
smooth();
stroke(0);
strokeWeight(5);
line(540,645,540,705);
