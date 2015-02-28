
// Workshop 1a

size(640, 480);
smooth();
background(220,215,185);


noStroke();
fill(59,54,51);
quad(0,0, 478,0, 469,142, 0,73);
quad(192,217, 273,217, 277,250, 192,252);

fill(54,83,61);
rect(490,377, 66,10);

fill(187,107,106);
quad(350,246, 434,247, 434,350, 351,350);

//gray shape!
beginShape();
noStroke();
fill(174,184,173);
vertex(0,234);
bezierVertex(0,234, 228,332, 319,280);
bezierVertex(319,280, 132,271, 0,50);
endShape();

beginShape(); //TROUBLE
vertex(62,0);
bezierVertex(62,0, 99,57, 363,269);
bezierVertex(363,269, 234,304, 339,0);
endShape();

beginShape(); //TROUBLE
vertex(0,234);
bezierVertex(0,234, 228,332, 319,280);
bezierVertex(319,280, 132,271, 0,50);
endShape();

beginShape();
vertex(0,325);
bezierVertex(0,325, 213,387, 303,293);
bezierVertex(303,293, 115,355, 0,269);
endShape();

beginShape(); 
vertex(0,347);
bezierVertex(55,378, 165,412, 303,315);
vertex(303,315);
vertex(306,325);
vertex(113,430);
vertex(0,391);
endShape();

beginShape(); 
vertex(155,438);
bezierVertex(204,421, 253,437, 312,329);
vertex(312,329);
vertex(319,334);
vertex(251,453);
vertex(212,453);
endShape();

beginShape(); 
vertex(276,479);
bezierVertex(299,460, 313,448, 344,349);
vertex(344,349);
vertex(359,349);
vertex(346,479);
endShape();

beginShape(); 
vertex(389,464);
bezierVertex(380,439, 375,383, 378,348);
vertex(378,348);
vertex(403,346);
bezierVertex(403,346, 409,427, 445,449);
endShape();

beginShape(); 
vertex(559,449);
bezierVertex(552,439, 533,418, 522,411);
vertex(522,411);
vertex(534,405);
bezierVertex(534,405, 577,433, 633,421);
endShape();

beginShape(); 
vertex(638,363);
bezierVertex(595,363, 552,363, 448,310);
vertex(448,310);
vertex(445,299);
vertex(445,299, 555,339, 639,322);
endShape();


beginShape(); 
vertex(638,206);
bezierVertex(573,307, 512,317, 437,290);
vertex(437,290);
vertex(431,282);
vertex(431,282, 436,293, 638,207);
endShape();

beginShape(); 
vertex(439,0);
bezierVertex(439,25, 444,213, 388,268);
bezierVertex(388,268, 511,316, 640,116);
vertex(640,116);
vertex(640,0);
endShape();

//Vertical black lines
stroke(0);
strokeWeight(6);
strokeCap(SQUARE);
line(101,10,101,47);
line(152,11,152,83);
line(205,12,205,134);
line(269,11,269,166);
strokeWeight(3);
line(319,13,319,205);

// Dark blue quads
noStroke();
fill(43, 86, 154);
quad(0,0, 495,0, 492,20, 0,11);

quad(160,406, 208,406, 209,433, 160,433);
quad(515,368, 537,367, 538,396, 514,396);
quad(0,270, 19,271, 19,290, 0,290);

quad(0,110, 14,110, 22,134, 0,134); //underneath orange circle
quad(157,119, 166,119, 178,183, 156,183); //underneath brown shape

fill(208, 45, 50);
quad(317,446, 358,456, 357,478, 322,465);
//light blue line
fill(113, 160, 204);
quad(256,460, 639,463, 639,472, 256,470);
quad(85,356, 127,356, 127,364, 85,363);

//purple quad
stroke(95,90,131);
strokeWeight(9);
line(414,383,479,383);

noStroke();
fill(218,95,64);  //orange
ellipse(442,388, 11,11);
ellipse(404,448, 13, 13);

// Dark blue ellipses

fill(43, 86, 154);
ellipse(329,342, 17,17);
ellipse(345,400, 16,16);
ellipse(374,465, 16,16);
ellipse(436,443, 11,11);
ellipse(431,445, 10,10);
ellipse(491,463, 10,10);
ellipse(453,227, 10,10);

fill(208, 45, 50);
quad(432,356, 493,357, 497,377, 429,369);

fill(222,121,51);
quad(346,367, 365,367, 365,384, 345,383);

// Light blue ellipses

fill(113, 160, 204);

ellipse(378,332, 11,11);
ellipse(403,376, 11,11);
ellipse(452,371, 11,11);
ellipse(489,408, 11,11);
ellipse(491,406, 11,11);
ellipse(354,466, 9,9);
ellipse(546,432, 11,11);
ellipse(355,367, 11,11);
ellipse(378,441, 10,10);
ellipse(380,439, 10,10);
ellipse(383,435, 10,10);
ellipse(353,466, 10,10);

fill(241,130,61); //big orange ellipse
ellipse(138,177, 68,68);
ellipse(23,158,68,68);

//blacksquare
noStroke();
fill(0);
quad(357,160, 427,160, 425,237, 357,238);

//red quads
fill(208, 45, 50);

quad(0,198, 31,198, 34,215, 0,214);
quad(98,195, 166,196, 176,219, 109,217);
quad(241,200, 309,201, 309,223, 241,222);
quad(376,208, 447,210, 447,225, 375,223);
quad(389,222, 412,222, 412,246, 389,246);
quad(432,239, 490,239, 490,254, 432,253);
quad(516,212, 579,214, 579,236, 516,234);
quad(516,232, 542,232, 542,264, 515,264);
quad(561,243, 623,244, 623,262, 561,261); //end of horizontal line of reds

//green rectangle

fill(0, 122, 84);
rect(172,287, 60,20);

//yellow quads
noStroke();
fill(247, 187, 55);
quad(571,379, 637,379, 638,391, 571,390);
quad(512,414, 565,408, 565,418, 505,421);
quad(221,381, 237,381, 237,414, 221,439);


//pink ellipse
noStroke();
fill(218,138,177);
ellipse(238,410, 38,28);

fill(51,72,65);
triangle(249,411, 264,402, 264,419);

//horizontal black lines
stroke(0);
strokeWeight(2);
line(0,193, 45,193);
line(0,203, 83,203);
line(0,212, 45,212);
line(0,224, 45,224);
line(0,238, 142,242);
line(0,351, 587,360); //arc?
line(0,357, 639,365); //arc?
line(0,429, 639,435);
line(120,455, 639,448);

//right side horizontals
line(437,214, 639,212);
line(435,250, 639,248);
line(436,289, 639,289);
line(476,329, 639,328);
line(195,193, 581,152);
line(527,201, 547,201);

//vertical black lines
strokeWeight(4);
line(191,224, 191,249);
line(244,182, 246,244);
line(149,386, 149,406);
line(91,336, 92,363);
line(147,263, 148,299);
strokeWeight(2);
line(528,189, 525,268);
line(546,185, 544,269);
line(628,179, 626,268);
line(625,452, 625,478);
line(563,478, 563,453);
line(497,478, 497,454);
line(541,478, 544,424);
line(437,478, 437,452);
line(361,478, 360,452);
line(296,478, 296,453);
line(104,479, 104,451);
line(37,479, 36,450);
line(219,304, 247,285);
line(219,304, 247,323);

//black ellipses
stroke(0);
noFill();
ellipse(69,402, 42,33);
ellipse(183,404, 42,28);
ellipse(287,409, 41,30);
ellipse(396,411, 37,34);
ellipse(504,408, 44,29);
ellipse(609,404, 45,33);

//red lines
stroke(208, 45, 50);
strokeWeight(2);
line(104,393, 163,394);
line(104,412, 163,412);
line(111,408, 94,456);
line(94,456, 72,408);
line(578,396,578,336);
line(582,396, 583,336);
line(586,396, 586,336);
line(590,396, 590,365);
line(594,396, 594,365);
line(598,396, 598,365);
line(602,396, 602,365);
line(575,426, 591,452);
line(591,452, 606,426);
line(591,452, 592,479);
line(584,0, 640,15);
strokeWeight(1);
line(444,390, 444, 446);
line(454,386, 454,445);
line(470,407, 470,468);
line(480,406, 480,468);
strokeWeight(12);
strokeCap(ROUND);
line(268,342, 270,425);




//large dark blue quads
noStroke();
fill(43, 86, 154);
quad(430,122, 500,122, 481,179, 419,178);
quad(587,120, 655,122, 620,182, 561,179);
quad(569,281, 576,273, 576,306, 569,306);
quad(558,273, 564,281, 563,323, 557,323);

//curve test works!!
stroke(43, 86, 154);
noFill();
strokeWeight(2);
beginShape();
vertex(0,176);
bezierVertex(133,218, 302,261, 639,129);
endShape();

stroke(0);
strokeWeight(3);
beginShape();
vertex(396,480);
bezierVertex(522,427, 680,241, 639,294);
endShape();

beginShape();
vertex(493,0);
bezierVertex(619,306, 301,268, 332,397);
endShape();

stroke(208, 45, 50);
strokeWeight(2);
beginShape();
vertex(0,95);
bezierVertex(35,112, 190,228, 55,387);
endShape();



//red line over blues
strokeCap(SQUARE);
stroke(208, 45, 50);
strokeWeight(2);
line(397,134, 639,167);

//brown quads

noStroke();
fill(173, 108, 68);

quad(26,109, 163,114, 163,173, 26,167);
quad(37,232, 77,233, 78,243, 38,243);

fill(247,188,50);
triangle(42,21, 70,138, 68,78);
triangle(68,78, 95,20, 70,138);

//pink quads

fill(197, 94, 123);
quad(232,16, 257,16, 258,107, 234,98);
quad(372,323, 405,318, 404,345, 371,348);
rect(406,471, 70,9);

//off-white quads

fill(204, 219, 222);
quad(468,25, 482,25, 481,85, 468,85);
quad(442,25, 455,25, 455,84, 442,84);


//other ellipses

fill(58,110,168);
ellipse(378,332,11,11);

fill(101,101,75);  //darkish green
ellipse(300,379, 18,18);



//cross shape

fill(22,129,183); //blue
rect(36,57, 11,61);
rect(21,74, 44,12);
fill(207, 216, 221); //white
rect(39,56, 6,61);
rect(21,77, 44,6);


//black rules
strokeWeight(2);
stroke(0);
line(0,60, 241,49);
line(0,109, 71,110);
line(71,110, 637, 52);





