
size(640,480);
background(210,171,142);
smooth();

//large TAN shape at the very back//
fill(193,195,168);
noStroke();
beginShape();
vertex(0,0);
vertex(204,0);
vertex(538,29);
vertex(640,35);
vertex(640,480);
vertex(160,480);
vertex(160,360);
vertex(0,360);
endShape();


//GREEN quad and black lines around the edges//
fill(22,125,99);
beginShape();
vertex(144,0);
vertex(362,48);
vertex(362,480);
vertex(0,480);
vertex(0,0);
endShape();

//small BEIGE triangle in SW corner//
noStroke();
fill(235,238,197);
quad(0,415, 78,414, 78,480, 0,480);


stroke(0,60);
strokeWeight(3);
line(144,0, 362,48);
line(362,48, 362,480);

//circle//
noFill();
ellipse(310,146,200,70);
ellipse(731,768, 1391,902);

//black line//
strokeWeight(1);
stroke(0,85);
line(26,480, 285,235);
line(180,480, 177,436);
line(177,436, 360,465);


//SW PURPLE triangle//
fill(54,46,86);
triangle(0,428, 60,480, 0,480);
strokeWeight(0.5);
stroke(0);
line(24,483, 45,464);
strokeWeight(6);
line(108,486, 0,446);
noStroke();


//SW little BLUE piece//
fill(77,144,188);
triangle(0,437,13,480,0,480);

//little lines in SW corner//
fill(0,150);
noStroke();
beginShape();
vertex(87,474);
vertex(76,463);
vertex(46,444);
vertex(29,432);
vertex(0,417);
vertex(0,423);
vertex(21,434);
vertex(45,447);
vertex(85,474);
endShape();
beginShape();
vertex(73,484);
vertex(82,473);
vertex(51,454);
vertex(34,442);
vertex(5,427);
vertex(5,433);
vertex(26,444);
vertex(50,457);
vertex(90,484);
endShape();
beginShape();
vertex(113,484);
vertex(122,473);
vertex(91,434);
vertex(74,422);
vertex(45,407);
vertex(45,413);
vertex(66,424);
vertex(90,437);
vertex(130,464);
endShape();

fill(0,150);
noStroke();
beginShape();
vertex(108,480);
vertex(87,465);
vertex(82,454);
vertex(60,442);
vertex(46,430);
vertex(26,418);
vertex(24,418);
vertex(38,431);
vertex(56,444);
endShape();

fill(0,150);
noStroke();
beginShape();
vertex(114,475);
vertex(90,456);
vertex(66,438);
vertex(51,426);
vertex(36,415);
vertex(42,414);
vertex(66,434);
vertex(88,453);
vertex(56,444);
endShape();

fill(0,150);
noStroke();
beginShape();
vertex(52,414);
vertex(73,432);
vertex(95,450);
vertex(107,462);
endShape();
beginShape();
vertex(52,414);
vertex(73,432);
vertex(95,450);
vertex(107,462);
endShape();

//line squiggles//
beginShape();
vertex(370,356);
vertex(410,301);
vertex(456,261);
vertex(408,299);
endShape();
beginShape();
vertex(360,381);
vertex(400,326);
vertex(446,286);
vertex(398,324);
endShape();
beginShape();
vertex(370,381);
vertex(410,326);
vertex(456,286);
vertex(408,324);
endShape();
beginShape();
vertex(350,371);
vertex(390,316);
vertex(436,276);
vertex(388,314);
endShape();
beginShape();
vertex(350,365);
vertex(390,310);
vertex(436,270);
vertex(388,310);
endShape();
beginShape();
vertex(340,350);
vertex(380,310);
vertex(426,265);
vertex(378,305);
endShape();
beginShape();
vertex(340,340);
vertex(380,300);
vertex(426,255);
vertex(378,295);
endShape();
beginShape();
vertex(345,325);
vertex(386,285);
vertex(429,240);
vertex(382,280);
endShape();
beginShape();
vertex(370,341);
vertex(410,286);vertex(456,246);
vertex(408,284);
endShape();
beginShape();
vertex(340,300);
vertex(380,260);
vertex(426,215);
vertex(378,255);
endShape();
beginShape();
vertex(350,300);
vertex(390,260);
vertex(436,215);
vertex(388,255);
endShape();
beginShape();
vertex(357,305);
vertex(397,265);
vertex(443,220);
vertex(395,260);
endShape();
beginShape();
vertex(352,275);
vertex(392,235);
vertex(437,190);
vertex(390,230);
endShape();
fill(22,125,99);
quad(368,251, 362,366, 336,384, 327,249);


arc(175, 35, 50, 50, -PI / 6, PI / 6);


//BLUE quad on left side and RED quad on top//
fill(37,52,104);
quad(116,0,125,412,0,416,0,0);

fill(183,48,44);
quad(15,0,15,52,0,52,0,0);

//curved black line,blue a lil over it//
noFill();
strokeWeight(2);
stroke(0,85);
ellipse(129,915,1764,1446);
ellipse(1043,793, 1843,767);
ellipse(794,798, 1391,902);

fill(37,52,104);
noStroke();
quad(0,168, 117,168, 119,230, 0,207);

//WHITE block in background//
fill(173,228,255,120);
noStroke();
beginShape();
vertex(498,210);
vertex(500,464);
vertex(500,480);
vertex(640,480);
vertex(640,192);
endShape();

//black line//
stroke(0);
strokeWeight(5);
line(110,6, 640,261);

//PINK.//
noStroke();
fill(177,73,106);
beginShape();
vertex(640,12);
vertex(545,27);
vertex(281,70);
vertex(302,276);
vertex(405,237);
vertex(476,217);
vertex(504,211);
vertex(546,206);
vertex(640,204);
endShape();

//black broken line//
stroke(0);
strokeWeight(4);
line(270,10, 540,52);
line(540,52, 640,113);

//little RED on right side//
//beginShape();
//fill(178,34,31);
//vertex(578,396);
//curveVertex(574,380);
//curveVertex(582,469);
//curveVertex(594,361);
//curveVertex(612,357);
//curveVertex(625,358);
//vertex(640,360);
//vertex(640,373);
//curveVertex(629,370);
//curveVertex(615,369);
//curveVertex(599,371);
//curveVertex(585,382);
//vertex(578,395);
//endShape();





//TRIANGLE!!!!!!!!!!!!!!!!!/////////////////////////






//black line//
stroke(0);
strokeWeight(4);
line(117,151, 552,200);

stroke(37,52,104);
line(116,138,116,155);

//red triangle//
noStroke();
fill(183,48,44);
triangle(402,488, 453,448, 465,489);

//thick RED line//
stroke(66,31,26);
strokeCap(PROJECT);
strokeWeight(22);
line(0,377, 586,494);

//bLUE LINE//
strokeWeight(8);
stroke(37,52,104);
line(108,4, 221,480);







strokeWeight(9);
stroke(38,76,155);
strokeCap(PROJECT);
line(0,72, 570,-1);













//TRIANGLES//////////////////////////////////////////////
fill(7,29,38);
noStroke();
beginShape();
vertex(209,395);
bezierVertex(207,388, 213,321,  144,261);
 bezierVertex(245,293, 244,344, 258,364);
endShape();


beginShape();
vertex(306,321);
bezierVertex(303,320, 307,235, 238,175);
bezierVertex(332,217, 339,295, 345,304);
endShape();

beginShape();
vertex(408,249);
bezierVertex(404,247, 378,89, 242,0);
bezierVertex(312,-13, 473,181, 477,222);
endShape();


//fill(7,29,38);
//noStroke();
//beginShape();
//vertex(208,395);
//vertex(205,368);
//vertex(250,345);
//vertex(259,365);
//endShape();
//beginShape();
//vertex(205,369);
//vertex(251,347);
//vertex(241,325);
//vertex(198,334);
//endShape();
//beginShape();
//vertex(241,326);
//vertex(198,335);
//vertex(186,308);
//vertex(232,314);
//endShape();
//beginShape();
//vertex(186,309);
//vertex(232,315);
//vertex(222,304);
//vertex(174,288);
//endShape();
//beginShape();
//vertex(186,309);
//vertex(174,288);
//vertex(144,264);
//vertex(216,299);
//endShape();
//beginShape();
//vertex(174,288);
//vertex(144,264);
//vertex(217,300);
//vertex(195,284);
//endShape();
//
//
//
//
//
//beginShape();
//vertex(305,322);
//vertex(345,303);
//vertex(336,277);
//vertex(303,290);
//endShape();
//beginShape();
//vertex(303,291);
//vertex(336,278);
//vertex(330,264);
//vertex(300,281);
//endShape();
//beginShape();
//vertex(300,282);
//vertex(330,265);
//vertex(323,251);
//vertex(298,271);
//endShape();
//beginShape();
//vertex(298,272);
//vertex(323,252);
//vertex(320,245);
//vertex(294,252);
//endShape();
//beginShape();
//vertex(294,253);
//vertex(320,246);
//vertex(317,238);
//vertex(288,240);
//endShape();
//beginShape();
//vertex(288,240);
//vertex(317,238);
//vertex(310,231);
//vertex(285,246);
//endShape();

//BLUE LINE ON BOTTOM...ONLY PARTIAL//
stroke(37,52,104);
strokeWeight(8);
line(170,263, 207,418);


//black V bottom//
stroke(0);
strokeWeight(5);
strokeCap(ROUND);
line(641,352, 125,287);
line(125,287, 584,482);
strokeWeight(8);
stroke(37,52,104);
line(172,274, 185,327);

//blue skinny line on right side//
strokeWeight(7);
strokeCap(PROJECT);
stroke(44,79,162);
line(554,0, 644, 474);

//LIGHT blue thick line front//
strokeWeight(13);
strokeCap(ROUND);
stroke(2,122,177);
line(427,202, 550,422);

//curved black line in SE corner//
noFill();
stroke(0);
strokeWeight(10);
ellipse(1103,1383,1600,2911);

//little blue triangle bottom SW on green//
smooth();
noStroke();
fill(7,29,38);
triangle(115,474, 158,443, 144,426);




