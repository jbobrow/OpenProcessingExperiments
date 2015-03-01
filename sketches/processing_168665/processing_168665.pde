
void setup(){
  
  size(440, 650);
  background(56, 103, 21);
  noFill();
  stroke(255);
  strokeWeight(1);
}
void draw(){
  
  
  
  
  //cos
  fill(212, 152, 128);
  noStroke();
  beginShape();
  vertex(441, 378);
  vertex(441, 650);
  vertex(155, 650);
  vertex(163, 381);
  vertex(441, 378);
  endShape();
  
  //ombra cos
  fill(197, 120, 89);
  noStroke();
  beginShape();
  curveVertex(273, 430);
  curveVertex(288, 433);
  curveVertex(301, 430);
  curveVertex(314, 417);
  curveVertex(414, 351);
  curveVertex(439, 392);
  curveVertex(439, 480);
  curveVertex(395, 481);
  curveVertex(358, 464);
  curveVertex(315, 477);
  curveVertex(283, 470);
  curveVertex(269, 461);
  curveVertex(242, 423);
  curveVertex(273, 430);
  endShape();
  
  //ombra coll
  fill(189, 107, 74);
  noStroke();
  beginShape();
  curveVertex(273, 430);
  curveVertex(288, 433);
  curveVertex(301, 430);
  curveVertex(297, 442);
  curveVertex(288, 451);
  curveVertex(271, 443);
  curveVertex(245, 428);
  curveVertex(273, 430);
  endShape();
    
   //fons cabell
  fill(54, 23, 21);
  noStroke();
  beginShape();
  vertex(105, 168);
  vertex(279, 406);
  vertex(274, 430);
  vertex(267, 484);
  vertex(248, 522);
  vertex(237, 565);
  vertex(238, 650);
  vertex(101, 650);
  vertex(108, 536);
  vertex(78, 205);
  vertex(105, 168);
  endShape();
  
  //ombra cabell 2
  fill(40, 15, 14);
  beginShape();
  curveVertex(103, 204);
  curveVertex(83, 233);
  curveVertex(100, 441);
  curveVertex(236, 579);
  curveVertex(255, 498);
  vertex(270, 450);
  vertex(278, 399);
  vertex(275, 303);
  vertex(103, 204);
  endShape();
  
    
  //base forma cara
  fill(212, 152, 128);
  noStroke();
  beginShape();
  curveVertex(313, 113);
  curveVertex(196, 96);
  curveVertex(116, 194);
  curveVertex(120, 247);
  curveVertex(124, 259);
  curveVertex(146, 285);
  curveVertex(156, 302);
  curveVertex(172, 337);
  curveVertex(183, 355);
  curveVertex(201, 371);
  curveVertex(232, 393);
  curveVertex(244, 405);
  curveVertex(260, 421);
  curveVertex(278, 432);
  curveVertex(284, 433);
  curveVertex(298, 431);
  curveVertex(308, 424);
  curveVertex(332, 400);
  curveVertex(379, 150);
  curveVertex(313, 113);
  endShape();
  
  //ombra galta
   
  fill(212, 147, 121);
  noStroke();
  beginShape();
  curveVertex(301, 336);
  curveVertex(294, 326);
  curveVertex(272, 324);
  curveVertex(254, 313);
  curveVertex(267, 329);
  curveVertex(286, 333);
  curveVertex(292, 335);
  curveVertex(296, 339);
  curveVertex(301, 336);
  endShape();
  
  
  
  //ull esquerre
  fill(213, 197, 190);
  beginShape();
  vertex(149, 280);
  vertex(150, 276);
  vertex(175, 271);
  vertex(169, 279);
  vertex(162, 287);
  vertex(156, 288);
  vertex(152, 287);
  vertex(149, 280);
  endShape();
  
  //ull dret
  fill(213, 197, 190);
  beginShape();
  vertex(222, 252);
  vertex(224, 249);
  vertex(227, 238);
  vertex(230, 233);
  vertex(243, 227);
  vertex(258, 224);
  vertex(268, 223);
  vertex(262, 230);
  vertex(254, 238);
  vertex(248, 243);
  vertex(242, 247);
  vertex(230, 250);
  vertex(222, 252);  
  endShape();
  
    //iris dret
  fill(65, 40, 29);
  ellipse(246,233,20,20);
  
  //iris esquerre
  fill(68, 40, 29);
  ellipse(165,276,20,20);

  
  //contorn iris dret
  noFill();
  stroke(0);
  ellipse(245, 232, 20, 20);
  
  //contorn iris esquerre
  noFill();
  stroke(0);
  ellipse(165, 275, 20, 20);
  
  //pestanyes dretes
  fill(12, 12, 12);
  
  beginShape();
  curveVertex(267, 222);
  curveVertex(268, 224);
  curveVertex(248, 227);
  curveVertex(233, 233);
  curveVertex(226, 244);
  curveVertex(224, 246);
  curveVertex(224, 239);
  curveVertex(228, 230);
  curveVertex(239, 223);
  curveVertex(254, 221);
  curveVertex(265, 219);
  curveVertex(269, 221);
  curveVertex(267, 222);
  endShape();
  
  strokeWeight(0.5);
  stroke(47, 29, 21);
  line(268, 226, 260, 236);
  line(260, 236, 254, 242);
  line(254, 242, 235, 250);
  
  
  //pestanyes esquerres
  fill(12, 12, 12);
  noStroke();
  beginShape();
  curveVertex(157, 273);
  curveVertex(150, 278);
  curveVertex(150, 281);
  curveVertex(151, 285);
  curveVertex(143, 280);
  curveVertex(147, 276);
  curveVertex(160, 270);
  curveVertex(157, 273);
  endShape();
  
  strokeWeight(0.5);
  stroke(47, 29, 21);
  line(151, 285, 153, 287);
  line(153, 287, 158, 289);
  line(158, 289, 167, 287);
  line(167, 287, 172, 285);
  
  //pupil·la dreta
  ellipse(246, 232, 8, 8);
  
  //pupil·la esquerra
  ellipse(165, 275, 8, 8);
  
  //ombra ull dret
  fill(205, 141, 115);
  noStroke();
  beginShape();
  curveVertex(226, 208);
  curveVertex(218, 210);
  curveVertex(207, 226);
  curveVertex(211, 247);
  curveVertex(206, 256);
  curveVertex(217, 252);
  curveVertex(218, 247);
  curveVertex(217, 233);
  curveVertex(230, 210);
  curveVertex(226, 208);
  endShape();
  
  //ombra ull esquerre
  fill(205, 141, 115);
  noStroke();
  beginShape();
  curveVertex(181, 266);
  curveVertex(175, 256);
  curveVertex(148, 250);
  curveVertex(142, 253);
  curveVertex(159, 259);
  curveVertex(171, 267);
  curveVertex(181, 266);
  endShape();
  
  //nas
  fill(205, 141, 115);
  noStroke();
  beginShape();
  curveVertex(184, 276);
  curveVertex(185, 314);
  curveVertex(186, 325);
  curveVertex(187, 343);
  curveVertex(195, 351);
  curveVertex(208, 351);
  curveVertex(218, 350);
  curveVertex(220, 348);
  curveVertex(225, 355);
  curveVertex(226, 365);
  curveVertex(227, 378);
  curveVertex(215, 370);
  curveVertex(211, 363);
  curveVertex(193, 353);
  curveVertex(185, 344);
  curveVertex(182, 321);
  curveVertex(184, 276);
  endShape();
  
  noFill();
  stroke(147, 91, 74);
  beginShape();
  curveVertex(184, 276);
  curveVertex(185, 314);
  curveVertex(186, 325);
  curveVertex(187, 343);
  curveVertex(195, 351);
  curveVertex(208, 351);
  curveVertex(218, 350);
  curveVertex(220, 348);
  endShape();
  
  //ombra nas 2
  fill(201, 138, 113);
  noStroke();
 
  beginShape();
  curveVertex(239, 341);
  curveVertex(246, 336);
  curveVertex(249, 334);
  curveVertex(253, 323);
  curveVertex(250, 317);
  curveVertex(243, 311);
  curveVertex(254, 313);
  curveVertex(257, 326);
  curveVertex(250, 337);
  curveVertex(239, 341);
  endShape();
  
  strokeWeight(0.5);
  stroke(147, 91, 74);
  line(244, 311, 250, 315);
  line(250, 315, 254, 321);
  line(254, 321, 253, 328);
  line(253, 328, 250, 334);
  
  //ombra nas 1
  fill(147, 91, 74);
  noStroke();
  beginShape();
  curveVertex(222, 343);
  curveVertex(217, 343);
  curveVertex(222, 337);
  curveVertex(237, 330);
  curveVertex(234, 337);
  curveVertex(227, 337);
  curveVertex(222, 343);
  endShape();
  
  stroke(62, 40, 32);
  strokeWeight(0.5);
  line(217, 343, 222, 337);
  line(222, 337, 237, 330);
  
  //cella esquerra
  fill(76, 32, 19);
  noStroke();
  beginShape();
  curveVertex(121, 251);
  curveVertex(131, 245);
  curveVertex(148, 249);
  curveVertex(145, 254);
  curveVertex(134, 254);
  curveVertex(123, 262);
  curveVertex(120, 256);
  curveVertex(121, 251);
  endShape();
  
  //cella dreta
   fill(76, 32, 19);
  noStroke();
  beginShape();
  curveVertex(188, 225);
  curveVertex(188, 218);
  curveVertex(222, 188);
  curveVertex(228, 186);
  curveVertex(260, 182);
  curveVertex(241, 189);
  curveVertex(225, 197);
  curveVertex(212, 208);
  vertex(196, 225);
  vertex(188, 225);
  endShape();
  
  //interior boca
  fill(162, 88, 81);
  noStroke();
  beginShape();
  vertex(291, 341);
  vertex(277, 347);
  vertex(246, 363);
  vertex(228, 366);
  vertex(227, 369);
  vertex(253, 383);
  vertex(278, 366);
  vertex(291, 341);
  endShape();
  
  //llavi superior
  fill(149, 81, 70);
  noStroke();
  beginShape();
  vertex(226, 367);
  vertex(242, 367);
  vertex(247, 365);
  vertex(264, 355);
  vertex(292, 340);
  vertex(277, 345);
  vertex(256, 356);
  vertex(242, 363);
  vertex(232, 364);
  vertex(226, 367);
  endShape();
  
  //ombra llavi superior
  fill(212, 147, 121);
  noStroke();
  beginShape();
  curveVertex(224, 345);
  curveVertex(230, 344);
  curveVertex(241, 354);
  curveVertex(240, 358);
  curveVertex(230, 359);
  curveVertex(230, 352);
  curveVertex(222, 344);
  curveVertex(224, 345);
  endShape();
  
  //llavi inferior
  fill(184, 101, 93);
  noStroke();
  beginShape();
  vertex(225, 367);
  curveVertex(229, 373);
  curveVertex(233, 381);
  curveVertex(237, 386);
  curveVertex(245, 390);
  curveVertex(251, 391);
  curveVertex(264, 389);
  curveVertex(276, 380);
  curveVertex(285, 367);
  curveVertex(290, 356);
  curveVertex(292, 340);
  curveVertex(281, 358);
  curveVertex(264, 372);
  curveVertex(253, 378);
  curveVertex(243, 376);
  curveVertex(236, 374);
  vertex(225, 367);
  endShape();
  
   //ombra llavi inferior
  fill(212, 147, 121);
  noStroke();
  beginShape();
  curveVertex(297, 377);
  curveVertex(263, 404);
  curveVertex(237, 387);
  curveVertex(255, 391);
  curveVertex(273, 382);
  curveVertex(288, 363);
  curveVertex(296, 365);
  curveVertex(290, 382);
  curveVertex(297, 377);
  endShape();
  
 
  
  
  //ulleres noves
  noFill();
  noStroke();
  beginShape();
  curveVertex(198, 262);
  curveVertex(188, 274);
  curveVertex(192, 272);
  curveVertex(214, 290);
  curveVertex(237, 296);
  curveVertex(275, 286);
  curveVertex(302, 262);
  curveVertex(303, 250);
  curveVertex(293, 214);
  curveVertex(297, 208);
  curveVertex(328, 191);
  curveVertex(327, 141);
  curveVertex(281, 197);
  curveVertex(232, 219);
  curveVertex(188, 254);
  curveVertex(183, 260);
  curveVertex(152, 266);
  curveVertex(118, 280);
  curveVertex(104, 194);
  curveVertex(115, 317);
  curveVertex(140, 337);
  curveVertex(170, 333);
  curveVertex(185, 316);
  curveVertex(185, 281);
  curveVertex(187, 273);
  curveVertex(184, 266);
  curveVertex(165, 278);
  curveVertex(177, 289);
  curveVertex(181, 315);
  curveVertex(163, 327);
  curveVertex(142, 329);
  curveVertex(122, 317);
  curveVertex(110, 297);
  curveVertex(132, 280);
  curveVertex(165, 277);
  curveVertex(201, 253);
  curveVertex(202, 247);
  curveVertex(232, 226);
  curveVertex(271, 213);
  curveVertex(287, 226);
  curveVertex(297, 256);
  curveVertex(271, 281);
  curveVertex(221, 286);
  curveVertex(198, 262);
  endShape();
  
  
  //ulleres montura
  
  fill(12, 12, 12);
  noStroke();
  beginShape();
  curveVertex(184, 278);
  curveVertex(188, 275);
  curveVertex(194, 274);
  curveVertex(214, 289);
  curveVertex(221, 292);
  curveVertex(234, 295);
  curveVertex(241, 296);
  curveVertex(259, 293);
  curveVertex(281, 283);
  curveVertex(298, 267);
  curveVertex(302, 260);
  curveVertex(303, 249);
  curveVertex(300, 234);
  curveVertex(295, 216);
  curveVertex(296, 213);
  curveVertex(301, 206);
  curveVertex(323, 188);
  curveVertex(318, 154);
  curveVertex(286, 193);
  curveVertex(262, 204);
  curveVertex(234, 218);
  curveVertex(206, 237);
  curveVertex(189, 253);
  curveVertex(184, 259);
  curveVertex(174, 263);
  curveVertex(151, 267);
  curveVertex(136, 273);
  curveVertex(119, 281);
  curveVertex(109, 289);
  curveVertex(104, 296);
  curveVertex(106, 301);
  curveVertex(118, 320);
  curveVertex(134, 333);
  curveVertex(145, 336);
  curveVertex(156, 335);
  curveVertex(170, 331);
  curveVertex(180, 323);
  curveVertex(186, 313);
  curveVertex(184, 278);
  
  //vidre esquerre
  
  curveVertex(167, 279);
  curveVertex(178, 291);
  curveVertex(183, 305);
  curveVertex(182, 313);
  curveVertex(181, 316);
  curveVertex(171, 325);
  curveVertex(154, 329);
  curveVertex(143, 330);
  curveVertex(140, 328);
  curveVertex(124, 317);
  curveVertex(114, 306);
  curveVertex(111, 301);
  curveVertex(110, 293);
  curveVertex(114, 290);
  curveVertex(138, 278);
  curveVertex(160, 275);
  curveVertex(167, 279);
 
//vidre dret

  
  noStroke();
  curveVertex(198, 256);
  curveVertex(204, 247);
  curveVertex(233, 225);
  curveVertex(247, 219);
  curveVertex(260, 214);
  curveVertex(269, 212);
  curveVertex(269, 212);
  curveVertex(278, 217);
  curveVertex(285, 224);
  curveVertex(295, 242);
  curveVertex(298, 253);
  curveVertex(292, 266);
  curveVertex(273, 280);
  curveVertex(260, 286);
  curveVertex(239, 289);
  curveVertex(220, 286);
  curveVertex(207, 276);
  curveVertex(199, 262);
  curveVertex(198, 256);
  
  endShape();
  
  beginShape();
  vertex(200, 253);
  vertex(199, 263);
  vertex(200, 266);
  vertex(188, 274);
  vertex(183, 277);
  vertex(170, 281);
  vertex(163, 274);
  vertex(200, 253);
  
  
  endShape();
  
  
  //cabell base
  fill(84, 30, 28);
  noStroke();
  beginShape();
  vertex(277, 121);
  curveVertex(268, 138);
  curveVertex(251, 157);
  curveVertex(221, 172);
  curveVertex(178, 183);
  curveVertex(170, 189);
  curveVertex(152, 205);
  curveVertex(131, 218);
  curveVertex(108, 238);
  curveVertex(101, 268);
  curveVertex(102, 315);
  curveVertex(112, 360);
  curveVertex(158, 413);
  curveVertex(189, 468);
  curveVertex(211, 498);
  curveVertex(235, 541);
  curveVertex(238, 566);
  curveVertex(241, 606);
  curveVertex(232, 585);
  curveVertex(223, 575);
  curveVertex(183, 553);
  curveVertex(160, 536);
  curveVertex(169, 561);
  curveVertex(182, 583);
  curveVertex(146, 556);
  curveVertex(144, 563);
  curveVertex(152, 577);
  curveVertex(124, 557);
  curveVertex(94, 522);
  curveVertex(86, 506);
  curveVertex(78, 482);
  curveVertex(70, 443);
  curveVertex(68, 419);
  curveVertex(60, 388);
  curveVertex(47, 348);
  curveVertex(43, 314);
  curveVertex(47, 287);
  curveVertex(49, 215);
  curveVertex(62, 161);
  curveVertex(74, 127);
  curveVertex(86, 98);
  curveVertex(108, 78);
  curveVertex(159, 43);
  curveVertex(188, 28);
  curveVertex(247, 17);
  curveVertex(258, 19);
  curveVertex(268, 33);
  curveVertex(276, 29);
  curveVertex(289, 31);
  curveVertex(314, 38);
  curveVertex(333, 55);
  curveVertex(356, 74);
  curveVertex(380, 111);
  curveVertex(397, 150);
  curveVertex(405, 189);
  curveVertex(414, 216);
  curveVertex(421, 260);
  curveVertex(417, 324);
  curveVertex(421, 337);
  curveVertex(439, 364);
  curveVertex(439, 399);
  curveVertex(411, 379);
  curveVertex(412, 390);
  curveVertex(417, 407);
  curveVertex(439, 435);
  curveVertex(418, 430);
  curveVertex(403, 414);
  curveVertex(390, 395);
  curveVertex(388, 413);
  curveVertex(390, 434);
  curveVertex(404, 469);
  curveVertex(417, 496);
  curveVertex(397, 460);
  curveVertex(384, 432);
  curveVertex(380, 435);
  curveVertex(379, 450);
  curveVertex(386, 471);
  curveVertex(395, 502);
  curveVertex(408, 522);
  curveVertex(431, 546);
  curveVertex(406, 529);
  curveVertex(385, 501);
  curveVertex(361, 451);
  curveVertex(359, 414);
  curveVertex(350, 429);
  curveVertex(344, 457);
  curveVertex(336, 485);
  curveVertex(335, 462);
  curveVertex(327, 479);
  curveVertex(323, 491);
  curveVertex(325, 471);
  curveVertex(314, 480);
  curveVertex(311, 464);
  curveVertex(318, 440);
  curveVertex(319, 423);
  curveVertex(307, 428);
  curveVertex(313, 414);
  curveVertex(316, 393);
  curveVertex(319, 349);
  curveVertex(320, 275);
  curveVertex(315, 207);
  curveVertex(309, 176);
  curveVertex(300, 160);
  curveVertex(277, 121);
  endShape();
  
  //ombra cabell 1
  fill(60, 20, 21);
  beginShape();
  curveVertex(268, 32);
  curveVertex(274, 29);
  curveVertex(297, 44);
  curveVertex(290, 67);
  curveVertex(302, 83);
  curveVertex(236, 158);
  curveVertex(169, 183);
  curveVertex(108, 230);
  curveVertex(95, 298);
  curveVertex(109, 363);
  curveVertex(153, 414);
  curveVertex(184, 470);
  curveVertex(222, 523);
  curveVertex(236, 574);
  curveVertex(221, 540);
  curveVertex(177, 501);
  curveVertex(127, 450);
  curveVertex(76, 380);
  curveVertex(63, 291);
  curveVertex(73, 207);
  curveVertex(80, 127);
  curveVertex(97, 93);
  curveVertex(174, 40);
  curveVertex(249, 20);
  curveVertex(266, 34);
  curveVertex(268, 32);
  endShape();
  
   //ombra cabell 3
  fill(46, 21, 17);
  beginShape();
  curveVertex(278, 33);
  curveVertex(291, 46);
  curveVertex(287, 67);
  curveVertex(297, 79);
  curveVertex(278, 116);
  curveVertex(309, 171);
  curveVertex(310, 176);
  curveVertex(297, 92);
  curveVertex(309, 75);
  curveVertex(295, 64);
  curveVertex(301, 44);
  curveVertex(279, 31);
  curveVertex(278, 33);
  endShape();
  
  //ombra cabell 4
  fill(60, 20, 21);
  beginShape();
  curveVertex(371, 106);
  curveVertex(388, 178);
  curveVertex(392, 244);
  curveVertex(366, 299);
  curveVertex(365, 366);
  curveVertex(361, 411);
  curveVertex(365, 425);
  curveVertex(383, 354);
  curveVertex(389, 328);
  curveVertex(394, 237);
  curveVertex(398, 202);
  curveVertex(371, 106);
  endShape();
  
    //ombra cabell 5
  fill(60, 20, 21);
  beginShape();
  curveVertex(408, 267);
  curveVertex(404, 334);
  curveVertex(408, 376);
  curveVertex(411, 371);
  curveVertex(414, 329);
  curveVertex(413, 279);
  curveVertex(408, 267);
  endShape();
  
   //ombra cabell 6
  fill(46, 21, 17);
  beginShape();
  curveVertex(155, 185);
  curveVertex(104, 225);
  curveVertex(71, 297);
  curveVertex(65, 275);
  curveVertex(60, 291);
  curveVertex(93, 196);
  curveVertex(127, 177);
  curveVertex(165, 166);
  curveVertex(186, 159);
  curveVertex(155, 185);
  endShape();
  
    //ombra cabell 7
  fill(46, 21, 17);
  beginShape();
  curveVertex(72, 281);
  curveVertex(82, 334);
  curveVertex(103, 363);
  curveVertex(113, 370);
  curveVertex(97, 327);
  curveVertex(97, 255);
  curveVertex(111, 222);
  curveVertex(72, 281);
  endShape();
  
   //ombra cabell 8
  fill(84, 30, 28);
  beginShape();
  curveVertex(109, 548);
  curveVertex(104, 648);
  curveVertex(117, 648);
  curveVertex(119, 557);
  curveVertex(110, 551);
  curveVertex(109, 548);
  endShape();
  
  //ombra cabell 9
  fill(84, 30, 28);
  beginShape();
  curveVertex(123, 561);
  curveVertex(133, 567);
  curveVertex(130, 649);
  curveVertex(121, 648);
  curveVertex(127, 569);
  curveVertex(123, 561);
  endShape();
  
  //brillo cabell 1
   fill(112, 57, 41);
  beginShape();
  curveVertex(185, 45);
  curveVertex(168, 49);
  curveVertex(94, 109);
  curveVertex(66, 161);
  curveVertex(62, 187);
  curveVertex(98, 118);
  curveVertex(140, 78);
  curveVertex(185, 45);
  endShape();
  
  //brillo cabell 2
   fill(112, 57, 41);
  beginShape();
  curveVertex(180, 65);
  curveVertex(163, 69);
  curveVertex(89, 129);
  curveVertex(61, 181);
  curveVertex(57, 207);
  curveVertex(93, 138);
  curveVertex(135, 98);
  curveVertex(180, 65);
  endShape();
  
   //brillo cabell 3
   fill(84, 30, 28);
  beginShape();
  curveVertex(160, 75);
  curveVertex(143, 119);
  curveVertex(69, 179);
  curveVertex(41, 231);
  curveVertex(37, 257);
  curveVertex(29, 287);
  curveVertex(32, 324);
  curveVertex(73, 188);
  curveVertex(115, 158);
  curveVertex(160, 115);
  endShape();
  
  //brillo cabell 4
   fill(112, 57, 41);
  beginShape();
  curveVertex(55, 256);
  curveVertex(46, 307);
  curveVertex(61, 370);
  curveVertex(73, 426);
  curveVertex(89, 503);
  curveVertex(131, 553);
  curveVertex(137, 546);
  curveVertex(97, 499);
  curveVertex(81, 443);
  curveVertex(77, 397);
  curveVertex(58, 356);
  curveVertex(51, 306);
  curveVertex(57, 265);
  curveVertex(55, 256);
  endShape();
  
   //brillo cabell 5
   fill(112, 57, 41);
  beginShape();
  curveVertex(89, 409);
  curveVertex(173, 516);
  curveVertex(212, 546);
  curveVertex(221, 564);
  curveVertex(217, 543);
  curveVertex(137, 475);
  curveVertex(92, 416);
  curveVertex(89, 409);
  endShape();
  
  //brillo cabell 6
   fill(112, 57, 41);
  beginShape();
  curveVertex(304, 44);
  curveVertex(303, 49);
  curveVertex(297, 62);
  curveVertex(309, 73);
  curveVertex(300, 91);
  curveVertex(317, 190);
  curveVertex(325, 301);
  curveVertex(317, 414);
  curveVertex(331, 349);
  curveVertex(332, 278);
  curveVertex(321, 159);
  curveVertex(305, 91);
  curveVertex(317, 77);
  curveVertex(315, 66);
  curveVertex(305, 59);
  curveVertex(307, 45);
  curveVertex(304, 44);
  endShape();
  
  //brillo nas
  fill(231, 173, 150);
  beginShape();
  curveVertex(190, 281);
  curveVertex(189, 328);
  curveVertex(195, 330);
  curveVertex(194, 283);
  curveVertex(188, 282);
  curveVertex(190, 281);
  endShape();
  
   //brillo cella dreta
  fill(231, 173, 150);
  beginShape();
  curveVertex(222, 204);
  curveVertex(231, 196);
  curveVertex(250, 187);
  curveVertex(251, 189);
  curveVertex(236, 197);
  curveVertex(224, 205);
  curveVertex(222, 204);
  endShape();
  
  //brillo llavi superior
  fill(231, 173, 150);
  beginShape();
  curveVertex(231, 363);
  curveVertex(239, 359);
  curveVertex(245, 360);
  curveVertex(260, 352);
  curveVertex(275, 345);
  curveVertex(263, 349);
  curveVertex(246, 357);
  curveVertex(241, 360);
  curveVertex(232, 360);
  curveVertex(238, 362);
  curveVertex(231, 363);
  endShape();
  
  //brillo llavi inferior
   fill(212, 130, 122);
  beginShape();
  curveVertex(280, 363);
  curveVertex(271, 370);
  curveVertex(261, 378);
  curveVertex(254, 380);
  curveVertex(249, 383);
  curveVertex(264, 380);
  curveVertex(274, 370);
  curveVertex(280, 363);
  
  endShape();
  
  //samarreta
  fill(9, 8, 8);
  beginShape();
  vertex(440, 539);
  vertex(419, 574);
  vertex(391, 617);
  vertex(363, 650);
  vertex(440, 650);
  vertex(440, 539);
  endShape();
  
  //dents
  fill(240, 192, 170);
  beginShape();
  vertex(258, 371);
  vertex(253, 365);
  vertex(254, 361);
  vertex(257, 360);
  vertex(263, 358);
  vertex(266, 359);
  vertex(273, 364);
  vertex(267, 369);
  vertex(261, 373);
  endShape();
  
   
  beginShape();
  vertex(274, 363);
  vertex(267, 357);
  vertex(268, 354);
  vertex(271, 352);
  vertex(276, 349);
  vertex(282, 353);
  vertex(279, 360);
  vertex(274, 363);
  endShape();
 

  beginShape();
  vertex(260, 374);
  vertex(254, 368);
  vertex(250, 367);
  vertex(246, 366);
  vertex(243, 368);
  vertex(247, 376);
  vertex(254, 378);
  vertex(260, 374);
  endShape();
 
   
  beginShape();
  vertex(246, 375);
  vertex(243, 368);
  vertex(240, 367);
  vertex(237, 368);
  vertex(238, 373);
  vertex(242, 374);
  vertex(246, 375);
  endShape();
  
 
  beginShape();
  vertex(284, 353);
  vertex(278, 348);
  vertex(285, 344);
  vertex(289, 345);
  vertex(284, 353);
  endShape();
  
  
  beginShape();
  vertex(237, 371);
  vertex(236, 367);
  vertex(232, 368);
  vertex(231, 370);
  vertex(237, 371);
  endShape();
  
}


