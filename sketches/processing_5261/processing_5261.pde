
void setup(){
  
  size(320, 480);
}

void draw(){
 
 //Main Body
smooth();
strokeWeight(2);
fill(203, 224, 142);

beginShape();
vertex(154, 65);
vertex(182, 71);
vertex(225, 82);
vertex(250, 90);
vertex(258, 96);
vertex(265, 108);
vertex(265, 129);
vertex(250, 157);
vertex(244, 177);
vertex(239, 194);
vertex(234, 211);
vertex(228, 245);
vertex(228, 262);
vertex(226, 281);
vertex(226, 296);
vertex(224, 317);
vertex(225, 329);
vertex(229, 350);
vertex(222, 350);
vertex(204, 356);
vertex(195, 356);
vertex(170, 352);
vertex(166, 348);
vertex(166, 347);
vertex(166, 323);
vertex(166, 302);
vertex(170, 292);
vertex(174, 280);
vertex(180, 270);
vertex(187, 262);
vertex(201, 265);
vertex(152, 257);
vertex(131, 255);
vertex(95, 254);
vertex(76, 255);
vertex(66, 244);
vertex(61, 229);
vertex(50, 161);
vertex(56, 140);
vertex(62, 102);
vertex(76, 75);
vertex(130, 62);
vertex(154, 65);
endShape();


//Eyes

smooth();
strokeWeight(2);
fill(255);

ellipse(195, 156, 90, 90);
ellipse(64, 160, 85, 85);

fill(0);

ellipse(45, 160, 7, 7);
ellipse(200, 154, 8, 8);

//Right Arm

smooth();
fill(0);

beginShape();
vertex(220, 278);
vertex(227, 278);
vertex(228, 295);
vertex(233, 301);
vertex(236, 308);
vertex(236, 313);
vertex(236, 320);
vertex(233, 323);
vertex(228, 323);
vertex(222, 323);
vertex(216, 313);
vertex(212, 304);
vertex(209, 289);
vertex(220, 278);
endShape();

//Left Arm

smooth();
fill(0);

beginShape();
vertex(170, 294);
vertex(163, 298);
vertex(160, 300);
vertex(157, 305);
vertex(155, 310);
vertex(155, 319);
vertex(157, 325);
vertex(162, 325);
vertex(166, 307);
vertex(170, 294);
endShape();

//Right Leg

smooth();
fill(0);

beginShape();
vertex(206, 357);
vertex(220, 352);
vertex(223, 358);
vertex(223, 364);
vertex(220, 372);
vertex(220, 382);
vertex(220, 387);
vertex(217, 390);
vertex(213, 390);
vertex(211, 387);
vertex(209, 384);
vertex(207, 380);
vertex(207, 375);
vertex(207, 370);
vertex(206, 357);
endShape();

//Left Leg

smooth();
fill(0);

beginShape();
vertex(166, 350);
vertex(166, 354);
vertex(166, 357);
vertex(166, 368);
vertex(168, 375);
vertex(170, 380);
vertex(170, 383);
vertex(174, 387);
vertex(177, 391);
vertex(180, 391);
vertex(182, 391);
vertex(183, 381);
vertex(183, 356);
vertex(166, 350);
endShape();

//Tail

smooth();
fill(0);


beginShape();
vertex(252, 330);
vertex(247, 331);
vertex(243, 333);
vertex(239, 335);
vertex(234, 339);
vertex(227, 342);
vertex(226, 336);
vertex(230, 334);
vertex(234, 332);
vertex(239, 331);
vertex(242, 330);
vertex(245, 328);
vertex(252, 330);
endShape();

//Right Ear

smooth();
fill(0);

beginShape();
vertex(241, 25);
vertex(265, 30);
vertex(265, 38);
vertex(269, 64);
vertex(269, 73);
vertex(269, 90);
vertex(265, 107);
vertex(259, 101);
vertex(255, 95);
vertex(258, 89);
vertex(254, 73);
vertex(255, 55);
vertex(249, 43);
vertex(241, 25);
endShape();

//Left Ear

smooth();
fill(0);

beginShape();
vertex(171, 19);
vertex(171, 25);
vertex(162, 28);
vertex(153, 39);
vertex(146, 48);
vertex(141, 56);
vertex(141, 64);
vertex(130, 64);
vertex(130, 57);
vertex(137, 45);
vertex(142, 32);
vertex(147, 25);
vertex(153, 18);
vertex(171, 19);
endShape();

//Nose

smooth();
fill(0);

beginShape();
vertex(125, 227);
vertex(127, 229);
vertex(127, 232);
vertex(120, 231);
vertex(112, 231);
vertex(110, 230);
vertex(112, 227);
vertex(112, 224);
vertex(119, 220);
vertex(125, 227);
endShape();

//Tongue

smooth();
strokeWeight(2);
fill(220, 95, 81);

beginShape();
vertex(133, 257);
vertex(152, 260);
vertex(153, 264);
vertex(155, 269);
vertex(155, 272);
vertex(157, 278);
vertex(157, 286);
vertex(154, 287);
vertex(150, 286);
vertex(144, 285);
vertex(139, 285);
vertex(133, 285);
vertex(127, 285);
vertex(129, 278);
vertex(131, 272);
vertex(132, 266);
vertex(133, 262);
vertex(133, 257);
endShape();

line(142, 258, 142, 274);

//Zipper

smooth();
strokeWeight(2);
fill(191, 190, 183);

beginShape();
vertex(181, 266);
vertex(193, 266);
vertex(194, 335);
vertex(190, 338);
vertex(184, 338);
vertex(179, 338);
vertex(177, 335);
vertex(177, 321);
vertex(176, 313);
vertex(181, 266);
endShape();

beginShape();
vertex(178, 264);
vertex(190, 265);
vertex(188, 272);
vertex(188, 279);
vertex(185, 286);
vertex(185, 292);
vertex(174, 292);
vertex(167, 288);
vertex(166, 285);
vertex(167, 281);
vertex(170, 278);
vertex(174, 272);
vertex(178, 264);
endShape();

fill(0);
beginShape();
vertex(181, 285);
vertex(181, 286);
vertex(181, 289);
vertex(178, 289);
vertex(176, 287);
vertex(172, 285);
vertex(172, 282);
vertex(176, 282);
vertex(179, 284);
vertex(181, 285);
endShape();

strokeWeight(2);
line(185, 294, 185, 302);
line(185, 302, 181, 304);
line(181, 304, 181, 312);
line(181, 312, 186, 312);
line(186, 312, 186, 320);
line(186, 320, 182, 323);
line(182, 323, 182, 331);
line(182, 331, 187, 332);
line(187, 332, 187, 336);

//Stitches

strokeWeight(2);
line(141, 64, 134, 79);
line(128, 97, 124, 113);
line(122, 128, 119, 143);
line(116, 160, 116, 175);
line(115, 189, 115, 207);
line(114, 217, 116, 230);
line(116, 230, 118, 242);
line(118, 249, 119, 254);

}

