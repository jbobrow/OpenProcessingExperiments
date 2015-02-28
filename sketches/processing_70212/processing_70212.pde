
//  Rebecca Low
//  Fall 2012 Creative Computing - Section A - Norskov
//  September 14, 2012
//  Assignment_02


size (784, 1005);
smooth ();

//Background
fill(180, 66, 30); 
rect(0, 0, 784, 1005);

//Top Rectangle
noStroke();
fill(219,171,73);
quad(59, 40, 716, 30, 716, 37, 59, 45);

//Bottom Rectangle
fill(219,171,73);
quad(59, 933, 727, 936, 725, 975, 59, 970);

//Blue Rectangle
fill(73, 76, 153);
quad(73, 46, 701, 37, 710, 897, 70, 895);

//LARGE ORANGE TAIL
fill(237, 189, 1);
beginShape();
vertex(338, 282);
vertex(328, 315);
vertex(170, 832);
vertex(116, 652);
vertex(130, 598);
vertex(80, 651);
vertex(71, 589);
vertex(73, 543);
vertex(128, 454);
vertex(116, 438);
vertex(220, 325);
arc(168, 675, 105, 210, HALF_PI, PI+HALF_PI);
endShape();
fill(73, 76, 153);
arc(372, 650, 280, 730, 2.57, PI+HALF_PI);

//LEFT orange thing
beginShape();
fill(237, 189, 1);
vertex(178, 168);
vertex(178, 159);
vertex(298, 165);
vertex(358, 184);
vertex(383, 231);
vertex(364, 238);
vertex(316, 207);
vertex(262, 190);
endShape();

//White arm things
fill(186, 206, 204);
arc(295, 129, 203, 50, PI, TWO_PI);  //LEFT
beginShape();  //RIGHT
vertex(472, 162);
vertex(494, 103);
vertex(575, 67);
vertex(623, 72);
vertex(514,120);
vertex(493, 160);
endShape();

//White head and body
ellipse(440, 148, 40, 52);
beginShape();
vertex(422, 288);
vertex(422, 339);
vertex(359, 345);
vertex(329, 310);
vertex(368, 250);
vertex(419, 199);
vertex(455, 178);
vertex(478, 199);
vertex(461, 262);
vertex(506, 250);
vertex(541, 246);
vertex(587, 258);
vertex(595, 282);
vertex(581, 304);
vertex(498, 376);
vertex(463, 411);
vertex(485, 364);
vertex(518, 318);
vertex(545, 286);
vertex(467, 313);
vertex(454, 276);
endShape();

//MIDDLE & FAR RIGHT ORANGE
fill(219,169,6);
arc(470, 83, 200, 65, 2.5, TWO_PI);
beginShape();
vertex(532, 163);
vertex(613, 108);
vertex(643, 75);
vertex(694, 49);
vertex(625, 128);
vertex(587, 178);
vertex(547, 198);
endShape();

// Black FIGURE
beginShape();
vertex(539, 466);
fill(0);
arc(539, 468, 45, 73, 3.2, TWO_PI+QUARTER_PI);  //head
quad(504, 490, 555, 494, 558, 446, 520, 450);   //head

beginShape();
vertex(671, 388);
vertex(698, 408);
vertex(688, 486);
vertex(599, 573);
vertex(478, 686);
vertex(529, 798);
vertex(560, 831);
vertex(587, 889);
vertex(556, 897);  //bottom right foot
vertex(524, 832);
vertex(427, 741);
vertex(421, 721);
vertex(410, 717);
vertex(361, 807);
vertex(311, 895);  //bottom left foot
vertex(278, 891);
vertex(316, 760);
vertex(382, 658);
vertex(451, 580);
vertex(458, 550);
vertex(449, 531);
vertex(388, 510);
vertex(364, 493);
vertex(337, 454);  //left arm end
vertex(401, 484);
vertex(454, 492);
vertex(539, 520);
vertex(560, 513);
vertex(583, 550);
vertex(590, 543);
vertex(571, 505);
vertex(640, 484);
vertex(674, 432);
vertex(671, 387);
endShape();




