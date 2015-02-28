
size(600,600);

background(255);

//green background//
fill(131,189,66);
noStroke();
rect(40,40,520,520,   70,70,70,70);

//tv legs//

fill(126,104,82);
ellipse(140,440,30,30);
fill(130,89,76);
beginShape();
vertex(130,430);
vertex(155,435);
vertex(149,448);
vertex(130,440);
endShape(CLOSE);

fill(131,189,66);
noStroke();
rect(107,430,30,30);


fill(126,104,82);
ellipse(460,440,30,30);
fill(130,89,76);
beginShape();
vertex(470,430);
vertex(460,430);
vertex(465,448);
vertex(470,440);
endShape(CLOSE);

fill(131,189,66);
noStroke();
rect(463,430,30,30);

//tv body//
fill(126,104,82);
strokeWeight(2);
stroke(130,89,76,60);
rect(110,160,380,280,  10,10,10,10);

//screen shadow//
fill(130,89,76,80);
rect(128,175,345,180,  10,10,10,10);

//screen//
fill(174,152,133);
rect(130,180,340,172,  8,8,8,8);

//panel//
fill(184,120,67);
strokeWeight(1);
stroke(130,89,76,70);
rect(190,365,215,34,  3,3,3,3);

strokeWeight(1);
stroke(250,236,218);
line(225,388,250,388);
line(255,388,280,388);
line(285,388,310,388);
line(315,388,340,388);
line(345,388,370,388);

line(240,392,260,392);
line(272,392,292,392);
line(302,392,323,392);
line(336,392,355,392);


//green button shadow//
noStroke();
fill(111,50,46,70);
rect(225,405,27,17,  1,1,1,1);
rect(255,405,27,17,  1,1,1,1);
rect(285,405,27,17,  1,1,1,1);
rect(315,405,27,17,  1,1,1,1);
rect(345,405,27,17,  1,1,1,1);

//green buttons below panel//
noStroke();
fill(38,169,136);
rect(226,406,25,14,  1,1,1,1);
rect(256,406,25,14,  1,1,1,1);
rect(286,406,25,14,  1,1,1,1);
rect(316,406,25,14,  1,1,1,1);
rect(346,406,25,14,  1,1,1,1);

//red knobs//
noStroke();
fill(233,40,55);
ellipse(181,390,14,14);
fill(215,40,60);
ellipse(181,390,12,12);
fill(255,255,255,90);
ellipse(179,387,5,4);

fill(233,40,55);
ellipse(414,390,14,14);
fill(215,40,60);
ellipse(414,390,12,12);
fill(255,255,255,90);
ellipse(412,387,5,4);

//green knob//

noStroke();
fill(126,111,95);
ellipse(442,212,24,24);

fill(38,169,136);
ellipse(440,210,24,24);

fill(255,255,255,90);
ellipse(435,204,4,3);




