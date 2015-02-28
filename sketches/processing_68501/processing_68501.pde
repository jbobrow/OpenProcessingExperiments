
size(500, 500);
background(197, 234, 239);
smooth();
//sky
noStroke();
fill(64,131,142);
rect(0,475, 500,25);
fill(70,136,147);
rect(0,450, 500,25);
fill(75,141,152);
rect(0,425, 500,25);
fill(79,146,157);
rect(0,400, 500,25);
fill(85,151,162);
rect(0,375, 500,25);
fill(91,157,167);
rect(0,350, 500,25);
fill(99,164,175);
rect(0,325, 500,25);
fill(107,170,180);
rect(0,300, 500,25);
fill(114,175,185);
rect(0,275, 500,25);
fill(121,181,191);
rect(0,250, 500,25);
fill(130,189,198);
rect(0,225, 500,25);
fill(138,194,203);
rect(0,200, 500,25);
fill(145,200,209);
rect(0,175, 500,25);
fill(155,206,214);
rect(0,150, 500,25);
fill(166,214,222);
rect(0,125, 500,25);
fill(174,219,227);
rect(0,100, 500,25);
fill(185,225,232);
rect(0,75, 500,25);
fill(194,231,237);
rect(0,50, 500,25);
fill(205,239,245);
rect(0,25, 500,25);
fill(215,245,250);
rect(0,0, 500,25);

//clouds
fill(255);
noStroke();
ellipse(479,267, 100,100);
ellipse(452,300, 70,70);
ellipse(100,167, 179,179);
ellipse(90,100, 99,99);
ellipse(30,88, 77,77);
ellipse(20,170, 122,122);

//mane
fill(247,240,168);
stroke(208, 200, 110);
strokeWeight(10);
beginShape();
vertex(400,365);
vertex(425,520);
vertex(250,520);
endShape();

//neck
fill(205);
stroke(125);
rect(200,450, 132,57);

//head
fill(205);
stroke(125);
ellipse(266,271, 335,408);

//lefteye
fill(0);
noStroke();
ellipse(173,295, 113,180);
fill(255);
ellipse(170,300, 113,180);
fill(230,188,22);
ellipse(178,284, 90,140);
fill(0);
ellipse(178,284, 60,93);
fill(255);
ellipse(200,294, 50,60);

//mane
fill(247, 240,168);
stroke(208, 200, 110);
beginShape();
vertex(392,84);
vertex(367,64);
vertex(307,34);
vertex(276,25);
vertex(215,13);
vertex(182,12);
vertex(143,23);
vertex(120,37);
vertex(86,74);
vertex(126,62);
vertex(149,60);
//mane2
vertex(104,100);
vertex(70,146);
vertex(50,186);
vertex(40,229);
vertex(76,195);
vertex(99,179);
//mane3
vertex(83,206);
vertex(74,224);
vertex(62,266);
vertex(58,300);
vertex(61,348);
vertex(120,274);
vertex(175,222);
vertex(219,198);
vertex(290,169);
//mane4
vertex(272,198);
vertex(260,213);
vertex(240,235);
vertex(283,223);
vertex(298,216);
vertex(318,202);
vertex(345,178);
vertex(381,139);
endShape();

//ear
fill(205);
stroke(125);
beginShape();
vertex(383,154);
vertex(392,94);
vertex(396,82);
vertex(410,61);
vertex(418,62);
vertex(443,84);
vertex(467,128);
vertex(473,166);
vertex(471,201);
vertex(462,232);
vertex(453,252);
vertex(427,279);
endShape();
strokeWeight(8);
beginShape();
vertex(383,154);
vertex(383,159);
endShape();
strokeWeight(6);
beginShape();
vertex(383,159);
vertex(383,164);
endShape();
strokeWeight(4);
beginShape();
vertex(383,164);
vertex(383,169);
endShape();

//innerear
beginShape();
vertex(429,118);
vertex(432,125);
vertex(435,130);
vertex(440,160);
vertex(440,165);
vertex(439,172);
vertex(439,182);
vertex(437,190);
vertex(435,198);
vertex(432,203);
endShape();

//eyelashes
noFill();
stroke(3);
beginShape();
vertex(400,237);
vertex(407,236);
vertex(417,231);
vertex(422,226);
endShape();
beginShape();
vertex(393,225);
vertex(400,221);
vertex(410,213);
vertex(415,206);
endShape();
beginShape();
vertex(385,217);
vertex(389,213);
vertex(393,205);
vertex(395,198);
endShape();

//righteye
noStroke();
fill(0);
ellipse(357,295, 113,180);
fill(255);
ellipse(360,300, 113,180);
fill(230,188,22);
ellipse(352,315, 90,140);
fill(0);
ellipse(352,315, 60,93);
fill(255);
ellipse(375,294, 50,60);

//mouth
noFill();
stroke(125);
strokeWeight(6);
beginShape();
vertex(236,435);
vertex(246,440);
vertex(256,444);
vertex(266,445);
vertex(276,444);
vertex(286,440);
vertex(296,435);
endShape();

//snout
strokeWeight(4);
beginShape();
vertex(248,355);
vertex(252,353);
vertex(266,350);
vertex(280,353);
vertex(284,355);
endShape();

//nose
strokeWeight(6);
beginShape();
vertex(286,380);
vertex(282,384);
endShape();
beginShape();
vertex(246,380);
vertex(250,384);
endShape();
