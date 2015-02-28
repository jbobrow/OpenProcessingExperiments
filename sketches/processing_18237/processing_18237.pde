
size(300,200);
background(133,183,236);

//road
fill(82,81,87);
noStroke();
rectMode(CORNER);
rect(0,174,300,26);

//backwall
fill(229,228,189);
noStroke();
rectMode(CORNER);
rect(123,67,50,66);
rect(136,59,12,8);

//wall
fill(239,238,202);
noStroke();
rectMode(CORNER);
rect(23,137,251,37);
rect(142,132,13,5);
triangle(23,137,142,80,142,137);
triangle(274,137,155,80,155,137);

//blackline
stroke(60,60,60);
strokeWeight(1);
smooth();
line(142,80,23,137);
line(155,80,274,137);
line(123,67,135,67);
line(136,59,147,59);
line(148,67,172,67); 

//window
fill(99,103,88);
noStroke();
rectMode(CORNER);
rect(125,137,47,37);
quad(142,90,155,97,155,132,142,132);
rect(97,144,13,13);
rect(38,142,26,29);
rect(203,143,68,15);

noFill();
stroke(255,255,255);
strokeWeight(2);
smooth();
rect(97,144,13,13);
rect(38,142,26,29);
rect(203,143,68,15);
line(64,157,38,157);
line(51,142,51,171);
rect(218,143,13,15);
rect(244,143,13,15);

stroke(110,110,110);
strokeWeight(1);
smooth();
line(23,154,38,154);
line(64,154,97,154);
line(110,154,125,154);
line(172,154,203,154);
stroke(80,80,80);
strokeWeight(1);
smooth();
line(113,143,120,135);
line(120,135,127,130);
line(127,130,134,127);
line(134,127,142,125);
line(155,125,167,128);
line(167,128,175,132);
line(175,132,181,137);
line(181,137,186,143);
stroke(100,100,100);
line(65,142,65,172);
line(65,172,38,172);
line(111,144,111,158);
line(111,158,97,158);
line(272,143,272,159);
line(272,159,203,159);


//grass
fill(201,216,125);
noStroke();
quad(0,174,163,174,151,200,0,200);
quad(238,173,300,174,300,187,247,184);
ellipseMode(CENTER);
ellipse(219,177,17,6);
quad(240,173,247,184,219,180,219,174);

