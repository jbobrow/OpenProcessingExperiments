
PImage white_fur;
int x = 430; 
int dx = 1;

int n = 420;
int dn = 1;

int y = 500;
int dy = 1;

int m = 320;
int dm = 1;

int s = -50;
int ds = 1;

int r = 430;
int dr = 1;

int w = -50;
int dw = 1;

int t = -80;
int dt = 1;

int h = 500;
int dh = 1;

int k = 0;
int dk = 1;

int b = 400;
int db = 1;

int j = -50;
int dj = 1;

int p = -10;
int dp = 1;

int l = 500;
int dl = 1;

void setup(){
  size (480, 640);
  white_fur=loadImage("fur2.jpg"); 
}
  

void draw(){
  
 //image
  image(white_fur, 0, 0);
  filter(BLUR, 2);
  

  //eyelids
  noStroke();
  fill(0, 0, 0, 120);
  //left
  triangle(160, 160, 183, 142, 220, 147);
  //right
  triangle(268, 136, 260, 130, 291, 129);

  
  //lipstick
  noStroke();
  fill(129, 8, 8, 90);
  quad(284, 217, 295, 221, 295, 235, 252, 249); 
  quad(295, 221, 300, 213, 350, 225, 295, 250);
  quad(237, 251, 287, 258, 310, 250, 318, 225);
  
  
  //hair
  noStroke();
  fill(0, 0, 0, 80);
  triangle(227, 40, 270, 38, 285, 100);
  triangle(100, 62, 190, 3, 214, 40); 
  triangle(0, 240, 240, 415, 135, 5);
  triangle(40, 160, 50, 60, 160, 40);  
  triangle(285, 100, 325, 140, 319, 179); 
  
  
  
  // fur outline, left side (left to right)
  stroke(186,223,245);
  strokeWeight(4);
  line(0, random(318, 321), 11, random(311, 313));
  line(11, random(311, 313), 18, random(315, 318));
  line(18, random(315, 318), 27, random(312, 315));
  line(27, random(312, 315), 25, random( 317, 320)); 
  line(25, random(317, 320), 40, random(317, 320));
  line(40, random(317, 320), random(46, 49), 326);
  line(random(46, 49), 326, random(29, 32), 339);
  line(random(29, 32), 339, 54, random(327, 329));
  line(54, random(327, 329), 63, random( 325, 328));
  line(62, random(326, 329), 68, random(336, 339));
  line(68, random(336, 339), 75, random(335, 338));
  line(75, random(335, 338), 78, random( 346, 349));
  line(78, random(346, 349), 85, random(339, 341));
  line(85, random(339, 341), 90, random(351, 354));
  line(90, random(351, 354), 100, random(350, 353));
  line(100, random(350, 353), 109, random(360, 363));
  line(109, random(360, 363), 118, random(359, 362));
  line(118, random(359, 362), 123, random(371, 374));
  line(123, random(371, 374), 127, random( 366, 369));
  line(127, random(366, 369), 135, random(373, 376));
  line(135, random(373, 376), 140, random(369, 372));
  line(140, random(369, 372), 149, random(380, 383));
  line(149, random(380, 383), 158, random(379, 381));
  line(158, random(379, 381), 163, random(386, 389));
  line(163, random(386, 389), 169, random(385, 388));
  line(169, random(385, 388), 177, random(394, 397));
  line(177, random(394, 397), 184, random(393, 396));
  line(184, random(393, 396), 190, random(401, 404));
  line(190, random(401, 404), 198, random(398, 401));
  line(198, random(398, 401), 202, random(405, 408));
  line(202, random(405, 408), 210, random(403, 406));
  line(210, random(403, 406), 221, random(414, 417));
  line(221, random(414, 417), 230, random(415, 418));
  line(230, random(415, 418), 233, random(424, 427));
  line(233, random(424, 427), 241, random(420, 423));
  line(241, random(420, 423), 243, random(434, 437));
  line(243, random(434, 437), 257, random(433, 435));
  line(257, random(433, 435), 261, random(445, 448));
  line(261, random(445, 448), 266, random(441, 444));
  line(266, random(441, 444), 270, random(450, 453));
  line(270, random(450, 453), 278, random(452, 455));
  line(278, random(452, 455), 285, random(466, 469));
  line(285, random(466, 469), 293, random(466, 469));
  line(293, random(466, 469), 296, random(479, 481));
  line(296, random(479, 481), 303, random(478, 481));
  line(303, random(478, 481), 311, random(497, 500));
  line(311, random(497, 500), 318, random(494, 497));
  line(318, random(494, 497), 327, random(511, 514));
  line(327, random(511, 514), 332, random(504, 507));
  line(332, random(504, 507), 339, random(517, 520));
  line(339, random(517, 520), 348, random(519, 522));
  line(348, random(519, 522), 344, random(525, 528));
  line(344, random(525, 528), 354, random(527, 530));
  line(354, random(527, 530), 350, random(536, 539));
  line(350, random(536, 539), 361, random(539, 542));
  line(361, random(539, 542), 363, random(550, 553));
  line(363, random(550, 553), 376, random(561, 564));
  line(376, random(561, 564), 370, random(572, 575));
  line(370, random(572, 575), 380, random(585, 588));
  line(380, random(585, 588), 370, random(587, 590));
  line(370, random(587, 590), 380, random(592, 595));
  line(380, random(592, 595), 382, random(599, 602));
  line(382, random(599, 602), 374, random(606, 609));
  line(374, random(606, 609), 390, random(608, 611));
  line(390, random(608, 611), 384, random(613, 616));
  line(384, random(613, 616), 391, random(615, 618));
  line(391, random(615, 618), 380, random(620, 623));
  line(380, random(620, 623), 394, random(626, 629));
  line(394, random(626, 629), 384, random(633, 636));
  line(384, random(633, 636), 395, random(637, 640));
  
  
   
  // fur outline right side (left to right)
  stroke(186,223,245);
  strokeWeight(4);
  line(random(266, 269), 449, random(254, 257), 432);
  line(256, random(433, 436), 267, random(434, 437));
  line(random(265, 268), 435, 254, random(424, 427));
  line(254, random(424, 427), 263, random(422, 425));
  line(263, random(422, 425), 258, random(418, 421));
  line(258, random(418, 421), 266, random(410, 413));
  line(268, random(410, 413), 255, random(409, 412));
  line(255, random(409, 412), 272, random(395, 398));
  line(272, random(395, 398), random(260, 262), 399);
  line(random(260, 262), 399, random(254, 257), 395);
  line(255, random(393, 396), 263, random(387, 390));
  line(263, random(387, 390), 258, random(383, 386));
  line(258, random(383, 386), random(260, 263), 380);
  line(random(260, 263), 380, random(253, 256), 374);
  line(254, random(372, 375), 263, random(367, 370));
  line(263, random(367, 370), 258, random(363, 366));
  line(random(257, 260), 364, 264, random(358, 361));
  line(264, random(358, 361), 259, random(347, 350));
  line(259, random(347, 350), random(264, 266), 345);
  line(264, random(344, 347), 261, random(338, 341)); 
  line(261, random(338, 341), 267, random(332, 335));
  line(267, random(332, 335), 266, random(323, 326));
  line(266, random(323, 326), 272, random(323, 326));
  line(random(270, 273), 324, 269, random(316, 319));
  line(269, random(316, 319), 274, random(314, 317));
  line(274, random(314, 317), random(277, 279), 324);
  line(278, random(322, 325), 283, random(321, 324));
  line(283, random(321, 324), random(285, 288), 330);
  line(286, random(328, 331), 293, random(321, 324));
  line(random(291, 293), 322, random(293, 296), 332);
  line(294, random(330, 333), 304, random(331, 334));
  line(304, random(331, 334), 308, random( 340, 343));
  line(308, random(340, 343), 313, random(333, 336));
  line(313, random(333, 336), random(313, 316), 345);
  line(314, random(344, 347), 320, random(342, 345));
  line(random(319, 321), 343, 325, random(349, 352));
  line(325, random(349, 352), 332, random(347, 350));
  line(332, random(347, 350), 337, random(356, 359));
  line(337, random(356, 359), 343, random(355, 358));
  line(343, random(355, 358), 350, random(365, 368));
  line(350, random(365, 368), 358, random(368, 371));
  line(358, random(368, 371), 365, random(379, 382));
  line(365, random(379, 382), 375, random(381, 384));
  line(375, random(381, 384), random(376, 378), 390);
  line(377, random(388, 391), 386, random(393, 396));
  line(random(385, 388), 394, random(380, 383), 400);
  line(382, random(399, 402), 389, random(401, 404));
  line(389, random(401, 404), 385, random(410, 413));
  line(385, random(408, 411), 391, random(408, 411));
  line(391, random(409, 411), 382, random(417, 420));
  line(382, random(417, 420), 386, random(428, 431));
  line(386, random(428, 431), 370, random(437, 440));
  line(370, random(437, 440), 377, random(442, 445));
  line(377, random(442, 445), 365, random(447, 450));
  line(365, random(447, 450), 377, random(455, 458));
  line(377, random(455, 458), random(368, 371), 465);
  line(370, random(464, 467), 376, random(467, 470));
  line(random(375, 378), 469, 373, random(474, 477));
  line(373, random(474, 477), 380, random(481, 484));
  line(380, random(481, 484), 375, random(486, 489));
  line(375, random(486, 489), 387, random(498, 501));
  line(387, random(498, 501), 389, random(510, 513));
  line(389, random(510, 513), 393, random(515, 518));
  line(393, random(515, 518), 390, random(520, 523));
  line(390, random(520, 523), 399, random(530, 533));
  line(399, random(530, 533), 395, random(537, 540));
  line(395, random(537, 540), 405, random(540, 543));
  line(405, random(540, 543), 400, random(546, 549));
  line(400, random(546, 549), 409, random(552, 555));
  line(409, random(552, 555), 405, random(564, 567));
  line(405, random(564, 567), 411, random(570, 573));
  line(411, random(570, 573), 405, random(573, 576));
  line(405, random(573, 576), 413, random(576, 579));
  line(413, random(576, 579), 411, random(592, 595));
  line(411, random(592, 595), 419, random( 594, 597));
  line(419, random(594, 597), 413, random(603, 606));
  line(413, random(603, 606), 425, random(607, 610));
  line(425, random(607, 610), 420, random(612, 615));
  line(420, random(612, 615), 434, random(618, 621));
  line(434, random(618, 621), 428, random(625, 628));
  line(428, random(625, 628), 436, random(629, 632));
  line(436, random(629, 632), random(429, 432), 640);
  
  
  
   //moving ellipses
  
  //large pink ellipse horizontal (x)
  noStroke();
  fill(171, 175, 201, 220);
  ellipse(x, 60, 200, 200);
  x = x + dx;
  if(x > 480){
    dx = -1;
  }
  if(x < 400){
    dx = 1;
  }
  
  //small ellipse horizontal (n)
  
  noStroke();
  fill(35, 160, 201, 80);
  ellipse(n, 200, 75, 75);
  n = n + dn;
  if(n > 470){
    dn = -1;
  }
  if(n < 430){
    dn = 1;
  }
  
  // large ellipse vertical (y)
  noStroke();
  fill(232, 203, 202, 100);
  ellipse(500, y, 300, 300);
  y = y + dy;
  if(y > 500){
    dy = -1;
  }
  if(y < 0){
    dy = 1;
  }
  
  // medium ellipse horizontal (m)
  noStroke();
  fill(84, 45, 87, 95);
  ellipse(m, 350, 170, 170);
  m = m +dm;
  if(m > 550){
    dm = -1;
  }
  if(m < 320){
    dm = 1;
  }
  
  // large ellipse vertical (s)
  noStroke();
  fill(125, 191, 210, 80);
  ellipse(100, s, 400, 400);
  s = s + ds;
  if(s > 700){
    ds = -1;
  }
  if(s < -50){
    ds = 1;
  }
  
  // medium ellipse horizontal (r)
  noStroke();
  fill(234, 181, 189, 75);
  ellipse(r, 460, 230, 230);
  r = r + dr;
  if(r > 430){
    dr = -1;
  }
  if(r < 85){
    dr = 1;
  }
  
  //medium ellipse vertical (w)
  noStroke();
  fill(9, 48, 93, 60);
  ellipse(w, 150, 180, 180);
  w = w + dw;
  if(w > 300){
    dw = -1;
  }
  if(w < -50){
    dw = 1;
  }
 
  // large ellipse vertical (t)
  noStroke();
  fill(91, 46, 86, 65);
  ellipse(20, t, 350, 350);
  t = t + dt;
  if(t > 330){
    dt = -1;
  }
  if(t < -80){
    dt = 1;
  }
  
  //medium ellipse vertical (h)
  noStroke();
  fill(110, 196, 228, 80);
  ellipse(300, h, 200, 200);
  h = h + dh;
  if(h > 500){
    dh = -1;
  }
  if(h < 100){
    dh = 1;
  }
  
  //medium ellipse horizontal (k)
  noStroke();
  fill(74, 89, 120, 90);
  ellipse(k, 480, 160, 160);
  k = k + dk;
  if(k > 310){
    dk = -1;
  }
  if(k < 0){
    dk = 1;
  }
  
  //small ellipse vertical (b)
  noStroke();
  fill(47, 50, 54, 70);
  ellipse(300, b, 95, 95);
  b = b + db;
  if(b > 400){
    db = -1;
  }
  if(b < 100){
    db = 1;
  }
  
  // small ellipse vertical (j)
  noStroke();
  fill(28, 86, 147, 100);
  ellipse(120, j, 70, 70);
  j = j + dj;
  if(j > 200){
    dj = -1;
  }
  if(j < -50){
    dj = 1;
  }
  
  //small ellipse horizontal (p)
  noStroke();
  fill(175, 159, 191, 100);
  ellipse(p, 555, 90, 90); 
  p = p + dp;
  if(p > 300){
    dp = -1;
  }
  if(p < -10){
    dp = 1;
  }
  
  // large ellipse horizontal (l)
  noStroke();
  fill(120, 96, 127, 80);
  ellipse(l, 650, 300, 300);
  l = l + dl;
  if(l < 40){
    dl = 1;
  }
  if(l > 500){
    dl = -1;
  }
  
 
}
  
  


