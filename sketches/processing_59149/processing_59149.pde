
void setup(){
size(970,800);
 background(255);
 smooth ();
strokeWeight (2);
frameRate(10);
noFill();
}

void draw(){
PImage miro;
miro=loadImage("fondomiro.jpg");
tint(random(230,255),random(230,255),random(230,255));
image(miro,0,0);


strokeWeight(2);
beginShape();
vertex(283,96); 
bezierVertex(283,96,247,157,247,180);
bezierVertex(247,204,300,307,300,307);
bezierVertex(310,135,396,135,396,135);
bezierVertex(559,135,579,294,631,294);
vertex(586,7);
bezierVertex(586,7,428,151,396,109);
endShape();

beginShape();
vertex(409,117);
vertex(458,16);
bezierVertex(458,16,373,36,352,105);
endShape();

beginShape();
vertex(359,87);
bezierVertex(359,87,300,59,266,59);
bezierVertex(242,59,203,83,203,83);
endShape();

beginShape();
vertex(238,119);
bezierVertex(238,64,92,70,92,70);
bezierVertex(99,71,131,100,131,151);
bezierVertex(131,190,210,209,210,232);
bezierVertex(65,232,16,307,16,365);
bezierVertex(16,404,25,476,74,476);
bezierVertex(176,476,238,284,238,240);
bezierVertex(238,226,227,206,227,180);
bezierVertex(227,145,238,142,238,119);
endShape();

beginShape();
vertex(204,220);
bezierVertex(186,221,121,186,69,186);
vertex(16,186);
bezierVertex(16,186,50,200,71,203);
bezierVertex(92,206,111,200,135,208);
bezierVertex(164,217,174,233,174,233);
endShape();

bezier(228,163,228,163,245,136,262,136);

beginShape();
vertex(255,529);
bezierVertex(255,529,250,491,210,456);
bezierVertex(130,387,132,305,132,305);
vertex(162,299);
vertex(115,282);
vertex(96,316);
vertex(122,310);
bezierVertex(122,310,121,406,167,455);
bezierVertex(213,505,229,527,229,527);
endShape();

beginShape();
vertex(275,531);
bezierVertex(275,526,235,487,236,453);
bezierVertex(236,435,234,416,227,403);
bezierVertex(220,390,194,341,220,357);
bezierVertex(230,374,243,388,275,413);
bezierVertex(313,442,305,492,329,539);
bezierVertex(353,581,415,578,566,652);
bezierVertex(696,717,753,438,753,438);
bezierVertex(753,438,772,543,813,610);
bezierVertex(840,654,941,717,941,717);
bezierVertex(772,727,754,712,628,671);
bezierVertex(628,671,640,661,654,634);
bezierVertex(668,607,714,577,684,556);
bezierVertex(655,535,634,551,634,571);
bezierVertex(634,583,647,586,655,586);
bezierVertex(664,586,671,578,671,570);
bezierVertex(671,561,665,560,659,560);
bezierVertex(653,560,649,562,649,566);
bezierVertex(649,572,655,571,659,571);
endShape();

beginShape();
vertex(262,277);
bezierVertex(313,277,317,315,390,315);
bezierVertex(401,315,430,315,430,350);
bezierVertex(430,384,405,406,362,406);
bezierVertex(262,406,203,343,203,318);
bezierVertex(203,294,227,277,262,277);
endShape();

beginShape();
vertex(65,574);
bezierVertex(94,574,136,558,166,562);
bezierVertex(195,566,221,571,225,585);
bezierVertex(255,683,319,683,327,708);
bezierVertex(341,754,370,785,370,785);
endShape();

bezier(49,626,106,626,214,572,223,581);
bezier(65,669,118,669,215,578,224,583);
bezier(82,740,202,740,212,571,225,585);
bezier(215,764,208,727,223,584,227,589);
bezier(228,594,226,591,248,745,308,781);

beginShape();
vertex(432,595);
bezierVertex(366,595,381,653,314,653);
bezierVertex(283,653,242,691,218,691);
bezierVertex(194,691,126,651,124,609);
bezierVertex(122,568,107,517,107,517);
vertex(275,531);
bezierVertex(275,531,289,528,289,521);
bezierVertex(289,514,279,511,279,511);
endShape();

beginShape();
vertex(346,578);
bezierVertex(342,552,377,525,377,513);
bezierVertex(378,502,366,459,358,460);
bezierVertex(349,462,366,493,364,507);
bezierVertex(362,517,353,519,343,519);
bezierVertex(327,519,311,495,303,495);
endShape();

bezier(392,587,412,548,396,507,353,562);

beginShape();
vertex(485,594);
bezierVertex(485,537,531,495,531,495);
bezierVertex(531,495,483,498,483,476);
bezierVertex(483,453,521,423,521,423);
bezierVertex(520,423,410,420,410,469);
bezierVertex(410,488,441,497,431,574);
bezierVertex(426,614,477,703,421,695);
bezierVertex(318,682,303,721,303,721);
bezierVertex(359,714,356,772,406,772);
bezierVertex(432,772,444,768,444,768);
bezierVertex(444,723,493,674,493,655);
bezierVertex(493,672,495,702,461,715);
endShape();

beginShape();
vertex(493,668);
bezierVertex(532,656,586,671,586,704);
bezierVertex(586,757,517,776,517,800);
endShape();

bezier(477,585,547,552,584,605,584,605);
bezier(587,631,576,581,601,554,566,506);

beginShape();
vertex(569,510);
vertex(539,505);
bezierVertex(571,506,606,467,641,467);
bezierVertex(686,467,627,525,628,565);
bezierVertex(628,598,650,639,649,676);
bezierVertex(647,781,680,764,680,800);
endShape();

beginShape();
vertex(626,754);
bezierVertex(695,754,686,681,714,681);
bezierVertex(722,681,731,690,731,709);
bezierVertex(731,728,709,759,669,759);
bezierVertex(629,759,626,754,626,754);
endShape();

beginShape();
vertex(349,310);
bezierVertex(349,310,352,298,388,273);
bezierVertex(425,247,496,206,533,191);
bezierVertex(606,161,650,134,711,95);
endShape();

beginShape();
vertex(560,347);
bezierVertex(560,324,590,256,616,242);
bezierVertex(641,228,701,183,723,183);
bezierVertex(769,183,740,301,716,312);
bezierVertex(684,326,662,410,598,410);
bezierVertex(555,410,560,370,560,347);
endShape();

beginShape();
vertex(857,548);
bezierVertex(945,546,899,413,899,413);
bezierVertex(899,413,949,574,755,529);
bezierVertex(755,529,770,550,857,548);
endShape();

beginShape();
vertex(734,329);
bezierVertex(735,316,693,290,718,290);
bezierVertex(757,290,758,370,820,400);
bezierVertex(881,430,883,430,883,458);
bezierVertex(883,485,853,500,829,500);
bezierVertex(804,500,818,451,818,451);
vertex(837,481);
bezierVertex(837,481,864,456,864,346);
bezierVertex(864,270,827,258,827,258);
bezierVertex(852,256,880,268,880,268);
bezierVertex(863,279,870,330,871,356);
bezierVertex(871,466,858,515,833,515);
bezierVertex(808,515,686,494,636,494);
bezierVertex(485,494,474,348,511,310);
bezierVertex(535,285,527,241,529,218);
bezierVertex(534,158,573,111,573,111);
bezierVertex(573,111,539,237,539,303);
bezierVertex(539,368,539,421,603,421);
bezierVertex(646,421,738,318,752,318);
endShape();

beginShape();
vertex(853,124);
vertex(857,46);
vertex(815,126);
vertex(692,143);
vertex(806,148);
vertex(770,220);
vertex(824,156);
vertex(910,156);
vertex(853,124);
endShape();

bezier(135,71,135,71,149,62,149,35);
bezier(158,73,158,73,166,40,191,40);

beginShape();
vertex(219,389);
vertex(190,403);
vertex(230,410);
endShape();

beginShape();
vertex(231,413);
vertex(220,426);
vertex(234,426);
endShape();

beginShape();
vertex(236,448);
vertex(221,456);
vertex(236,459);
endShape();

beginShape();
vertex(203,525);
vertex(186,506);
vertex(176,523);
endShape();

beginShape();
vertex(167,521);
vertex(152,486);
vertex(135,519);
endShape();

triangle(799,753,837,703,775,688);

triangle(799,753,809,762,790,764);

triangle(759,419,781,398,746,394);

triangle(711,95,759,109,733,59);

bezier(936,197,925,179,855,165,846,160);
bezier(898,220,898,192,843,165,843,165);
bezier(879,230,879,204,831,164,831,164);
bezier(843,242,850,181,824,164,824,164);

bezier(892,341,818,341,747,303,738,276);
bezier(892,289,892,289,745,250,745,250);
bezier(803,231,770,240,747,226,747,226);
bezier(852,228,852,228,770,217,746,210);
bezier(864,205,850,190,779,193,741,193);

bezier(758,220,735,223,728,216,728,216);
bezier(772,175,772,175,724,200,724,200);
bezier(736,159,736,159,732,181,714,194);
bezier(694,204,690,196,680,180,692,167);
bezier(678,225,670,221,646,202,659,180);

bezier(714,77,733,77,755,51,755,51);
line(800,54,765,48);
line(782,98,762,51);
line(777,14,763,41);
line(747,18,757,39);
line(752,44,723,37);

line(564,363,578,355);
line(576,382,592,359);
line(612,393,610,360);
line(650,378,645,346);
line(706,337,657,328);
bezier(691,313,684,307,659,313,659,313);
bezier(693,291,675,290,656,303,656,303);
bezier(667,278,659,275,645,295,645,295);

bezier(811,572,800,565,768,574,755,570);
bezier(795,612,789,595,755,574,755,574);
bezier(778,634,754,619,751,584,751,584);
bezier(723,648,723,605,751,617,744,552);
bezier(709,629,709,606,738,585,738,585);
bezier(670,596,670,596,690,574,734,577);
bezier(734,562,734,562,713,563,723,534);
bezier(765,517,765,548,753,559,753,559);
bezier(791,521,791,560,755,566,755,566);

bezier(493,709,493,702,508,715,502,666);
bezier(501,721,531,694,554,697,571,678);
line(573,679,557,719);
line(560,721,585,696);
line(844,750,803,747);
line(844,759,807,760);

beginShape();
vertex(308,538);
bezierVertex(308,538,311,562,320,586);
bezierVertex(329,609,307,624,284,624);
bezierVertex(249,624,248,555,278,549);
bezierVertex(303,545,308,538,308,538);
endShape();

beginShape();
vertex(546,661);
bezierVertex(546,661,515,644,525,618);
bezierVertex(535,592,567,607,567,607);
bezierVertex(567,607,522,577,513,625);
bezierVertex(507,655,546,661,546,661);
endShape();

beginShape();
vertex(379,279);
bezierVertex(391,272,415,183,415,183);
bezierVertex(415,183,409,222,429,247);
bezierVertex(448,271,511,255,511,255);
bezierVertex(511,255,495,279,447,272);
bezierVertex(399,265,379,279,379,279);
endShape();

beginShape();
vertex(625,114);
bezierVertex(603,80,611,35,611,35);
bezierVertex(582,59,571,93,571,103);
bezierVertex(571,113,580,128,598,128);
bezierVertex(616,128,625,114,625,114);
endShape();

beginShape();
vertex(680,418);
bezierVertex(711,394,745,397,745,377);
bezierVertex(745,370,743,361,728,361);
bezierVertex(711,361,707,390,680,418);
endShape();

beginShape();
vertex(561,335);
bezierVertex(561,335,563,360,606,360);
bezierVertex(636,360,659,340,659,317);
bezierVertex(659,287,631,294,631,294);
endShape();

beginShape();
vertex(561,335);
vertex(631,294);
bezierVertex(639,294,648,298,648,313);
bezierVertex(648,334,634,349,602,349);
bezierVertex(586,349,561,335,561,335);
endShape();

bezier(613,348,589,348,592,320,594,316);
bezier(629,344,643,331,636,301,620,300);

beginShape();
vertex(225,118);
bezierVertex(225,118,209,141,158,141);
bezierVertex(136,141,126,95,154,95);
bezierVertex(183,95,225,118,225,118);
endShape();

beginShape();
vertex(197,105);
bezierVertex(197,127,182,133,172,133);
bezierVertex(163,133,152,131,152,118);
bezierVertex(152,106,162,97,168,97);
endShape();

beginShape();
vertex(626,261);
bezierVertex(634,238,647,230,653,229);
bezierVertex(659,229,664,233,662,242);
bezierVertex(660,252,626,261,626,261);
endShape();

beginShape();
vertex(672,228);
bezierVertex(689,224,701,225,713,223);
bezierVertex(725,221,731,215,729,208);
bezierVertex(729,208,721,192,708,194);
bezierVertex(695,195,686,223,672,228);
endShape();

beginShape();
vertex(701,198);
bezierVertex(720,193,721,220,706,221);
bezierVertex(690,222,691,208,691,208);
endShape();

beginShape();
vertex(730,232);
bezierVertex(730,232,720,238,714,238);
bezierVertex(714,238,700,234,693,235);
bezierVertex(686,236,685,241,685,245);
bezierVertex(685,259,712,269,712,271);
bezierVertex(712,274,690,287,690,287);
bezierVertex(690,287,685,247,678,247);
bezierVertex(678,247,669,258,669,265);
bezierVertex(669,269,673,270,678,270);
bezierVertex(683,270,687,266,687,266);
endShape();

bezier(694,284,694,274,699,277,700,281);
bezier(703,279,701,268,708,272,708,275);

beginShape();
vertex(729,246);
bezierVertex(729,246,717,258,703,258);
bezierVertex(690,258,691,242,702,241);
bezierVertex(712,239,729,246,729,246);
endShape();
ellipseMode(CENTER);
ellipse(759,46,13,13);
ellipseMode(CORNER);
ellipse(606,77,17,15);
ellipse(649,119,20,19);
ellipse(416,45,47,39);
ellipse(177,40,28,15);
ellipse(135,20,14,30);
ellipse(159,102,28,23);
ellipse(168,109,9,9);
ellipse(279,317,33,30);
ellipse(353,338,37,32);
ellipse(273,510,10,9);
ellipse(278,554,25,26);
ellipse(285,562,9,9);
ellipse(371,550,21,21);
ellipse(379,556,4,4);
ellipse(479,606,24,25);
ellipse(476,708,25,26);
ellipse(483,718,8,8);
ellipse(552,719,8,8);
ellipse(616,654,11,11);
ellipse(552,616,12,13);
ellipse(841,750,9,9);
ellipse(867,584,81,64);
ellipse(733,552,22,36);
ellipse(716,449,64,42);
ellipse(612,316,10,10);
ellipse(641,233,15,15);
ellipse(647,239,4,4);
ellipse(672,256,10,10);
ellipse(676,261,2,2);
ellipse(708,279,8,6);
ellipse(702,242,13,13);
ellipse(706,246,5,5);
ellipse(701,204,6,6);

strokeWeight(1.5);

ellipse(710,225,3,3);
ellipse(717,224,3,3);
ellipse(723,222,3,3);

ellipse(670,369,3,3);
ellipse(674,363,3,3);
ellipse(679,357,3,3);
ellipse(684,351,3,3);
ellipse(688,346,3,3);

ellipse(547,376,4,4);
ellipse(549,382,4,4);
ellipse(551,388,4,4);
ellipse(554,394,4,4);
ellipse(558,399,4,4);
ellipse(562,403,4,4);

ellipse(463,420,5,5);
ellipse(471,419,5,5);
ellipse(480,417,5,5);
ellipse(488,416,5,5);

ellipse(414,393,3,3);
ellipse(419,388,3,3);
ellipse(424,383,3,3);
ellipse(427,377,3,3);
ellipse(430,371,3,3);
ellipse(432,363,3,3);
ellipse(432,356,3,3);
ellipse(432,348,3,3);

ellipse(772,719,3,3);
ellipse(765,717,3,3);
ellipse(757,716,3,3);
ellipse(750,713,3,3);
ellipse(744,712,3,3);

ellipse(495,323,3,3);
ellipse(499,315,3,3);
ellipse(502,310,3,3);
ellipse(506,305,3,3);
ellipse(509,298,3,3);
ellipse(513,293,3,3);
ellipse(515,286,3,3);
ellipse(517,278,3,3);

ellipse(850,644,4,4);
ellipse(845,640,4,4);
ellipse(839,634,4,4);
ellipse(834,628,4,4);
ellipse(829,622,4,4);
ellipse(824,617,4,4);
ellipse(820,612,4,4);

ellipse(20,363,3,3);
ellipse(19,357,3,3);
ellipse(20,349,3,3);
ellipse(21,343,3,3);
ellipse(23,335,3,3);
ellipse(25,328,3,3);
ellipse(28,322,3,3);
ellipse(30,316,3,3);

ellipse(172,192,2,2);
ellipse(166,188,2,2);
ellipse(161,185,2,2);
ellipse(156,181,2,2);
ellipse(151,177,2,2);
ellipse(147,173,2,2);

ellipse(317,64,4,4);
ellipse(323,66,4,4);
ellipse(330,69,4,4);
ellipse(337,71,4,4);
ellipse(343,73,4,4);

ellipse(106,93,4,4);
ellipse(102,88,4,4);
ellipse(97,83,4,4);
ellipse(92,78,4,4);
ellipse(87,73,4,4);



}


