
size(500, 500);
smooth();
background(173, 181, 168);
noStroke();

//yellow background
fill(213, 208, 178);
beginShape();
vertex(168, 177);
vertex(500, 201);
vertex(500, 284);
vertex(254, 305);
endShape(CLOSE);

beginShape();
vertex(0, 44);
vertex(248, 0);
vertex(326, 0);
vertex(0, 50);
endShape(CLOSE);

beginShape();
vertex(80, 163);
vertex(500, 14);
vertex(500, 135);
vertex(347, 129);
vertex(271, 100);
vertex(80, 165);
endShape(CLOSE);

//pink background

fill(195, 188, 162, 200);
beginShape();
vertex(0, 62);
vertex(77, 56);
vertex(77, 58);
vertex(0, 72);
endShape(CLOSE);

beginShape();
vertex(473, 0);
vertex(500, 0);
vertex(250, 82);
vertex(282, 56);
endShape(CLOSE);

beginShape();
vertex(262, 90);
vertex(500, 22);
vertex(500, 98);
vertex(271, 100);
endShape(CLOSE);

//light gray background
fill(189, 192, 173);
beginShape();
vertex(295, 409);
vertex(500, 420);
vertex(500, 500);
vertex(152, 500);
vertex(0, 493);
vertex(0, 394);
endShape(CLOSE);

//cover
fill(173, 181, 168);
beginShape();
curveVertex(0, 395);
curveVertex(0, 394);
curveVertex(124, 445);
curveVertex(236, 468);
curveVertex(290, 445);
curveVertex(295, 409);
curveVertex(295, 409);
endShape(CLOSE);

//light under background
fill(204, 200, 171);
beginShape();
vertex(152, 500);
vertex(0, 500);
vertex(0, 493);
endShape(CLOSE);

//light line
stroke(135,141,129);
strokeWeight(0.5);
noFill();

beginShape();
curveVertex(41,325);
curveVertex(41,325);
curveVertex(500,435);
curveVertex(500,435);
endShape();

beginShape();
curveVertex(0,326);
curveVertex(0,326);
curveVertex(244,407);
curveVertex(244,407);
endShape();

beginShape();
curveVertex(0,345);
curveVertex(0,345);
curveVertex(500,478);
curveVertex(500,478);
endShape();

beginShape();
curveVertex(0,436);
curveVertex(0,436);
curveVertex(216,500);
curveVertex(216,500);
endShape();

line(23,0,27,185);
line(27,185,338,182);
line(0,213,435,205);
line(338,220,334,0);
line(303,172,300,0);
line(242,172,239,68);
line(213,67,214,172);
line(424,169,37,174);
line(37,174,34,0);
line(58,174,56,67);
line(56,67,239,68);
line(34,40,239,39);
line(239,39,350,87);
line(34,33,240,32);
line(240,32,326,70);
//line(338,182,338,220);
line(424,206,0,213);
line(339,221,436,220);
line(436,220,435,192);
line(350,171,350,210);
line(350,210,424,210);
line(424,210,424,169);

beginShape();
curveVertex(0,14);
curveVertex(0,14);
curveVertex(286,53);
curveVertex(286,53);
endShape();

beginShape();
curveVertex(18,0);
curveVertex(18,0);
curveVertex(89,10);
curveVertex(89,10);
endShape();

beginShape();
curveVertex(0,37);
curveVertex(0,37);
curveVertex(181,57);
curveVertex(181,57);
endShape();

beginShape();
curveVertex(0,71);
curveVertex(0,71);
curveVertex(500,115);
curveVertex(500,115);
endShape();

beginShape();
curveVertex(0,113);
curveVertex(0,113);
curveVertex(500,164);
curveVertex(500,164);
endShape();

beginShape();
curveVertex(0,140);
curveVertex(0,140);
curveVertex(500,169);
curveVertex(500,169);
endShape();

beginShape();
curveVertex(0,178);
curveVertex(0,178);
curveVertex(401,188);
curveVertex(401,188);
endShape();

beginShape();
curveVertex(0,207);
curveVertex(0,207);
curveVertex(60,212);
curveVertex(60,212);
endShape();

beginShape();
curveVertex(215,247);
curveVertex(215,247);
curveVertex(500,219);
curveVertex(500,219);
endShape();

beginShape();
curveVertex(306,255);
curveVertex(306,255);
curveVertex(500,236);
curveVertex(500,236);
endShape();

beginShape();
curveVertex(469,253);
curveVertex(469,253);
curveVertex(500,244);
curveVertex(500,244);
endShape();

beginShape();
curveVertex(143,241);
curveVertex(143,241);
curveVertex(173,252);
curveVertex(202,261);
curveVertex(264,273);
curveVertex(500,306);
curveVertex(500,306);
endShape();

beginShape();
curveVertex(143,296);
curveVertex(143,296);
curveVertex(173,307);
curveVertex(202,316);
curveVertex(264,328);
curveVertex(500,394);
curveVertex(500,394);
endShape();

line(161,248,159,304);
line(202,261,200,320);
line(235,268,232,330);
line(275,275,275,341);
line(317,282,309,349);
line(375,290,371,366);
line(437,299,435,379);

//gray bar
noStroke();
fill(151, 154, 136);
beginShape();
vertex(273, 0);
vertex(442, 250);
vertex(461, 250);
vertex(418, 0);
vertex(408, 0);
vertex(448, 224);
vertex(296, 0);
endShape(CLOSE);

fill(120, 124, 109, 180);
beginShape();
vertex(500, 273);
vertex(500, 277);
vertex(0, 375);
vertex(0, 363);
endShape(CLOSE);

beginShape();
vertex(500, 309);
vertex(500, 315);
vertex(0, 450);
vertex(0, 437);
endShape(CLOSE);

beginShape();
vertex(500, 364);
vertex(500, 371);
vertex(193, 500);
vertex(152, 500);
endShape(CLOSE);

beginShape();
vertex(500, 461);
vertex(500, 473);
vertex(459, 500);
vertex(436, 500);
endShape(CLOSE);

//orange quads
fill(200, 76, 16, 225);
quad(94, 0, 138, 87, 70, 200, 23, 90);
quad(368, 129, 398, 173, 360, 211, 330, 169);

//blue shape
fill(13, 65, 113);
beginShape();
vertex(0, 360);
vertex(167, 365);
vertex(212, 345);
vertex(362, 350);
vertex(297, 365);
vertex(500, 363);
vertex(500, 380);
vertex(242, 380);
vertex(179, 397);
vertex(85, 399);
vertex(132, 379);
vertex(0, 380);
endShape(CLOSE);

//orange line
noFill();
strokeWeight(1.5);
stroke(205,121,59);

beginShape();
curveVertex(335,195);
curveVertex(335,195);
curveVertex(318,213);
curveVertex(313,234);
curveVertex(325,258);
curveVertex(340,269);
curveVertex(360,281);
curveVertex(386,290);
curveVertex(424,301);
curveVertex(472,313);
curveVertex(500,318);
curveVertex(500,318);
endShape();

//red lines
noFill();
strokeWeight(1.5);
stroke(150,39,45);

beginShape();
curveVertex(500,117);
curveVertex(500,117);
curveVertex(495,123);
curveVertex(491,131);
curveVertex(486,141);
curveVertex(485,153);
curveVertex(491,174);
curveVertex(500,186);
curveVertex(500,186);
endShape();

beginShape();
curveVertex(229,257);
curveVertex(229,257);
curveVertex(191,277);
curveVertex(172,292);
curveVertex(160,310);
curveVertex(156,326);
curveVertex(166,353);
curveVertex(180,366);
curveVertex(196,375);
curveVertex(217,384);
curveVertex(236,389);
curveVertex(256,391);
curveVertex(276,392);
curveVertex(276,392);
endShape();

//yellow quad
noStroke();
fill(240, 180, 48);
quad(36, 252, 41, 255, 37, 264, 36, 264);
quad(50, 258, 56, 260, 55, 271, 53, 271);
quad(67, 265, 74, 267, 70, 278, 68, 277);
quad(86, 272, 93, 274, 90, 286, 87, 285);
quad(109, 280, 119, 283, 116, 296, 111, 294);
quad(143, 290, 155, 294, 152, 310, 146, 307);
quad(183, 303, 198, 306, 193, 325, 186, 322);
quad(229, 315, 251, 320, 245, 342, 232, 338);
quad(289, 329, 319, 335, 309, 362, 291, 356);
quad(361, 344, 404, 353, 388, 382, 369, 378);
quad(463, 363, 500, 369, 500, 409, 475, 403);

//black quad
fill(0, 0, 0);
quad(43, 255, 48, 257, 46, 268, 44, 267);
quad(59, 261, 64, 263, 61, 273, 60, 273);
quad(77, 268, 83, 270, 80, 282, 77, 281);
quad(97, 276, 105, 278, 102, 291, 98, 289);
quad(128, 285, 137, 289, 133, 303, 130, 301);
quad(161, 296, 175, 300, 171, 316, 164, 314);
quad(205, 308, 223, 314, 218, 333, 208, 329);
quad(259, 322, 284, 328, 276, 351, 264, 348);
quad(326, 337, 357, 343, 347, 372, 329, 367);
quad(411, 354, 455, 362, 443, 396, 423, 391);

//red object,black lines
noFill();
stroke(0);
strokeWeight(2);
line(409, 285, 500, 284);

noStroke();
fill(156, 42, 42);
beginShape();
curveVertex(185, 335);
curveVertex(185, 335);
curveVertex(212, 335);
curveVertex(224, 334);
curveVertex(227, 335);
curveVertex(229, 336);
curveVertex(230, 338);
curveVertex(228, 342);
curveVertex(224, 343);
curveVertex(215, 344);
curveVertex(183, 345);
curveVertex(178, 340);
curveVertex(181, 336);
curveVertex(185, 335);
endShape(CLOSE);

beginShape();
curveVertex(384, 279);
curveVertex(384, 279);
curveVertex(401, 279);
curveVertex(414, 275);
curveVertex(419, 276);
curveVertex(421, 281);
curveVertex(418, 284);
curveVertex(414, 285);
curveVertex(413, 285);
curveVertex(412, 286);
//curveVertex(411,286);
//curveVertex(410,287);
//curveVertex(409,297);
//curveVertex(408,287);
//curveVertex(407,288);
//curveVertex(406,288);
//curveVertex(405,288);
//curveVertex(404,288);
//curveVertex(403,289);
//curveVertex(402,289);
curveVertex(401, 289);
curveVertex(400, 289);
curveVertex(385, 288);
curveVertex(381, 284);
curveVertex(382, 281);
curveVertex(384, 279);
curveVertex(384, 279);
endShape(CLOSE);

//black lines
noFill();
stroke(0);
strokeWeight(2);

line(243, 429, 425, 500);
line(61, 471, 212, 500);
line(212, 500, 386, 449);
line(343, 317, 196, 320);
curve(343, 317, 196, 320, 131, 331, 100, 356);

beginShape();
curveVertex(131, 331);
curveVertex(130, 331);
curveVertex(117, 336);
//curveVertex(115,336);
//curveVertex(114,336);
curveVertex(110, 340);
curveVertex(105, 343);
curveVertex(100, 356);
curveVertex(110, 374);
curveVertex(128, 384);
curveVertex(138, 387);
curveVertex(138, 387);
endShape();
line(138, 387, 474, 500);

beginShape();
curveVertex(343, 317);
curveVertex(255, 318);
curveVertex(194, 327);
//curveVertex(179,335);
//curveVertex(178,336);
curveVertex(167, 343);
curveVertex(160, 359);
curveVertex(188, 386);
curveVertex(221, 397);
curveVertex(252, 406);
endShape();

line(221, 397, 500, 473);

quad(69, 287, 238, 294, 238, 299, 69, 299);
line(265, 297, 384, 292);
line(284, 309, 500, 296);
line(284, 309, 265, 297);
line(421, 0, 421, 8);
line(421, 8, 207, 86);
quad(154, 59, 190, 57, 415, 144, 407, 151);
quad(209, 57, 262, 58, 430, 133, 420, 140);
quad(288, 60, 335, 58, 454, 122, 443, 127);
quad(350, 60, 400, 58, 488, 112, 461, 120);
line(417, 57, 472, 57);
line(500, 80, 472, 57);
line(417, 57, 500, 107);
line(486, 60, 500, 60);
line(486, 60, 500, 70);
line(402, 160, 142, 65);

beginShape();
curveVertex(142, 65);
curveVertex(142, 65);
curveVertex(107, 61);
curveVertex(49, 70);
curveVertex(29, 91);
curveVertex(62, 134);
curveVertex(123, 164);
curveVertex(191, 182);
curveVertex(500, 256);
curveVertex(500, 256);
endShape();

beginShape();
curveVertex(402,160);
curveVertex(402,160);
curveVertex(399,177);
curveVertex(432,209);
curveVertex(461,226);
curveVertex(500,245);
curveVertex(500,245);
endShape();

strokeWeight(1.5);
line(171,142,174,143);
line(171,147,173,147);
quad(174,143,177,144,177,148,173,147);
line(177,144,183,145);
line(177,148,181,150);
quad(183,145,187,146,187,151,181,150);
line(187,146,193,147);
line(181,151,192,152);
quad(193,147,196,148,196,152,192,152);
line(196,148,203,149);
line(196,152,202,154);
quad(203,149,206,150,206,155,202,154);
line(206,150,214,151);
line(206,155,212,156);
quad(214,151,217,152,217,158,212,156);
line(217,152,224,153);
line(217,158,222,158);
quad(224,153,227,154,227,159,222,158);
line(227,154,233,155);
line(227,159,232,160);
quad(233,155,237,156,236,162,232,160);
line(237,156,244,157);
line(236,162,241,162);
quad(244,157,249,158,248,163,241,162);
line(249,158,258,159);
line(248,163,256,165);
quad(258,159,263,160,263,166,256,165);
line(263,160,274,161);
line(263,166,271,167);
quad(274,161,278,162,280,169,271,167);
line(278,162,289,164);
line(280,169,286,170);
quad(289,164,293,165,293,171,286,170);
line(293,165,307,167);
line(293,171,304,173);
quad(307,167,311,167,313,174,304,173);
line(311,167,327,170);
line(313,174,324,176);
quad(327,170,332,170,334,177,324,176);
line(332,170,354,173);
line(334,177,355,180);
line(350,173,346,179);
quad(354,173,376,175,372,183,355,180);
line(376,175,381,176);
line(372,183,383,185);
quad(381,176,407,179,408,188,383,185);
line(407,179,437,181);
line(408,188,430,191);
quad(437,181,443,182,449,194,430,191);
line(443,182,475,185);
line(449,194,467,196);
quad(475,185,481,185,486,198,467,196);
line(481,185,500,186);
line(486,198,500,199);

line(137,169,139,184);
line(167,176,159,187);
line(177,178,182,191);

line(232,77,229,62);
line(246,74,251,64);
line(232,105,229,114);
line(236,106,238,116);
line(251,118,257,107);
line(259,110,261,120);
line(383,119,374,133);
line(388,119,395,136);
line(431,121,422,134);
line(435,123,439,138);
line(471,143,484,125);
line(492,126,498,145);
line(500,233,455,245);

beginShape();
curveVertex(254,0);
curveVertex(254,0);
curveVertex(174,2);
curveVertex(119,6);
curveVertex(56,15);
curveVertex(18,27);
curveVertex(0,36);
curveVertex(0,36);
endShape();

strokeWeight(5);

beginShape();
curveVertex(48,0);
curveVertex(48,0);
curveVertex(18,25);
curveVertex(3,52);
curveVertex(15,77);
curveVertex(52,99);
curveVertex(95,113);
curveVertex(160,129);
curveVertex(216,139);
curveVertex(303,149);
curveVertex(402,161);
curveVertex(471,165);
curveVertex(500,165);
curveVertex(500,165);
endShape();

//blue line
stroke(103,166,183);
strokeWeight(1.5);

beginShape();
curveVertex(29,43);
curveVertex(29,43);
curveVertex(51,60);
curveVertex(51,60);
endShape();

//fade yellow green object
noStroke();
fill(94,142,128);

beginShape();
curveVertex(327,398);
curveVertex(327,398);
curveVertex(373,401);
curveVertex(433,388);
curveVertex(435,390);
curveVertex(434,396);
curveVertex(412,405);
curveVertex(392,408);
curveVertex(387,409);
curveVertex(381,412);
curveVertex(360,423);
curveVertex(347,426);
curveVertex(333,419);
curveVertex(326,406);
curveVertex(327,398);
curveVertex(327,398);
endShape(CLOSE);



