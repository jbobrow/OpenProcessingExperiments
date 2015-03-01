
float circleX;
float circleX2;

void setup(){
size(960, 640);
circleX = 10;
circleX2 = 800;

//SKY LEVEL
}

void draw(){
  background(#93D1FF);
//clouds
noStroke();
fill(#F2F2F2, 120);
ellipse(circleX2, 80, 400, 100 );
ellipse(circleX, 290, 600, 100 );

circleX=circleX+0.09;
circleX2=circleX2-0.1;

//END OF SKY LVL

//START OF BUILDING BLOCK 4

//BD 4 empire state building
//tip
rectMode(CORNER);
stroke(1);
strokeWeight(1);
fill(#5A5A5A);
rect(840, 55, 5, 60);
fill(#5A5A5A);
ellipse(843, 115, 23, 23);
fill(#5A5A5A);
ellipse(843, 127, 29, 29);
fill(#5A5A5A);
ellipse(843, 140, 35, 35);
fill(#5A5A5A);
ellipse(843, 155, 40, 40);

//head
rectMode(CORNER);
fill(#5A5A5A);
rect(818, 155, 50, 51);
//end of head

//body
rectMode(CORNER);
fill(#5A5A5A);
rect(815, 200, 57, 400);
//end of BB4 empire state building

//start of empire state deco.
line(820, 227, 872, 227);
line(820, 237, 872, 237);
line(820, 247, 872, 247);
line(820, 257, 872, 257);
line(820, 267, 872, 267);
line(820, 277, 872, 277);
line(820, 287, 872, 287);
line(820, 297, 872, 297);
line(820, 307, 872, 307);
line(820, 317, 872, 317);
line(820, 327, 872, 327);
line(820, 337, 872, 337);
//end of empire state deco

//BB4 small left to empire state building
rectMode(CORNER);
strokeWeight(1);
fill(#2E2E2E);
rect(750, 450, 70, 400);
//BB4 end of small left to empire state building

//BB4 building 3
rectMode(CORNER);
strokeWeight(3);
fill(#797979);
rect(812, 340, 70, 400);
//end of BB4 building 3

//start of BB4 building 3 deco.
line(820, 363, 860, 363);
line(820, 373, 860, 373);
line(820, 383, 860, 383);
line(820, 393, 860, 393);
line(820, 403, 860, 403);
line(820, 413, 860, 413);
line(820, 423, 860, 423);
line(820, 433, 860, 433);
line(820, 443, 860, 443);
line(820, 453, 860, 453);
line(820, 463, 860, 463);
line(820, 473, 860, 473);
line(820, 483, 860, 483);
line(820, 493, 860, 493);
line(820, 503, 860, 503);
line(820, 513, 860, 513);
line(820, 523, 860, 523);
line(820, 533, 860, 533);
line(820, 543, 860, 543);
line(820, 553, 860, 553);
line(820, 563, 860, 563);
line(820, 573, 860, 573);
line(820, 583, 860, 583);
line(820, 593, 860, 593);
line(820, 603, 860, 603);
//end of BB4 building 3 deco.

//start of BB4 second building
rectMode(CORNER);
strokeWeight(5);
fill(#989898);
rect(850, 282, 70, 400);
//end BB4 second building

//start of BB4 second building deco.
strokeWeight(3);
line(895, 282, 895, 600);
//end of BB4 second building deco.

//start of BB4 first building
rectMode(CORNER);
strokeWeight(8);
fill(#C6C6C6);
rect(887, 364, 80, 400);
//end of BB4 first building

//start of BB4 first building deco.
strokeWeight(1);
fill(#FAFAFA);
rect(900, 390, 200, 5);
rect(900, 400, 200, 5);
rect(900, 410, 200, 5);
rect(900, 420, 200, 5);
rect(900, 430, 200, 5);
rect(900, 440, 200, 5);
rect(900, 450, 200, 5);
rect(900, 460, 200, 5);
rect(900, 470, 200, 5);
rect(900, 480, 200, 5);
rect(900, 490, 200, 5);
rect(900, 500, 200, 5);
rect(900, 510, 200, 5);
rect(900, 520, 200, 5);
rect(900, 530, 200, 5);
rect(900, 540, 200, 5);
rect(900, 550, 200, 5);
rect(900, 560, 200, 5);
rect(900, 570, 200, 5);
rect(900, 580, 200, 5);
strokeWeight(3);
line(885, 375, 960, 375 );
line(885, 385, 960, 385 );
line(885, 405, 960, 405 );
//end of BB4 first building deco.

//END OF BUILDING BLOCK 4


//START OF BUILDING BLOCK 3

//back building
rectMode(CORNER);
strokeWeight(3);
fill(#797979);
rect(610, 345, 34, 300);
//end of back building

//start of back building deco.
strokeWeight(1);
line(610, 360, 650, 360);
line(610, 370, 650, 370);
line(610, 380, 650, 380 );
line(610, 390, 650, 390 );
line(610, 400, 650, 400 );
line(610, 410, 650, 410 );
line(610, 420, 650, 420 );
line(610, 430, 650, 430 );
line(610, 440, 650, 440 );
line(610, 450, 650, 450 );
line(610, 460, 650, 460 );
line(610, 470, 650, 470 );
line(610, 480, 650, 480 );
line(610, 490, 650, 490 );
line(610, 500, 650, 500 );
line(610, 510, 650, 510 );
line(610, 520, 650, 520 );
line(610, 530, 650, 530 );
line(610, 540, 650, 540 );
line(610, 550, 650, 550 );
line(610, 560, 650, 560 );
line(610, 570, 650, 570 );
line(610, 580, 650, 580 );
line(610, 590, 650, 590 );
line(610, 600, 650, 600 );
//end of back building deco.

///BB3 end of buidling 4
rectMode(CORNER);
strokeWeight(4);
fill(#989898);
rect(715, 282, 59, 300);
//BB3 end of buidling 4

//start of BB1 building 4 deco.
strokeWeight(2);
line(700, 300, 775, 300);
line(700, 320, 775, 320);
line(700, 340, 775, 340);
line(700, 360, 775, 360);
//end of BB3 building 4 deco.

//start of BB3 building 3
rectMode(CORNER);
strokeWeight(5);
fill(#A2A2A2);
rect(636, 251, 82, 327);
//end of BB3 building 3

//start of BB3 building 4 deco.
strokeWeight(1);
fill(255, 255, 255);
rect(645, 265, 65, 5);
rect(645, 275, 65, 5);
rect(645, 285, 65, 5);
rect(645, 295, 65, 5);
rect(645, 305, 65, 5);
rect(645, 315, 65, 5);
rect(645, 325, 65, 5);
rect(645, 335, 65, 5);
rect(645, 345, 65, 5);
rect(645, 355, 65, 5);
rect(645, 365, 65, 5);
strokeWeight(2);
line(655, 248, 655, 400);
line(665, 248, 665, 400);
line(675, 248, 675, 400);
line(685, 248, 685, 400);
line(695, 248, 695, 400);
line(705, 248, 705, 400);
//end of BB3 building 4 deco.

//BB3 second building
rectMode(CORNER);
strokeWeight(6);
fill(#BCBCBC);
rect(620, 375, 177, 400);
//BB3 end of second building

//BB3 start of deco.
strokeWeight(1);
fill(255, 255, 255);
rect(630, 380, 15, 200);
rect(660, 380, 15, 200);
rect(740, 380, 15, 200);
rect(770, 380, 15, 200);
strokeWeight(4);
line(620, 386, 795, 386);
line(620, 396, 795, 396);
line(620, 416, 795, 416);
//BB3 end of second building deco.

//BB3 front building
rectMode(CORNER);
strokeWeight(9);
fill(#E0E0E0);
rect(632, 467, 140, 120);
//end of BB3 front building

///start of BB3 front deco.
strokeWeight(1);
fill(255, 255, 255);
rect(651, 496, 100, 5);
rect(651, 506, 100, 5);
rect(651, 516, 100, 5);
rect(651, 526, 100, 5);
rect(651, 536, 100, 5);
rect(651, 546, 100, 5);
strokeWeight(3);
line(651, 490, 750, 490);
strokeWeight(2);
line(670, 482, 670, 600);
line(675, 482, 675, 600);
line(680, 482, 680, 600);
line(685, 482, 685, 600);
line(690, 482, 690, 600);
line(695, 482, 695, 600);
line(700, 482, 700, 600);
line(705, 482, 705, 600);
line(710, 482, 710, 600);
line(715, 482, 715, 600);
line(720, 482, 720, 600);
line(725, 482, 725, 600);
line(730, 482, 730, 600);
line(735, 482, 735, 600);
//end of BB3 front building deco

//END OF BB3


//START OF BB2

//BB2 6th building
rectMode(CORNER);
strokeWeight(1);
fill(#404040);
rect(160, 450, 110, 150);
//end of BB2 6th building

//BB2 5th building
rectMode(CORNER);
strokeWeight(1);
fill(#525252);
rect(500, 238, 72, 550);
//end of BB2 5th building

//BB2 4th building
rectMode(CORNER);
strokeWeight(2);
fill(#767575);
rect(473, 268, 80, 320);
//end of BB2 4th building

//BB2 3rd building
rectMode(CORNER);
strokeWeight(3);
fill(#8B8B8B);
rect(463, 286, 123, 300);
//end of BB2 3rd building

//start of BB2 3rd building deco. window
strokeWeight(1);
fill(#DEDEDE);
rect(470, 294, 110, 5);
rect(470, 304, 110, 5);
rect(470, 314, 110, 5);
rect(470, 324, 110, 5);
rect(470, 334, 110, 5);
rect(470, 344, 110, 5);
rect(470, 354, 110, 5);
rect(470, 364, 110, 5);
rect(470, 374, 110, 5);
rect(470, 384, 110, 5);
rect(470, 394, 110, 5);
rect(470, 404, 110, 5);
rect(470, 414, 110, 5);
rect(470, 424, 110, 5);
rect(470, 434, 110, 5);
rect(470, 444, 110, 5);
rect(470, 454, 110, 5);
rect(470, 464, 110, 5);
rect(470, 474, 110, 5);
rect(470, 484, 110, 5);
rect(470, 494, 110, 5);
rect(470, 504, 110, 5);
rect(470, 514, 110, 5);
rect(470, 524, 110, 5);
rect(470, 534, 110, 5);
rect(470, 544, 110, 5);
rect(470, 554, 110, 5);
rect(470, 564, 110, 5);
rect(470, 574, 110, 5);
rect(470, 584, 110, 5);
rect(470, 594, 110, 5);
rect(470, 604, 110, 5);
//end of BB2 3rd building deco. window

//BB2 4th building
rectMode(CORNER);
strokeWeight(4);
fill(#A2A2A2);
rect(483, 252, 73, 400);
//end of BB2 4th building

//start of BB2 4th building deco.
strokeWeight(1);
fill(255, 255, 255);
rect(490, 264, 5, 100);
rect(500, 264, 5, 100);
rect(510, 264, 5, 100);
rect(520, 264, 5, 100);
rect(530, 264, 5, 100);
rect(540, 264, 5, 100);
//end of BB2 4th building deco.


//BB2 last building
rectMode(CORNER);
fill(#5A5A5A);
strokeWeight(3);
rect(321, 228, 93, 400);
//BB end of last building

//BB2 start of last building deco.
strokeWeight(1);
fill(#C1C1C1);
rect(327, 258, 30, 5);
rect(327, 268, 30, 5);
rect(327, 278, 30, 5);
rect(327, 288, 30, 5);
rect(327, 298, 30, 5);
rect(327, 308, 30, 5);
rect(327, 318, 30, 5);
rect(327, 328, 30, 5);
rect(327, 338, 30, 5);
rect(327, 348, 30, 5);
//BB2 end of last building deco.

//BB2 start of second building
rectMode(CORNER);
fill(#7E7E7E);
strokeWeight(6);
rect(342, 251, 40, 400);
//end of BB2 2nd building 

//start of BB2 2nd building deco.
line(345, 270, 379, 270);
strokeWeight(1);
fill(#CECECE);
rect(350, 278, 30, 5);
rect(350, 288, 30, 5);
rect(350, 298, 30, 5);
rect(350, 308, 30, 5);
rect(350, 318, 30, 5);
rect(350, 328, 30, 5);
rect(350, 338, 30, 5);
rect(350, 348, 30, 5);
rect(350, 358, 30, 5);
rect(350, 368, 30, 5);
rect(350, 378, 30, 5);
rect(350, 388, 30, 5);
rect(350, 398, 30, 5);
rect(350, 408, 30, 5);
rect(350, 308, 30, 5);
rect(350, 418, 30, 5);
rect(350, 428, 30, 5);
rect(350, 438, 30, 5);
rect(350, 448, 30, 5);
rect(350, 458, 30, 5);
rect(350, 468, 30, 5);
rect(350, 478, 30, 5);
rect(350, 488, 30, 5);
rect(350, 498, 30, 5);
rect(350, 508, 30, 5);
rect(350, 518, 30, 5);
rect(350, 528, 30, 5);
rect(350, 538, 30, 5);
rect(350, 548, 30, 5);
rect(350, 558, 30, 5);
rect(350, 568, 30, 5);
rect(350, 578, 30, 5);
rect(350, 588, 30, 5);
rect(350, 598, 30, 5);

strokeWeight(3);
line(370, 270, 370, 600);
//end of BB2 2nd building deco.

//BB2 first building left
rectMode(CORNER);
fill(#BCBCBC);
strokeWeight(8);
rect(240, 356, 121, 250);
//end of BB2 first building left

//BB2 first left.2 building  deco.
rectMode(CORNER);
fill(#BCBCBC);
strokeWeight(7);
rect(278, 328, 45, 260);
strokeWeight(1);//vertical window
fill(255, 255, 255);
rect(248, 365, 4, 220);
rect(258, 365, 4, 220);
rect(268, 365, 4, 220);
strokeWeight(1);//vertical window
fill(255, 255, 255);
rect(328, 365, 4, 220);
rect(338, 365, 4, 220);
rect(348, 365, 4, 220);
strokeWeight(3);//horizontal window
line(280, 358, 325, 358);
strokeWeight(3);//horizontal 
line(280, 368, 325, 368);
line(280, 378, 325, 378);
line(280, 388, 325, 388);
line(280, 398, 325, 398);
line(280, 408, 325, 408);
line(280, 418, 325, 418);
line(280, 428, 325, 428);
line(280, 438, 325, 438);
line(280, 448, 325, 448);
line(280, 458, 325, 458);
line(280, 468, 325, 468);
line(280, 478, 325, 478);
line(280, 488, 325, 488);
line(280, 498, 325, 498);
line(280, 508, 325, 508);
line(280, 518, 325, 518);
line(280, 528, 325, 528);
line(280, 538, 325, 538);
line(280, 548, 325, 548);
line(280, 558, 325, 558);
line(280, 568, 325, 568);
line(280, 578, 325, 578);
line(280, 588, 325, 588);
line(280, 598, 325, 598);
//end of BD2 first left.2 deco.

//BB2 1rst right building
rectMode(CORNER);
fill(#E0E0E0);
strokeWeight(7);
rect(406, 343, 160, 241);
//end of BB2 1st right building

//start of BB2 1st building deco.
strokeWeight(1);//vertical window
fill(255, 255, 255);
rect(415, 370, 140, 4);
rect(415, 380, 140, 4);
rect(415, 390, 140, 4);
rect(415, 400, 140, 4);
rect(415, 410, 140, 4);
rect(415, 420, 140, 4);
rect(415, 430, 140, 4);
rect(415, 440, 140, 4);
rect(415, 450, 140, 4);
rect(415, 460, 140, 4);
rect(415, 470, 140, 4);
rect(415, 480, 140, 4);
rect(415, 490, 140, 4);
rect(415, 500, 140, 4);

rectMode(CORNER);
strokeWeight(5);
stroke(0, 0, 0);
fill(#A5A5A5);
rect(443, 345, 21, 189);
rect(509, 345, 21, 189);
//end of BB2 1st building deco.

//BB2 first building feet
rectMode(CORNER);
strokeWeight(7);
fill(#E0E0E0);
rect(406, 513, 160, 70);
//BB2 end of first buiding feet

//start of 1st deco.
strokeWeight(1);//vertical window
fill(255, 255, 255);
rect(415, 530, 140, 4);
rect(415, 540, 140, 4);
rect(415, 550, 140, 4);
rect(415, 560, 140, 4);
rect(415, 570, 140, 4);
rect(415, 520, 140, 4);
//end of 1st deco.



//END OF BUILDING BLOCK 2


//START OF BUILDING BLOCK 1

//BB1 fourth building ackground
rectMode(CORNER);
strokeWeight(2);
fill(#838282);
rect(117, 230, 110, 358);
//BB1 fourth building background

//BB1 fourth building deco.
strokeWeight(1);
line(117, 245, 225, 245 );
line(117, 255, 225, 255 );
line(117, 265, 225, 265 );
line(117, 275, 225, 275 );
line(117, 285, 225, 285 );
line(117, 295, 225, 295 );
line(117, 305, 225, 305 );
line(117, 315, 225, 315 );
line(117, 325, 225, 325 );
line(117, 335, 225, 335 );
line(117, 345, 225, 345 );
line(117, 355, 225, 355 );
line(117, 365, 225, 365 );
line(117, 375, 225, 375 );
line(117, 385, 225, 385 );
line(117, 395, 225, 395 );
line(117, 405, 225, 405 );
line(117, 415, 225, 415 );
line(117, 425, 225, 425 );
line(117, 435, 225, 435 );
line(117, 445, 225, 445 );
line(117, 455, 225, 455 );
line(117, 465, 225, 465 );
line(117, 475, 225, 475 );
line(117, 485, 225, 485 );
line(117, 495, 225, 495 );
line(117, 505, 225, 505 );
line(117, 515, 225, 515 );
line(117, 525, 225, 525 );
line(117, 535, 225, 535 );
line(117, 545, 225, 545 );
line(117, 555, 225, 555 );
line(117, 565, 225, 565 );
line(117, 575, 225, 575 );
line(117, 585, 225, 585 );
////end of BB1 fourth building deco.

//BB1 third building side right
rectMode(CORNER);
strokeWeight(5);
fill(#909090);
rect(80, 397, 118, 218);
//BB1 end of third building side right

//BB1 third building side right deco.
strokeWeight(2);
line(125, 410, 200, 410);
line(125, 420, 200, 420);
line(125, 430, 200, 430);
line(125, 440, 200, 440);
line(125, 450, 200, 450);
line(125, 460, 200, 460);
line(125, 470, 200, 470);
line(125, 480, 200, 480);
line(125, 490, 200, 490);
line(125, 500, 200, 500);
line(125, 510, 200, 510);
line(125, 520, 200, 520);
line(125, 530, 200, 530);
line(125, 540, 200, 540);
line(125, 550, 200, 550);
line(125, 560, 200, 560);
line(125, 570, 200, 570);
line(125, 580, 200, 580);
line(125, 590, 200, 590);
//BB1 end of third building right deco.

//BB1 third building side left
rectMode(CORNER);
strokeWeight(6);
fill(#9B9999);
rect(48, 380, 82, 397);
//BB1 end of third building side left

//BB1 third building side left decoration
strokeWeight(1);
fill(255, 255, 255);
rect(42, 390, 80, 5);
rect(42, 400, 80, 5);
rect(42, 410, 80, 5);
rect(42, 420, 80, 5);
rect(42, 430, 80, 5);
rect(42, 440, 80, 5);
rect(42, 450, 80, 5);
rect(42, 460, 80, 5);
rect(42, 470, 80, 5);
//BB1 end of third building sde left decoration

//BB1 second building
rectMode(CORNER);
strokeWeight(7);
fill(#BCBCBC);
rect(80, 311, 61, 294);
//BB1 end of second building

//BB1 second building secoration
strokeWeight(3);
line(80, 475, 140, 475 );
line(80, 465, 140, 465 );
line(80, 455, 140, 455 );
line(80, 445, 140, 445 );
line(80, 435, 140, 435 );
line(80, 425, 140, 425 );
line(80, 415, 140, 415 );
line(80, 405, 140, 405 );
line(80, 395, 140, 395 );
line(80, 385, 140, 385 );
line(80, 375, 140, 375 );
line(80, 365, 140, 365 );
line(80, 355, 140, 355 );
line(80, 345, 140, 345 );
line(80, 335, 140, 335 );
line(80, 325, 140, 325 );
//BB1 end of second building decoration

//BD1 first building
rectMode(CORNER);
strokeWeight(8);
fill(#E0E0E0);
rect(-10, 481, 147, 123);
//BB1 end of first buiding

//BB1 first building front decoration
strokeWeight(1);//window decoration
fill(255, 255, 255);
rect(5, 490, 110, 5);
rect(5, 500, 110, 5);
rect(5, 510, 110, 5);
rect(5, 520, 110, 5);
rect(5, 530, 110, 5);
rect(5, 540, 110, 5);
rect(5, 550, 110, 5);
rect(5, 560, 110, 5);
rect(5, 570, 110, 5);
strokeWeight(5);
line(10, 480, 10, 600);
line(33, 480, 33, 600);
line(53, 480, 53, 600);
line(76, 480, 76, 600);
strokeWeight(7);
line(120, 485, 120, 600);
//BB1 end of first building decoration

//END OF BUILDING BLOCK 1

//SEA LVL
rectMode(CORNER);
fill(#0097DB);
rect(-40, 584, 1200, 60);
//end of SEA LVL

//TREES
noStroke();
fill(#249D00, 120);
ellipse(630, 562, 40, 40);
ellipse(650, 562, 50, 50);
ellipse(690, 562, 55, 50);
ellipse(730, 562, 50, 50);
ellipse(760, 562, 50, 50);
ellipse(790, 562, 70, 70);
ellipse(380, 562, 40, 40);
//end of TREES

//BRIDGE LVL
stroke(#000000);
strokeWeight(6);
rectMode(CORNER);
fill(#EAEAEA);
rect(-40, 554, 1200, 15);
//end of BRIDGE LVL

//EARTH LVL
rectMode(CORNER);
fill(#EAEAEA);
rect(-40, 584, 1200,30);
//end of EARTH LVL

//GROUND LVL
rectMode(CORNER);
fill(#000000);
rect(-40, 604, 1200,3);
//end of GROUND LVL

}
