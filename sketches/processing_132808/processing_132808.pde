
int xPos;
int yPos;

//Size and background color
void setup () {
size(800, 800);
background(200);
}

void draw () {
//none of the shapes will have strokes
noStroke();

//dark grey shapes top to bottom
fill(150, 200);
rect(380, 0, 400, 170);
rect(0, 160, 200, 450);
rect(380, 620, 500, 40);
rect(250, 420, 300, 500);
quad(540, 280, 600, 280, 840, 420, 790, 420);

//darker grey shapes top to bottom
fill(100, 200);
rect(0, 245, 400, 100);

//darkest grey shapes top to bottom
fill(50, 200);
rect(70, 0, 70, 150);
rect(300, 0, 40, 300);
rect(490, 50, 100, 270);
rect(0, 440, 500, 50);
rect(700, 300, 100, 300);
rect(0, 650, 800, 30);

//Pink box at bottom
fill(206, 79, 177, 200);
rect(0, 550, 800, 800);

//black shapes
fill(0);
quad(0, 0, 125, 175, 100, 175, 0, 35);
quad(25, 0, 50, 0, 175, 175, 150, 175);
rect(0, 650, 225, 40);
quad(150, 650, 225, 650, 325, 725, 250, 725);
rect(350, 550, 450, 50);
quad(500, 700, 525, 700, 600, 800, 575, 800);
quad(575, 700, 600, 700, 675, 800, 650, 800);
quad(300, 230, 340, 230, 220, 375, 180, 375);
rect(750, 0, 40, 300);

//purple shapes
fill(170, 14, 136, 200);
rect(0, 250, 450, 25);
rect(0, 600, 300, 25);
rect(500, 250, 250, 100);
rect(560, 750, 240, 30);

//orange shapes
fill(252, 91, 15, 200);
rect(0, 0, 200, 100);
rect(225, 0, 275, 95);
rect(540, 0, 750, 80);
rect(575, 125, 225, 100);
rect(175, 400, 225, 100);
rect(425, 400, 175, 80);
rect(645, 400, 155, 75);
rect(0, 525, 100, 100);
rect(460, 525, 150, 100);
rect(640, 525, 160, 110);
quad(350, 700, 475, 700, 550, 800, 350, 800);

//yellow shapes
fill(255, 230, 23, 150);
rect(160, 150, 175, 80);
rect(350, 125, 200, 100);
rect(650, 0, 50, 300);
rect(375, 325, 175, 100);
rect(0, 400, 150, 100);
rect(0, 700, 150, 75);
rect(175, 700, 150, 125);

//light pink shapes
fill(245, 119, 186, 200);
rect(450, 675, 150, 125);
rect(620, 650, 155, 150);
rect(80, 300, 150, 75);


//LINES-------------------------------------------------------
//set the stroke of all lines
strokeWeight(3);

//vertical yellow lines top
stroke(255, 230, 23, 150);
line(170, 146-yPos, 170, 245+yPos);
line(180, 143-yPos, 182, 240+yPos);
line(196, 144-yPos, 196, 240+yPos);
line(205, 138-yPos, 205, 238+yPos);
line(212, 144-yPos, 212, 245+yPos);
line(225, 143-yPos, 225, 238+yPos);
line(235, 146-yPos, 234, 240+yPos);
line(244, 144-yPos, 243, 244+yPos);
line(256, 138-yPos, 256, 240+yPos);
line(267, 143-yPos, 267, 245+yPos);
line(277, 144-yPos, 279, 242+yPos);
line(285, 146-yPos, 285, 240+yPos);
line(295, 138-yPos, 295, 243+yPos);
line(304, 143-yPos, 304, 238+yPos);
line(315, 146-yPos, 313, 240+yPos);
line(326, 138-yPos, 326, 243+yPos);
line(358, 120-yPos, 358, 238+yPos);
line(367, 118-yPos, 367, 234+yPos);
line(376, 120-yPos, 377, 235+yPos);
line(385, 117-yPos, 385, 243+yPos);
line(395, 120-yPos, 394, 238+yPos);
line(406, 119-yPos, 406, 240+yPos);
line(417, 117-yPos, 417, 235+yPos);
line(426, 118-yPos, 425, 240+yPos);
line(435, 120-yPos, 435, 238+yPos);
line(444, 119-yPos, 444, 232+yPos);
line(455, 115-yPos, 457, 238+yPos);
line(465, 120-yPos, 465, 240+yPos);
line(476, 117-yPos, 476, 235+yPos);
line(485, 118-yPos, 485, 238+yPos);
line(498, 120-yPos, 496, 240+yPos);
line(505, 117-yPos, 508, 235+yPos);
line(516, 116-yPos, 516, 235+yPos);
line(527, 120-yPos, 528, 240+yPos);
line(535, 119-yPos, 535, 238+yPos);
line(545, 120-yPos, 545, 235+yPos);

line(580, 0, 580, 235+yPos);
line(591, 0, 588, 280+yPos);
line(604, 0, 600, 260+yPos);
line(612, 0, 610, 310+yPos);
line(618, 0, 620, 280+yPos);
line(630, 0, 628, 290+yPos);
line(638, 0, 642, 305+yPos);

line(710, 0, 712, 295+yPos);
line(721, 0, 719, 315+yPos);
line(728, 0, 730, 280+yPos);
line(740, 0, 738, 287+yPos);
line(748, 0, 749, 260+yPos);
line(760, 0, 758, 275+yPos);
line(767, 0, 768, 285+yPos);
line(780, 0, 778, 240+yPos);
line(789, 0, 794, 260+yPos);

//hoizontal yellow lines top
line(140-xPos, 160, 553+xPos, 158);
line(146-xPos, 170, 560+xPos, 170);
line(148-xPos, 180, 562+xPos, 183);
line(145-xPos, 192, 560+xPos, 196);
line(150-xPos, 200, 557+xPos, 201);
line(148-xPos, 210, 560+xPos, 210);
line(145-xPos, 222, 557+xPos, 222);

//vertical yellow lines middle
line(100, 387-yPos, 104, 570);
line(110, 390-yPos, 112, 557);
line(124, 389-yPos, 120, 530);
line(130, 386-yPos, 130, 510);
line(142, 391-yPos, 140, 508);

//horizontal yellow lines middle
line(0, 410, 155+xPos, 410);
line(0, 420, 156+xPos, 418);
line(0, 429, 170+xPos, 430);
line(0, 442, 155+xPos, 442);
line(0, 450, 153+xPos, 453);
line(0, 463, 159+xPos, 460);
line(0, 470, 162+xPos, 472);
line(0, 479, 155+xPos, 481);
line(0, 490, 160+xPos, 493);

//vertical yellow lines bottom left
stroke(255, 230, 23, 200);
line(10, 390-yPos, 10, 800);
line(20, 387-yPos, 20, 795+yPos);
line(28, 392-yPos, 30, 800);
line(42, 388-yPos, 42, 780+yPos);
line(55, 393-yPos, 57, 790+yPos);
line(70, 386-yPos, 70, 795+yPos);
line(77, 390-yPos, 76, 790+yPos);
line(85, 393-yPos, 85, 790+yPos);
line(93, 390-yPos, 95, 792+yPos);
line(103, 682-yPos, 103, 790+yPos);
line(115, 685-yPos, 115, 795+yPos);
line(126, 687-yPos, 128, 792+yPos);
line(135, 682-yPos, 135, 780+yPos);
line(143, 690-yPos, 143, 785+yPos);

//vertical yellow lines second bottom left
line(180, 688-yPos, 182, 800);
line(190, 685-yPos, 190, 800);
line(204, 682-yPos, 203, 800);
line(215, 690-yPos, 215, 800);
line(226, 688-yPos, 226, 800);
line(235, 682-yPos, 235, 800);
line(246, 687-yPos, 246, 800);
line(256, 688-yPos, 253, 800);
line(265, 682-yPos, 265, 800);
line(277, 690-yPos, 275, 800);
line(283, 685-yPos, 283, 800);
line(295, 688-yPos, 294, 800);
line(303, 683-yPos, 303, 800);
line(310, 684-yPos, 310, 800);
line(320, 688-yPos, 320, 800);

//horizontal yellow lines bottom left
line(0, 705, 330+xPos, 705);
line(0, 715, 337+xPos, 717);
line(0, 725, 345+xPos, 725);
line(0, 736, 330+xPos, 736);
line(0, 742, 336+xPos, 744);
line(0, 755, 333+xPos, 755);
line(0, 764, 345+xPos, 764);
line(0, 772, 356+xPos, 772);
line(125, 780, 336+xPos, 780);
line(170, 790, 342+xPos, 793);

//top horizontal orange lines
stroke(252, 91, 15, 170);
line(0, 17, 670+xPos, 20);
line(0, 28, 600+xPos, 29);
line(0, 39, 650+xPos, 38);
line(0, 44, 500+xPos, 47);
line(0, 58, 600+xPos, 58);
line(0, 65, 520+xPos, 64);
line(0, 75, 510+xPos, 77);
line(0, 83, 513+xPos, 83);

//top vertical orange lines
line(15, 0, 15, 112+yPos);
line(26, 0, 26, 110+yPos);
line(38, 0, 40, 105+yPos);
line(45, 0, 45, 110+yPos);
line(56, 0, 57, 108+yPos);
line(66, 0, 66, 111+yPos);
line(75, 0, 78, 105+yPos);
line(87, 0, 85, 109+yPos);
line(95, 0, 96, 107+yPos);
line(105, 0, 105, 111+yPos);
line(115, 0, 113, 108+yPos);
line(124, 0, 125, 110+yPos);
line(135, 0, 137, 107+yPos);
line(146, 0, 146, 113+yPos);
line(155, 0, 154, 108+yPos);
line(167, 0, 165, 110+yPos);
line(175, 0, 178, 104+yPos);
line(184, 0, 184, 108+yPos);

//middle vertical orange lines
line(185, 390-yPos, 184, 510+yPos);
line(196, 392-yPos, 196, 507+yPos);
line(205, 390-yPos, 205, 510+yPos);
line(217, 388-yPos, 218, 508+yPos);
line(225, 391-yPos, 225, 510+yPos);
line(234, 390-yPos, 233, 506+yPos);
line(245, 387-yPos, 245, 508+yPos);
line(254, 391-yPos, 255, 510+yPos);
line(265, 390-yPos, 267, 507+yPos);
line(275, 385-yPos, 277, 508+yPos);
line(288, 390-yPos, 285, 506+yPos);
line(295, 387-yPos, 295, 510+yPos);
line(304, 388-yPos, 305, 507+yPos);
line(315, 387-yPos, 315, 508+yPos);
line(324, 391-yPos, 325, 510+yPos);
line(335, 390-yPos, 337, 507+yPos);
line(345, 385-yPos, 347, 508+yPos);
line(355, 390-yPos, 357, 507+yPos);
line(365, 385-yPos, 367, 508+yPos);
line(378, 390-yPos, 375, 506+yPos);
line(385, 387-yPos, 385, 510+yPos);

//middle horizontal orange lines
line(165, 410, 800, 413);
line(164, 423, 800, 420);
line(166, 430, 800, 429);
line(163, 440, 800, 441);
line(165, 451, 800, 451);
line(167, 460, 800, 462);
line(163, 473, 800, 470);
line(165, 480, 430, 482);

//bottom vertical orange lines
line(650, 390-yPos, 650, 650+yPos);
line(663, 380-yPos, 660, 645+yPos);
line(670, 387-yPos, 670, 642+yPos);
line(678, 395-yPos, 679, 640+yPos);
line(687, 382-yPos, 687, 641+yPos);
line(695, 390-yPos, 695, 645+yPos);
line(706, 393-yPos, 708, 650+yPos);
line(716, 380-yPos, 716, 642+yPos);
line(725, 387-yPos, 725, 645+yPos);
line(736, 391-yPos, 738, 650+yPos);
line(746, 384-yPos, 746, 642+yPos);
line(758, 390-yPos, 758, 640+yPos);
line(765, 388-yPos, 767, 644+yPos);
line(775, 392-yPos, 778, 641+yPos);
line(783, 386-yPos, 784, 640+yPos);
line(794, 390-yPos, 794, 645+yPos);

//bottom horizontal orange lines
line(435-xPos, 540, 800, 540);
line(450-xPos, 551, 800, 550);
line(447-xPos, 560, 800, 560);
line(443-xPos, 570, 800, 568);
line(453-xPos, 583, 800, 582);
line(448-xPos, 590, 800, 590);
line(451-xPos, 599, 800, 600);
line(438-xPos, 610, 800, 610);
line(453-xPos, 620, 800, 622);

//horizontal purple lines
stroke(170, 14, 136, 150);
line(0, 590, 320+xPos, 589);
line(0, 580, 300+xPos, 580);
line(0, 567, 305+xPos, 569);

//vertical purple lines
line(680, 658-yPos, 683, 800);
line(689, 650-yPos, 692, 800);
line(700, 656-yPos, 702, 800);
line(710, 660-yPos, 710, 800);
line(718, 664-yPos, 720, 800);
line(730, 666-yPos, 730, 800);
line(740, 658-yPos, 738, 800);

//grey lines top to bottom
stroke(230, 150);
line(0, 285, 490+xPos, 283);
line(0, 293, 440+xPos, 295);
line(0, 305, 460+xPos, 300);
line(0, 315, 470+xPos, 315);
line(0, 328, 430+xPos, 330);
line(330-xPos, 340, 690+xPos, 339);
line(360-xPos, 353, 730+xPos, 355);
line(355-xPos, 366, 800, 364);
line(345-xPos, 375, 760+xPos, 378);

line(500-xPos, 700, 800, 700);
line(480-xPos, 705, 800, 709);
line(485-xPos, 720, 800, 718);
line(470-xPos, 732, 800, 732);
line(500-xPos, 740, 800, 738);
line(473-xPos, 751, 800, 748);
line(490-xPos, 760, 800, 759);
line(500-xPos, 768, 800, 770);
line(485-xPos, 780, 800, 778);
line(495-xPos, 791, 800, 788);

xPos++;
yPos++;

}

/* 
The artist I chose was Juju Sun. I attempted to reflect her style
through the use of color, and the orientation of lines and rectangles 
to create horizontal movement seen in Sun's abstract paintings. I also
used transparency and linework to attempt to reference her use of 
texture. 
*/


