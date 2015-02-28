
/*
 Konkuk University
 SOS iDesign

Name: PARK Hyebin <<------ Write your full name here!
 ID: 201420081 <<--------- Write your ID here!

*/

PImage img;

void setup(){
size (600, 600);
background(255, 255, 192);
 // noLoop();
smooth();
colorMode (RGB, 600);
 }

void draw(){
println(mouseX + " : " + mouseY);

//line
strokeWeight(2);
line(479, 589, 492, 599);
line(479, 589, 516, 558);
line(516, 558, 540, 575);
line(540, 575, 514, 599);

noFill();
quad(516, 558, 540, 575, 591, 532, 565, 520);
fill(600, 0, 0);
triangle(565, 520, 591, 532, 599, 521);

strokeWeight(2);
line(575, 514, 591, 497);
line(591, 497, 598, 499);
line(591, 497, 598, 489);

line(417, 599, 455, 573);
line(455, 573, 492, 599);
noFill();
quad(455, 573, 477, 589, 516, 559, 492, 544);
noFill();
quad(492, 544, 516, 559, 562, 522, 540, 510);
noFill();
quad(540, 510, 562, 522, 591, 498, 567, 488);

strokeWeight(2);
line(567, 488, 591, 498);
line(591, 498, 598, 491);
line(567, 488, 591, 472);
line(591, 472, 599, 477);



//Red line
strokeWeight(4);
stroke(240, 0, 0);
line(493, 579, 599, 555);


//line
stroke(0, 0 ,0);
strokeWeight(5);
line(546, 38, 545, 279);

strokeWeight(2);
line(476, 50, 599, 92);

strokeWeight(1);
line(497, 126, 597, 125);

strokeWeight(2);
line(507, 142, 599, 142);

strokeWeight(1);
line(546, 191, 599, 227);

strokeWeight(1);
line(275, 398, 546, 191);

strokeWeight(1);
line(143, 406, 580, 318);


strokeWeight(5);
line(509, 526, 599, 514);


//quad
strokeWeight(2);
fill(0, 0, 0);
quad(191, 516, 181, 522, 352, 599, 398, 599);

fill(0, 0, 600);
quad(401, 599, 424, 598, 454, 573, 438, 562);
fill(0, 0, 0);
quad(438, 562, 454, 573, 492, 544, 468, 530);
noFill();
quad(468, 530, 492, 544, 540, 511, 500, 496);
fill(0, 0, 255);
quad(500, 496, 540, 511, 567, 490, 526, 469);
noFill();
quad(526, 469, 567, 490, 592, 473, 548, 443);
fill(0, 0, 0);
quad(548, 443, 592, 473, 598, 467, 560, 425);
noFill();
quad(560, 425, 598, 467, 598, 424, 577, 408);
fill(0, 0, 0);
triangle(577, 408, 598, 424, 599, 380);

strokeWeight(2);
fill(152, 0, 0);
quad(345, 576, 401, 599, 436, 562, 377, 518);
noFill();
quad(377, 518, 436, 562, 467, 531, 393, 487);
fill(71, 102, 0);
quad(393, 487, 467, 531, 500, 498, 411, 461);
noFill();
quad(411, 461, 500, 498, 527, 473, 430, 423);
fill(0, 0, 0);
quad(430, 423, 527, 473, 547, 445, 457, 376);
stroke(0, 0, 0);
line(542, 575, 599, 575);

//ellipse
fill(500, 0, 0);
ellipse(303, 269, 120, 120);
fill(0, 0, 0);
ellipse(171, 135, 358, 358);
fill(232, 0, 255);
ellipse(171, 135, 182, 182);

//bezier
fill(225, 228, 0);
bezier(73, 600, 73, 549, 192, 548, 193, 600);
noFill();
strokeWeight(9);
bezier(198, 398, 194, 404, 221, 445, 244, 441);
bezier(198, 398, 183, 355, 276, 362, 285, 376);
bezier(285, 376, 296, 393, 390, 377, 386, 357);
strokeWeight(5);
bezier(386, 357, 378, 324, 486, 297, 494, 328);
strokeWeight(3);
bezier(494, 328, 499, 348, 597, 327, 597, 313);


















}

