
size (800, 600);
background (#ea3834);

//gelbe zacken in der mitte oben
fill(#f6ba35);
smooth();
noStroke();
beginShape();
vertex(401, 0);
vertex(336, 102);
vertex(401, 141);
vertex(333, 232);
vertex(382, 295);
vertex(331, 286);
vertex(364, 351);
vertex(182, 216);
vertex(272, 0);
endShape(CLOSE);

//gelbe seite
beginShape();
  curveVertex(364, 351); 
  curveVertex(364, 351);
  curveVertex(266, 482);
  curveVertex(387, 558);
  curveVertex(492, 600);
  curveVertex(150, 600);
  curveVertex(0, 600);
  curveVertex(0, 595);
  curveVertex(8, 120);
  curveVertex(39, 11);
  curveVertex(127, 0);
  curveVertex(249, 0);
  curveVertex(311, 0);
  curveVertex(250, 174);
  curveVertex(358, 339); 
  curveVertex(358, 339); 
  endShape();
  
//gelbe seite verlauf orange  
  fill(240, 188 ,43 ,70);
  beginShape();
  curveVertex(364, 351); 
  curveVertex(364, 351); 
  curveVertex(339, 468);
  curveVertex(459, 523);
  curveVertex(533, 650);
  curveVertex(0, 600);
  curveVertex(0, 0);
  curveVertex(127, 0);
  curveVertex(249, 0);
  curveVertex(311, 0);
  curveVertex(250, 174);
  curveVertex(358, 339); 
  curveVertex(358, 339); 
  endShape();
  
//rechts schwarzer großer Block
fill(0);
quad(520, 234,810, 300,655, 562,433, 392);


// rechts weißes element oberhalb der mittelachse
fill(255);
stroke(0);
beginShape();
vertex(520, 234);
vertex(503, 156);
vertex(611, 128);
vertex(629, 174);
vertex(669, 167);
vertex(665, 197);
endShape(CLOSE);

// weißes dreieck am schwarzen
beginShape();
vertex(365, 250);
vertex(482, 308);
vertex(457, 350);
endShape(CLOSE);

//weißer block auf schwarzem
quad(589, 476,614, 496,595, 519,571, 500);

//gelbes dreieck oben
fill(#f6ba35);
beginShape();
vertex(426, 127);
vertex(539, -35);
vertex(592, 85);
endShape(CLOSE);

//schwarzes dreicke über weißem objekt
fill(0);
beginShape();
vertex(611, 128);
vertex(629, 174);
vertex(516, 206);
endShape(CLOSE);

//linie dazwischen
line(539, -35, 675, 275);

//links vom weißen Block
fill(#ea3834);
quad(514, 206,520, 234,458,253,450,223);

//schwarz auf (links vom weißen Block) 
fill(0);
beginShape();
quad(494, 212,501, 241,478,247,471,218);

//schwarze Streifen oben rechts
quad(638, 26,700, 26,700, 32,638, 32);
quad(638, 26,700, 26,700, 32,638, 32);
quad(638, 45,700, 45,700, 52,638, 52);
quad(638, 62,700, 62,700, 69,638, 69);

quad(721, 27,726, 27,726, 97,721, 97);
quad(733, 27,740, 27,740, 97,733, 97);
quad(748, 27,753, 27,753, 97,748, 97);
quad (763, 27,768, 27,768, 97,763, 97);
quad (775, 27,782, 27,782, 97, 775, 97);

//Roter bLock rechts unterm schwarzen
fill(#ea3834);
quad(595, 519, 571, 500, 552, 524, 576, 543);
// anliegender Türkiser Block
fill(#417d59);
quad(576, 543, 552, 524, 533,546, 556,565);

//beide orangenen Bläcke auf dem Schwarzen
fill(#dc8301);
quad(457, 350,482, 308, 520, 327, 486, 382);
quad(520, 327,547,341,531,369,506,352);

//blauer kleiner Block auf schwarz
fill(#64b4d7);
quad(531,369,506,352,495,373,519,387);

//roter Block auf dem Schwarzen
fill(#ea3834);
quad(531,369,547,341,657,392, 627, 432);

//groß blau auf groß schwarz
fill(#64b4d7);
quad(589, 476,614, 496,685, 404,691, 343);

//LINKE SEITE
//bögen oben links
fill(255);
beginShape();
vertex(8, 273); // first point
bezierVertex(55, 112, 125, 45, 246, 15);
vertex(246,41);
bezierVertex(145, 69, 65, 142, 19, 273);
endShape(CLOSE);

fill(#ea3834);
beginShape();
vertex(246,41);
bezierVertex(145, 69, 65, 142, 19, 273);
vertex(31,273);
bezierVertex(79, 156,143, 99, 246, 70);
endShape(CLOSE);

fill(0);
beginShape();
vertex(31,273);
bezierVertex(79, 156,143, 99, 246, 70);
vertex(246,99);
bezierVertex(156,120,81, 182, 41, 273);
endShape(CLOSE);

// Links roter halbkreis mit anschließendem großen schwarzen objekt
noStroke();
fill(#ea3834);
beginShape();
vertex(50,379);
bezierVertex(49, 221,101, 171, 234, 183);
vertex(210,206);
bezierVertex(116,207,81, 266, 85, 379);
endShape(CLOSE);

//blau weißer kreis
fill(255);
noStroke();
ellipse(295,375,56,56);

fill(#84c3cc);
noStroke();
ellipse(295,375,46,46);

fill(#097aa2);
noStroke();
ellipse(295,375,36,36);


//blauer part
stroke(0);
fill(#64b4d7);
quad(236, 182, 329, 375,287, 375,208, 208);


fill(0);
stroke(0);
beginShape();
vertex(210,206);
bezierVertex(116,207,81, 266, 85, 379);
vertex(146,382);
vertex(225,399);
vertex(257,399);
bezierVertex(276,394,290, 380, 293, 371);
bezierVertex(294,366,297, 362, 291, 354);
endShape(CLOSE);

//weißer kreis auf schwarzem
fill(255);
ellipse(118,313,36,36);

fill(#134aa4);
beginShape();
vertex(48,378);
vertex(117,471);
vertex(156,378);
endShape(CLOSE);

//rotes vogelartiges ding
fill(#ea3834);
ellipse(248,238,55,55);
fill(#f6ba35);
arc(235, 241, 27, 27, -PI, 0);
arc(260, 241, 27, 27, -PI, 0);
fill(#e5481f);
arc(203, 241, 35, 35, -PI, 0);
arc(293, 241, 35, 35, -PI, 0);

//roter Block
fill(#c41d17);
quad(166,415, 206, 415, 206,487, 166,487);

fill(#db8111);
quad(125,417, 228, 420, 226,398, 137,396);

fill(#549d7f);
beginShape();
vertex(226,398);
vertex(137,396);
vertex(202,270);
endShape(CLOSE);

fill(#db8111);
quad(191,346, 215,346, 218,358, 190,358);
fill(#ea3834);
quad(218,358, 190,358 ,190,370,220,371);

//dreieck über weißen kreis hinaus

fill(#db8111);
beginShape();
vertex(118,317);
vertex(44,385);
vertex(34,368);
endShape(CLOSE);

//dreieck ohne farbe in den vogel hinein
noFill();
beginShape();
vertex(253,228);
vertex(352,141);
vertex(325,122);
endShape(CLOSE);

//Unten vier Blöcke
fill(#64b4d7);
quad(240,484, 245, 514, 142,514, 142,484);
fill(255);
quad(142,514, 142,484, 122,484, 122,514);
fill(0);
quad(122,484, 122,514, 99,514, 99,484);
fill(#f6ba35);
quad(99,514, 99,484, 78,484, 78,514);

//schwarze Streifen
line(228,420,228,484);
line(228,420,257,574);

//über den bögen
line(158,158,17,42);
line(162,154,15,11);
line(167,152,37,6);
line(171,150,67,6);
line(175,148,97,13);
//rechts oben
line(719,281,694,198);
line(732,282,712,160);
line(744,286,743,189);
line(755,288,775,167);
//rechts unten
line(580,578,776,387);
line(605,573,774,437);

line(662,518,750,586);
line(666,513,774,568);

line(688,474,784,532);
line(697,466,782,502);
line(698,465,776,472);

line(716,579,739,464);
line(735,578,740,448);
line(749,573,779,421);
line(757,572,777,494);
line(767,573,791,504);

//farbsprenkler
fill(0);
beginShape();
vertex(259,129);
vertex(263,123);
vertex(271,33);
vertex(255,125);
endShape(CLOSE);

beginShape();
vertex(282,106);
vertex(289,103);
vertex(342,17);
vertex(281,100);
endShape(CLOSE);

beginShape();
vertex(260,153);
vertex(269,150);
vertex(338,88);
vertex(262,145);
endShape(CLOSE);

beginShape();
vertex(21,477);
vertex(29,473);
vertex(87,402);
vertex(23,466);
endShape(CLOSE);

beginShape();
vertex(54,537);
vertex(63,541);
vertex(153,540);
vertex(63,532);
endShape(CLOSE);

beginShape();
vertex(206,547);
vertex(219,552);
vertex(332,547);
vertex(219,540);
endShape(CLOSE);

beginShape();
vertex(329,394);
vertex(422,432);
vertex(429,444);
vertex(412,441);
endShape(CLOSE);

beginShape();
vertex(312,405);
vertex(380,498);
vertex(380,507);
vertex(370,502);
endShape(CLOSE);

beginShape();
vertex(464,426);
vertex(410,536);
vertex(402,539);
vertex(401,531);
endShape(CLOSE);

line(85,357,85,337);


