
size(400, 400);
colorMode(HSB, 360, 100, 100);
background(200, 100, 100);
smooth();

//虹
noFill();
for(int i=0; i<7; i++){
strokeWeight(10);
stroke(i*48, 100, 100);
ellipse(400, 400, 860-i*20, 820-i*20);
}

noStroke();
fill(#ffffff);

//街並み
beginShape();
vertex(0, 400);

vertex(0, 355);
vertex(10, 355);
vertex(10, 375);
vertex(25, 375);
vertex(25, 342);
vertex(30, 342);
vertex(30, 340);
vertex(40, 340);
vertex(40, 330);
vertex(50, 330);
vertex(50, 345);
vertex(55, 345);
vertex(55, 370);
vertex(80, 370);

vertex(80, 400);
vertex(80, 365);
vertex(90, 365);
vertex(90, 345);
vertex(95, 345);
vertex(95, 350);
vertex(100, 350);
vertex(100, 352);
vertex(105, 352);
vertex(105, 375);

vertex(115, 375);
vertex(115, 315);
vertex(120, 315);
vertex(118, 313);
vertex(129, 313);
vertex(127, 315);
vertex(132, 315);
vertex(132, 355);
vertex(137, 355);
vertex(137, 385);

vertex(155, 385);
vertex(165, 235);
vertex(160, 235);
vertex(158, 215);
vertex(167, 215);
vertex(170, 185);
vertex(168, 185);
vertex(166, 175);
vertex(171, 175);
vertex(172.5, 160);
vertex(174.5, 160);
vertex(175.5, 115);
vertex(177.5, 115);
vertex(178.5, 160);
vertex(180.5, 160);
vertex(182, 175);
vertex(187, 175);
vertex(185, 185);
vertex(183, 185);
vertex(186, 215);
vertex(195, 215);
vertex(193, 235);
vertex(188, 235);
vertex(197, 375);

vertex(217, 375);
vertex(217, 323);
vertex(237, 323);
vertex(237, 315);
vertex(247, 315);
vertex(247, 323);
vertex(250, 323);
vertex(250, 353);
vertex(260, 353);
vertex(260, 338);
vertex(275, 338);
vertex(275, 333);
vertex(276, 333);
vertex(276, 325);
vertex(282, 325);
vertex(282, 333);
vertex(283, 333);
vertex(283, 385);

vertex(298, 385);
vertex(298, 345);
vertex(318, 345);
vertex(318, 335);
vertex(348, 335);
vertex(348, 350);
vertex(353, 350);
vertex(353, 375);

vertex(360, 375);
vertex(360, 365);
vertex(365, 365);
vertex(365, 367);
vertex(380, 367);
vertex(380, 390);
vertex(385, 390);
vertex(385, 390);
vertex(390, 390);
vertex(390, 338);
vertex(400, 338);
vertex(400, 400);
endShape();
