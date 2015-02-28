
// Chun Yi Wu
// P3


void setup() {
size(330,356);
background(132,108,91);
smooth();  
}

void draw() {
  

  noFill();
  stroke(0);
  beginShape();
  curveVertex(9,8); // the first control point
  curveVertex(9,8);  
  curveVertex(12,57); 
  curveVertex(56,51);
  curveVertex(62,77);
  curveVertex(80,120);
  curveVertex(132,134);
  curveVertex(152,155);
  curveVertex(159,188); 
  curveVertex(159,188); 
  endShape();
  fill(0);
  ellipse(161,194,15,13);
 
  
  noFill();
  stroke(0);  
  beginShape();
  curveVertex(16,356); // the first control point
  curveVertex(16,356);  
  curveVertex(74,241); 
  curveVertex(142,172);
  curveVertex(186,125);
  curveVertex(186,125);
  endShape();
  fill(0);
  ellipse(191,119,15,13);
  
  fill(0);
  noStroke();  
  beginShape();
  vertex(94,125); // the first control point  
  vertex(162,9);  
  vertex(110,67);
  vertex(75,115);
  vertex(83,121);
  endShape(CLOSE);    
  
  // blue block
  fill(46,35,64);  
  noStroke( );  
  beginShape();
  curveVertex(67,164); // the first control point
  curveVertex(67,164);
  curveVertex(62,151);
  curveVertex(51,143);
  vertex(51,143); 
  vertex(75,115); 
  vertex(83,121);
  vertex(94,125);
  endShape(CLOSE);
 
 //big blue block
 
  fill(46,39,66);  
  noStroke( );  
  beginShape();
  curveVertex(5,234);
  curveVertex(5,234);
  curveVertex(34,218);
  curveVertex(62,224);
  curveVertex(74,241);
  curveVertex(77,281);
  curveVertex(38,302);
  curveVertex(14,295);
  curveVertex(0,272);
  curveVertex(0,272);
  endShape(CLOSE);
 
 // RED Block 
  fill(255,0,0);  
  noStroke( );  
  beginShape();
  curveVertex(0,140); // the first control point
   curveVertex(0,140);
  curveVertex(27,136);
  curveVertex(51,143);
  curveVertex(62,151);
  curveVertex(67,164); 
  curveVertex(73,193);
  curveVertex(58,221);
  curveVertex(34,218);
  curveVertex(18,223);
  vertex(5,234);
  vertex(0,244);
  vertex(0,244);
  endShape();
  
  
  // block slope block
  fill(0);  
  noStroke( );  
  beginShape();
  curveVertex(67,164); // the first control point
  curveVertex(67,164);
  curveVertex(62,151);
  curveVertex(51,143);
  vertex(51,143);
  vertex(0,205);
  vertex(0,230); 
  vertex(5,234);
  curveVertex(5,234);
  curveVertex(18,223);
  curveVertex(34,218);
  curveVertex(34,218);
  endShape(CLOSE);
  
  //green block
  noStroke();
  fill(89,82,23);
  beginShape();
  curveVertex(56,356);
  curveVertex(56,356);
  curveVertex(82,347);
  curveVertex(109,350);
  curveVertex(109,350);
  vertex(109,350);
  vertex(100,356);
  endShape(CLOSE);
  
  
  
  // yeollow
  fill(244,195,56);  
  noStroke( );  
  beginShape();
  vertex(34,218);
  vertex(18,223);
  vertex(5,234);
  vertex(22,238);
  endShape(CLOSE);
  
  fill(0);  
  noStroke( );  
  beginShape();
  vertex(0,244);
  vertex(0,272);
  vertex(22,238);
  vertex(5,234);
  endShape(CLOSE);
  
  
  fill(0);
  noStroke();
  line(34,218,18,223);
 
  
  fill(0);  
  noStroke( );  
  beginShape();
  curveVertex(22,238);
  curveVertex(22,238);
  curveVertex(42,233);
  curveVertex(58,221);
  curveVertex(34,218);
  curveVertex(34,218);
  endShape();
  
  // yeollow
  fill(0);  
  noStroke( );  
  beginShape();
  curveVertex(74,241);
  curveVertex(74,241);
  curveVertex(77,283);
  curveVertex(43,302);
  
  curveVertex(61,259);
  curveVertex(61,259);
  curveVertex(74,241);
  endShape(CLOSE);
  
 // all line
  stroke(0);
  strokeWeight(0);
  line(0,86,9,76);
  line(0,103,22,102);
  line(38,72,36,109);
  line(28,72,47,103);
  line(27,88,53,84);
  line(28,96,48,75);
  line(0,29,65,29);
  ellipse(73,29,14,14);
  line(92,1,111,44);
  line(105,5,97,46);
  line(84,19,122,26);
  line(117,11,84,41);
  line(125,91,145,127); 
  line(136,88,130,127);
  line(154,91,116,122);
  line(106,239,100,275);
  line(95,243,119,273);
  line(91,255,120,255);
  line(122,241,89,266);
  line(74,304,99,302);
   line(85,291,85,317);
  line(96,294,74,314);
   line(79,297,98,314);
   line(228,356,223,348);
   line(232,356,233,346);
   line(237,356,245,348);
   
   line(242,165,242,191);
   line(232,168,251,186);
   line(255,167,232,189);
    line(230,182,256,176);
   line(179,0,194,13);
   line(173,6,196,1);
   line(173,19,186,0);
   line(182,0,184,18);
   
   
  fill(0);  
  noStroke( );  
  beginShape();
  vertex(93,183);
  vertex(105,194);
  vertex(102,210);
  vertex(114,198);
  vertex(107,194);
  vertex(113,164);
  vertex(101,171);
  

  endShape(CLOSE);
  
   fill(46,39,66);  
  noStroke( );  
  beginShape();
  curveVertex(95,235);
  curveVertex(95,235);
  curveVertex(117,230);
  curveVertex(137,220);
  curveVertex(137,220);
  vertex(114,198);
  vertex(102,210);
  endShape(CLOSE);
  
   fill(0);  
  noStroke( );  
  beginShape();
  vertex(0,337);
  vertex(9,342); 
  vertex(0,349);
  endShape(CLOSE);
  
  fill(0);  
  noStroke( );  
  beginShape();
  curveVertex(24,339);
  curveVertex(24,339);
  curveVertex(36,315);
  curveVertex(15,321);
  curveVertex(15,321);
  endShape(CLOSE);
 
 fill(46,39,66);  
  noStroke( );  
  beginShape();
  curveVertex(36,315);
  curveVertex(36,315);
  curveVertex(43,329);
  curveVertex(25,337);
  curveVertex(25,337);
  endShape(CLOSE);

// half ball blue
fill(46,39,66);  
  noStroke( );  
  beginShape();
  curveVertex(94,343);
  curveVertex(94,343);
  curveVertex(80,337);
  curveVertex(72,350);
  curveVertex(72,350);
  endShape();
  // half ball black
  fill(0);  
  noStroke( );  
  beginShape();
  curveVertex(94,343);
  curveVertex(94,343);
  curveVertex(86,355);
  curveVertex(72,350);
  curveVertex(72,350);
  endShape();
  
  noFill();  
  stroke(0);  
  beginShape();
  curveVertex(127,356);
  curveVertex(127,356);
  curveVertex(152,334);
  curveVertex(167,323);
  curveVertex(176,306);
  curveVertex(178,273);
  curveVertex(178,273);
  endShape();
  
  noFill();  
  stroke(0);  
  beginShape();
  curveVertex(150,356);
  curveVertex(150,356);
  curveVertex(161,348);
  curveVertex(171,343);
  curveVertex(187,328);
  curveVertex(194,315);
  curveVertex(195,301);
  curveVertex(195,301);
  endShape();
  
  fill(0);  
  noStroke();  
  beginShape();  
  curveVertex(119,289);
  curveVertex(119,289);
  curveVertex(123,307);
  curveVertex(143,309);
  vertex(143,309);
  vertex(177,296);
  curveVertex(177,296);
  curveVertex(177,296);
  curveVertex(175,311);
  curveVertex(167,323);
  curveVertex(167,323);
  vertex(167,323);
  curveVertex(151,321);
  curveVertex(121,319);
  curveVertex(114,312);
  curveVertex(112,301);
  curveVertex(112,301);
  endShape(CLOSE);
  
  
  fill(0);  
  noStroke();  
  beginShape();
  curveVertex(189,327);
  curveVertex(189,327);
  curveVertex(194,312);
  curveVertex(194,312);
  vertex(194,312);
  curveVertex(194,312);
  curveVertex(194,312);
  curveVertex(207,324);
  curveVertex(218,325);
  curveVertex(231,319);
  curveVertex(231,319);
  vertex(231,319);
  curveVertex(231,319);
  curveVertex(231,319);
  curveVertex(222,330);
  curveVertex(204,333);
  endShape(CLOSE);
  
  // red block
  fill(255,0,0);  
  noStroke();  
  beginShape();
  curveVertex(177,296);
  curveVertex(177,296);
  curveVertex(175,311);
  curveVertex(167,323);
  curveVertex(167,323);
  vertex(167,323);
  curveVertex(167,323);
  curveVertex(189,327);
  vertex(189,327);
  curveVertex(189,327);
  curveVertex(194,312);
  vertex(194,312);
  vertex(194,312);
  endShape(CLOSE);
  
  // red block
  noFill();  
  stroke(0);  
  beginShape();
  curveVertex(177,282);
  curveVertex(177,282);
  curveVertex(157,288);
  curveVertex(144,282);
  curveVertex(144,267);
  curveVertex(176,200);
  curveVertex(176,200);
  endShape();
  
  noFill();  
  stroke(0);  
  beginShape();
  curveVertex(272,356);
  curveVertex(272,356);
  curveVertex(272,336);
  curveVertex(259,304);
  curveVertex(213,249);
  curveVertex(186,218);
  curveVertex(176,200);
  curveVertex(176,200);
  endShape();
  
  //eye
  fill(0);
  ellipse(207,64,84,84);
 
   // yeollow block
  fill(244,195,56);  
  noStroke();  
  beginShape();
  curveVertex(232,44);
  curveVertex(232,44);
  curveVertex(210,41);
  curveVertex(187,47);
  curveVertex(178,64);
  curveVertex(184,85);
  curveVertex(182,85);
  
  endShape();
  //
  fill(244,195,56);  
  noStroke();  
  beginShape();
  curveVertex(184,85);
  curveVertex(184,85);
  curveVertex(203,93);
  curveVertex(223,85);
  curveVertex(233,67);
  curveVertex(232,44);
  curveVertex(232,44);
  
  endShape();
 
 //eye
 fill(0);
  ellipse(205,66,28,28);
 
 //
  fill(0);  
  noStroke();  
  beginShape();
  curveVertex(170,66);
  curveVertex(170,66);
  
  curveVertex(176,36);
  curveVertex(155,55);
  curveVertex(147,61);
  curveVertex(132,71);
  curveVertex(132,71);
  endShape();
  
  fill(0);  
  noStroke();  
  beginShape();
  curveVertex(173,89);
  curveVertex(173,89);
  curveVertex(160,80);
  curveVertex(147,78);
  curveVertex(132,71);
  curveVertex(170,66);
  curveVertex(170,66);
  endShape();
  
  //eye
 fill(0);
  ellipse(144,70,24,14);
  
  //eye
 fill(0);
  ellipse(226,140,42,42);
  
  fill(0);  
  noStroke();  
  beginShape();
  curveVertex(162,151);
  curveVertex(162,151);
  curveVertex(162,139);
  curveVertex(175,136);
  curveVertex(175,136);
  endShape();
  
   fill(46,39,66);  
  noStroke();  
  beginShape();
  curveVertex(163,153);
  curveVertex(163,153);
  curveVertex(178,152);
  curveVertex(175,136);
  curveVertex(175,136);
  endShape();
  
  fill(0);  
  noStroke();  
  beginShape();
  curveVertex(165,221);
  curveVertex(165,221);
  curveVertex(154,225);
  curveVertex(158,237);
  curveVertex(158,237);
  endShape();
  
   fill(46,39,66);  
  noStroke();  
  beginShape();
  curveVertex(165,221);
  curveVertex(165,221);
  curveVertex(169,234);
  curveVertex(158,237);
  curveVertex(158,237);
  endShape();
  
  //1
   noFill();  
  stroke(0);  
  beginShape();
  curveVertex(192,225);
  curveVertex(192,225);
  curveVertex(219,209);
  curveVertex(250,201);
  curveVertex(250,201);
  endShape();
  //2
  beginShape();
  curveVertex(179,206);
  curveVertex(179,206);
  curveVertex(194,194);
  curveVertex(207,184);
  curveVertex(224,179);
  curveVertex(224,179);
  endShape();
  //3
  beginShape();
  curveVertex(213,249);
  curveVertex(213,249);
  curveVertex(240,234);
  curveVertex(265,231);
  curveVertex(265,231);
  endShape();
  //4 
  beginShape();
  curveVertex(237,278);
  curveVertex(237,278);
  curveVertex(263,269);
  curveVertex(283,269);
  curveVertex(283,269);
  endShape();
  //5 
  beginShape();
  curveVertex(258,302);
  curveVertex(258,302);
  curveVertex(275,294);
  curveVertex(293,301);
  curveVertex(293,301);
  endShape();
   //6
  beginShape();
  curveVertex(272,336);
  curveVertex(272,336);
  curveVertex(287,344);
  curveVertex(295,356);
  curveVertex(295,356);
  endShape();
  
  fill(0);  
  noStroke();  
  beginShape();
  curveVertex(197,190);
  curveVertex(197,190);
  curveVertex(202,178);
  curveVertex(212,183);
  curveVertex(212,183);
  endShape();
  
   fill(46,39,66);  
  noStroke();  
  beginShape();
  curveVertex(197,190);
  curveVertex(197,190);
  curveVertex(208,195);
  curveVertex(212,183);
  curveVertex(212,183);
  endShape();
  
  
  fill(0);  
  noStroke();  
  beginShape();
  curveVertex(230,239);
  curveVertex(230,239);
  curveVertex(237,228);
  curveVertex(246,233);
  curveVertex(246,233);
  endShape();
  
   fill(46,39,66);  
  noStroke();  
  beginShape();
  curveVertex(230,239);
  curveVertex(230,239);
  curveVertex(240,245);
  curveVertex(246,233);
  curveVertex(246,233);
  endShape();
  
  noFill();  
  stroke(0);  
  beginShape();
  curveVertex(315,356);
  curveVertex(315,356);
  curveVertex(300,270);
  curveVertex(286,197);
  curveVertex(275,140);
  curveVertex(279,91);
  curveVertex(308,36);
  curveVertex(308,36);
  endShape();
  
  
  fill(0);
  ellipse(307,287,18,18);
  
  ellipse(279,183,36,36);
  
  ellipse(275,131 ,18,18);
  //
  ellipse(258,58 ,8,8);
  ellipse(276,34 ,8,8);
  ellipse(308,34 ,8,8);
  ellipse(322,55 ,10,10);
  ellipse(308,91 ,10,10);
  ellipse(293,9 ,16,16);
  ellipse(253,12 ,16,16);
  ellipse(310,136 ,24,24);
  ellipse(307,200,16,16);
  ellipse(293,241,32,32);
  //
  noFill();
  stroke(0);
  line(258,58,291,68);
  line(276,34,291,68);
  line(322,55,291,68);
  line(308,91,291,68);
  line(293,9,253,12);
  line(310,136,307,200);
  
  //
  fill(62,62,35);
  noStroke();
  beginShape();
  curveVertex(290,224);
  curveVertex(290,224);
  curveVertex(279,230);
  curveVertex(275,243);
  curveVertex(284,256);
  curveVertex(297,259);
  curveVertex(297,259);
  endShape();
  //
  noFill();
  stroke(0);
  beginShape();
  curveVertex(249,61);
  curveVertex(249,61);
  curveVertex(256,78);
  curveVertex(270,81);
  curveVertex(270,81);
  
  endShape();
  
  fill(0);
  noStroke();
  beginShape();
  curveVertex(163,264);
  curveVertex(163,264);
  curveVertex(177,275);
  curveVertex(191,289);
  curveVertex(212,292);
  curveVertex(225,280);
  curveVertex(223,268);
  curveVertex(223,268);
  endShape();
  
  fill(210);
  noStroke();
  beginShape();
  curveVertex(163,264);
  curveVertex(163,264);
  curveVertex(177,262);
  curveVertex(198,254);
  curveVertex(210,257);
  curveVertex(223,268);
  curveVertex(223,268);
  endShape();
  
  fill(210);
  noStroke();
  beginShape();
  curveVertex(163,264);
  curveVertex(163,264);
  curveVertex(174,268);
  curveVertex(189,279);
  curveVertex(204,283);
  curveVertex(220,278);
  curveVertex(223,268);
  curveVertex(223,268);
  endShape();
  
  //
  fill(46,39,66);
  noStroke();
  ellipse(198,266,24,24);
  fill(0);
  noStroke();
  ellipse(198,266,8,8);
  //.....................
  //1
  stroke(0);
  noFill();
  beginShape();
  curveVertex(225,280);
  curveVertex(225,280);
  curveVertex(230,285);
  curveVertex(238,286);
  curveVertex(238,286);
  endShape();
  //2
  stroke(0);
  noFill();
  beginShape();
  curveVertex(220,287);
  curveVertex(220,287);
  curveVertex(221,297);
  curveVertex(230,307);
  curveVertex(230,307);
  endShape();
  //3
  stroke(0);
  noFill();
  beginShape();
  curveVertex(204,293);
  curveVertex(204,293);
  curveVertex(204,303);
  curveVertex(209,310);
  curveVertex(209,310);
  endShape();
  
  
  
}



