
void setup()
{
  int[ ] coords = {
    40, 40, 80, 60, 100, 100, 60, 120, 50, 150
  };
  int i;
  
  size(400, 400);
  background(255);
  //smooth();
  
  noFill();
  stroke(0);
  
  // Wire
  line(76, 40, 83, 47);
  line(83, 47, 94, 59);
  line(70, 45, 76, 51);
  line(76, 51, 87, 62);
  
  // Mouse wheel indent
  beginShape();
  curveVertex(113, 56);
  curveVertex(113, 56);
  curveVertex(108, 60);
  curveVertex(114, 63);
  curveVertex(119, 66);
  curveVertex(130, 73);
  curveVertex(136, 75);
  curveVertex(139, 74);
  curveVertex(147, 72);
  curveVertex(156, 68);
  curveVertex(157, 66);
  curveVertex(155, 64);
  curveVertex(151, 62);
  curveVertex(144, 59);
  curveVertex(144, 59);
  endShape();
  
  // Mouse wheel
  beginShape();
  curveVertex(110, 61);
  curveVertex(110, 61);
  curveVertex(114, 55);
  curveVertex(120, 52);
  curveVertex(128, 49);
  curveVertex(133, 49);
  curveVertex(143, 57);
  curveVertex(150, 66);
  curveVertex(152, 70);
  curveVertex(152, 70);
  endShape();
  
  // Mouse wheel contour
  beginShape();
  curveVertex(111, 61);
  curveVertex(116, 56);
  curveVertex(122, 57);
  curveVertex(129, 63);
  curveVertex(137, 74);
  curveVertex(137, 74);
  endShape();
  
  // Mouse wheel stripe
  beginShape();
  curveVertex(115, 54);
  curveVertex(115, 54);
  curveVertex(121, 54);
  curveVertex(127, 58);
  curveVertex(133, 65);
  curveVertex(139, 74);
  curveVertex(139, 74);
  endShape();
  
  beginShape();
  curveVertex(125, 49);
  curveVertex(125, 49);
  curveVertex(132, 51);
  curveVertex(144, 62);
  curveVertex(149, 71);
  curveVertex(149, 71);
  endShape();
  
  // Mouse wheel L/R arrows
  line(112, 65, 112, 67);
  line(112, 67, 116, 67);
  line(145, 56, 149, 56);
  line(149, 56, 150, 58);
  
  // Left/right button line
  beginShape();
  curveVertex(148, 72);
  curveVertex(148, 72);
  curveVertex(154, 78);
  curveVertex(157, 80);
  curveVertex(157, 80);
  endShape();
  
  beginShape();
  curveVertex(174, 97);
  curveVertex(174, 97);
  curveVertex(188, 112);
  curveVertex(201, 127);
  curveVertex(201, 127);
  endShape();
  
  // Mouse wheel lock button
  beginShape();
  curveVertex(153, 83);
  curveVertex(153, 83);
  curveVertex(159, 80);
  curveVertex(165, 79);
  curveVertex(167, 80);
  curveVertex(178, 89);
  curveVertex(179, 90);
  curveVertex(179, 93);
  curveVertex(179, 93);
  curveVertex(174, 96);
  curveVertex(168, 98);
  curveVertex(165, 98);
  curveVertex(163, 96);
  curveVertex(153, 86);
  curveVertex(153, 83);
  curveVertex(153, 83);
  endShape();
  
  beginShape();
  curveVertex(155, 84);
  curveVertex(155, 84);
  curveVertex(166, 95);
  curveVertex(166, 95);
  curveVertex(169, 95);
  curveVertex(176, 92);
  curveVertex(177, 91);
  curveVertex(177, 91);
  endShape();
  
  // Right side
  beginShape();
  curveVertex(51, 83);
  curveVertex(51, 83);
  curveVertex(70, 70);
  curveVertex(121, 51);
  curveVertex(154, 46);
  curveVertex(187, 50);
  curveVertex(214, 58);
  curveVertex(231, 68);
  curveVertex(247, 83);
  curveVertex(262, 103);
  curveVertex(281, 132);
  curveVertex(297, 156);
  curveVertex(317, 184);
  curveVertex(327, 197);
  curveVertex(336, 212);
  curveVertex(349, 238);
  curveVertex(356, 259);
  curveVertex(360, 284);
  curveVertex(358, 302);
  curveVertex(344, 337);
  curveVertex(315, 362);
  curveVertex(301, 369); // Bottom corner of right side
  curveVertex(301, 369);
  endShape();
  
  beginShape();
  curveVertex(301, 369);
  curveVertex(301, 369);
  curveVertex(300, 338);
  curveVertex(294, 304);
  curveVertex(285, 278);
  curveVertex(270, 250);
  curveVertex(247, 226);
  curveVertex(218, 204);
  curveVertex(165, 176);
  curveVertex(122, 152);
  curveVertex(88, 131);
  curveVertex(71, 117);
  curveVertex(56, 101);
  curveVertex(51, 91);
  curveVertex(50, 87);
  curveVertex(50, 85);
  curveVertex(51, 83);
  curveVertex(51, 83);
  endShape();
  
  // Middle section
  beginShape();
  curveVertex(301, 369);
  curveVertex(301, 369);
  curveVertex(295, 371);
  curveVertex(287, 373);
  curveVertex(287, 373);
  endShape();
  
  beginShape();
  curveVertex(287, 373);
  curveVertex(287, 373);
  curveVertex(285, 350);
  curveVertex(280, 321);
  curveVertex(273, 300);
  curveVertex(263, 277);
  curveVertex(247, 257);
  curveVertex(238, 248);
  curveVertex(230, 241);
  curveVertex(215, 231);
  curveVertex(209, 228);
  curveVertex(192, 219);
  curveVertex(166, 204);
  curveVertex(129, 182);
  curveVertex(96, 160);
  curveVertex(68, 140);
  curveVertex(52, 125);
  curveVertex(41, 108);
  curveVertex(38, 101);
  curveVertex(39, 95);
  curveVertex(41, 92);
  curveVertex(47, 85);
  curveVertex(51, 83);
  curveVertex(51, 84);
  curveVertex(51, 84);
  endShape();
  
  // Left side
  beginShape();
  curveVertex(287, 373);
  curveVertex(287, 373);
  curveVertex(267, 376);
  curveVertex(244, 373);
  curveVertex(221, 367);
  curveVertex(202, 359);
  curveVertex(182, 346);
  curveVertex(163, 331);
  curveVertex(149, 316);
  curveVertex(132, 295);
  curveVertex(121, 277);
  curveVertex(105, 242);
  curveVertex(87, 200);
  curveVertex(83, 190);
  curveVertex(81, 186);
  curveVertex(79, 184);
  curveVertex(79, 184);
  endShape();
  
  // Up button
  beginShape();
  curveVertex(51, 143);
  curveVertex(51, 143);
  curveVertex(48, 144);
  curveVertex(48, 146);
  curveVertex(50, 153);
  curveVertex(55, 161);
  curveVertex(61, 168);
  curveVertex(69, 173);
  curveVertex(72, 176);
  curveVertex(72, 176);
  endShape();
  
  // Up button contour
  beginShape();
  curveVertex(70, 168);
  curveVertex(70, 168);
  curveVertex(63, 162);
  curveVertex(58, 157);
  curveVertex(54, 151);
  curveVertex(51, 147);
  curveVertex(51, 147);
  endShape();
  
  // Down button
  beginShape();
  curveVertex(78, 168);
  curveVertex(78, 168);
  curveVertex(73, 171);
  curveVertex(72, 172);
  curveVertex(72, 174);
  curveVertex(72, 176);
  curveVertex(72, 176);
  curveVertex(78, 182);
  curveVertex(84, 188);
  curveVertex(94, 196);
  curveVertex(106, 204);
  curveVertex(119, 211);
  curveVertex(131, 214);
  curveVertex(135, 214);
  curveVertex(141, 213);
  curveVertex(141, 211);
  curveVertex(139, 208);
  curveVertex(129, 201);
  curveVertex(114, 192);
  curveVertex(98, 183);
  curveVertex(80, 170);
  curveVertex(68, 160);
  curveVertex(59, 151);
  curveVertex(53, 145);
  curveVertex(51, 143);
  curveVertex(51, 143);
  endShape();
  
  // Down button contour
  beginShape();
  curveVertex(134, 212);
  curveVertex(134, 212);
  curveVertex(132, 208);
  curveVertex(124, 204);
  curveVertex(111, 197);
  curveVertex(101, 191);
  curveVertex(90, 184);
  curveVertex(82, 178);
  curveVertex(77, 173);
  curveVertex(77, 173);
  endShape();
  
  // Top of left area
  beginShape();
  curveVertex(51, 143);
  curveVertex(51, 143);
  curveVertex(43, 132);
  curveVertex(38, 122);
  curveVertex(35, 113);
  curveVertex(34, 108);
  curveVertex(36, 100);
  curveVertex(39, 95);
  curveVertex(39, 95);
  endShape();
}

