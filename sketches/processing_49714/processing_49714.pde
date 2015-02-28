
void setup() {
  size(640, 480);
  background(50);
  smooth();  
  noFill();
  
  //COUCH
  stroke(100, 75);
  strokeWeight(5);
  line(0, 299, 640, 151);
  
  beginShape();
  vertex(273,  239);
  curveVertex(273,  239);
  curveVertex(492,  398);
  curveVertex(550,  451);
  curveVertex(569,  480);
  vertex(569, 480);
  endShape();
  
  beginShape();
  vertex(394,  322);
  curveVertex(394,  322);
  curveVertex(490,  263);
  curveVertex(530,  249);
  curveVertex(561,  245);
  curveVertex(591,  250);
  vertex(591, 250);
  endShape();
  
  beginShape();
  vertex(110,  402);
  curveVertex(110,  402);
  curveVertex(139,  374);
  curveVertex(247,  329);
  curveVertex(315,  318);
  curveVertex(366,  316);
  vertex(366, 316);
  endShape();
  
  beginShape();
  vertex(270,  222);
  curveVertex(270,  222);
  curveVertex(263,  133);
  curveVertex(245,  50);
  curveVertex(237, 24);
  curveVertex(230,  10);
  curveVertex(224,  0);
  vertex(224, 0);
  endShape();
  
  //MILK BOTTLE

  stroke(255);
  strokeWeight(1);
  
  beginShape();
  vertex(214,  94);
  curveVertex(214,  94);
  curveVertex(200,  89);
  curveVertex(192,  85);
  curveVertex(191,  75);
  curveVertex(198,  68);
  curveVertex(223,  61);
  curveVertex(282,  62);
  curveVertex(315,  73);
  curveVertex(313,  86);
  curveVertex(296,  91);
  curveVertex(276,  96);
  curveVertex(240,  97);
  vertex(240, 97);
  endShape();
  
  beginShape();
  vertex(195,  74);
  curveVertex(195,  74);
  curveVertex(197,  77);
  curveVertex(212,  83);
  curveVertex(250,  87);
  curveVertex(288, 84);
  curveVertex(304,  78);
  curveVertex(307, 75);
  vertex(307, 75);
  endShape();
  
  beginShape();
  vertex(200,  78);
  curveVertex(200,  78);
  curveVertex(219,  69);
  curveVertex(253,  69);
  curveVertex(279, 70);
  curveVertex(303, 78);
  vertex(303, 78);
  endShape();
  
  beginShape();
  vertex(195,  87);
  curveVertex(195,  87);
  curveVertex(213,  144);
  curveVertex(214,  195);
  curveVertex(190, 256);
  curveVertex(188, 404);
  curveVertex(250, 436);
  curveVertex(305, 404);
  curveVertex(308, 254);
  curveVertex(290, 207);
  curveVertex(290, 148);
  curveVertex(309, 90);
  vertex(309, 90);
  endShape();
  
  beginShape();
  vertex(296,  230);
  curveVertex(296,  230);
  curveVertex(274,  256);
  curveVertex(285,  287);
  curveVertex(296,  288);
  curveVertex(298,  287);
  curveVertex(307, 282);
  vertex(307, 282);
  endShape();
  
  beginShape();
  vertex(297,  235);
  curveVertex(297,  235);
  curveVertex(283,  265);
  curveVertex(289,  280);
  curveVertex(296,  280);
  curveVertex(306,  274);
  vertex(306, 274);
  endShape();
  
  //BOTTLE SHADING
  
  fill(150, 75);
  noStroke();
  beginShape(TRIANGLES);
  vertex(303, 96);
  vertex(290, 129);
  vertex(293, 99);

  vertex(202, 95);
  vertex(219, 147);
  vertex(209, 98);
  endShape();
  
  fill(150, 50);
  beginShape();
  vertex(201,  418);
  curveVertex(201,  418);
  curveVertex(193,  402);
  curveVertex(192,  373);
  curveVertex(192,  297);
  curveVertex(204,  259);
  curveVertex(220,  267);
  curveVertex(230,  285);
  curveVertex(243,  295);
  curveVertex(256,  290);
  curveVertex(271,  313);
  curveVertex(282,  323);
  curveVertex(298,  349);
  curveVertex(303,  387);
  curveVertex(300,  408);
  curveVertex(276,  430);
  curveVertex(231,  433);
  curveVertex(201,  418);
  vertex(201, 418);
  endShape();
  
  //PENNIES
  
  color copper1 = color(227, 169, 133);
  color copper2 = color(193, 126, 84);
  color copper3 = color(171, 89, 39);
  color silver1 = color(165);
  color silver2 = color(119);
  color silver3 = color(215);
  
  noStroke();
  fill(copper1);
  ellipse(220, 401, 20, 20);
  ellipse(257, 378, 20, 20);
  ellipse(267, 400, 20, 20);
  fill(silver1);
  ellipse(249, 405, 20, 17);
  ellipse(212, 366, 20, 13);
  ellipse(249, 370, 20, 17);
  fill(copper2);
  ellipse(238, 416, 20, 16);
  ellipse(278, 416, 20, 16);
  ellipse(227, 383, 20, 19);
  fill(silver2);
  ellipse(207, 407, 20, 16);
  ellipse(257, 394, 20, 16);
  fill(copper3);
  ellipse(258, 368, 20, 16);
  ellipse(207, 405, 20, 16);
  ellipse(238, 397, 20, 16);
  fill(silver3);
  ellipse(283, 407, 20, 16);
  ellipse(259, 411, 20, 16);
  fill(silver1);
  ellipse(219, 411, 20, 20);
  ellipse(278, 416, 20, 16);
  ellipse(245, 413, 20, 16);
  fill(copper1);
  ellipse(203, 388, 20, 14);
  ellipse(270, 412, 20, 17);
  fill(copper2);
  ellipse(280, 388, 25, 20);
  ellipse(289, 382, 20, 16);
  fill(silver2);
  ellipse(283, 370, 20, 14);
  ellipse(288, 397, 25, 20);
  ellipse(253, 387, 20, 18);
  fill(copper3);
  ellipse(206, 379, 20, 14);
  ellipse(261, 422, 20, 14);
  ellipse(254, 391, 20, 16);
  fill(silver1);
  ellipse(235, 394, 20, 16);
  ellipse(225, 401, 20, 16);
  fill(silver3);
  ellipse(221, 397, 20, 16);
  ellipse(225, 418, 20, 16);
  ellipse(231, 408, 20, 16);
  fill(silver2);
  ellipse(205, 401, 20, 16);
  ellipse(217, 387, 20, 16);
  ellipse(242, 397, 20, 16);
  fill(copper1);
  ellipse(248, 382, 25, 20);
  ellipse(273, 384, 20, 16);
}

