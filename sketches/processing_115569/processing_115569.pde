
//Assignment 3 Miro star strike
//juichi lin
//some star moving by second, when strike together the bird will change
/*reference:http://processing.org/reference/second_.html
 some classmates project on openprocessing uploading before 10/15
 */

void setup() {
  size(700, 350);

  smooth();
}

int constant = 280;//x


void draw() {
  int s=second();
  if (s>10) {
    background(80, 150, 100);
    stroke(174, 185, 190);
  }
  else  {
    background(170, 185, 190);
    stroke(110, 162, 100);
  }
 
//e25 curve
beginShape();
noFill();
stroke(1.2);
vertex(395.5, 255.8);
bezierVertex(399.1, 240.6, 410.5, 240.6, 415.2, 247);
bezierVertex(420, 253.4, 417, 271.3, 393.6, 274);
bezierVertex(370.2, 276.6, 367.3, 251.1, 380, 246.1);
endShape();

//eye background
beginShape();
fill(0);
noStroke();
vertex(292.8, 138.7);
bezierVertex(316.6, 74, 377, 71.3, 411, 80);
bezierVertex(444.3, 88.4, 474.9, 95.6, 495.2, 120.6);
bezierVertex(515.5, 145.7, 516.4, 150.3, 528.7, 158.5);
bezierVertex(541.1, 166.8, 456.4, 155.4, 433.9, 148.6);
bezierVertex(411.4, 141.7, 415.5, 139.5, 399.1, 138.2);
bezierVertex(379.5, 136.6, 377.3, 135.8, 366.6, 131.5);
bezierVertex(355.4, 127, 309, 121.6, 292.8, 138.7);
endShape();

//eye background blue
beginShape();
fill(72, 70, 131);
noStroke();
vertex(372.4, 76.8);
bezierVertex(389.2, 72.9, 406.6, 76.6, 409.6, 81.7);
bezierVertex(404.2, 96.5, 403.9, 133.5, 399.1, 138.2);
bezierVertex(389.2, 137, 370, 135.6, 366.6, 131.5);
bezierVertex(363.1, 127.4, 355.6, 80.7, 372.4, 76.8);
bezierVertex(389.2, 72.9, 406.6, 76.6, 409.2, 81.7);
endShape();

//eyes
fill(205, 50, 42);
noStroke();
ellipse(362, 103, 65, 56);//e29(eye1)
ellipse(450, 122, 60, 59);//e31(eye2)
//sneaky eyes
fill(0);
//e30(eye1)
ellipse(362+(25*(mouseX-360)/380), 99+(5*(mouseY-100)/70), 19, 19 );
//e32(eye2)
ellipse(446+(21*(mouseX-360)/380), 116+(5*(mouseY-100)/55), 18, 17);

//fblack1
beginShape();
fill(0);
stroke(1.2);
vertex(586.1, 102.4);
bezierVertex(603.7, 102.4, 603.3, 104.2, 610.3, 105.1);
bezierVertex(617.4, 106, 696.8, 122.3, 700, 119.6);
vertex(700, 119.6, 700, 87.5);
bezierVertex(678.2, 75.7, 632.8, 83.5, 624.4, 107.7);
endShape();
//fblue1
beginShape();
fill(72, 70, 131);
stroke(1.2);
vertex(624.4, 107.7);
bezierVertex(582.1, 149, 626.6, 223.3, 700.3, 190.6);
bezierVertex(724.1, 180.9, 718.5, 128.3, 700, 119.6);
vertex(700, 190.6, 700, 107.7);
endShape();
//fblack2
beginShape();
fill(5);
stroke(1.2);
vertex(683.5, 21.9);
bezierVertex(626.2, 57.5, 607.4, 75.4, 586.2, 102.4);
vertex(586.2, 102.4, 610.3, 107.7);
vertex(610.3, 107.7);
bezierVertex(639.7, 66.9, 650, 62.2, 683.5, 21.9);
endShape();
//fblbe2
beginShape();
fill(72, 70, 131);
stroke(1.2);
vertex(586.2, 102.4);
bezierVertex(573.6, 115.1, 563.9, 136.5, 561.5, 153.9);
bezierVertex(559.2, 171.2, 564.1, 198.9, 593, 226.8);
bezierVertex(621.8, 254.7, 676.7, 300.3, 688.5, 302.1);
bezierVertex(700.3, 303.8, 557.4, 208.3, 610.3, 107.7);
vertex(610.3, 107.7, 586.2, 102.4);
endShape();
//fblack3
beginShape();
fill(5);
stroke(1.2);
vertex(561.5, 153.9);
bezierVertex(559.2, 171.2, 564.1, 198.9, 593, 226.8);
bezierVertex(594.9, 182.7, 575.6, 176.5, 561.5, 153.9);
endShape();
//fblack4
beginShape();
fill(5);
stroke(1.2);
vertex(586.2, 102.4);
bezierVertex(552.7, 96.6, 530.6, 103.3, 516.8, 112.7);
bezierVertex(535.1, 124.9, 549.4, 144.6, 561.5, 153.9);
endShape();


//curve1
stroke(1.2);
beginShape();
vertex(980, 268);
bezierVertex(980, 240, 925, 186, 869, 169);
bezierVertex(824, 162, 786, 187, 780, 205);
bezierVertex(725, 248, 721, 325, 682, 343.5);
bezierVertex(642, 362, 548, 400, 528, 500);
endShape();
//curve3
beginShape();
vertex(785, 309);
bezierVertex(840, 322, 860, 392, 795, 364);
bezierVertex(839, 386, 771, 415, 766, 364);
endShape();
//curve4
beginShape();
fill(233, 236, 239);
stroke(1.2);
vertex(1000, 343);
bezierVertex(892, 407, 812, 431, 740, 463);
bezierVertex(850, 452, 960, 415, 1000, 402);
endShape();

//black1
beginShape();
fill(0);
stroke(1.2);
vertex(889, 398.3);
bezierVertex(847.8, 386.4, 852.8, 341.2, 891.2, 325.3);
bezierVertex(929.6, 309.4, 962.1, 324.1, 953.5, 366);
bezierVertex(949.6, 418.8, 929, 410, 889, 398.3);
endShape();
//black2
beginShape();
fill(0);
stroke(1.2);
vertex(945.7, 403.8);
bezierVertex(961.9, 400.3, 1000, 415, 1000, 442.6);
bezierVertex(1000, 470.2, 979.8, 490.2, 954, 478.2);
bezierVertex(928.1, 466.1, 932.7, 406.6, 945.7, 403.8);
endShape();

//black3
beginShape();
fill(0);
stroke(1.2);
vertex(750.2, 464);
bezierVertex(804.9, 464.6, 938.4, 434.6, 952.5, 425.8);
bezierVertex(966.6, 417, 931.9, 395.8, 911.9, 393.5);
bezierVertex(891.9, 391.1, 812.9, 433.6, 775.5, 449.3);
bezierVertex(734.3, 464.6, 693.8, 464, 750.2, 464);
endShape();
//blue1
fill(72, 70, 131);
stroke(1.2);
beginShape();
curveVertex(944.6, 404.3); 
curveVertex(944.6, 404.3); 
curveVertex(951.2, 385.1);
curveVertex(954, 364.2);
curveVertex(891, 396.6);
curveVertex(908.2, 402.5); 
curveVertex(938.2, 406.5); 
curveVertex(941.7, 410.7);
curveVertex(935.5, 431.2);
curveVertex(979.8, 417.7); 
curveVertex(961.3, 408.3); 
curveVertex(944.6, 404.3); 
curveVertex(944.6, 404.3);
endShape();

//curve f
beginShape();
noFill();
stroke(1.2);
vertex(247.9, 0);
bezierVertex(258.4, 21.3, 174.6, 47.4, 162.3, 98.3);
bezierVertex(149.9, 149.2, 210.2, 162.3, 244.9, 153.6);
bezierVertex(279.6, 144.8, 283.4, 120.6, 271.3, 97);
bezierVertex(259.3, 73.3, 245.1, 64.5, 228, 71.1);
bezierVertex(210.8, 77.8, 206.2, 88.3, 215.1, 101.1);
endShape();
//face-black
beginShape();
fill(0);
noStroke();
vertex(271.3, 97);
bezierVertex(283.4, 120.6, 279.6, 144.8, 244.9, 153.6);
bezierVertex(256.1, 131.5, 249.6, 125.4, 271.3, 97);
endShape();
//curvegblue
beginShape();
fill(72, 70, 131);
stroke(1.2);
vertex(29.5, 350);
bezierVertex(45, 271.3, 127.9, 287.1, 128.3, 350);
vertex(29.5, 350, 128.3, 350);
endShape();
//ellipse green
beginShape();
fill(100, 102, 67);
noStroke();
vertex(78.8, 179.5);
bezierVertex(41.9, 230.3, 18.5, 197.4, 32.2, 304);
bezierVertex(45.9, 310.6, 37.5, 308.8, 47.6, 311.5);
bezierVertex(57.8, 314.1, 85.5, 318.5, 110.7, 307.9);
bezierVertex(135.8, 297.4, 145.8, 268.8, 151.1, 247);
bezierVertex(156.4, 225.2, 148.2, 207.1, 132.3, 193.6);
bezierVertex(116.4, 180.1, 105.2, 175.4, 78.8, 179.5);
endShape();
//curvegs1
beginShape();
fill(5);
stroke(1.2);
vertex(78.8, 179.5);
bezierVertex(18.5, 189.3, -21.2, 257.9, 32.2, 304);
vertex(32.2, 304, 78.8, 179.5);
endShape();
//curvegs&gsb=black
beginShape();
fill(5);
stroke(1.2);
vertex(47.6, 311.5);
bezierVertex(57.8, 314.1, 85.5, 318.5, 110.7, 307.9);
bezierVertex(93.8, 292.8, 66.5, 291.8, 47.6, 311.5);
endShape();

//fbb
beginShape();
fill(5);
stroke(1.2);
vertex(560.6, 247);
vertex(560.6, 247, 537.7, 225.6);
vertex(537.7, 225.6, 575.3, 228);
vertex(575.3, 228, 575.3, 228);
vertex(575.3, 228, 60, 284.4);
vertex(60, 284.4, 513.3, 304.4);
vertex(513.3, 304.4, 560.6, 247);
endShape();
//blue ball 2
beginShape();
fill(72, 70, 131);
stroke(1.2);
vertex(132, 192);
bezierVertex(119, 210, 124, 237.9, 150, 248);
bezierVertex(176, 258, 216, 252, 222, 230);
bezierVertex(229, 210, 226, 205, 223, 194);
bezierVertex(219, 184, 189, 139, 132, 192);
endShape();
//blue ball 2 black
beginShape();
fill(5);
stroke(1.2);
vertex(132, 192);
bezierVertex(119, 210, 124, 237.9, 150, 248);
bezierVertex(157, 220, 142, 199, 132, 192);
endShape();
//ball 2 black
fill(5);
ellipse(233, 213, 39, 38);
//ball 2 yellow
beginShape();
fill(227, 188, 57);
stroke(1.2);
vertex(222, 230);
bezierVertex(229, 210, 226, 205, 223, 194);
bezierVertex(213, 198, 203, 218, 222, 230);
endShape();
// ball 1 blue
beginShape();
fill(72, 70, 131);
stroke(1.2);
vertex(236, 193);
bezierVertex(256, 196, 262, 221, 244, 228);
bezierVertex(231, 218, 233, 201, 236, 193);
endShape();
//triangle black
beginShape();
fill(5);
stroke(1.2);
vertex(597, 284);
bezierVertex(585, 263, 545, 240, 538, 227);
bezierVertex(531, 214, 573, 223, 576, 227);
bezierVertex(579, 231, 511, 292, 514, 305);
bezierVertex(517, 318, 594, 291, 597, 284);
endShape();  
//triangle blue
beginShape();
fill(72, 70, 131);
stroke(1);
vertex(561, 247);
bezierVertex(547, 258, 529, 281, 526, 285);
bezierVertex(522, 289, 585, 276, 579, 264);
bezierVertex(578, 262, 579, 263, 561, 247);
endShape(); 
// ball 2 blue
beginShape();
fill(72, 70, 131);
stroke(1);
vertex(370, 350);
bezierVertex(396, 295, 454, 304, 476, 350);
vertex(370, 350, 476, 350);
endShape();
// ball 3 blue
beginShape();
fill(72, 70, 131);
stroke(1.2);
vertex(297, 256);
bezierVertex(331, 236, 341, 248, 340, 271);
bezierVertex(339, 307, 252, 303, 297, 256);
endShape();
// ball 3 black
beginShape();
fill(0);
stroke(1.2);
vertex(297, 256);
bezierVertex(331, 236, 341, 248, 340, 271);
bezierVertex(309, 266, 303, 257, 297, 256);
endShape();
//face
noFill();
stroke(1.2);
beginShape();
curveVertex(446.9, 8.4);
curveVertex(446.9, 8.4); 
curveVertex(381, 34); 
curveVertex(354.2, 43.2);
curveVertex(292.8, 75.4);
curveVertex(271.3, 97);
curveVertex(256.9, 125); 
curveVertex(244.9, 153.6); 
curveVertex(235.9, 195.1);
curveVertex(235.9, 215.3);
curveVertex(247.9, 231.7); 
curveVertex(296.3, 255.8); 
curveVertex(339.6, 272.3); 
curveVertex(376.6, 279.7);
curveVertex(429.5, 287.7); 
curveVertex(487.6, 287.7); 
curveVertex(528.7, 285.5);
curveVertex(559.6, 277.8);
curveVertex(579.8, 267.4);
curveVertex(589.6, 250.9); 
curveVertex(592.7, 229); 
curveVertex(592.7, 205.6);
curveVertex(579.4, 178.7);
curveVertex(562.2, 156.2); 
curveVertex(543.4, 133.3); 
curveVertex(517.7, 111.9); 
curveVertex(481.7, 90.5); 
curveVertex(444.5, 66.4); 
curveVertex(417.6, 46.3);
curveVertex(403.8, 31.3);
curveVertex(387.2, 5.4);
curveVertex(387.2, 5.4);
endShape();
//line star
stroke(255);
//star 1

float x = constant;
float y = 175;

strokeWeight(1.3);
line(x-140+s, y-139, x-136+s, y-173);
line(x-153+s, y-159, x-118+s, y-161);
line(x-146+s, y-174, x-129+s, y-151);
line(x-153+s, y-145, x-124+s, y-171);
//star3
strokeWeight(1.3);
line(x-106+s, y+135, x-103+s, y+90);
line(x-124+s, y+112, x-81+s, y+107);
line(x-120+s, y+92, x-93+s, y+127);
line(x-125+s, y+128, x-87+s, y+96);
//star6
strokeWeight(1.2);
line(x+172-s, y-117, x+177-s, y-146);
line(x+161-s, y-133, x+188-s, y-135);
line(x+161-s, y-148, x+182-s, y-125);
line(x+187-s, y-147, x+164-s, y-122);


//star7
strokeWeight(1.2);
line(500+s, 67, 511+s, 11);
line(477+s, 38, 543+s, 33);
line(494+s, 11, 518+s, 67);
line(484+s, 54, 534+s, 13);
//star13
strokeWeight(1.2);
line(x-s, y, x+7-s, y-31);
line(x-10-s, y-19, x+20-s, y-19);
line(x-10-s, y-30, x+11-s, y-6 );
line(x-11-s, y-5, x+19-s, y-33);



//line z

stroke(0);
line(328, 330, 360, 313);
//z2
line(x+220, y+171, x+241, y+149);
line(x+241, y+149, x+253, y+172);
line(x+253, y+172, x+275, y+153);
line(x+275, y+153, x+287, y+169);
line(x+287, y+169, x+321, y+134);
//z3
line(757, 35, 782, 13);
line(782, 13, 792, 49);
line(792, 49, 822, 33);
line(822, 33, 832, 59);
line(832, 59, 864, 42);

//line
stroke(0);
strokeWeight(1.2);
line(401, 129, 388, 164);
//mouth
if (s>30) {
  fill(200, 50, 40);
  ellipse(386, 164, 50, 40);
}
else {
  line(368, 162, 407, 166);
}


//husei
int m=minute();

if (s>30) {
  pushMatrix();
  translate(386.9, 208.2);
  float rotating6=-PI/6;
  rotate(rotating6);
  beginShape();
  fill(10);
  noStroke();
  vertex(355.6-386.9, 151.5-208.2);
  bezierVertex(360.5-386.9, 151.9-208.2, 283.1-386.9, 168-208.2, 281.6-386.9, 196.5-208.2);
  bezierVertex(280.2-386.9, 225-208.2, 331-386.9, 217.1-208.2, 353.7-386.9, 220.9-208.2);
  bezierVertex(376.3-386.9, 224.7-208.2, 393.3-386.9, 220-208.2, 429.2-386.9, 234.7-208.2);
  bezierVertex(465.1-386.9, 249.4-208.2, 485.1-386.9, 249.7-208.2, 492.1-386.9, 245-208.2);
  bezierVertex(499.2-386.9, 240.3-208.2, 512.7-386.9, 225.3-208.2, 509.2-386.9, 195.6-208.2);
  bezierVertex(505.7-386.9, 165.9-208.2, 476-386.9, 171.2-208.2, 467.4-386.9, 168.3-208.2);
  bezierVertex(458.9-386.9, 165.4-208.2, 491.5-386.9, 184.8-208.2, 492.1-386.9, 206.5-208.2);
  bezierVertex(492.7-386.9, 228.3-208.2, 479.5-386.9, 239.4-208.2, 463.6-386.9, 232.1-208.2);
  bezierVertex(447.7-386.9, 224.7-208.2, 440.7-386.9, 197.7-208.2, 425-386.9, 204.8-208.2);

  bezierVertex(409.2-386.9, 211.8-208.2, 395.7-386.9, 219.9-208.2, 386.9-386.9, 208.2-208.2);

  bezierVertex(378.1-386.9, 196.5-208.2, 367.8-386.9, 192.7-208.2, 343.1-386.9, 201.5-208.2);
  bezierVertex(318.4-386.9, 210.3-208.2, 289.9-386.9, 209.7-208.2, 295.2-386.9, 195.9-208.2);
  bezierVertex(300.5-386.9, 182.1-208.2, 344.5-386.9, 161.7-208.2, 355.6-386.9, 151.5-208.2);
  endShape();
  popMatrix();
}
else {
  beginShape();
  fill(10);
  noStroke();
  vertex(355.6, 151.5);
  bezierVertex(360.5, 151.9, 283.1, 168, 281.6, 196.5);
  bezierVertex(280.2, 225, 331, 217.1, 353.7, 220.9);
  bezierVertex(376.3, 224.7, 393.3, 220, 429.2, 234.7);
  bezierVertex(465.1, 249.4, 485.1, 249.7, 492.1, 245);
  bezierVertex(499.2, 240.3, 512.7, 225.3, 509.2, 195.6);
  bezierVertex(505.7, 165.9, 476, 171.2, 467.4, 168.3);
  bezierVertex(458.9, 165.4, 491.5, 184.8, 492.1, 206.5);
  bezierVertex(492.7, 228.3, 479.5, 239.4, 463.6, 232.1);
  bezierVertex(447.7, 224.7, 440.7, 197.7, 425, 204.8);
  bezierVertex(409.2, 211.8, 395.7, 219.9, 386.9, 208.2);
  bezierVertex(378.1, 196.5, 367.8, 192.7, 343.1, 201.5);
  bezierVertex(318.4, 210.3, 289.9, 209.7, 295.2, 195.9);
  bezierVertex(300.5, 182.1, 344.5, 161.7, 355.6, 151.5);
  endShape();
}


line(865, 277, 703, 500);

//linegs1
strokeWeight(1.3);
line(98.8, 131.1, 78.8, 179.5);
line(32.2, 304, 18.5, 350);
//curvegs1
beginShape();
noFill();
stroke(1.3);
vertex(98.8, 131.1);
bezierVertex(60.9, 157.6, 6.2, 223.6, 0, 247);
endShape();

//ellipse;

noStroke();
fill(0);
ellipseMode(CENTER);
ellipse(x+324, y+134, 16, 17);//e4
ellipse(x+223, y+171, 15, 19);//e5
ellipse(364, 315, 19, 21);//e6
ellipse(313, 25, 34, 28);//e7
ellipse(79, 19, 32, 32);//e8
ellipse(101, 464, 42, 43);//e9
ellipse(218, 105, 19, 21);//e10
ellipse(395, 257, 17, 16);//e25
ellipse(324, 335, 25, 29);//e28


//stars moving by second

stroke(180, 162, 100);

//star2
pushMatrix();
strokeWeight(random(0, 7));
translate(112, 94);
line(96-112+s, 125-94+s, 108-112+s, 32-94+s);
line(32-112+s, 90-94+s, 172-112+s, 98-94+s);
line(64-112+s, 38-94+s, 139-112+s, 172-94+s);
line(58-112+s, 130-94+s, 165-112+s, 56-94+s);
popMatrix();
//star12
pushMatrix();
strokeWeight(random(0, 5));
translate(241, 278);
line(244-241-s, 255-278-s, 238-241-s, 300-278-s);
line(225-241-s, 275-278-s, 260-241-s, 271-278-s);
line(228-241-s, 257-278-s, 256-241-s, 296-278-s);
line(227-241-s, 290-278-s, 254-241-s, 261-278-s);
popMatrix();

//star8
pushMatrix();
translate(586, 22);
strokeWeight(1.2);
line(589-586, 0-22+s, 583-586, 44-22+s);
line(558-586, 19-22+s, 621-586, 15-22+s);
line(574-586, 0-22+s, 607-586, 36-22+s);
line(566-586, 40-22+s, 605-586, 0-22+s);
popMatrix();
//star9
strokeWeight(2);
pushMatrix();
translate(568, 73);
line(564-568, 57-73+s*2, 556-568, 89-73+s*2);
line(533-568, 69-73+s*2, 577-568, 74-73+s*2);
line(543-568, 52-73+s*2, 568-568, 86-73+s*2);
line(539-568, 83-73+s*2, 578-568, 60-73+s*2);
popMatrix();

//star5
pushMatrix();
strokeWeight(1.2);
line(268-266, 21-41+s, 264-266, 61-41+s);
line(255-266, 38-41+s, 282-266, 42-41+s);
line(260-266, 30-41+s, 277-266, 57-41+s);
line(256-266, 49-41+s, 282-266, 28-41+s);
popMatrix();
}


