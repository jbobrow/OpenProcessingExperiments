
size(640,480);
background(0);

smooth();

//moon shape
stroke(255,255,0,120);
strokeWeight(20);
fill(80);
beginShape();
vertex(373,height - 347);
vertex(335,height - 373);
vertex(282,height - 380);
vertex(211,height - 340);
vertex(180,height - 256);
vertex(202,height - 158);
vertex(261,height - 106);
vertex(351,height - 97);
vertex(423,height - 131);
vertex(451,height - 200);
vertex(433,height - 262);
vertex(414,height - 201);
vertex(370,height - 171);
vertex(321,height - 172);
vertex(281,height - 206);
vertex(264,height - 253);
vertex(271,height - 307);
vertex(320,height - 349);
endShape(CLOSE);

//craters
fill(180);
noStroke();
ellipse(285,height - 353,27,27);
ellipse(239,height - 319,19,19);
ellipse(210,height - 251,38,38);
ellipse(251,height - 213,29,29);
ellipse(265,height - 134,33,33);
ellipse(305,height - 150,14,14);
ellipse(358,height - 137,21,21);
ellipse(409,height - 139,12,12);
ellipse(403,height - 175,16,16);

//flagpole
stroke(255);
strokeWeight(2);
line(275,height - 222,317,height - 257);

//flag outline
noStroke();
strokeWeight(2);
strokeWeight(1);
fill(198,0,0);
quad(317,height - 257,339,height - 275,370,height - 243,345,height - 222);

//blue box
fill(11,0,173);
quad(328,height - 266,339,height - 275,352,height - 261,341,height - 252);

//red stripes
fill(255);
quad(352,height - 261,370,height - 243,364,height - 238,347,height - 257);
quad(328,height - 266,322,height - 261,352,height - 228,358,height - 233);

