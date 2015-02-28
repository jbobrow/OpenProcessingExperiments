
//Deanna Hagopian
//Julie Mehretu Assignment

size(500, 500);
smooth();
background(198, 195, 162);

//yellow bottom right corner
fill(232, 182, 47);
noStroke();
triangle(500,445,  250,500,  500,500);

//grey top right corner
fill(154, 164, 155);
triangle(500,140,  280,0,  500,0);

//background shapes on top left corner
//peach
noFill();
stroke(221, 177, 150);
strokeWeight(18);
line(0,17,  500,50);

//purple
fill(46, 42, 77, 240);
noStroke();
quad(0,145,  0,183,  120,275,  172,275);

//teal
fill(0, 131, 95, 150);
quad(24,193,  21,25,  115,43,  115,205);

//blue
fill(31, 47, 98);
quad(0,10,  0,140,  38,140,  33,10);

//pink
fill(173, 74, 103);
quad(86,49,  91,102,  250,89,  250,27); //----------NEEDS CURVE

//attempt at a quad with curved side
//beginShape();
//curveVertex(91,102);
//curveVertex(121,93);
//curveVertex(159,86);
//curveVertex(198,84);
//curveVertex(230,86);
//curveVertex(250,89);
//point(86,49);
//point(250,27);
//endShape();

//other background shapes
//purple
fill(46, 42, 77, 240);
quad(150,198,  183,198,  302,284,  266,284);

//white
fill(208, 217, 214);
noStroke();
quad(193,270,  193,307,  236,340,  236,314);

quad(265,346,  277,353,  278,403,  266,400);

quad(57,475,  73,472,  140,500,  109,500);

quad(23,389,  45,385,  162,462,  140,464);

quad(226,486,  252,480,  282,500,  254,500);

quad(276,403,  298,399,  376,458,  358,462);

quad(404,492,  432,492,  439,500,  413,500);

triangle(478,422,  500,419,  500,448);

fill(208, 217, 214, 220);
quad(155,195,  250,204,  248,89,  155,97);

//navy shapes
fill(40, 86, 119, 230);
quad(402,187,  447,190,  447,287,  410,284);

fill(40, 64, 128);
quad(500,108,  473,108,  488,177,  500,177);

//orange circle1
fill(219, 138, 72);
ellipse(360,122,  67,67);

//orange circle2
fill(222, 119, 60);
ellipse(474,136,  67,67);

//green
fill(35, 73, 48, 220);
quad(275,-10,  270,185,  354,224,  355,43);

//top brown line
noFill();
stroke(101, 66, 47);
strokeWeight(10);
strokeCap(SQUARE);
line(67,1,  438,73);

//right white rectangle
fill(208, 217, 214);
noStroke();
quad(361,55,  361,82,  500,105,  500,80);

//aqua rectangle
fill(0, 159, 179);
quad(374,418,  374,400,  354,397,  355,420);

//red shapes from top to bottom
fill(191, 44, 50);
quad(0,15,  26,15,  25,27,  0,27);

quad(140,147,  57,200,  63,271,  146,230); //---------NEEDS CURVE

quad(298,170,  298,184,  267,209,  245,209);

quad(377,205,  377,216,  419,219,  412,205);

quad(117,172,  157,223,  153,334,  117,315);

quad(193,307,  193,333,  235,359,  235,341);

quad(277,354,  286,360,  286,404,  277,402);

quad(311,382,  311,399,  333,403,  333,388);

triangle(0,264,  24,264,  0,283);

triangle(48,384,  71,394,  56,424);

triangle(0,467,  16,474,  0,500);

triangle(212,431,  233,445,  221, 469);

triangle(341,384,  360,395,  352,420);

triangle(389,408,  406,380,  426,380);

//grey
fill(154, 164, 155);
quad(163,186,  190,186,  197,453,  175,453);

quad(249,251,  278,251,  278,369,  252,369);

quad(382,210,  409,210,  409,324,  382,324);

//light pastel blue triangles
fill(179,199,208);
triangle(14,281,  10,304,  -5,286);

triangle(71,491,  91,500,  72,500);

triangle(144,494,  139,467,  156,468);

triangle(128,410,  139,445,  146,422);

triangle(188,378,  208,389,  195,416);

triangle(251,446,  274,459,  260,482);

triangle(265,406,  286,415,  276,444);

//white irregular shape
fill(208, 217, 214);
beginShape();
vertex(108,284);
vertex(105,337);
vertex(151,340);
vertex(121,309);
vertex(149,308);
endShape(CLOSE);

triangle(120,184,  158,220,  145,280);

//lavendar rectangle
fill(117, 132, 171);
quad(369,436,  459,437,  459,420,  369,418);

//green
fill(35, 73, 48);
quad(311,399,  333,403,  333,415,  311,411);

fill(35, 73, 48, 220);
triangle(377,401,  396,410,  385,436);

triangle(228,390,  249,404,  236,429);

triangle(288,457,  308,469,  303,492);

triangle(234,490,  226,510,  215,480);

quad(256,339,  266,346,  266,400,  258,397);

//light pastel blue triangle
fill(179,199,208);
triangle(303,370,  325,386,  310,413);

noFill();
stroke(191, 44, 50);
strokeWeight(7);
strokeCap(SQUARE);
line(496,200,  496,291);

//colorful rectangles near W shape
//tan
noStroke();
fill(172, 136, 74);
quad(314,204,  355,221,  359,278,  316,271);

//red
fill(191, 44, 50);
quad(223,198,  229,221,  316,232,  319,209);

//grey
fill(125, 119, 103);
quad(293,225,  318,226,  320,290,  293,290);

quad(438,218,  457,218,  460,276,  438,276);

//blue
noFill();
stroke(41, 68, 145);
strokeWeight(20);
line(290,232,  290,274);

//short blue curve
stroke(34, 74, 162);
strokeWeight(3);
beginShape();
curveVertex(472,146);
curveVertex(462,156);
curveVertex(299,161);
curveVertex(192,179);
curveVertex(50,215);
curveVertex(40,225);
endShape();

//dark brown curves
stroke(54, 31, 23);
strokeWeight(8);
line(-2,277,  357,313);

strokeWeight(6);
line(-2,130,  335,186);

//orange W shape
fill(222, 119, 60);
noStroke();
beginShape();
vertex(300,80);
vertex(313,77 );
vertex(376,305);
vertex(386,274);
vertex(337,96);
vertex(349,93);
vertex(391,249);
vertex(407,198);
vertex(417,202);
vertex(397,274);
vertex(410,319);
vertex(440,214);
vertex(453,217);
vertex(411,366);
vertex(392,296);
vertex(375,349);
endShape(CLOSE);

//red circle with quad
fill(191, 44, 50);
quad(423,252,  423,272,  481,272,  481,255);

ellipse(446,252,  25,25); //--------------------- NEEDS TO BE HALF MASK

//light pastel blue
noFill();
stroke(178,198,205);
strokeWeight(15);
line(329,151,  368,151);

//black
fill(0);
noStroke();
triangle(33,474,  40,510,  55,490);

triangle(88,397,  96,438,  110,411);

triangle(161,426,  172,462,  183,439);

triangle(178,465,  184,502,  197,481);

triangle(248,495,  248,500,  261,500);

triangle(299,420,  309,456,  321, 433);

triangle(323,476,  346,485,  334,505);

//purple plus sign
noFill();
stroke(69, 50, 78);
strokeWeight(6);
line(479,133,  479,178);  
line(458,155,  500,155);

//dots
//blue
fill(62, 102, 153);
noStroke();
ellipse(231,231,  13,13);

ellipse(292,240,  13,13);

fill(0, 157, 166);
ellipse(500,397,  30,30);  

//pattern
noFill();
stroke(64, 156, 195);
strokeWeight(5);
line(288,328,  294,328);
line(339,333,  345,334);
line(380,337,  384,338);
line(421,346,  426,347);
line(462,351,  470,353);

stroke(211, 116, 48);
strokeWeight(8);
line(352,334,  369,337);
line(394,340,  408,343);
line(278,324,  283,325);

strokeWeight(10);
line(302,328,  328,331);
line(430,345,  453, 348);

//blue shapes
fill(11, 90, 157);
noStroke();
quad(193,333,  194,361,  236,375,  235,358);

triangle(447,392,  392,409,  446,401);

//curves
//black curve
noFill();
stroke(0);
strokeWeight(3);
beginShape();
curveVertex(510,10);
curveVertex(500,20);
curveVertex(434,69);
curveVertex(367,133);
curveVertex(324,187);
curveVertex(300,266);
curveVertex(305,326);
curveVertex(327,372);
curveVertex(350,403);
curveVertex(360,413);
endShape();

//short black curve
stroke(0);
strokeWeight(3);
beginShape();
curveVertex(298,-10);
curveVertex(288,0);
//curveVertex(258,26);
curveVertex(196,76);
//curveVertex(180,95);
curveVertex(159,124);
curveVertex(136,175);
curveVertex(128,228);
curveVertex(118,238);
endShape();

//blue curve
stroke(34, 74, 162);
strokeWeight(3);
beginShape();
curveVertex(-10,52);
curveVertex(-2,49);
curveVertex(40,43);
curveVertex(120,34);
curveVertex(178,30);
curveVertex(289,21);
curveVertex(365,26);
curveVertex(393,29);
curveVertex(426,34);
curveVertex(470,43);
curveVertex(500,52);
curveVertex(510,62);
endShape();

//lines
//navy line
noFill();
stroke(27,46,112);
strokeWeight(2);
line(29,28,  157,500);

line(166,0,  232,279);

line(182,176,  225,351);

line(225,351,  237,242);

line(346,0,  438,339);

line(416,130,  474,349);

line(474,349,  500,252);

line(-5,376,  175,383);

//blue strips
fill(1, 122, 179);
noStroke();
quad(240,366,  246,372,  247,423,  241,424);

quad(262,371,  268,366,  269,425,  262,423);

//pastel blue
stroke(82, 145, 189);
strokeWeight(8);
line(100,500,  -5,172);

line(133,500,  175,260);

//dark grey
stroke(126, 143, 169);
line(418,80,  302,-5);

//yellow
noStroke();
fill(228, 183, 58);
quad(22,176,  29,180,  83,178,  83,173);

quad(29,199,  23,205,  83,204,  83,200);

//red
noFill();
stroke(191, 64, 49);
strokeWeight(4);
line(81,479,  35,510);

//blue shapes
stroke(40, 70, 143);
strokeWeight(18);
line(251,59,  253,128);

noStroke();
fill(20, 121, 173);
quad(344,116,  339,122,  346,126,  353,121);

quad(344,130,  339,136,  346,142,  354,136);

quad(350,127,  356,133,  365,128,  356,123);

