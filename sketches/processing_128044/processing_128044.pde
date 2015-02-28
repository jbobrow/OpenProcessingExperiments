
//void setup()
//{
size(892,707);
background (#99717A);
//} //lotta begin/endShapes, gonna warn ya' ahead of time




fill(#BA5016);
beginShape(); //red background
vertex(322,178);
vertex(892,0);
vertex(892,707);
vertex(308,707);
vertex(322,178);
endShape(CLOSE);

strokeWeight(7);  
//BG LINES 
stroke(0);
line(370,0,370,707);
line(437,0,437,707);
line(505,0,505,707);
line(573,0,573,707);
line(645,0,645,707);
line(719,0,719,707);
line(786,0,786,707);
line(851,0,851,707);

//bg lines V
line(0,68,892,68);
line(0,139,892,139);
line(0,230,892,230);
line(0,309,892,309);
line(0,399,892,399);
line(0,484,892,484);
line(0,556,892,556);
line(0,644,892,644);

strokeWeight(2);  
stroke(#AD6F2B);
//bg lines color v
line(380,0,380,707);
line(444,0,444,707);
line(510,0,510,707);
line(582,0,582,707);
line(653,0,653,707);
line(728,0,728,707);
line(800,0,800,707);
line(863,0,863,707);


//bg lines color h
line(0,42,892,42);
line(0,64,892,64);
line(0,117,892,117);
line(0,135,892,135);
line(0,214,892,214);
line(0,217,892,217);
line(0,293,892,293);
line(0,297,892,297);
line(0,367,892,367);
line(0,381,892,381);
line(0,450,892,450);
line(0,470,892,470);
line(0,529,892,529);
line(0,549,892,549);
line(0,621,892,621);
line(0,641,892,641);
line(0,674,892,674);
line(0,694,892,694);

noStroke();
fill(0,0,0); //black bg
beginShape();
vertex(321,0);
vertex(309,707);
vertex(0,707);
vertex(0,0);
endShape(CLOSE);



fill(#EDCF00);//yellowBackground
beginShape();
vertex(22,44);
vertex(310,11);
vertex(307,655);
vertex(46,658);
endShape(CLOSE);

fill(#BA5016);//brick red Top
beginShape();
vertex(24,35);
vertex(307,-1);
vertex(0,0);
vertex(0,9);
endShape(CLOSE);

stroke(#000000);
fill(#000000);
beginShape();//blacktri tablebottom
vertex(309,573);
vertex(308,708);
vertex(275,569);
vertex(252,708);
vertex(231,554);
endShape(CLOSE);

noStroke();
fill(#807439);
beginShape(); //table highlight bottom
vertex(308,708);
vertex(275,569);
vertex(252,708);
endShape(CLOSE);

fill(#000000); //table leg 2
rectMode(CORNERS);
rect(104,521,192,707);

noStroke(); //table leg highlight 2
fill(#AD6F2B);
beginShape();
vertex(106,528);
vertex(174,545);
vertex(109,707);
endShape(CLOSE);

fill(#000000);
beginShape();//table black
vertex(54,512);
vertex(27,389);
vertex(288,274);
vertex(587,398);
vertex(760,483);
vertex(853,577);
vertex(855,595);
vertex(478,624);
endShape(CLOSE);

fill(#000000); //tableleg 3
beginShape();
vertex(366,586);
vertex(412,707);
vertex(529,707);
vertex(527,586);
endShape();

fill(#614F43);
beginShape(); //tableleg highlight 1
vertex(375,598);
vertex(420,612);
vertex(423,705);
vertex(414,705);
endShape(CLOSE);

fill(#E2D3CC);
beginShape(); //tableleg 3 highlight 2
vertex(426,612);
vertex(477,626);
vertex(480,707);
vertex(430,707);
endShape(CLOSE);

fill(#000000);//tableleg 4
beginShape();
vertex(686,606);
vertex(688,707);
vertex(801,707);
vertex(700,606);

endShape();

beginShape(#E2D3CC); //tableleg 4 highlight
vertex(761,612);
vertex(791,608);
vertex(794,707);
vertex(768,707);
endShape();

fill(#EDCF00); //table side yellow
beginShape();
vertex(402,591);
vertex(479,618);
vertex(853,594);
vertex(851,586);
endShape(CLOSE);

fill(#EDCF00); //tabletop yellow
beginShape();
vertex(850,581);
vertex(444,585);
vertex(36,387);
vertex(290,277);
endShape(CLOSE);
beginShape();

stroke(#000000);//tabletop white
fill(#E2D3CC);
vertex(440,581);
vertex(583,401);
vertex(371,308);
vertex(307,393);
vertex(440,581);
endShape();

fill(#FFFFFF);//cyan curve
fill(#FFFFFF);//purple curve
fill(#FFFFFF);//skull purple

//arc(x, y, width, height, start, stop) RAD
fill(#67C392); //cyan skull
arc(312,282,150,207,0,PI*2);

fill(#7B5967);//purple skull top
arc(210,189,220,100,0,PI*2);

//beginShape();
//vertex(

beginShape(); //purple skull 
vertex(101,197); //yellow/purple/purple int
vertex(308,384);
vertex(256,396);
curveVertex(189,412);
curveVertex(272,395);
curveVertex(168,422);
vertex(119,407);//very bottom
curveVertex(119,407);
curveVertex(139,360);
curveVertex(142,315);
curveVertex(126,256);
//vertex(112,408);
//vertex(150,331);
endShape(CLOSE);

strokeWeight(6);
fill(#FFFFFF);
beginShape();//skull teeth
vertex(137,362);
//curveVertex(240,368);
//curveVertex(240,368);
//curveVertex(141,333);
vertex(208,377);
vertex(244,367);
vertex(144,328);
endShape(CLOSE);
strokeWeight(4);
line(148,364,153,333);
line(162,367,165,337);
line(173,369,174,342);
line(186,370,188,347);
line(200,375,201,352);
line(140,347,244,367);

strokeWeight(1);


stroke(#000000); //skull yellow
fill(#EDCF00);
beginShape();
vertex(101,197);
vertex(308,384);
vertex(322,178);
vertex(101,197);
endShape();

fill(#000000);
beginShape();// yellow skull black detail 1
vertex(294,358);
curveVertex(294,358);
curveVertex(285,340);
curveVertex(282,324);
curveVertex(279,316);
curveVertex(277,304);
curveVertex(278,297);
vertex(278,297);
curveVertex(278,297);
curveVertex(283,292);
curveVertex(287,291);
curveVertex(294,287);
curveVertex(294,287);
vertex(294,287);
curveVertex(294,287);
curveVertex(292,308);
curveVertex(294,325);
curveVertex(295,338);
curveVertex(294,358);
vertex(294,358);
endShape(CLOSE);

fill(#000000);
beginShape();// yellow skull black detail 1
vertex(286,358);
curveVertex(270,336);
curveVertex(255,318);
curveVertex(242,310);
curveVertex(238,303);
vertex(238,303);
curveVertex(238,303);
curveVertex(252,302);
curveVertex(267,315);
curveVertex(279,340);
curveVertex(285,359);
vertex(285,359);
endShape(CLOSE);



fill(#000000);
ellipseMode(CORNERS);  //left skull eye
ellipse(174,210,240,268);
fill(#000000);
ellipseMode(CORNERS);  //right skull eye
ellipse(249,226,298,274);

//vase
  
fill(#7B5967);
beginShape();
vertex(625,567);
vertex(839,573);
vertex(661,357);
endShape(CLOSE);

strokeWeight(4);
fill(#FFFFFF);
beginShape();//blue triangle
vertex(670,195);
curveVertex(670,195);
curveVertex(646,190);
curveVertex(611,183);
curveVertex(595,178);
curveVertex(579,171);
curveVertex(579,171);
vertex(579,171);
curveVertex(579,171);
curveVertex(601,162);
curveVertex(625,156);
curveVertex(638,152);
curveVertex(675,153);
vertex(675,153);
curveVertex(675,153);
curveVertex(676,169);
curveVertex(673,179);
curveVertex(673,177);
curveVertex(673,188);
curveVertex(670,195);
vertex(670,195);
endShape(CLOSE);

fill(#FFFFFF);
beginShape();
vertex(691,202);
curveVertex(691,202);
curveVertex(708,196);
curveVertex(719,184);
curveVertex(716,162);
curveVertex(702,157);
vertex(702,157);
endShape(CLOSE);

fill(#EDE577);
beginShape();//yellow square thing
vertex(625,503);
vertex(848,373);
vertex(736,214);
vertex(675,237);
endShape(CLOSE);

fill(#BA5016);
beginShape();//red oval1
vertex(802,302);
curveVertex(802,302);
curveVertex(814,263);
curveVertex(804,206);
curveVertex(784,186);
curveVertex(754,178);
vertex(754,178);
vertex(735,214);
vertex(802,302);
endShape(CLOSE);

fill(#EDE577);
beginShape();//yellow and white curve 1
vertex(848,373);
curveVertex(848,373);
curveVertex(859,259);
curveVertex(837,167);
curveVertex(808,141);
curveVertex(754,178);
vertex(754,178);
curveVertex(754,178);
curveVertex(784,186);
curveVertex(804,206);
curveVertex(814,263);
curveVertex(814,263);
vertex(814,263);
endShape(CLOSE);



stroke(2);
beginShape();//big yellow curve
vertex(579,171);
curveVertex(579,171);
curveVertex(601,162);
curveVertex(625,156);
curveVertex(638,152);
curveVertex(675,153);
vertex(675,153);
curveVertex(675,153);//1
curveVertex(682,153);//2
curveVertex(690,151);//3
curveVertex(696,149);//4
curveVertex(702,157);//5
vertex(702,157);
curveVertex(702,157);//1
curveVertex(702,156);//2
curveVertex(716,163);//3
curveVertex(719,184);//4
curveVertex(707,196);//5
vertex(691,201);
vertex(658,229);
curveVertex(658,229);//1
curveVertex(707,226);//2
curveVertex(735,213);//3
curveVertex(753,193);//4
curveVertex(754,162);//5
vertex(754,162);
curveVertex(754,162);//1
curveVertex(742,131);//2
curveVertex(713,117);//3
curveVertex(666,115);//4
curveVertex(627,121);//5
vertex(627,121);
curveVertex(627,121);//1
curveVertex(596,131);//2
curveVertex(575,136);//3
curveVertex(561,144);//4
curveVertex(536,153);//5
vertex(536,153);
endShape(CLOSE);

fill(#000000);
beginShape();//blackbox
vertex(665,235);
vertex(693,236);
vertex(702,156);
vertex(675,153);
endShape(CLOSE);

strokeWeight(2);  //purple curve shape 1
fill(#FFFFFF);
beginShape();
vertex(664,235);
curveVertex(664,235);
curveVertex(660,270);
curveVertex(645,309);
curveVertex(626,355);
curveVertex(590,393);
vertex(590,393);
curveVertex(590,393);
curveVertex(661,341);
curveVertex(612,275);
curveVertex(590,228);
curveVertex(543,189);
vertex(543,189);
curveVertex(576,200);
curveVertex(603,212);
curveVertex(633,228);
curveVertex(665,235);
vertex(664,235);

endShape(CLOSE);

fill(#7B5967);
beginShape();
vertex(664,235);
vertex(675,237);
curveVertex(675,237);
curveVertex(669,271);
curveVertex(662,311);
curveVertex(655,368);
curveVertex(658,450);
vertex(658,450);
vertex(625,502);
curveVertex(625,502);
curveVertex(618,479);
curveVertex(613,456);
curveVertex(605,430);
curveVertex(590,393);
vertex(590,393);
curveVertex(590,393);
curveVertex(590,393);
curveVertex(626,355);
curveVertex(626,355);
curveVertex(645,309);
curveVertex(660,270);
curveVertex(664,235);
vertex(664,235);
endShape(CLOSE);

fill(#3F3AC9);//arc circle 1
beginShape();
vertex(675,237);
curveVertex(675,237);
curveVertex(669,271);
curveVertex(662,311);
curveVertex(655,368);
curveVertex(658,450);
vertex(658,450);
curveVertex(658,450);
curveVertex(703,431);
curveVertex(767,347);
curveVertex(729,270);
curveVertex(675,237);
vertex(675,237);
endShape(CLOSE);



