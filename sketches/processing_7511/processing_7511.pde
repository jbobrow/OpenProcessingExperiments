

 //Scher Test
void setup(){
size(500, 500);
background(255);
smooth();

}

void draw() {
  beginShape();  ///borde de la imagen
  //noFill();
  strokeWeight(3);
  vertex(77,46);
  bezierVertex(109, 47, 121, 52, 121, 52);
  bezierVertex(125, 12, 130, 6, 130, 6);
  bezierVertex(140, 0, 172, 25, 172, 62);
  bezierVertex(174, 117, 190, 129, 190, 129);
  bezierVertex(167, 131, 154, 127, 154, 127);
  bezierVertex(144, 134, 148, 155, 148, 155);
  bezierVertex(155, 177, 152, 199, 152, 199);
  bezierVertex(169, 215, 166, 227, 166, 227);
  bezierVertex(180, 211, 196, 203, 196, 203);
  bezierVertex(209, 184, 192, 186, 192, 186);
  bezierVertex(188, 179,  177, 175, 177, 175); 
  bezierVertex(173, 164, 177, 160, 177, 160);
  bezierVertex(178, 153, 199, 158, 199, 158);
  bezierVertex(210, 177, 218, 183, 218, 183);
  bezierVertex(219, 208, 204, 228, 204, 228);
  vertex(172, 267);
  vertex(217, 270);
  bezierVertex(217, 248, 230, 245, 230, 245);
  bezierVertex(232, 220, 242, 205, 242, 205);
  bezierVertex(258, 175, 299, 148, 299, 148);
  bezierVertex(345, 130, 370, 149, 370, 149);
  vertex(374, 140);
  bezierVertex(379, 156, 389, 161, 389, 161);
  bezierVertex(412, 164, 413, 179, 413, 179);
  vertex(410, 235);
  bezierVertex(390, 256, 392, 271, 392, 271);
  bezierVertex(381, 267, 362, 270, 362, 270);
  bezierVertex(366, 247, 354, 230, 354, 230);
  bezierVertex(320, 219, 309, 282, 309, 282);
  bezierVertex(304, 321, 298, 348, 298, 348);
  vertex(326, 347);
  vertex(334, 334); //OMG x = y //
  bezierVertex(342, 354, 337, 372, 337, 372);
  vertex(332, 381);
  vertex(331, 415);
  bezierVertex(320, 426, 315, 442, 315, 442);
  bezierVertex(301, 429, 285, 423, 285, 423);
  vertex(280, 413);
  vertex(281, 409);
  vertex(295, 407);
  vertex(306, 392);
  vertex(306, 380);
  vertex(283, 378);
  bezierVertex(268, 392, 265, 402, 265, 402);
  bezierVertex(267, 409,273, 430, 273, 430);
  bezierVertex(282, 453, 289, 458, 289, 458);
  bezierVertex(305, 472, 310, 486, 310, 486);
  bezierVertex(293, 483, 274, 490, 274, 490);
  vertex(264, 490);
  bezierVertex(264, 473, 253, 469, 253, 469);
  bezierVertex(262, 416, 193, 378, 193, 378);
  bezierVertex(170, 348, 111, 366, 111, 366);
  vertex(110, 359);
  bezierVertex(90, 383, 72, 390, 72, 390);
  vertex(68, 398);
  bezierVertex(72, 442, 74, 452, 74, 452);
  bezierVertex(90, 470, 87, 491, 87, 491);
  bezierVertex(59, 485, 36, 491, 36, 491);
  bezierVertex(37, 485, 19, 462, 19, 462);
  bezierVertex(16, 455, 23, 446, 23, 446);
  bezierVertex(56, 410, 32, 381, 32, 381);
  bezierVertex(38, 377, 44, 365, 44, 365);
  bezierVertex(11, 349, 9, 321, 9, 321);
  bezierVertex(-6, 263, 94, 271, 94, 271);
  bezierVertex(95, 257, 113, 253, 112, 236);
  bezierVertex(111, 220, 93, 215, 91, 193);
  bezierVertex(91, 192, 88, 171, 99, 164);
  bezierVertex(90, 150, 92, 140, 92, 140);
  bezierVertex(121, 121, 119, 88, 119, 88);
  bezierVertex(117, 57, 82, 47, 77, 46); //el punto 77, 46 es el primer vertex
  endShape();
  
     beginShape(); // cola
  strokeWeight(1);
  vertex(50, 287);
  bezierVertex(50, 282, 42, 285, 42, 285);
  bezierVertex(15, 304, 45, 331, 45, 331);
  bezierVertex(75, 352, 96, 317, 96, 317);
  bezierVertex(114, 375, 47, 364, 47, 364);
  endShape(); //
   
   beginShape(); // división de las patas traseras
   vertex(67, 398);
   bezierVertex(55, 436, 59, 464, 59, 464);
   bezierVertex(70, 468, 72, 488, 72, 488);
   endShape(); //
   
   beginShape(); // división pezuñas de las patas traseras
   vertex(33, 479);
   bezierVertex(43, 473, 51, 465, 51, 465); 
   vertex(59, 464);
   endShape();  //
   
   beginShape(); // división pezuñas de las patas traseras
   vertex(68, 473);
   bezierVertex(71, 464, 80, 465, 80, 465);
   endShape();  //
   
   beginShape();
   vertex(122, 53);
   bezierVertex(147, 56, 168, 47, 168, 47);
   endShape();  //
   
    beginShape();
    vertex(119, 78);
    vertex(123, 73);
    bezierVertex(150, 75, 171, 67, 171, 67);
    endShape();  //
   
   beginShape();
   vertex(145, 88);
   bezierVertex(145, 77, 136, 79, 136, 79);
   bezierVertex(130, 83, 138, 94, 138, 94);
   bezierVertex(144, 111, 146, 96, 146, 96);
   endShape();  //
   
   beginShape();
   vertex(135, 90);
   bezierVertex(139, 131, 99, 163, 99, 163);
   endShape();  //
   
    beginShape();
   vertex(140, 79);
   vertex(147, 72);
    endShape();  //
   
   beginShape();
   vertex(171, 74);
   bezierVertex(157, 74, 152, 82, 152, 82);
   endShape();  //
   
   beginShape();
   vertex(170, 78);
   vertex(160, 80);
   vertex(168, 85);
   endShape();  //
   
   beginShape(); // iris ojo
   vertex(168, 79);
   bezierVertex(168, 83, 164, 83, 164, 83);
   endShape();  //
   
    beginShape(); //
   vertex(144, 102);
   bezierVertex(150, 117, 179, 113, 179, 113);
   endShape();  //
   
   beginShape(); //
   vertex(141, 101);
   bezierVertex(139, 114, 153, 125, 153, 125);
   endShape();  //
   
   beginShape(); // boca
   vertex(177, 107);
   bezierVertex(170, 108, 170, 105, 170, 105);
   vertex(168, 108);
   endShape();  //
   
   beginShape(); // nariz
   vertex(175, 97);
   bezierVertex(165, 100, 167, 93, 167, 93);
   endShape();  //
   
   beginShape(); // cuello ropa
   vertex(117, 145);  
   bezierVertex(142, 159, 146, 175, 146, 175);
   vertex(146, 150);
   endShape();  //
   
   beginShape(); // hombro // brazo
   vertex(122, 170);
   bezierVertex(131, 170, 143, 188, 143, 188);
   bezierVertex(145, 195, 152, 200, 152, 200);
   endShape();  //
   
   beginShape(); // curba // brazo
   vertex(167, 226);
   bezierVertex(163, 230, 163, 240, 165, 240);
   endShape();  //
   
   beginShape(); // muñeca
 vertex(198, 204);
 bezierVertex(206, 203, 211, 212, 211, 212);
   endShape();  //
   
   beginShape(); //
   vertex(109, 194);
   bezierVertex(108, 203, 126, 220, 126, 220);
   bezierVertex(141, 236, 149, 248, 149, 248);
   bezierVertex(162, 265, 171, 266, 171, 266);
    endShape();  //
   
   
    beginShape(); //
   vertex(113, 237);
   bezierVertex(126, 239, 141, 236, 141, 236);
    endShape();  //
   
   beginShape(); //
   vertex(111, 244);
   bezierVertex(126, 248, 146, 244, 146, 244);
   endShape();  //
   
   beginShape(); //
   vertex(77, 270);
   bezierVertex(77, 317, 130, 315, 130, 315);
   endShape();  //
   
   beginShape(); //
   vertex(183, 303);
   bezierVertex(200, 294, 201, 269, 201, 269);
   endShape();  //
   
    beginShape(); //bolita, tira caballo
    vertex(188, 300);
    bezierVertex(209, 302, 197, 287, 197, 287);
    endShape();  //
   
   
   beginShape(); //
   vertex(95, 270);
   bezierVertex(97, 296, 107, 300, 107, 300);
   bezierVertex(150, 308, 186, 290, 186, 290);
   bezierVertex(185, 274, 173, 268, 173, 268);
   endShape();  //
   
   beginShape(); // lado pierna
   vertex(117, 302);
   bezierVertex(146, 334, 180, 353, 180, 353);
   bezierVertex(181, 364, 189, 374, 189, 374);
   endShape();  //
   
   beginShape(); // lado pierna
   vertex(175, 295);
   bezierVertex(196, 315, 198, 329, 198, 329);
   bezierVertex(204, 329, 213, 339, 213, 339);
   vertex(215, 354);
   vertex(243, 392);
   vertex(253, 386);
   endShape();  //
   
   line(197, 299, 264, 402);
   line(200, 296, 266, 395);
   
   beginShape(); // pedacito pie
   vertex(258, 383);
   bezierVertex(270, 376, 282, 377, 282, 377);
   endShape();  //
   
   beginShape(); //
   vertex(307, 381);
   vertex(317, 382);
   vertex(317, 380);
   endShape();  //
   
   beginShape(); //
   vertex(296, 408);
   bezierVertex(296, 415, 311, 413, 311, 413);
   bezierVertex(321, 411, 329, 416, 329, 416);
   endShape();  //
   
    beginShape(); //
   vertex(263, 480);
   bezierVertex(267, 482, 275, 469, 275, 469);
   bezierVertex(280, 461, 289, 461, 289, 461);
   endShape();  //
   
   beginShape(); //
   vertex(257, 338);
   vertex(265, 348);
   vertex(298, 348);
   endShape();  //
   
    
    noFill();
   beginShape(); // bosal 1
   vertex(218, 189);
   bezierVertex(273, 257, 372, 254, 372, 254);
   vertex(392, 176);
    endShape();  //
   
   beginShape(); // bosal 2
   vertex(219, 184);
   bezierVertex(275, 253, 369, 249, 369, 249);
   vertex(386, 174);
   endShape();  //
   
   fill(255);
   beginShape(); //
   vertex(399, 177);
   bezierVertex(376, 180, 370, 149, 370, 149);
   endShape();  //
   
    beginShape(); //
   vertex(374, 161);
   bezierVertex(305, 148, 251, 212, 251, 212);
    endShape();  //
    
    beginShape(); //
    vertex(231, 244);
    vertex(249, 217);
    endShape();  //
    
    beginShape(); //
    vertex(356, 229);
    bezierVertex(346, 207, 348, 196, 348, 196);
    bezierVertex(349, 184, 364, 186, 364, 186); 
    endShape();  //
    
     beginShape(); //
    vertex(390, 183);
    bezierVertex(400, 180, 411, 185, 411, 185);
     endShape();  //
    
    beginShape(); //
    vertex(389, 188);
    bezierVertex(402, 183, 412, 190, 412, 190);
    endShape();  //
    
     beginShape(); // ojo caballo
    vertex(396, 193);
    bezierVertex(405, 197, 403, 207, 403, 207);
    bezierVertex(395, 219, 401, 224, 401, 224);
    endShape();  //
    
    beginShape(); //
    vertex(402, 199);
    bezierVertex(393, 198, 393, 207, 393, 207);
    bezierVertex(393, 214, 399, 214, 399, 214);
    endShape();  //
    
    ellipse(397, 205, 2, 6); // iris caballo
    
    
    beginShape(); //
    vertex(372, 268);
    bezierVertex(375, 262, 372, 255, 372, 255);
    endShape();  //
    
   
    beginShape(); //
    vertex(386, 264);
    bezierVertex(381, 253, 387, 252, 387, 252);
    bezierVertex(391, 252, 390, 260, 390, 260);
    endShape();  // 
    
    
     beginShape(); //
     vertex(179, 161);
     bezierVertex(184, 160, 185, 171, 185, 171);
     bezierVertex(192, 170, 197, 166, 197, 166);
    endShape();  // 
}

