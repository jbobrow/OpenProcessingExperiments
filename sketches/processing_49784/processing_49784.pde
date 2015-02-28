
//Kelly Fadem assignment 1
//Keith Haring Friends

void setup(){

//gray background
size(1000, 800);
background(247, 247, 245);
smooth();

//sky blue background
beginShape();
  vertex(50, 50);
  strokeJoin(ROUND);
  vertex(50, 750);
  strokeJoin(ROUND);
  vertex(930, 750);
  strokeJoin(ROUND);
  vertex(950, 60);
  strokeJoin(ROUND);
  vertex(50, 50);
  stroke(29, 22, 18);
  strokeWeight(20);
  fill(137, 198, 213);
endShape();

//lavender background
beginShape();
  vertex(50, 640);
  strokeJoin(ROUND);
  vertex(930, 645);
  strokeJoin(ROUND);
  vertex(930, 750);
  strokeJoin(ROUND);
  vertex(50, 750);
  strokeJoin(ROUND);
  vertex(50, 640);
  stroke(29, 22, 18);
  strokeWeight(20);
  fill(179, 180, 219);
endShape();

//orange dude

//orange dude body
beginShape();
  vertex(545, 750);
  strokeJoin(ROUND);
  vertex(540, 615);
  strokeJoin(ROUND);
  vertex(605, 530);
  strokeJoin(ROUND);
  vertex(590, 470);
  strokeJoin(ROUND);
  vertex(585, 380);
  strokeJoin(ROUND);
  vertex(210, 460);
  strokeJoin(ROUND);
  vertex(180, 415);
  strokeJoin(ROUND);
  vertex(590, 305);
  strokeJoin(ROUND);
  vertex(760, 285);
  strokeJoin(ROUND);
  vertex(795, 295);
  strokeJoin(ROUND);
  vertex(880, 405);
  strokeJoin(ROUND);
  vertex(815, 530);
  strokeJoin(ROUND);
  vertex(730, 530);
  strokeJoin(ROUND);
  vertex(795, 420);
  strokeJoin(ROUND);
  vertex(745, 370);
  strokeJoin(ROUND);
  vertex(755, 540);
  strokeJoin(ROUND);
  vertex(695, 650);
  strokeJoin(ROUND);
  vertex(710, 745);
  strokeJoin(ROUND);
  vertex(625, 745);
  strokeJoin(ROUND);
  vertex(610, 635);
  strokeJoin(ROUND);
  vertex(670, 560);
  strokeJoin(ROUND);
  vertex(610, 635);
  strokeJoin(ROUND);
  vertex(625, 745);
  strokeJoin(ROUND);
  vertex(545, 750);
  stroke(29, 22, 18);
  strokeWeight(20);
  fill(243, 111, 63);
endShape();
//orange dude curves minus head
fill(243, 111, 63);
stroke(29, 22, 18);
strokeWeight(20);
bezier(605, 530, 585, 475, 585, 430, 590, 380);
bezier(748, 420, 760, 570, 755, 610, 690, 640);
bezier(820, 525, 845, 605, 675, 585, 755, 485);

//orange dude head
//bezier(610, 320, 480, 135, 850, 80, 740, 320);

//yellow dude
beginShape();
  vertex(320, 660);
  strokeJoin(ROUND);
  vertex(285, 750);
  strokeJoin(ROUND);
  vertex(370, 750);
  strokeJoin(ROUND);
  vertex(405, 620);
  strokeJoin(ROUND);
  vertex(345, 550);
  strokeJoin(ROUND);
  vertex(405, 620);
  strokeJoin(ROUND);
  vertex(370, 750);
  strokeJoin(ROUND);
  vertex(460, 750);
  strokeJoin(ROUND);
  vertex(480, 595);
  strokeJoin(ROUND);
  vertex(420, 510);
  strokeJoin(ROUND);
  vertex(430, 460);
  strokeJoin(ROUND);
  vertex(440, 355);
  strokeJoin(ROUND);
  vertex(580, 245);
  strokeJoin(ROUND);
  vertex(835, 305);
  strokeJoin(ROUND);
  vertex(860, 260);
  strokeJoin(ROUND);
  vertex(545, 180);
  strokeJoin(ROUND);
  vertex(415, 265);
  strokeJoin(ROUND);
  vertex(220, 295);
  strokeJoin(ROUND);
  vertex(100, 365);
  strokeJoin(ROUND);
  vertex(150, 625);
  strokeJoin(ROUND);
  vertex(215, 590);
  strokeJoin(ROUND);
  vertex(185, 420);
  strokeJoin(ROUND);
  vertex(235, 385);
  strokeJoin(ROUND);
  vertex(245, 500);
  strokeJoin(ROUND);
  vertex(255, 570);
  strokeJoin(ROUND);
  vertex(320, 660);
  stroke(29, 22, 18);
  strokeWeight(20);
  fill(250, 182, 55);
endShape();

//yellow dude curves
beginShape();
  fill(250, 182, 55);
  stroke(29, 22, 18);
  strokeWeight(20);
  bezier(250, 335, 115, 150, 505, 75, 400, 320);
  bezier(830, 252, 985, 280, 785, 415, 800, 300);
  bezier(145, 595, 50, 685, 240, 710, 212, 580);
  bezier(320, 650, 250, 585, 230, 535, 240, 385);
endShape();

//orange dude head
fill(243, 111, 63);
stroke(29, 22, 18);
strokeWeight(20);
bezier(610, 320, 480, 135, 850, 80, 740, 320);

//yay! lines
line(920, 185, 880, 210);
line(870, 160, 830, 190);
line(860, 100, 800, 160);
line(765, 90, 740, 130);
line(685, 95, 675, 120);
line(620, 95, 600, 140);
line(535, 110, 530, 145);
line(475, 100, 470, 165);
line(400, 100, 405, 135);
line(340, 90, 345, 120);
line(275, 105, 285, 130);
line(190, 100, 235, 160);
line(165, 174, 195, 190);
line(105, 200, 155, 245);
line(90, 270, 130, 290);

//woo! dots
//left
line(60, 665, 70, 665);
line(60, 715, 70, 715);
line(95, 670, 105, 670);
line(85, 695, 95, 695);
line(120, 700, 125, 700);
line(100, 730, 110, 730);
line(145, 685, 155, 685);
line(150, 710, 160, 710);
line(140, 735, 150, 735);
line(180, 685, 190, 685);
line(185, 720, 195, 720);
line(215, 665, 225, 665);
line(220, 300, 230, 300);
line(225, 725, 235, 725);
line(250, 675, 260, 675);
line(215, 700, 225, 700);
line(260, 710, 270, 710);
line(260, 735, 270, 735);
line(295, 675, 305, 675);
//center
line(485, 665, 495, 665);
line(520, 670, 540, 670);
line(495, 690, 505, 690);
line(475, 720, 485, 720);
line(520, 710, 530, 710);
line(505, 730, 515, 730);
//left
line(710, 660, 720, 660);
line(720, 715, 730, 715);
line(730, 685, 740, 685);
line(750, 660, 760, 660);
line(760, 705, 770, 705);
line(780, 670, 790, 670);
line(780, 730, 790, 730);
line(800, 705, 810, 705);
line(820, 650, 830, 650);
line(835, 675, 845, 675);
line(845, 700, 855, 700);
line(830, 735, 840, 735);
line(885, 735, 895, 735);
line(880, 650, 890, 650);
line(880, 680, 890, 680);
line(900, 700, 910, 700);
line(925, 660, 925, 660);
line(925, 725, 930, 725);
}

