
void setup() {
  
size(500, 800);

smooth();
}

void draw () { 
  
  if (mousePressed == true) {
  
background(251, 246, 165);

fill(183,180,248); // top right
triangle(325,1,500,1,187,277);

fill(183,180,248); // counter clockwise 2 
triangle(0,1,146,1,187,277);

fill(183,180,248); // 3
triangle(1,214,1,325,187,277);

fill(183,180,248); //4
triangle(1,480,1,798,187,277);

fill(183,180,248); // 5
triangle(150,798,348,798,187,277);

fill(183,180,248); // 6
triangle(498,798,498,560,187,277);

fill(183,180,248); // 7
triangle(498,390,498,180,187,277);
    
    
fill(238,18,184); // HAIR
stroke(0);
strokeWeight(1.5); //STROKE
strokeJoin(ROUND);
beginShape();
  vertex(49, 200);
  vertex(50, 165);
  vertex(51, 150);
  vertex(55, 130);
  vertex(66, 100);
  vertex(84, 78);
  vertex(110, 55);
  vertex(130, 50);
  vertex(160, 53);
  vertex(180, 55);
  vertex(210, 58);
  vertex(240, 65);
  vertex(268, 100);
  vertex(300, 130); 
  vertex(328, 200);
  vertex(330, 233);
  vertex(340, 300); //curl
  vertex(360, 450);
  vertex(350, 468);
  vertex(340, 500);
  vertex(360, 600);
  vertex(354, 620);
  vertex(347, 633);
  vertex(355, 636);
  vertex(356, 640);
  vertex(347, 643);
  vertex(345, 645);
  vertex(346, 650);
  vertex(347, 653);
  vertex(346, 657);
  vertex(345, 660);
  vertex(344, 690);
  vertex(340, 730);
  vertex(330, 732);
  vertex(328, 738);
  vertex(330, 770);
  vertex(329, 780);
  vertex(324, 784);
  vertex(320, 758);
  vertex(317, 764);
  vertex(304, 748);
  vertex(300, 780);
  vertex(296, 776);
  vertex(290, 790);
  vertex(280, 760);
  vertex(275, 746);
  vertex(270, 760);
  vertex(258, 740);
  vertex(247, 700);
  vertex(245, 670);
  vertex(235, 654);
  vertex(238, 648);
  vertex(240, 620);
  vertex(247, 600);
  vertex(245, 552);
  vertex(243, 548);
  vertex(242, 530);
  vertex(240, 519);
  vertex(236, 500);
  vertex(230, 470);
  vertex(231, 459);
  vertex(232, 450);
  vertex(228, 448);
  vertex(230, 400);  //other piece
  vertex(130, 370);
  vertex(130, 400);
  vertex(137, 438);
  vertex(145, 452);
  vertex(148, 487);
  vertex(150, 500);
  vertex(138, 600);
  vertex(146, 640);
  vertex(140, 700);
  vertex(138, 723);
  vertex(136, 714);
  vertex(130, 720);
  vertex(124, 700);
  vertex(120, 710);
  vertex(120, 721);
  vertex(117, 738);
  vertex(110, 780);
  vertex(105, 789);
  vertex(100, 782);
  vertex(97, 780);
  vertex(92, 763);
  vertex(90, 760);
  vertex(93, 746);
  vertex(90, 745);
  vertex(80, 750);
  vertex(70, 740);
  vertex(65, 736);
  vertex(60, 743);
  vertex(58, 739);
  vertex(53, 758);
  vertex(49, 760);
  vertex(42, 740);
  vertex(37, 738);
  vertex(40, 720);
  vertex(44, 700);
  vertex(40, 680);
  vertex(38, 650);
  vertex(30, 600);
  vertex(29, 560);
  vertex(36, 549);
  vertex(31, 500);
  vertex(30, 450);
  vertex(33, 435);
  vertex(29, 432);  
  vertex(25, 434);
  vertex(23, 400);
endShape(CLOSE); 

smooth();
fill(239, 213, 184); // face
stroke(0);
beginShape();
  vertex(79, 170);
  vertex(76, 184);
  vertex(75, 198);
  vertex(74, 212);
  vertex(75, 226);
  vertex(77, 240);
  vertex(80, 254);
  vertex(85, 268);
  vertex(90, 282);
  vertex(93, 296);
  vertex(95, 310); // left temple
  vertex(101, 333);
  vertex(104, 340);
  vertex(108, 345);
  vertex(110, 350);
  vertex(115, 355);
  vertex(117, 360);
  vertex(119, 365);
  vertex(127, 380);
  vertex(130, 385);
  vertex(135, 390);
  vertex(150, 403);
  vertex(155, 408);
  vertex(160, 410);
  vertex(165, 414);
  vertex(170, 418);
  vertex(175, 420);
  vertex(180, 422);
  vertex(195, 425);
  vertex(200, 427);
  vertex(215, 428); //left cheek chin
  vertex(250, 417);
  vertex(260, 410);
  vertex(270, 397); // right chin
  vertex(274, 390);
  vertex(276, 380);
  vertex(282, 366);
  vertex(286, 342);
  vertex(287, 340);
  vertex(289, 333);
  vertex(292, 320);
  vertex(291, 310);
  vertex(290, 300);
  vertex(280, 266);
  vertex(277, 233);
  vertex(276, 217);
  vertex(266, 200);
  vertex(236, 190);
  vertex(190, 170);
  vertex(185, 168);
  vertex(168, 165);
  vertex(133, 160);
  vertex(120, 159);
  vertex(100, 163); 
endShape(CLOSE); // END OF FACE

beginShape(); //left eye
fill(255,255,255); 
  vertex(135,264);
  vertex(150,270);
  vertex(138,280); 
  vertex(113,283);
  vertex(120,267);
endShape(CLOSE);

fill(154,204,218); // left
beginShape();
  vertex(135,264);
  vertex(140,271);
  vertex(138,280); 
  vertex(120,280);
  vertex(120,267);
endShape(CLOSE); 

fill(64);
ellipse(131,275,10,10);

beginShape(); //right eye
fill(255,255,255); 
  vertex(216,254);
  vertex(226,243);
  vertex(244,243);
  vertex(256,250); 
  vertex(235,259);
endShape(CLOSE);

beginShape(); //right
fill(154,204,218);
  vertex(224,254);
  vertex(226,243);
  vertex(244,243);
  vertex(247,250); 
  vertex(235,259);
endShape(CLOSE);

fill(64);
ellipse(234,252,11,11);

fill(238,18,184); //left brow
  beginShape();
    vertex(97,264);
    vertex(108,253);
    vertex(142,252);
    vertex(110,257);
  endShape(CLOSE);


fill(238,18,184); //right brow
  beginShape();
    vertex(218,234);
    vertex(247,230);
    vertex(260,240);
    vertex(242,234);
  endShape(CLOSE);
  
  fill(0);
  line(174,335,199,333);
  line(199,333,220,326);
 
  line(173,331,174,334);
  line(221,321,220,325);
  
  fill(47,241,107);
  stroke(0);
  strokeWeight(1);
beginShape(); // lip top
    vertex(161,372);
    vertex(187,359);
    vertex(201,360);
    vertex(221,353);
    vertex(247,358);
    
endShape(CLOSE);
  
fill(108,243,149); 
beginShape(); //lip bottom
   vertex(161,372);
   vertex(180,378);
   vertex(201,381);
   vertex(225,374);
   vertex(247,358);
endShape(CLOSE);
    
    
    
    
} else {

background(230, 243, 252);

fill(173,251,164); // top right
triangle(325,1,500,1,187,277);

fill(173,251,164); // counter clockwise 2 
triangle(0,1,146,1,187,277);

fill(173,251,164); // 3
triangle(1,214,1,325,187,277);

fill(173,251,164); //4
triangle(1,480,1,798,187,277);

fill(173,251,164); // 5
triangle(150,798,348,798,187,277);

fill(173,251,164); // 6
triangle(498,798,498,560,187,277);

fill(173,251,164); // 7
triangle(498,390,498,180,187,277);

fill(81, 57, 30); // HAIR
stroke(0);
strokeWeight(1.5); //STROKE
strokeJoin(ROUND);
beginShape();
  vertex(49, 200);
  vertex(50, 165);
  vertex(51, 150);
  vertex(55, 130);
  vertex(66, 100);
  vertex(84, 78);
  vertex(110, 55);
  vertex(130, 50);
  vertex(160, 53);
  vertex(180, 55);
  vertex(210, 58);
  vertex(240, 65);
  vertex(268, 100);
  vertex(300, 130); 
  vertex(328, 200);
  vertex(330, 233);
  vertex(340, 300); //curl
  vertex(360, 450);
  vertex(350, 468);
  vertex(340, 500);
  vertex(360, 600);
  vertex(354, 620);
  vertex(347, 633);
  vertex(355, 636);
  vertex(356, 640);
  vertex(347, 643);
  vertex(345, 645);
  vertex(346, 650);
  vertex(347, 653);
  vertex(346, 657);
  vertex(345, 660);
  vertex(344, 690);
  vertex(340, 730);
  vertex(330, 732);
  vertex(328, 738);
  vertex(330, 770);
  vertex(329, 780);
  vertex(324, 784);
  vertex(320, 758);
  vertex(317, 764);
  vertex(304, 748);
  vertex(300, 780);
  vertex(296, 776);
  vertex(290, 790);
  vertex(280, 760);
  vertex(275, 746);
  vertex(270, 760);
  vertex(258, 740);
  vertex(247, 700);
  vertex(245, 670);
  vertex(235, 654);
  vertex(238, 648);
  vertex(240, 620);
  vertex(247, 600);
  vertex(245, 552);
  vertex(243, 548);
  vertex(242, 530);
  vertex(240, 519);
  vertex(236, 500);
  vertex(230, 470);
  vertex(231, 459);
  vertex(232, 450);
  vertex(228, 448);
  vertex(230, 400);  //other piece
  vertex(130, 370);
  vertex(130, 400);
  vertex(137, 438);
  vertex(145, 452);
  vertex(148, 487);
  vertex(150, 500);
  vertex(138, 600);
  vertex(146, 640);
  vertex(140, 700);
  vertex(138, 723);
  vertex(136, 714);
  vertex(130, 720);
  vertex(124, 700);
  vertex(120, 710);
  vertex(120, 721);
  vertex(117, 738);
  vertex(110, 780);
  vertex(105, 789);
  vertex(100, 782);
  vertex(97, 780);
  vertex(92, 763);
  vertex(90, 760);
  vertex(93, 746);
  vertex(90, 745);
  vertex(80, 750);
  vertex(70, 740);
  vertex(65, 736);
  vertex(60, 743);
  vertex(58, 739);
  vertex(53, 758);
  vertex(49, 760);
  vertex(42, 740);
  vertex(37, 738);
  vertex(40, 720);
  vertex(44, 700);
  vertex(40, 680);
  vertex(38, 650);
  vertex(30, 600);
  vertex(29, 560);
  vertex(36, 549);
  vertex(31, 500);
  vertex(30, 450);
  vertex(33, 435);
  vertex(29, 432);  
  vertex(25, 434);
  vertex(23, 400);
endShape(CLOSE); 

smooth();
fill(239, 213, 184); // face
stroke(0);
beginShape();
  vertex(79, 170);
  vertex(76, 184);
  vertex(75, 198);
  vertex(74, 212);
  vertex(75, 226);
  vertex(77, 240);
  vertex(80, 254);
  vertex(85, 268);
  vertex(90, 282);
  vertex(93, 296);
  vertex(95, 310); // left temple
  vertex(101, 333);
  vertex(104, 340);
  vertex(108, 345);
  vertex(110, 350);
  vertex(115, 355);
  vertex(117, 360);
  vertex(119, 365);
  vertex(127, 380);
  vertex(130, 385);
  vertex(135, 390);
  vertex(150, 403);
  vertex(155, 408);
  vertex(160, 410);
  vertex(165, 414);
  vertex(170, 418);
  vertex(175, 420);
  vertex(180, 422);
  vertex(195, 425);
  vertex(200, 427);
  vertex(215, 428); //left cheek chin
  vertex(250, 417);
  vertex(260, 410);
  vertex(270, 397); // right chin
  vertex(274, 390);
  vertex(276, 380);
  vertex(282, 366);
  vertex(286, 342);
  vertex(287, 340);
  vertex(289, 333);
  vertex(292, 320);
  vertex(291, 310);
  vertex(290, 300);
  vertex(280, 266);
  vertex(277, 233);
  vertex(276, 217);
  vertex(266, 200);
  vertex(236, 190);
  vertex(190, 170);
  vertex(185, 168);
  vertex(168, 165);
  vertex(133, 160);
  vertex(120, 159);
  vertex(100, 163); 
endShape(CLOSE); // END OF FACE

beginShape(); //left eye
fill(255,255,255); 
  vertex(135,264);
  vertex(150,270);
  vertex(138,280); 
  vertex(113,283);
  vertex(120,267);
endShape(CLOSE);

fill(154,204,218); // left
beginShape();
  vertex(135,264);
  vertex(140,271);
  vertex(138,280); 
  vertex(120,280);
  vertex(120,267);
endShape(CLOSE); 

fill(64);
ellipse(131,275,10,10);

beginShape(); //right eye
fill(255,255,255); 
  vertex(216,254);
  vertex(226,243);
  vertex(244,243);
  vertex(256,250); 
  vertex(235,259);
endShape(CLOSE);

beginShape(); //right
fill(154,204,218);
  vertex(224,254);
  vertex(226,243);
  vertex(244,243);
  vertex(247,250); 
  vertex(235,259);
endShape(CLOSE);

fill(64);
ellipse(234,252,11,11);

fill(81, 57, 34); //left brow
  beginShape();
    vertex(97,264);
    vertex(108,253);
    vertex(142,252);
    vertex(110,257);
  endShape(CLOSE);


fill(81, 57, 34); //right brow
  beginShape();
    vertex(218,234);
    vertex(247,230);
    vertex(260,240);
    vertex(242,234);
  endShape(CLOSE);
  
  fill(0);
  line(174,335,199,333);
  line(199,333,220,326);
 
  line(173,331,174,334);
  line(221,321,220,325);
  
  fill(233,179,201);
  stroke(0);
  strokeWeight(1);
  
beginShape(); // lip top
    vertex(161,372);
    vertex(187,359);
    vertex(201,360);
    vertex(221,353);
    vertex(247,358);
    
endShape(CLOSE);
  
fill(248,195,217); 
beginShape(); //lip bottom
   vertex(161,372);
   vertex(180,378);
   vertex(201,381);
   vertex(225,374);
   vertex(247,358);
endShape(CLOSE);


}

}



