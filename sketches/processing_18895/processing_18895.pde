
size(640,480);
background(231,249,249);
smooth();

//large ellipse; needs to be more precise
fill(20,44,116);
ellipse(800,-55,1675,700);

//white diagonal bar
strokeWeight(.5);
fill(231,249,249);
quad(17,480,280,0,323,0,58,480);

//large red shape
noStroke();
fill(203,0,22);

beginShape();
//16 lines
vertex(167,307);
vertex(174,248);
vertex(191,248);
vertex(191,261);
vertex(293,271);
vertex(293,257);
vertex(334,259);
vertex(334,253);
vertex(368,255);
vertex(370,240);
vertex(378,240);
vertex(378,233);
vertex(387,233);
vertex(387,242);
vertex(392,242);
vertex(393,235);
vertex(426,235);

//16 lines
vertex(426,247);
vertex(444,247);
vertex(444,239);
vertex(474,240);
vertex(470,282);
vertex(463,282);
vertex(460,322);
vertex(437,320);
vertex(435,336);
vertex(429,337);
vertex(428,346);
vertex(415,345);
vertex(415,349);
vertex(379,346);
vertex(379,338);
vertex(402,339);
vertex(402,334);

//8 lines
vertex(337,327);
vertex(337,316);
vertex(210,304);
vertex(210,308);
vertex(195,307);
vertex(195,302);
vertex(185,301);
vertex(185,309);

endShape(CLOSE);


//large dark blue shape
noStroke();
fill(9,23,36);

beginShape();
//21 lines - right
vertex(13,251);
vertex(69,226);
vertex(75,242);
vertex(64,247);
vertex(107,344);
vertex(121,338);
vertex(138,372);
vertex(144,370);
vertex(158,400);
vertex(172,394);
vertex(176,402);
vertex(183,399);
vertex(187,406);
vertex(179,409);
vertex(181,414);
vertex(187,412);
vertex(202,441);
vertex(194,445);
vertex(203,462);
vertex(213,457);
vertex(225,480);

//13 lines - left
vertex(97,480);
vertex(87,455);
vertex(94,451);
vertex(103,471);
vertex(109,468);
vertex(81,408);
vertex(92,403);
vertex(39,286);
vertex(34,288);
vertex(28,273);
vertex(32,271);
vertex(28,264);
vertex(22,267);
endShape(CLOSE);

//far left bottom rect
noStroke();
fill(74,96,143);
quad(1,444,56,419,62,433,7,459);


//middle white rectangles
fill(231,249,249);
    //hammer
beginShape();
vertex(300,97);
vertex(309,82);
vertex(320,87);
vertex(369,0);
vertex(414,0);
vertex(354,105);
vertex(363,110);
vertex(354,127);
endShape(CLOSE);
    //line
stroke(0);
line(320,87,354,105);

//small rect
quad(344,71,371,87,363,100,336,84);
    //lines
line(352,77,345,89);
line(356,79,349,92);

line(360,81,355,89);
line(355,89,366,95);


//Top left shapes

fill(9,23,36);
quad(0,63,28,92,14,102,0,90);
fill(34,63,93);
triangle(0,90,5,95,0,99);

//Bottom right shapes

fill(9,23,36);
quad(482,476,500,442,572,480,487,480);

fill(34,63,93);
noStroke();
beginShape();
vertex(461,476);
vertex(489,422);
vertex(506,432);
vertex(481,480);
vertex(470,480);
endShape(CLOSE);

fill(203,0,22);
noStroke();
quad(502,460,514,467,507,480,490,480);

fill(137,124,144);
quad(498,466,511,473,509,477,496,470);

fill(34,63,93);
triangle(597,480,600,475,608,480);


//3D Portion
//Dark
fill(9,23,36);
quad(233,65,268,85,269,136,233,119);

//Med
fill(34,63,93);
quad(268,85,315,0,346,0,269,136);

//Light
fill(112,139,168);
quad(233,65,270,0,315,0,268,85);

//Red1
fill(203,0,22);
quad(231,45,259,59,259,70,231,54);

//Red2
quad(223,82,277,112,270,122,217,93);

//Red3
quad(320,28,336,0,348,6,332,34);

//White1
fill(231,249,249);
quad(320,28,332,34,332,51,320,45);

//Black1
fill(9,23,36);
quad(332,34,348,6,348,21,332,51);

//White2
fill(231,249,249);
quad(217,93,270,122,270,125,217,96);

//White3
//fill(0);
//strokeWeight(1);
fill(231,249,249);
quad(270,122,277,112,277,116,270,125);

//G1
fill(231,249,249);
quad(259,60,268,49,268,59,259,70);

//B2
fill(9,23,36);
quad(231,45,259,60,268,49,238,33);

//L1
fill(112,139,168);
quad(233,33,250,43,256,35,238,24);

//G2
fill(34,63,93);
quad(233,43,250,53,250,43,233,33);

//D1
fill(41,57,80);
quad(250,43,256,35,256,44,250,53);

//G3
fill(34,63,93);
quad(234,24,240,27,240,35,234,32);

//W4
fill(231,249,249);
quad(240,27,244,21,244,31,240,35);

//B3
fill(9,23,36);
quad(234,24,238,17,244,21,240,27);

