
int x;
void setup(){
  size(570,500) ;
  colorMode(RGB% 200);
  x = 500;
}
void draw(){
  background(#181B34);
  fill(#C6D33A);
  rect(0, x, 50, 150);
  rect(100, x,50,150);
  rect(200, x, 50, 150);
  rect(300, x, 50, 150);
  rect(400, x, 50, 150);
  rect( 500, x, 50,150);
  rect(600, x, 50, 150);
  
   if( x>100 ){
    x -= 50;
  }
  else{
    x = 500;
  } 

smooth();
noStroke();
fill(random (10, 100));
beginShape ();//boca 

vertex(241, 150);
vertex(232, 152);
vertex(225, 162);
vertex(220, 175);
vertex(215, 196);
vertex(215, 208);
vertex(218, 223);
vertex(225, 236);
vertex(236, 244);
vertex(245, 247);
vertex(260, 247);
vertex(278, 242);
vertex(290, 228);
vertex(297, 215);
vertex(302, 206);
vertex(306, 199);
vertex(313, 195);
vertex(320, 193);
vertex(337, 196);
vertex(310, 180);
vertex(289, 168);
vertex(262, 156);

endShape (CLOSE);
fill(#B268DB);
beginShape (); // piel mas clara

vertex(0, 135);
vertex(0, 221);
vertex(18, 243);
vertex(27, 249);
vertex(46, 268);
vertex(86, 281);
vertex(100, 274);
vertex(54, 255);
vertex(46, 229);
vertex(48, 215);
vertex(59, 193);
vertex(80, 222);
vertex(111, 243);
vertex(116, 272);
vertex(116, 274);
vertex(149, 281);
vertex(164, 288);
vertex(189, 282);
vertex(170, 242);
vertex(192, 241);
vertex(223, 251);
vertex(237, 248);
vertex(221, 232);
vertex(214, 210);
vertex(215, 191);
vertex(220, 171);
vertex(230, 151);
vertex(242, 147);
vertex(259, 152);
vertex(283, 163);
vertex(299, 172);
vertex(319, 180);
vertex(329, 188);
vertex(343, 199);
vertex(349, 200);
vertex(368, 180);
vertex(352, 162);
vertex(329, 140);
vertex(304, 110);
vertex(292, 78);
vertex(287, 46);
vertex(279, 18);
vertex(267, 0);
vertex(147, 0);
vertex(142, 33);
vertex(117, 55);
vertex(66, 82);
vertex(24, 111);

endShape (CLOSE);

fill(#745983);//piel media, ojo
beginShape ();

vertex(115, 273);
vertex(110, 247);
vertex(94, 250);
vertex(83, 249);
vertex(77, 242);
vertex(78, 228);
vertex(80, 223);
vertex(59, 193);
vertex(52, 214);
vertex(49, 227);
vertex(53, 251);
vertex(78, 263);
vertex(98, 272);
vertex(85, 281);
vertex(46, 267);
vertex(18, 244);
vertex(0, 223);
vertex(0, 234);
vertex(15, 251);
vertex(24, 262);
vertex(41, 270);
vertex(87, 284);

endShape (CLOSE);

beginShape(); //borde de bosa y nariz
vertex(197, 281);
vertex(188, 280);
vertex(170, 242);
vertex(192, 241);
vertex(207, 245);
vertex(224, 250);
vertex(236, 244);
vertex(220, 231);
vertex(213, 209);
vertex(214, 192);
vertex(220, 171);
vertex(227, 156);
vertex(230, 150);
vertex(241, 145);
vertex(258, 151);
vertex(272, 157);
vertex(281, 161);
vertex(294, 169);
vertex(308, 176);
vertex(321, 181);
vertex(333, 190);
vertex(343, 197);
vertex(347, 198);
vertex(347, 202);
vertex(338, 199);
vertex(332, 193);
vertex(320, 186);
vertex(311, 179);
vertex(302, 175);
vertex(289, 167);
vertex(276, 161);
vertex(263, 154);
vertex(251, 151);
vertex(241, 149);
vertex(231, 154);
vertex(228, 157);
vertex(220, 176);
vertex(216, 192);
vertex(215, 205);
vertex(218, 217);
vertex(221, 226);
vertex(227, 233);
vertex(236, 240);
vertex(241, 245);
vertex(238, 252);
vertex(226, 255);
vertex(215, 262);
vertex(207, 271);

endShape (CLOSE);
beginShape();
vertex(338, 195);
vertex(334, 199);
vertex(323, 196);
vertex(315, 199);
vertex(312, 203);
vertex(307, 211);
vertex(302, 223);
vertex(293, 240);
vertex(285, 247);
vertex(277, 251);
vertex(263, 253);
vertex(240, 253);
vertex(240, 248);
vertex(250, 247);
vertex(259, 245);
vertex(275, 242);
vertex(286, 233);
vertex(292, 223);
vertex(300, 211);
vertex(307, 200);
vertex(315, 194);
vertex(329, 193);
vertex(332, 192);

endShape (CLOSE);
fill(#503E5A);//menton obscuro
beginShape();


vertex(368, 177);
vertex(328, 139);
vertex(304, 110);
vertex(292, 78);
vertex(287, 47);
vertex(280, 17);
vertex(336, 1);
vertex(359, 30);
vertex(362, 61);
vertex(374, 101);
vertex(374, 177);

endShape (CLOSE);

beginShape();
vertex(2, 134);
vertex(28, 107);
vertex(66, 79);
vertex(118, 54);
vertex(140, 32);
vertex(145, 0);
vertex(1, 0);

endShape (CLOSE);
fill(#2F243B, random (-10, 100));
beginShape();

vertex(411, 18);
vertex(405, 1);
vertex(268, 0);
vertex(279, 17);
vertex(336, 2);
vertex(360, 35);
vertex(380, 16);
vertex(396, 11);

endShape (CLOSE); //polera

fill(#500C25);
beginShape();
vertex(408, 0);
vertex(416, 22);
vertex(420, 24);
vertex(440, 6);
vertex(447, 6);
vertex(467, 31);
vertex(493, 55);
vertex(517, 69);
vertex(543, 73);
vertex(568, 64);
vertex(567, 0);

endShape (CLOSE);

fill(random (1, 150));
beginShape();
vertex(77, 222);
vertex(77, 239);
vertex(80, 245);
vertex(88, 249);
vertex(110, 245);
vertex(86, 227);

endShape (CLOSE);
}



