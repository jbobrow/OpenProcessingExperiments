
//"After Juju Sun" © Mackenzie Gillett 2014

Maxim maxim; //create maxim object
AudioPlayer player; //create audio channel
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;
AudioPlayer player5;
AudioPlayer player6;
AudioPlayer player7;
AudioPlayer player8;
AudioPlayer player9;
AudioPlayer player10; 
AudioPlayer player11;
AudioPlayer player12;
AudioPlayer player13;
AudioPlayer player14;
AudioPlayer player15;
AudioPlayer player16;
AudioPlayer player17;
AudioPlayer player18;
AudioPlayer player19;
AudioPlayer player20;

//BOOLEANS THAT ALLOW LINES TO MOVE IF USER TOUCHES THEM (start false= lines are not moving until mouse is in correct area)
boolean orangeHorMove=false; //top left orange lines horizontal
boolean orangeMove= false; //top left orange lines vertical
boolean yellowTopLeftMove= false; //top left vertical yellow lines
boolean yellowTopLeftHorMove= false; //top left horizontal yellow lines
boolean yellowTopRightMove=false; //top middle yellow lines
boolean yellowTopVertMove=false; //top right yellow lines
boolean whiteTopMove=false; //top white lines
boolean orangeMiddleMove=false; //middle orange lines
boolean yellowMiddleMove=false; //middle yellow lines
boolean orangeLongMiddleMove=false; //longer middle orange lines
boolean orangeBottomMove=false; //bottom right orange lines vertical
boolean orangeBottomHorMove=false; //bottom orange horizontal lines
boolean yellowLeftBottomMove=false; //bottom left yellow lines vertical
boolean yellowBottomLeftHor=false; //bottom left yellow lines horizontal
boolean yellowBottomMove= false; //bottom right yellow lines vertical
boolean purpleMoveHor=false; //horizontal purple lines
boolean purpleMove=false; //bottom purple lines 
boolean whiteBottomMove=false; //bottom white lines

//BOOLEANS THAT DETERMINE WHETHER THE LINES HAVE WRAPPED AROUND THE SCREEN
boolean wrapped=false; //top left horizontal orange
boolean orangeWrap2=false; //top left vertical orange
boolean yellowWrap=false; //top left vertical yellow
boolean yellowWrap2=false; //top left horizontal yellow
boolean yellowWrap3=false; //top right vertical yellow
boolean yellowWrap4=false; //top far right vertical yellow
boolean whiteWrap=false; //middle white
boolean orangeWrap3=false; //middle left vertical orange
boolean orangeWrap4=false; //middle long orange
boolean yellowWrap5=false; //middle horizontal yellow
boolean orangeWrap5=false; //bottom vertical orange
boolean orangeWrap6=false; //bottom horizontal orange
boolean yellowWrap6=false; //bottom vertical yellow
boolean yellowWrap7=false; //bottom horizontal yellow
boolean yellowWrap8=false; //bottom right vertical yellow
boolean purpleWrap=false; //left purple
boolean purpleWrap2=false; //bottom purple
boolean whiteWrap2=false; //bottom white



//VARIABLES FOR LINE POSITIONS
//top left orange rect horizontal
int orangeHorX=0; 
//top left orange rectangle LOOP
int y= 0;          //horizontal location of each line
int spacing= 10;   //space between lines
int len= 110;      //length of each line 
//top left yellow rectangle
int yellowVert1X= 170;
int yellowVert1Y= 146;
int yellowHor1X= 140;
int yellowHor1Y= 160;
//top right yellow rectangle
int yellowVert2Y=120;
//top right vertical lines
int yellowTopVert=0;
//top white lines
int white1X= 0;
//middle left orange rectangle
int orangeVert1Y= 390;
//middle long orange hor lines
int orange2X=800;
//middle yellow lines
int yellowMiddle=0;
//bottom right orange rect
int orangeVert2Y= 390;
//bottom orange hor lines
int orangeBottom=800;
//bottom left yellow lines vertical
int yellowVert4Y=800;
//bottom left yellow lines horizontal
int yellowHor2X=0;
//bottom right yellow rect vertical
int yellowVert3Y= 800;
//horizontal purple lines
int purpleHorX=0;
//purple lines bottom right
int purpleVertY= 800;
//white lines bottom right
int white2X= 500;




void setup () {
  size(800, 800);
   //Sound:
  maxim = new Maxim(this); //creates new Maxim object, only need one per project
  player = maxim.loadFile("note1.mp3"); //load audio file into audio channel
  
  player2 = maxim.loadFile("note2.mp3");
  player3 = maxim.loadFile("note3.mp3");
  player4 = maxim.loadFile("note4.mp3");
  player5 = maxim.loadFile("note5.mp3");
  player6 = maxim.loadFile("note6.mp3");
  player7 = maxim.loadFile("note7.mp3");
  player8 = maxim.loadFile("note8.mp3");
  player9 = maxim.loadFile("note9.mp3");
  player10 = maxim.loadFile("note10.mp3"); 
  player11 = maxim.loadFile("note11.mp3"); 
  player12 = maxim.loadFile("note10.mp3"); 
  player13 = maxim.loadFile("note9.mp3"); 
  player14 = maxim.loadFile("note8.mp3"); 
  player15 = maxim.loadFile("note7.mp3"); 
  player16 = maxim.loadFile("note6.mp3"); 
  player17 = maxim.loadFile("note5.mp3"); 
  player18 = maxim.loadFile("note4.mp3"); 
  /*player19 = maxim.loadFile("note10.mp3"); 
  player20 = maxim.loadFile("note10.mp3"); */
  player.setLooping(false); //the audio file will NOT loop
  player2.setLooping(false);
  player3.setLooping(false);
  player4.setLooping(false);
  player5.setLooping(false);
  player6.setLooping(false); 
  player7.setLooping(false);
  player8.setLooping(false);
  player9.setLooping(false);
  player10.setLooping(false); 
  player11.setLooping(false); 
  player12.setLooping(false); 
  player13.setLooping(false); 
  player14.setLooping(false); 
  player15.setLooping(false); 
  player16.setLooping(false); 
  player17.setLooping(false); 
  player18.setLooping(false); 
  /*player19.setLooping(false); 
  player20.setLooping(false); */
}


void draw () {
  background(200);

  //SHAPES--------------------------------------------------------------------------------
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

  //LINES---------------------------------------------------------------------------------
  //set the stroke of all lines
  strokeWeight(3);

  //FIRST YELLOW RECTANGLE
  //verticals
  stroke(255, 230, 23, 200);
  line(yellowVert1X, yellowVert1Y, yellowVert1X, yellowVert1Y+99);
  line(yellowVert1X+10, yellowVert1Y-3, yellowVert1X+12, yellowVert1Y+94);
  line(yellowVert1X+26, yellowVert1Y-2, yellowVert1X+26, yellowVert1Y+94);
  line(yellowVert1X+35, yellowVert1Y-8, yellowVert1X+35, yellowVert1Y+92);
  line(yellowVert1X+42, yellowVert1Y-2, yellowVert1X+42, yellowVert1Y+99);
  line(yellowVert1X+55, yellowVert1Y-3, yellowVert1X+55, yellowVert1Y+92);
  line(yellowVert1X+65, yellowVert1Y, yellowVert1X+64, yellowVert1Y+94);
  line(yellowVert1X+74, yellowVert1Y-2, yellowVert1X+73, yellowVert1Y+99);
  line(yellowVert1X+86, yellowVert1Y-8, yellowVert1X+86, yellowVert1Y+94);
  line(yellowVert1X+97, yellowVert1Y-3, yellowVert1X+97, yellowVert1Y+99);
  line(yellowVert1X+107, yellowVert1Y-2, yellowVert1X+109, yellowVert1Y+102);
  line(yellowVert1X+115, yellowVert1Y, yellowVert1X+115, yellowVert1Y+94);
  line(yellowVert1X+125, yellowVert1Y-8, yellowVert1X+125, yellowVert1Y+98);
  line(yellowVert1X+134, yellowVert1Y-3, yellowVert1X+134, yellowVert1Y+92);
  line(yellowVert1X+145, yellowVert1Y, yellowVert1X+146, yellowVert1Y+94);
  line(yellowVert1X+156, yellowVert1Y-8, yellowVert1X+154, yellowVert1Y+98);
  //hoizontals
  line(yellowHor1X, yellowHor1Y, yellowHor1X+413, 158);
  line(yellowHor1X+6, yellowHor1Y+10, yellowHor1X+420, yellowHor1Y+10);
  line(yellowHor1X+8, yellowHor1Y+20, yellowHor1X+422, yellowHor1Y+23);
  line(yellowHor1X+5, yellowHor1Y+32, yellowHor1X+420, yellowHor1Y+36);
  line(yellowHor1X+10, yellowHor1Y+40, yellowHor1X+417, yellowHor1Y+41);
  line(yellowHor1X+8, yellowHor1Y+50, yellowHor1X+420, yellowHor1Y+50);
  line(yellowHor1X+5, yellowHor1Y+62, yellowHor1X+417, yellowHor1Y+62);

  //SECOND YELLOW RECTANGLE 
  line(358, yellowVert2Y, 358, yellowVert2Y+118);
  line(367, yellowVert2Y+2, 367, yellowVert2Y+114);
  line(376, yellowVert2Y, 377, yellowVert2Y+115);
  line(385, yellowVert2Y-3, 385, yellowVert2Y+123);
  line(395, yellowVert2Y, 394, yellowVert2Y+118);
  line(406, yellowVert2Y-1, 406, yellowVert2Y+120);
  line(417, yellowVert2Y-3, 417, yellowVert2Y+115);
  line(426, yellowVert2Y-2, 425, yellowVert2Y+120);
  line(435, yellowVert2Y, 435, yellowVert2Y+118);
  line(444, yellowVert2Y-1, 444, yellowVert2Y+116);
  line(455, yellowVert2Y-5, 457, yellowVert2Y+118);
  line(465, yellowVert2Y, 465, yellowVert2Y+120);
  line(476, yellowVert2Y-3, 476, yellowVert2Y+115);
  line(485, yellowVert2Y-2, 485, yellowVert2Y+118);
  line(498, yellowVert2Y, 496, yellowVert2Y+120);
  line(505, yellowVert2Y-3, 508, yellowVert2Y+115);
  line(516, yellowVert2Y-4, 516, yellowVert2Y+115);
  line(527, yellowVert2Y, 528, yellowVert2Y+120);
  line(535, yellowVert2Y-1, 535, yellowVert2Y+118);
  line(545, yellowVert2Y, 545, yellowVert2Y+115);


  //Vertical Yellow Lines Top Right
  line(580, yellowTopVert-10, 580, yellowTopVert+235);
  line(591, yellowTopVert-5, 588, yellowTopVert+280);
  line(604, yellowTopVert-20, 600, yellowTopVert+260);
  line(612, yellowTopVert, 610, yellowTopVert+310);
  line(618, yellowTopVert-15, 620, yellowTopVert+280);
  line(630, yellowTopVert-8, 628, yellowTopVert+290);
  line(638, yellowTopVert-12, 642, yellowTopVert+305);

  line(710, yellowTopVert, 712, yellowTopVert+295);
  line(721, yellowTopVert-10, 719, yellowTopVert+315);
  line(728, yellowTopVert-16, 730, yellowTopVert+280);
  line(740, yellowTopVert-10, 738, yellowTopVert+287);
  line(748, yellowTopVert-18, 749, yellowTopVert+260);
  line(760, yellowTopVert, 758, yellowTopVert+275);
  line(767, yellowTopVert-20, 768, yellowTopVert+285);
  line(780, yellowTopVert-15, 778, yellowTopVert+240);
  line(789, yellowTopVert-10, 794, yellowTopVert+260);

  //horizontal yellow lines middle
  line(yellowMiddle-10, 410, yellowMiddle+155, 410);
  line(yellowMiddle-5, 420, yellowMiddle+156, 418);
  line(yellowMiddle, 429, yellowMiddle+170, 430);
  line(yellowMiddle-12, 442, yellowMiddle+155, 442);
  line(yellowMiddle-8, 450, yellowMiddle+153, 453);
  line(yellowMiddle-6, 463, yellowMiddle+159, 460);
  line(yellowMiddle, 470, yellowMiddle+162, 472);
  line(yellowMiddle-10, 479, yellowMiddle+155, 481);
  line(yellowMiddle-14, 490, yellowMiddle+160, 493);

  //vertical yellow lines bottom left
  stroke(255, 230, 23, 200);
  line(10, yellowVert4Y-410, 10, yellowVert4Y);
  line(20, yellowVert4Y-413, 20, yellowVert4Y-5);
  line(28, yellowVert4Y-408, 30, yellowVert4Y);
  line(42, yellowVert4Y-412, 42, yellowVert4Y-20);
  line(55, yellowVert4Y-407, 57, yellowVert4Y-10);
  line(70, yellowVert4Y-414, 70, yellowVert4Y-5);
  line(77, yellowVert4Y-410, 76, yellowVert4Y-10);
  line(85, yellowVert4Y-407, 85, yellowVert4Y-10);
  line(93, yellowVert4Y-410, 95, yellowVert4Y-8);
  line(103, yellowVert4Y-128, 103, yellowVert4Y-10);
  line(115, yellowVert4Y-115, 115, yellowVert4Y-5);
  line(126, yellowVert4Y-113, 128, yellowVert4Y-8);
  line(135, yellowVert4Y-118, 135, yellowVert4Y-20);
  line(143, yellowVert4Y-110, 143, yellowVert4Y-15);

  line(100, yellowVert4Y-413, 104, yellowVert4Y-230);
  line(110, yellowVert4Y-410, 112, yellowVert4Y-243);
  line(124, yellowVert4Y-401, 120, yellowVert4Y-270);
  line(130, yellowVert4Y-414, 130, yellowVert4Y-290);
  line(142, yellowVert4Y-409, 140, yellowVert4Y-292);

  //vertical yellow lines second bottom left
  line(180, yellowVert3Y-112, 182, yellowVert3Y+10);
  line(190, yellowVert3Y-115, 190, yellowVert3Y+20);
  line(204, yellowVert3Y-117, 203, yellowVert3Y+15);
  line(215, yellowVert3Y-110, 215, yellowVert3Y);
  line(226, yellowVert3Y-112, 226, yellowVert3Y+12);
  line(235, yellowVert3Y-117, 235, yellowVert3Y+22);
  line(246, yellowVert3Y-113, 246, yellowVert3Y+18);
  line(256, yellowVert3Y-112, 253, yellowVert3Y);
  line(265, yellowVert3Y-117, 265, yellowVert3Y+20);
  line(277, yellowVert3Y-110, 275, yellowVert3Y);
  line(283, yellowVert3Y-115, 283, yellowVert3Y+15);
  line(295, yellowVert3Y-112, 294, yellowVert3Y+19);
  line(303, yellowVert3Y-118, 303, yellowVert3Y+21);
  line(310, yellowVert3Y-116, 310, yellowVert3Y);
  line(320, yellowVert3Y-112, 320, yellowVert3Y+14);

  //horizontal yellow lines bottom left
  line(yellowHor2X-10, 705, yellowHor2X+330, 705);
  line(yellowHor2X-5, 715, yellowHor2X+337, 717);
  line(yellowHor2X, 725, yellowHor2X+345, 725);
  line(yellowHor2X-8, 736, yellowHor2X+330, 736);
  line(yellowHor2X-12, 742, yellowHor2X+336, 744);
  line(yellowHor2X-3, 755, yellowHor2X+333, 755);
  line(yellowHor2X, 764, yellowHor2X+345, 764);
  line(yellowHor2X-6, 772, yellowHor2X+356, 772);
  line(yellowHor2X+125, 780, yellowHor2X+336, 780);
  line(yellowHor2X+170, 790, yellowHor2X+342, 793);

  //top horizontal orange lines
  stroke(252, 91, 15, 200);
  line(orangeHorX, 17, orangeHorX+670, 20);
  line(orangeHorX, 28, orangeHorX+600, 29);
  line(orangeHorX, 39, orangeHorX+650, 38);
  line(orangeHorX, 44, orangeHorX+500, 47);
  line(orangeHorX, 58, orangeHorX+600, 58);
  line(orangeHorX, 65, orangeHorX+520, 64);
  line(orangeHorX, 75, orangeHorX+510, 77);
  line(orangeHorX, 83, orangeHorX+513, 83);

  //top vertical orange lines
  //commented out because loop is replacing
  /*line(15, 0, 15, 112);
   line(26, 0, 26, 110);
   line(38, 0, 40, 105);
   line(45, 0, 45, 110);
   line(56, 0, 57, 108);
   line(66, 0, 66, 111);
   line(75, 0, 78, 105);
   line(87, 0, 85, 109);
   line(95, 0, 96, 107);
   line(105, 0, 105, 111);
   line(115, 0, 113, 108);
   line(124, 0, 125, 110);
   line(135, 0, 137, 107);
   line(146, 0, 146, 113);
   line(155, 0, 154, 108);
   line(167, 0, 165, 110);
   line(175, 0, 178, 104);
   line(184, 0, 184, 108); */

  //MIDDLE ORANGE RECTANGLE
  //middle vertical orange lines
  line(185, orangeVert1Y, 184, orangeVert1Y+120);
  line(196, orangeVert1Y+2, 196, orangeVert1Y+117);
  line(205, orangeVert1Y, 205, orangeVert1Y+120);
  line(217, orangeVert1Y-2, 218, orangeVert1Y+118);
  line(225, orangeVert1Y+1, 225, orangeVert1Y+120);
  line(234, orangeVert1Y, 233, orangeVert1Y+116);
  line(245, orangeVert1Y-3, 245, orangeVert1Y+118);
  line(254, orangeVert1Y+1, 255, orangeVert1Y+120);
  line(265, orangeVert1Y, 267, orangeVert1Y+117);
  line(275, orangeVert1Y-5, 277, orangeVert1Y+118);
  line(288, orangeVert1Y, 285, orangeVert1Y+116);
  line(295, orangeVert1Y-3, 295, orangeVert1Y+120);
  line(304, orangeVert1Y-2, 305, orangeVert1Y+117);
  line(315, orangeVert1Y-3, 315, orangeVert1Y+118);
  line(324, orangeVert1Y+1, 325, orangeVert1Y+120);
  line(335, orangeVert1Y, 337, orangeVert1Y+117);
  line(345, orangeVert1Y-5, 347, orangeVert1Y+118);
  line(355, orangeVert1Y, 357, orangeVert1Y+117);
  line(365, orangeVert1Y-5, 367, orangeVert1Y+118);
  line(378, orangeVert1Y, 375, orangeVert1Y+116);
  line(385, orangeVert1Y-3, 385, orangeVert1Y+120);

  //middle horizontal orange lines
  line(orange2X-635, 410, orange2X, 413);
  line(orange2X-636, 423, orange2X, 420);
  line(orange2X-634, 430, orange2X, 429);
  line(orange2X-637, 440, orange2X, 441);
  line(orange2X-635, 451, orange2X, 451);
  line(orange2X-633, 460, orange2X, 462);
  line(orange2X-637, 473, orange2X, 470);
  line(orange2X-635, 480, orange2X, 482);

  //bottom vertical orange lines
  line(650, orangeVert2Y, 650, orangeVert2Y+260);
  line(663, orangeVert2Y-10, 660, orangeVert2Y+255);
  line(670, orangeVert2Y-3, 670, orangeVert2Y+252);
  line(678, orangeVert2Y+5, 679, orangeVert2Y+250);
  line(687, orangeVert2Y-8, 687, orangeVert2Y+251);
  line(695, orangeVert2Y, 695, orangeVert2Y+255);
  line(706, orangeVert2Y+3, 708, orangeVert2Y+260);
  line(716, orangeVert2Y-10, 716, orangeVert2Y+257);
  line(725, orangeVert2Y-3, 725, orangeVert2Y+255);
  line(736, orangeVert2Y+1, 738, orangeVert2Y+260);
  line(746, orangeVert2Y-6, 746, orangeVert2Y+257);
  line(758, orangeVert2Y, 758, orangeVert2Y+255);
  line(765, orangeVert2Y-2, 767, orangeVert2Y+254);
  line(775, orangeVert2Y+2, 778, orangeVert2Y+256);
  line(783, orangeVert2Y-4, 784, orangeVert2Y+255);
  line(794, orangeVert2Y, 794, orangeVert2Y+260);

  //bottom horizontal orange lines
  line(orangeBottom-365, 540, orangeBottom+10, 540);
  line(orangeBottom-350, 551, orangeBottom+5, 550);
  line(orangeBottom-353, 560, orangeBottom+8, 560);
  line(orangeBottom-357, 570, orangeBottom, 568);
  line(orangeBottom-347, 583, orangeBottom+12, 582);
  line(orangeBottom-352, 590, orangeBottom+3, 590);
  line(orangeBottom-349, 599, orangeBottom, 600);
  line(orangeBottom-362, 610, orangeBottom+5, 610);
  line(orangeBottom-347, 620, orangeBottom+15, 622);

  //horizontal purple lines
  stroke(170, 14, 136, 200);
  line(purpleHorX-5, 590, purpleHorX+320, 589);
  line(purpleHorX, 580, purpleHorX+300, 580);
  line(purpleHorX-8, 567, purpleHorX+305, 569);

  //vertical purple lines
  line(680, purpleVertY-142, 683, purpleVertY+10);
  line(689, purpleVertY-150, 692, purpleVertY);
  line(700, purpleVertY-144, 702, purpleVertY+5);
  line(710, purpleVertY-140, 710, purpleVertY+15);
  line(718, purpleVertY-134, 720, purpleVertY+18);
  line(730, purpleVertY-134, 730, purpleVertY);
  line(740, purpleVertY-142, 738, purpleVertY+12);

  //white lines top to bottom
  stroke(230, 200);
  line(white1X-10, 285, white1X+490, 283);
  line(white1X, 293, white1X+440, 295);
  line(white1X-15, 305, white1X+460, 300);
  line(white1X-20, 315, white1X+470, 315);
  line(white1X-10, 328, white1X+430, 330);
  line(white1X+330, 340, white1X+690, 339);
  line(white1X+360, 353, white1X+730, 355);
  line(white1X+355, 366, white1X+800, 364);
  line(white1X+345, 375, white1X+760, 378);


  line(white2X, 700, white2X+310, 700);
  line(white2X-20, 705, white2X+315, 709);
  line(white2X-15, 720, white2X+300, 718);
  line(white2X-30, 732, white2X+320, 732);
  line(white2X, 740, white2X+318, 738);
  line(white2X-27, 751, white2X+322, 748);
  line(white2X-10, 760, white2X+300, 759);
  line(white2X, 768, white2X+310, 770);
  line(white2X-15, 780, white2X+300, 778);
  line(white2X-5, 791, white2X+317, 788);

  //TOP ORANGE RECTANGLE LOOP
  stroke(252, 91, 15, 200); 
  for (int x= 15; x<= 180; x+= spacing) {
    line(x, y, x, y+len);
  }

  //CONDITIONALS--------------------------------------------------------------------------

  //TOP HORIZONTAL ORANGE LINES:
  if (mousePressed && (mouseX>0 && mouseX<670 && mouseY>0 && mouseY<80)) {
    orangeHorMove=true;
    wrapped=false;
    player.play();
  } 
  //If orangeHorMove is true, lines will move 
  if (orangeHorMove) {
    orangeHorX--;
    if (orangeHorX+670<0) { //if it goes offscreen, it will wrap around
      orangeHorX=width;
      wrapped= true;
    }
  }
  //If the lines are back to where they started, orangeHorMove is false
  if (wrapped && orangeHorX==0) {
    orangeHorMove=false;
  } 

  //If orangeHorMove is false, lines will stop
  if (!orangeHorMove) {
    orangeHorX=0;
  }




  //TOP VERTICAL ORANGE LINES
  if (mousePressed && mouseX>0 && mouseX<200 && mouseY>0 && mouseY<100) {
    orangeMove=true;
    orangeWrap2=false;
    player2.play();
  }
  if (orangeMove) {
    y+=2;
    if (y>height) {
      y=-110;
      orangeWrap2=true;
    }
  } 
  if (orangeWrap2 && y==0) {
    orangeMove=false;
  }
  if (!orangeMove) {
    y=0;
  }




  //TOP LEFT YELLOW VERTICAL LINES
  if (mousePressed && mouseX>160 && mouseX<330 && mouseY>150 && mouseY<230) {
    yellowTopLeftMove=true;
    yellowWrap=false;
    player3.play();
  }
  if (yellowTopLeftMove) {
    yellowVert1Y++;
    if (yellowVert1Y>height) {
      yellowVert1Y=-170;
      yellowWrap=true;
    }
  }
  if (yellowWrap && yellowVert1Y==146) {
    yellowTopLeftMove=false;
  }
  if (!yellowTopLeftMove) {
    yellowVert1X= 170;
  }




  //TOP LEFT YELLOW HORIZONTAL LINES
  if (mousePressed && mouseX>160 && mouseX<580 && mouseY>150 && mouseY<230) {
    yellowTopLeftHorMove=true;
    yellowWrap2=false;
    player4.play();
  }
  if (yellowTopLeftHorMove) {
    yellowHor1X--;
    if (yellowHor1X<-430) {
      yellowHor1X=width;
      yellowWrap2=true;
    }
  }
  if (yellowWrap2 && yellowHor1X==140) {
    yellowTopLeftHorMove=false;
  }
  if (!yellowTopLeftHorMove) {
    yellowHor1X= 140;
  }





  //TOP RIGHT VERTICAL YELLOW LINES
  if (mousePressed && mouseX>350 && mouseX<550 && mouseY>125 && mouseY<225) {
    yellowTopRightMove=true;
    yellowWrap3=false;
    player5.play();
  }
  if (yellowTopRightMove) {
    yellowVert2Y--;
    if (yellowVert2Y<-120) {
      yellowVert2Y=height;
      yellowWrap3=true;
    }
  }
  if (yellowWrap3 && yellowVert2Y==120) {
    yellowTopRightMove=false;
  }
  if (!yellowTopRightMove) {
    yellowVert2Y=120;
  }




  //TOP FAR RIGHT YELLOW VERT LINES 
  if (mousePressed && mouseX>580 && mouseX<800 && mouseY>0 && mouseY<320) {
    yellowTopVertMove=true;
    yellowWrap4=false;
    player6.play();
  }
  if (yellowTopVertMove) {
    yellowTopVert+=2;
    if (yellowTopVert>height) {
      yellowTopVert=-300;
      yellowWrap4=true;
    }
  }
  if (yellowWrap4 && yellowTopVert==0) {
    yellowTopVertMove=false;
  }
  if (!yellowTopVertMove) {
    yellowTopVert=0;
  }




  //TOP WHITE LINES 
  if (mousePressed && mouseX>0 && mouseX<750 && mouseY>280 && mouseY<380) {
    whiteTopMove=true;
    whiteWrap=false;
    player7.play();
  }
  if (whiteTopMove) {
    white1X+=3;
    if (white1X>width) {
      white1X=-780;
      whiteWrap=true;
    }
  }
  if (whiteWrap && white1X==0) {
    whiteTopMove=false;
  }
  if (!whiteTopMove) {
    white1X=0;
  }




  //MIDDLE ORANGE LINES
  if (mousePressed && mouseX>175 && mouseX<400 && mouseY>400 && mouseY<500) {
    orangeMiddleMove=true;
    orangeWrap3=false;
    player8.play();
  }
  if (orangeMiddleMove) {
    orangeVert1Y--;
    if (orangeVert1Y<-120) {
      orangeVert1Y=height;
      orangeWrap3=true;
    }
  }
  if (orangeWrap3 && orangeVert1Y==390) {
    orangeMiddleMove=false;
  }
  if (!orangeMiddleMove) {
    orangeVert1Y=390;
  }




  //LONG MIDDLE HORIZONTAL LINES 
  if (mousePressed && mouseX>160 && mouseX<800 && mouseY>410 && mouseY<485) {
    orangeLongMiddleMove=true;
    orangeWrap4=false;
    player9.play();
  }
  if (orangeLongMiddleMove) {
    orange2X+=4;
    if (orange2X-700>width) {
      orange2X=0;
      orangeWrap4=true;
    }
  }
  if (orangeWrap4 && orange2X==800) {
    orangeLongMiddleMove=false;
  }
  if (!orangeLongMiddleMove) {
    orange2X=800;
  }




  //MIDDLE YELLOW LINES
  if (mousePressed && mouseX>0 && mouseX<170 && mouseY>410 && mouseY<495) {
    yellowMiddleMove=true;
    yellowWrap5=false;
    player10.play();
  }
  if (yellowMiddleMove) {
    yellowMiddle+=3;
    if (yellowMiddle>width) {
      yellowMiddle=0;
      yellowWrap5=true;
    } 
  }
  if (yellowWrap5 && yellowMiddle==0) {
    yellowMiddleMove=false;
  }
  if (!yellowMiddleMove) {
    yellowMiddle=0;
  }




  //BOTTOM VERTICAL ORANGE LINES
  if (mousePressed && mouseX>640 && mouseX<800 && mouseY>400 && mouseY<635) {
    orangeBottomMove=true;
    orangeWrap5=false;
    player11.play();
  }
  if (orangeBottomMove) {
    orangeVert2Y--;
    if (orangeVert2Y<-260) {
      orangeVert2Y=height;
      orangeWrap5=true;
    }
  }
  if (orangeWrap5 && orangeVert2Y==390) {
    orangeBottomMove=false;
  }
  if (!orangeBottomMove) {
    orangeVert2Y=390;
  }



  //BOTTOM HORIZONTAL ORANGE LINES 
  if (mousePressed && mouseX>450 && mouseX<width && mouseY>540 && mouseY<625) {
    orangeBottomHorMove=true;
    orangeWrap6=false;
    player12.play();
  }
  if (orangeBottomHorMove) {
    orangeBottom--;
    if (orangeBottom<0) {
      orangeBottom=width+400;
      orangeWrap6=true;
    }
  }
  if (orangeWrap6 && orangeBottom==800) {
    orangeBottomHorMove=false;
  }
  if (!orangeBottomHorMove) {
    orangeBottom=800;
  }





  //BOTTOM LEFT YELLOW LINES VERTICAL
  if (mousePressed && mouseX>0 && mouseX<145 && mouseY>350 && mouseY<800) {
    yellowLeftBottomMove=true;
    yellowWrap6=false;
    player13.play();
  }
  //If yellowLeftBottomMove is true, lines will move up
  if (yellowLeftBottomMove) {
    yellowVert4Y-=2;
    if (yellowVert4Y<0) {
      yellowVert4Y=height+400;
      yellowWrap6=true;
    }
  }
  if (yellowWrap6 && yellowVert4Y==800) {
    yellowLeftBottomMove=false;
  }
  if (!yellowLeftBottomMove) {
    yellowVert4Y=800;
  }




  //BOTTOM LEFT YELLOW LINES HORIZONTAL
  if (mousePressed && mouseX>0 && mouseX<345 && mouseY>700 && mouseY<height) {
    yellowBottomLeftHor=true;
    yellowWrap7=false;
    player14.play();
  }
  if (yellowBottomLeftHor) {
    yellowHor2X+=2;
    if (yellowHor2X>width) {
      yellowHor2X=-300;
      yellowWrap7=true;
    }
  }
  if (yellowWrap7 && yellowHor2X==0) {
    yellowBottomLeftHor=false;
  }
  if (!yellowBottomLeftHor) {
    yellowHor2X=0;
  }




  //BOTTOM RIGHT YELLOW LINES VERTICAL

  if (mousePressed && mouseX>175 && mouseX<352 && mouseY>700 && mouseY<800) {
    yellowBottomMove=true;
    yellowWrap8=false;
    player15.play();
  }
  if (yellowBottomMove) {
    yellowVert3Y-=3;
    if (yellowVert3Y<0) {
      yellowVert3Y=height+150;
      yellowWrap8=true;
    }
  }
  //rect(175, 700, 150, 125);
  if (yellowWrap8 && yellowVert3Y==800) {
    yellowBottomMove=false;
  }
  if (!yellowBottomMove) {
    yellowVert3Y=800;
  }



  //HORIZONTAL PURPLE LINES 
  if (mousePressed && mouseX>0 && mouseX<320 && mouseY>560 && mouseY<590) {
    purpleMoveHor=true;
    purpleWrap=false;
    player16.play();
  }
  if (purpleMoveHor) {
    purpleHorX++;
    if (purpleHorX>width) {
      purpleHorX=-300;
      purpleWrap=true;
    }
  }
  if (purpleWrap && purpleHorX==0) {
    purpleMoveHor=false;
  }

  if (!purpleMoveHor) {
    purpleHorX=0;
  }



  //BOTTOM PURPLE LINES 
  if (mousePressed && mouseX>620 && mouseX<775 && mouseY>650 && mouseY<800) {
    purpleMove=true;
    purpleWrap2=false;
    player17.play();
  }
  if (purpleMove) {
    purpleVertY-=4;
    if (purpleVertY<0) {
      purpleVertY=height+200;
      purpleWrap2=true;
    }
  }
  if (purpleWrap2 && purpleVertY==800) {
    purpleMove=false;
  }
  if (!purpleMove) {
    purpleVertY=800;
  }



  //BOTTOM WHITE LINES 
  if (mousePressed && mouseX>480 && mouseX<800 && mouseY>700 && mouseY<800) {
    whiteBottomMove=true;
    whiteWrap2=false;
    player18.play();
  }
  if (whiteBottomMove) {
    white2X-=2;
    if (white2X<-450) {
      white2X=width;
      whiteWrap2=true;
    }
  }
  if (whiteWrap2 && white2X==500) {
    whiteBottomMove=false;
  }
  if (!whiteBottomMove) {
    white2X=500;
  }
 
}







void mousePressed() {
  if (mouseX>200 && mouseX<670 && mouseY>0 && mouseY<80) {
    player.stop();
    orangeHorMove=true;
    wrapped=false;
    player.play();
  }
  if (mouseX>0 && mouseX<200 && mouseY>0 && mouseY<100) {
    player2.stop();
    orangeMove=true;
    orangeWrap2=false;
    player2.play();
  }
  if (mouseX>160 && mouseX<330 && mouseY>150 && mouseY<230) {
    player3.stop();
    yellowTopLeftMove=true;
    yellowWrap=false;
    player3.play();
  }
  if (mouseX>160 && mouseX<580 && mouseY>150 && mouseY<230) {
    player4.stop();
    yellowTopLeftHorMove=true;
    yellowWrap2=false;
    player4.play();
  }
  if (mouseX>350 && mouseX<550 && mouseY>125 && mouseY<225) {
    player5.stop();
    yellowTopRightMove=true;
    yellowWrap3=false;
    player5.play();
  }
  if (mouseX>580 && mouseX<800 && mouseY>0 && mouseY<320) {
    player6.stop();
    yellowTopVertMove=true;
    yellowWrap4=false;
    player6.play();
  }
  if (mouseX>0 && mouseX<750 && mouseY>280 && mouseY<380) {
    player7.stop();
    whiteTopMove=true;
    whiteWrap=false;
    player7.play();
  }
  if (mouseX>175 && mouseX<400 && mouseY>400 && mouseY<500) {
    player8.stop();
    orangeMiddleMove=true;
    orangeWrap3=false;
    player8.play();
  }
  if (mouseX>160 && mouseX<800 && mouseY>410 && mouseY<485) {
    player9.stop();
    orangeLongMiddleMove=true;
    orangeWrap4=false;
    player9.play();
  }
  if (mouseX>0 && mouseX<170 && mouseY>410 && mouseY<495) {
    player10.stop();
    yellowMiddleMove=true;
    yellowWrap5=false;
    player10.play();
  }
  if (mouseX>640 && mouseX<800 && mouseY>400 && mouseY<635) {
    player11.stop();
    orangeBottomMove=true;
    orangeWrap5=false;
    player11.play();
  }
  if (mouseX>450 && mouseX<width && mouseY>540 && mouseY<625) {
    player12.stop();
    orangeBottomHorMove=true;
    orangeWrap6=false;
    player12.play();
  }
  if (mouseX>0 && mouseX<145 && mouseY>350 && mouseY<800) {
    player13.stop();
    yellowLeftBottomMove=true;
    yellowWrap6=false;
    player13.play();
  }
  if (mouseX>0 && mouseX<345 && mouseY>700 && mouseY<height) {
    player14.stop();
    yellowBottomLeftHor=true;
    yellowWrap7=false;
    player14.play();
  }
  if (mouseX>175 && mouseX<352 && mouseY>700 && mouseY<800) {
    player15.stop();
    yellowBottomMove=true;
    yellowWrap8=false;
    player15.play();
  }
  if (mouseX>0 && mouseX<320 && mouseY>560 && mouseY<590) {
    player16.stop();
    purpleMoveHor=true;
    purpleWrap=false;
    player16.play();
  }
  if (mouseX>620 && mouseX<775 && mouseY>650 && mouseY<800) {
    player17.stop();
    purpleMove=true;
    purpleWrap2=false;
    player17.play();
  }
  if (mouseX>480 && mouseX<800 && mouseY>700 && mouseY<800) {
    player18.stop();
    whiteBottomMove=true;
    whiteWrap2=false;
    player18.play();
  }
}







/* 
 This piece is inspired by the abstract painter Juju Sun. I attempted to reflect her style
 through the use of color, and the orientation of lines and rectangles 
 to create horizontal movement as seen in Sun's paintings. I also
 used transparency and linework to attempt to reference her use of 
 texture. Sound was added to enhance the user interactivity. 
 */


