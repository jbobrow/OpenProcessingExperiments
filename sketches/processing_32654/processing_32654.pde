
size(502,628);
background(255);
noStroke();

//yellow sky
fill(251,243,198);
rect(0,0,width,height);

fill(247,244,127,100);

beginShape();
curveVertex(187-60-60-60,0);
curveVertex(187-60-60-60,0);
curveVertex(293-60-60-60,392);
curveVertex(383-60-60-60,560);
curveVertex(383-60-60-60,560);
vertex(width,height);
vertex(width,0);
endShape();

beginShape();
curveVertex(187-60-60,0);
curveVertex(187-60-60,0);
curveVertex(293-60-60,392);
curveVertex(383-60-60,560);
curveVertex(383-60-60,560);
vertex(width,height);
vertex(width,0);
endShape();

beginShape();
curveVertex(187-60,0);
curveVertex(187-60,0);
curveVertex(293-60,392);
curveVertex(383-60,560);
curveVertex(383-60,560);
vertex(width,height);
vertex(width,0);
endShape();

beginShape();
curveVertex(187,0);
curveVertex(187,0);
curveVertex(293,392);
curveVertex(383,560);
curveVertex(383,560);
vertex(width,height);
vertex(width,0);
endShape();

beginShape();
curveVertex(187+60,0);
curveVertex(187+60,0);
curveVertex(293+60,392);
curveVertex(383+60,560);
curveVertex(383+60,560);
vertex(width,height);
vertex(width,0);
endShape();

beginShape();
curveVertex(187+60+60,0);
curveVertex(187+60+60,0);
curveVertex(293+60+60,392);
curveVertex(383+60+60,560);
curveVertex(383+60+60,560);
vertex(width,height);
vertex(width,0);
endShape();

fill(254,226,21,50);

beginShape();
vertex(270-60,0);
vertex(295-60,105);
vertex(width,105);
vertex(width,0);
endShape();

beginShape();
vertex(270,0);
vertex(295,105);
vertex(width,105);
vertex(width,0);
endShape();

beginShape();
vertex(270+60,0);
vertex(295+60,105);
vertex(width,105);
vertex(width,0);
endShape();

beginShape();
vertex(270+60+60,0);
vertex(295+60+60,105);
vertex(width,105);
vertex(width,0);
endShape();


strokeWeight(2);
stroke(0);
// four lines on upperleft
line(22,40,20,144);
line(64,44,0,116);
line(62,90,0,88);
line(0,66,54,140);
// four lines on lowerleft
line(66,470,60,584);
line(10,482,104,590);
line(21,535,108,544);
line(34,576,114,492);
//last straight line between 2 circles
line(159,443,156,479);


// circles
noFill();
// big left line
beginShape();
curveVertex(-5,215); //C1
curveVertex(-1,208); //V1
curveVertex(18,218); //V2
curveVertex(31,247); //V3
curveVertex(32,266); //V4
curveVertex(32,266); //C2
endShape();
// small left line
beginShape();
curveVertex(-5,370); //C1
curveVertex(-1,366); //V1
curveVertex(15,379); //V2
curveVertex(21,397); //V3
curveVertex(22,418); //V4
curveVertex(21,420); //C2
endShape();

//right triangle shape
fill(20);
beginShape();
vertex(474,548);
vertex(425,574);
vertex(502,567);
endShape();
//+
fill(110,106,175);
beginShape();
vertex(474,548);
vertex(502,533);
vertex(510,571);
endShape();


//red beard
fill(243,97,46);
beginShape();
curveVertex(292,536);
curveVertex(306,551);
curveVertex(316,575);
curveVertex(327,603);
curveVertex(345,613);
curveVertex(361,612);
curveVertex(376,608);

vertex(361,612);

curveVertex(374,603);
curveVertex(361,612);
curveVertex(335,620);
curveVertex(312,613);
curveVertex(297,578);
curveVertex(288,560);
curveVertex(274,549);
endShape();

//black beard
fill(20);
beginShape();
curveVertex(316,575);
curveVertex(306,551);
curveVertex(292,536);
curveVertex(250,500);
curveVertex(240,480);
curveVertex(243,456);
curveVertex(252,435);
curveVertex(267,420);
vertex(252,435);
curveVertex(277,418);
curveVertex(252,435);
curveVertex(228,465);
curveVertex(227,496);
curveVertex(250,526);
curveVertex(274,549);
curveVertex(288,560);
curveVertex(297,578);
endShape();

noFill();
//horse face
beginShape();
curveVertex(150,635); 
curveVertex(153,629);
curveVertex(210,615); 
curveVertex(238,600); 
curveVertex(249,586); 
curveVertex(267,573); 
curveVertex(300,553);
curveVertex(334,534);
curveVertex(345,512);
curveVertex(345,487);
curveVertex(326,473);
curveVertex(303,479);
curveVertex(291,479);
curveVertex(284,470);
curveVertex(290,461);
curveVertex(330,447);
curveVertex(367,461);
curveVertex(402,494);
curveVertex(440,521);
curveVertex(484,555);
curveVertex(508,568);
curveVertex(508,568);
endShape();
//fur
beginShape();
curveVertex(370,510); 
curveVertex(395,486);
curveVertex(405,443);
curveVertex(397,404);
curveVertex(379,390);
endShape();

beginShape();
curveVertex(399,518); 
curveVertex(416,501);
curveVertex(435,450);
curveVertex(431,391);
curveVertex(417,369);
endShape();

beginShape();
curveVertex(414,538); 
curveVertex(430,513);
curveVertex(461,480);
curveVertex(500,460);
curveVertex(520,450);
endShape();

beginShape();
curveVertex(439,539);
curveVertex(448,525);
curveVertex(467,510);
curveVertex(499,493);
curveVertex(505,491);
curveVertex(510,491);
endShape();



//red eyes
ellipseMode(CORNER);

strokeWeight(5);
fill(243,97,46);
ellipse(331,539,70,65);



//black circles
strokeWeight(2);
fill(20);
ellipse(2,414,33,26);
ellipse(-3,262,63,59);
ellipse(145,411,33,32);
ellipse(132,480,43,34);
ellipse(-9,602,36,36);
ellipse(353,563,30,25);
ellipse(478,20,44,46);

//lower right
beginShape();
curveVertex(435,629);
curveVertex(435,629);
curveVertex(414,616);
curveVertex(395,612);
curveVertex(374,612);
vertex(395,612);
curveVertex(377,609);
curveVertex(409,610);
curveVertex(430,599);
curveVertex(459,591);
curveVertex(485,597);
curveVertex(502,607);
curveVertex(510,610);
vertex(width+1,height+1);
endShape();

//huge shit on the center
//begin at upper-right
fill(20);
beginShape();
curveVertex(508,113);
curveVertex(502,106);
curveVertex(437,67);
//first red
curveVertex(380,50);
vertex(437,67);
curveVertex(421,78);
curveVertex(437,67);
curveVertex(436,39);
curveVertex(420,26);
curveVertex(393,32);
curveVertex(380,50);
curveVertex(383,63);
//end of first red
vertex(380,50);
curveVertex(437,67);
curveVertex(380,50);
curveVertex(273,42);
curveVertex(227,43);
curveVertex(201,55);
//2nd red
curveVertex(170,95);
vertex(201,55);
curveVertex(202,66);
curveVertex(201,55);
curveVertex(174,46);
curveVertex(155,56);
curveVertex(149,75);
curveVertex(172,95);
curveVertex(180,93);
//end of 2nd red
vertex(172,95);
curveVertex(201,55);
curveVertex(170,95);
curveVertex(153,127);
//3rd red
curveVertex(138,183);
vertex(153,127);
curveVertex(173,135);
curveVertex(153,127);
curveVertex(122,133);
curveVertex(105,161);
curveVertex(120,180);
curveVertex(138,183);
curveVertex(160,185);
//end of 3rd red
vertex(138,183);
curveVertex(153,127);
curveVertex(138,183);
curveVertex(145,234);
curveVertex(160,276);
//4th red,, big one
curveVertex(235,346);
vertex(160,276);
curveVertex(181,271);
curveVertex(160,276);
curveVertex(128,302);
curveVertex(118,337);
curveVertex(153,368);
curveVertex(192,372);
curveVertex(232,348);
curveVertex(238,321);
//end of 4th red,, big one
vertex(232,348);
curveVertex(160,276);
curveVertex(235,346);
curveVertex(283,364);
curveVertex(341,372);
//5th red,, small
curveVertex(382,373);
vertex(341,372);
curveVertex(348,364);
curveVertex(341,372);
curveVertex(352,388);
curveVertex(370,390);
curveVertex(384,373);
curveVertex(374,364);
//end of 5th red,, small
vertex(384,373);
curveVertex(341,372);
curveVertex(382,373);
curveVertex(420,366);
curveVertex(447,359);
//last one!!!!!!!!!!!!! finally!!!!
curveVertex(500,333);
vertex(447,359);
curveVertex(452,341);
curveVertex(447,359);
curveVertex(459,390);
curveVertex(480,410);
curveVertex(505,416);
curveVertex(505,416);

endShape();

// red intersections
strokeWeight(2);
fill(243,97,46);
// no.1
beginShape();
curveVertex(502,106);
curveVertex(437,67);
curveVertex(380,50);
curveVertex(273,42);
vertex(380,50);
curveVertex(393,32);
curveVertex(380,50);
curveVertex(383,63);
curveVertex(407,77);
curveVertex(437,67);
curveVertex(436,39);
endShape();

//no.2
beginShape();
curveVertex(227,43);
curveVertex(201,55);
curveVertex(170,95);
curveVertex(153,127);
vertex(170,95);
curveVertex(159,88);
curveVertex(172,95);
curveVertex(180,93);
curveVertex(194,86);
curveVertex(202,72);
curveVertex(201,55);
curveVertex(174,46);
endShape();

// no.3
beginShape();
curveVertex(170,95);
curveVertex(153,127);
curveVertex(138,183);
curveVertex(145,234);
vertex(138,183);
curveVertex(120,180);
curveVertex(138,183);
curveVertex(160,185);
curveVertex(169,180);
curveVertex(181,159);
curveVertex(173,135);
curveVertex(153,127);
curveVertex(122,133);
endShape();

//no.4
beginShape();
curveVertex(145,234);
curveVertex(160,276);
curveVertex(235,346);
curveVertex(283,364);
vertex(235,346);
curveVertex(192,372);
curveVertex(232,348);
curveVertex(241,319);
curveVertex(233,292);
curveVertex(210,275);
curveVertex(181,271);
curveVertex(160,276);
curveVertex(128,302);
endShape();

//no.5
beginShape();
curveVertex(283,364);
curveVertex(341,372);
curveVertex(382,373);
curveVertex(420,366);
vertex(382,373);
curveVertex(381,381);
curveVertex(384,373);
curveVertex(376,361);
curveVertex(354,358);
curveVertex(341,372);
curveVertex(352,388);
endShape();

//finalround
beginShape();
curveVertex(420,366);
curveVertex(447,359);
curveVertex(480,347);
curveVertex(500,333);
curveVertex(505,333);
curveVertex(505,333);
vertex(505,333);
vertex(505,298);
curveVertex(505,298);
curveVertex(505,298);
curveVertex(478,308);
curveVertex(455,337);
curveVertex(447,359);
curveVertex(459,390);

endShape();


//extra
beginShape();
curveVertex(503,107);
curveVertex(503,107);
curveVertex(494,120);
curveVertex(503,130);
curveVertex(503,130);
endShape();

