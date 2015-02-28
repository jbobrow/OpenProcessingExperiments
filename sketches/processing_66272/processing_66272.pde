
size(187,175);
background(253,234,201);
smooth();

int orange = color(236,109,66);


// PURPLE STAR ------------
fill(144,134,194);
noStroke();
beginShape();
vertex(187,137);
vertex(177,139);
vertex(181,166);

vertex(170,168);
vertex(152,147);
vertex(148,167);

vertex(138,166);
vertex(133,157);
vertex(97,160);

vertex(88,154);
vertex(136,122);
vertex(145,78);

vertex(154,79);
vertex(158,118);
vertex(187,125);
endShape(CLOSE);


// ORANGE STAR BIT, bottom right
fill(orange);
ellipse(178,179,25,25);



// CURVY LINE ------------------
//beginShape();
//curveVertex();
//endShape();



// BLACK STAR BITS ---------

fill(0);
beginShape();
vertex(181,166);
vertex(182,175);
vertex(175,175);
vertex(170,168);
endShape(CLOSE);

beginShape();
vertex(148,167);
vertex(147,175);
vertex(141,175);
vertex(138,166);
endShape(CLOSE);

beginShape();
vertex(97,160);
vertex(73,161);
vertex(88,154);
endShape(CLOSE);

beginShape();
vertex(145,78);
vertex(151,46);
vertex(154,79);
endShape(CLOSE);

// DUMBBELL DOTS -------------
ellipse(126,78,10,10);
ellipse(175,80,6,6);


// DOTS ON THE SIDE ----------

ellipse(0,120,10,10);
ellipse(0,140,10,10);


// ORANGE STAR BITS -----------
fill(236,109,66);
beginShape();
curveVertex(138,163);
curveVertex(138,163);
curveVertex(112,172);
curveVertex(112,172);
vertex(113,175);
vertex(140,175);
endShape(CLOSE);




fill(0);
beginShape();
vertex(138,166);
vertex(138,166);
vertex(133,157);
vertex(97,160);
vertex(112,173);
curveVertex(123,167);
curveVertex(123,167);
curveVertex(138,166);
curveVertex(138,166);
endShape();






// WEIRD CURVE AT BOTTOM ---------
fill(0);
beginShape();
curveVertex(102,175);
curveVertex(102,175);
curveVertex(84,166);
curveVertex(64,173);
curveVertex(74,175);
curveVertex(74,175);
endShape(CLOSE);


// BIG BLACK CIRCLE -------------
fill(0);
ellipse(53,58,120,93);





// CONCENTRIC CIRCLES (inner black) ---------
ellipse(58,161,24,21);


// LINE AT TOP OF STAR --------------
stroke(0);
strokeWeight(1);
line(175,80,130,76);


// STARS (top to bottom) -----------------------
line(143,0,142,16);
line(137,0,148,16);
line(150,0,136,15);
line(133,7,151,8);

line(179,1,174,31);
line(166,3,187,31);
line(161,14,187,19);
line(160,28,187,11);

line(171,52,171,73);
line(163,61,182,61);
line(164,54,183,72);
line(178,53,161,72);




// SMALLER BLACK CIRCLES --------
fill(0);
ellipse(100,100,39,39);
ellipse(56,106,11,11);
ellipse(7,90,24,30);
ellipse(5,22,17,17);
ellipse(70,15,18,18);
ellipse(100,34,12,12);
ellipse(110,59,28,24);

fill(236,109,66); // orange
ellipse(0,44,12,12);



// INNER ORANGE BITS ------------
fill(236,109,66); // orange

bezier(62,13,62,24,74,25,78,19);
bezier(96,30,92,38,99,42,106,37);
bezier(113,48,90,49,104,74,113,71);
bezier(106,83,102,80,80,86,81,101);
bezier(61,105,62,99,51,101,50,106);
bezier(19,98,33,80,7,72,0,78);
bezier(13,20,16,23,11,31,5,30);


// UPPER DUMBBELLS -----------------------
fill(0);
ellipse(96,13,15,15);
ellipse(119,5,13,13);
line(96,13,119,5);


// WHISPY BLACK SHIT ON THE LEFT -----------
noFill();
beginShape();
vertex(88,154);

vertex(80,148); // eyelash right
vertex(76,144); // eyelash 2
vertex(71,141); // eyelash 3
vertex(65,136); // eyelash 4
curveVertex(53,127);
curveVertex(45,123);
curveVertex(35,131);
curveVertex(40,136);
curveVertex(48,133);
curveVertex(52,137);
curveVertex(53,146);
curveVertex(40,155); // black and orange thing meeting point
curveVertex(36,158); // black and orange thing meeting point
curveVertex(30,161);
curveVertex(19,171);
curveVertex(8,175);
curveVertex(8,175);
endShape();

// EYELASHES
bezier(80,148,83,144,95,139,102,137);
bezier(76,144,84,134,101,126,105,127);
bezier(71,141,78,137,79,114,76,110);
bezier(65,136,72,129,69,118,66,114);

// EYELASHES NEAR THE STAR
bezier(158,115,157,113,167,105,171,103);
bezier(160,119,163,114,180,106,183,106);
bezier(166,120,167,117,178,112,181,112);

bezier(148,167,151,167,155,170,155,170);


// BLACK AND ORANGE SQUIGGLE ON THE LEFT
fill(0);
noStroke();
beginShape();
vertex(41,156);
curveVertex(27,132);
curveVertex(24,136);
curveVertex(24,128);
curveVertex(27,122);
curveVertex(20,130);
curveVertex(19,141);
curveVertex(36,158);
curveVertex(36,158);
endShape();

fill(orange);
beginShape();
vertex(41,156);
curveVertex(43,159);
curveVertex(43,160);
curveVertex(45,166);
curveVertex(50,172);
curveVertex(53,174);
curveVertex(45,174);
curveVertex(36,158);
curveVertex(36,158);
endShape();

// CONCENTRIC CIRCLES (outer circle) ---------
stroke(0);
strokeWeight(2);
fill(236,109,66); // orange
ellipse(58,161,24,21);

noStroke();
fill(0);
ellipse(58,163,9,9);

