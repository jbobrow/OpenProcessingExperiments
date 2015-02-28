
//assign01a replicate 

//parameter
  size(640,480);
  background(223, 211, 179);
  smooth();



//top grey
noStroke();
fill(198,199,182);
quad(0,11,  422,55,   464,67,  0,61);

noStroke();
fill(198,199,182);
quad(0,67,  424,95,   418,151,  0,119);

noStroke();
fill(198,199,182);
quad(639,0,  538,38,   538,60,  639,79);



//
noStroke();
fill(216,106,49);
quad(50,93,  101,38,   144,98,  91,153);


stroke(0);
strokeWeight(5);
line(1,65,  292,88);

strokeWeight(2.5);
line(110,42,  123,22);
line(129,23,  140,46);
line(178,44,  189,26);
line(196,29,  202,50);

line(0,24,  144,77);
line(0,10,  157,67);
line(158,68,  167,58);
line(167,58,  19,0);
line(43,1,  176,52);
line(176,52,  189,42);
line(189,42,  97,0);
line(131,0,  208,34);
line(208,34,  224,27);
line(224,27,  175,0);
line(193,0,  234,24);
line(234,24,  274,13);
line(274,13,  253,0);
line(278,0,  296,10);
line(296,10,  334,4);
line(334,4,  330,0);
line(350,0,  355,4);
line(355,4,  409,0);

line(248,56,  266,31);
line(277,32,  286,59);

strokeWeight(2);
line(0,90,  588,132);
line(0,99,  499,157);
line(499,157,  521,129);



stroke(160,164,147,   230);
line(0,248,  639,322);
line(28,253,  19,353);
line(110,266,  109,374);
line(200,279,  197,383);
line(304,290,  298,414);
line(426,303,  425,433);
line(574,318,  574,449);
line(0,248,  639,322);
line(0,355,  639,455);






fill(186,189,172, 160);
quad(0,278,  636,289,  638,489,  0,478);


fill(146,144,129);
triangle(0,292,  0,304,  639,177);
triangle(0,363,  0,378,  639,200);
triangle(14,479,  49,479,  639,232);
triangle(338,479,  361,479,  642,288);
quad(597,479,  615,479,  639,450,  639, 435);

fill(17,78,129);
triangle(0,374,  0,345,  93,351);
triangle(0,374,  0,393,  638,391);

noStroke();
fill(246,181,51);
quad(0,322,  32,330,   16,367,  0,362);
fill(18,31,28);
quad(42,332,  85,341,   70,382,  46,375);
fill(246,181,51);
quad(92,342,  152,354,   129,397,  102,391);
fill(18,31,28);
quad(162,355,  225,367,   208,417,  180,410);
fill(246,181,51);
quad(236,369,  316,381,   297,438,  253,427);
fill(18,31,28);
quad(327,382,  421,394,   397,458,  340,447);
fill(246,181,51);
quad(439,395,  592,412,   564,490,  452,470);

stroke(0);
line(0,147,  374,236);
line(224,201,  494,127);


line(548,223,  639,256);

line(0,272, 122,268);
line(172,257,  374,254);
line(374,254,  376,268);
line(376,268,  0,291);
line(0,305,  65,304);

line(0,447,  112,479);
line(0,477, 9,479);

line(396,479,   451,455);
line(549,402, 639,338);



//red line
strokeWeight(3);
stroke(155, 49, 53);
line(543, 0,  558, 47);



noFill();


 
//upperright black lines
strokeWeight(0.5);
stroke(100);
line(364,4,  568,131);
line(552,121,  638,81);
line(522,102,  639,50);
line(490,83,  639,22);
line(464,66,  614,0);
line(443,49,  573,0);
line(411,34,  495,0);
line(196,29,  202,50);

 line(404,0,  494,51);
line(423,0,  489,36);
line(544,0,  595,40);
line(585,0,  625,26);



strokeWeight(2);
stroke(0);
line(10,99,  14,91);
line(20,91,  23,99);
line(39,104,  44,95);
line(50,95,  54,104);
line(71,108, 76,97);
line(80,97,  83,108);
line(109,111,  113,100);
line(118,100, 122,111);
line(158,103,  158,118);
line(199,106, 190,120);
line(207,106, 217,125);
line(242,128,  253,110);
line(261,110,  269,131);
line(307,135,  321,115);
line(327,115,  332,138);
line(382,144,  397, 120);
line(409,120,  416, 149);


//red mark
smooth();
strokeWeight(4);
stroke(168, 44, 47);
beginShape();
curveVertex(121, 256);
curveVertex(147, 256);
curveVertex(176, 249);
endShape();

 


 

 
// curves
 //long red curve
strokeWeight(2.5);
bezier(290,17,
       268,60,
       305,132,
       511,190);
       
       //short red curve
strokeWeight(2.5);
bezier(544,0,
       545,16,
       551,34,
       559,48);

//long orange curve
strokeWeight(2.5);
stroke(206,96,34);
bezier(54,132,
       26,164,
       57,233,
       638,344);
       
       //long blue curve
strokeWeight(5);
stroke(66,81,99);
bezier(606,0,
       589,29,
       598,84,
       627,117);

//long black curve near orange quad
strokeWeight(2);
stroke(0);
bezier(147,80,
       145,96,
       166,130,
       374,236);
       
       
       //small heavy red curve
strokeWeight(14);
stroke(168,45,47);
bezier(122,255,
       140,256,
       155,254,
       172,248);

//black swivel curve
strokeWeight(2);
stroke(0);
bezier(379,271,
       442,220,
       461,186,
       532,93);


//orange dot
fill(209,74,49);
noStroke();
ellipse(454,15, 15,15);


//green shapes

noStroke();
fill(94,142,128);
beginShape();
curveVertex(44,417);
curveVertex(111,422);
curveVertex(149,419);
curveVertex(193,404);
curveVertex(198,412);
curveVertex(134,432);
curveVertex(74,458);
curveVertex(53,451);
curveVertex(48,444);
curveVertex(42,432);
endShape(CLOSE);

noStroke();
fill(94,142,128);
beginShape();
curveVertex(690,120);
curveVertex(625,119);
curveVertex(614,119);
curveVertex(599,120);
curveVertex(588,138);
curveVertex(604,158);
curveVertex(628,160);
curveVertex(639,147);
endShape(CLOSE);



