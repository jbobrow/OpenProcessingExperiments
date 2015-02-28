

//background
size(500, 500);
background(#EA0707);

fill(#FFE600);
rect(-3, 160, 550,170);

fill (#227E09);
rect(-3,330, 550, 180);

//rastafarian!!!

//face
fill(#893F1A);
ellipse (250, 250, 210, 300);

//hair curve vertices 
noSmooth();
strokeWeight (15);
noFill();
beginShape();
curveVertex(375, 375);
curveVertex(390, 375);
curveVertex(300, 80);
curveVertex(130, 200);
curveVertex(175, 375);
curveVertex(200, 600);
endShape();

noSmooth();
strokeWeight (22);
noFill();
beginShape();
curveVertex(375, 412);
curveVertex(350, 400);
curveVertex(320, 100);
curveVertex(150, 160);
curveVertex(125, 390);
curveVertex(200, 400);
endShape();

noSmooth();
strokeWeight (15);
noFill();
beginShape();
curveVertex(375, 380);
curveVertex(370, 380);
curveVertex(300, 110);
curveVertex(120, 220);
curveVertex(150, 375);
curveVertex(200, 600);
endShape();

noSmooth();
strokeWeight (10);
noFill();
beginShape();
curveVertex(375, 412);
curveVertex(350, 430);
curveVertex(350, 100);
curveVertex(150, 160);
curveVertex(145, 400);
curveVertex(10, 500);
endShape();

//eyes
fill(#050505);
strokeWeight (0);
ellipse(200, 240, 55, 40);

fill(#050505);
strokeWeight (0);
ellipse(300, 240, 50, 55);

fill(255, 255, 255);
noStroke();
ellipse(300, 240, 30, 30);

fill(255, 255, 255);
noStroke();
ellipse(207, 237, 25, 25);

//Nose
stroke (#000000);
strokeWeight(4);
fill(#893F1A);
arc(268, 250, 60, 85, PI/1.7, PI);

noFill ();
arc(251,280, 40, 20, PI/1.5, PI);

//eyebrows
noSmooth ();
fill (#1A0A03);
rect(270, 180, 57, 12);

noSmooth();
rect (170, 210, 65, 13);

//mouth
fill (#5D0606);
triangle ( 220,330, 300, 330, 300, 305);

//stubble craptons of points
point(200, 310);
point(220, 306);
point(230, 309);
point(215, 307);
point(223, 310);
point(237, 306);
point(245, 309);
point(255, 307);
point(260, 313);
point(239, 314);
point(250, 309);
point(268, 307);
point(350, 299);
point(320, 306);
point(325, 309);
point(310, 307);
point(330, 300);
point(305, 303);
point(319, 308);
point(350, 270);
point(325, 333);
point(329, 314);
point(314, 318);
point(350, 314);
point(304, 318);
point(320, 324);
point(310, 321);
point(350, 319);
point(304, 335);
point(320, 339);
point(310, 325);
point(350, 343);
point(304, 346);
point(320, 330);
point(314, 333);
point(350, 349);
point(304, 355);
point(320, 339);
point(310, 340);
point(305, 364);
point(322, 346);
point(310, 347);
point(295, 340);
point(297, 349);
point(293, 356);
point(295, 363);
point(295, 370);
point(286, 336);
point(284, 344);
point(286, 350);
point(284, 358);
point(286, 366);
point(286, 374);
point(283, 381);
point(286, 386);
point(280, 336);
point(273, 337);
point(275, 343);
point(273, 349);
point(276, 357);
point(273, 386);
point(273, 391);
point(265, 336);
point(266, 341);
point(265, 346);
point(265, 336);
point(260, 336);
point(252, 336);
point(245, 336);
point(235, 336);
point(210, 315);
point(218, 317);
point(227, 317);
point(206, 322);
point(195, 315);
point(190, 322);
point(195, 330);
point(188, 317);
point(182, 317);
point(175, 315);
point(168, 311);
point(162, 316);
point(160, 310);
point(167, 318);
point(167, 324);
point(169, 333);
point(173, 338);
point(173, 347);
point(173, 347);
point(183, 325);
point(176, 327);
point(176, 333);
point(185, 332);
point(187, 345);
point(196, 330);
point(199, 350);
point(198, 342);
point(204, 340);
point(215, 339);
point(220, 338);
point(219, 320);
point(193, 352);
point(185, 354);
point(189, 360);
point(194, 370);
point(200, 370);
point(202, 376);
point(210, 372);
point(215, 380);
point(219, 390);
point(220, 360);

fill(#1A0A03);
noSmooth();
rect(240, 336, 25, 50);
strokeWeight(13);
line(282, 388, 337, 340);
line(165, 340, 220, 390);
strokeWeight(3);
quad(220, 390, 250, 375, 280, 390, 253, 415);

//joint
fill(#DADECE);
quad(210, 360, 240, 325, 213, 362, 242, 325);








