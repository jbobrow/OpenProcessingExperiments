
int strokeOpac= 255;
int purpleBright=62;
int lavBright=75;
int lightBright=94;
int darkBright=43;
int hueChangePurp=254;
int hueChangeDark=253;
int hueChangeLight=251;
int hueChangeLav=255;

void setup(){
  size(500,800);
}

void draw(){
  colorMode(HSB,360,100,100);
  background (269,0,40);
  stroke (269,0,99, strokeOpac);
  strokeWeight(2);
  

//initial face outline
noFill();
beginShape();
vertex(360, 160);
vertex(400, 200);
vertex(430, 280);
vertex(412, 310);
vertex(460, 380);
vertex(440, 400);
vertex(430, 400);
vertex(440, 420);
vertex(430, 440);
vertex(440, 460);
vertex(420, 480);
vertex(410, 480);
vertex(400, 500);
vertex(400, 540);
vertex(200, 640);
endShape();



//FOREHEAD
fill (hueChangeLight,23,lightBright);//Light Purple
beginShape();
vertex (400, 222);
vertex (400, 296);
vertex (405, 300);
vertex (430, 280);
vertex (406, 216);
endShape(CLOSE);//F1

fill (hueChangeLav,25,lavBright);//Lavender
triangle(370, 260, 400, 222, 400, 300);//F2

fill (hueChangePurp,26,purpleBright);//Purple
beginShape();
vertex (380, 300);
vertex (400, 300);
vertex (370, 260);
vertex (355, 280);
endShape(CLOSE); //F3

fill (hueChangePurp,26,purpleBright);//Purple
triangle(405, 300, 430, 280, 412, 310);//F4


fill (hueChangeDark,39,darkBright);//Dark Purple
triangle(380, 300, 400, 300, 400, 330);//F5

fill (hueChangeDark,39,darkBright);//Dark Purple
triangle(338, 300, 354, 280, 380, 300);//F6

fill (hueChangeLight,23,lightBright);//Light Purple
beginShape();
vertex (270, 280);
vertex (380, 180);
vertex (400, 200);
vertex (315, 301);
endShape(CLOSE);//F7


//EYE

fill (hueChangeDark,39,darkBright);//Dark Purple
triangle(380, 342, 400, 330, 400, 350);//E2

fill (hueChangePurp,26,purpleBright);//Purple
ellipse(375,325,32,32);//E3

fill (hueChangeDark,39,darkBright);//Dark Purple
ellipse(377,324,17,17);//E4

fill (hueChangeLight,23,lightBright);//Light Purple
beginShape();
vertex (322, 320);
vertex (339, 300);
vertex (380, 300);
vertex (400, 330);
vertex (380, 320);
endShape(CLOSE);//E1


//CHEEK
fill (hueChangeDark,39,darkBright);//Dark Purple
beginShape();
vertex (305, 314);
vertex (400, 200);
vertex (405, 216);
vertex (322, 320);
vertex (400, 350);
vertex (392, 365);
vertex (280, 320);
vertex (280, 305);
endShape(CLOSE); //C1

fill (hueChangeDark,39,darkBright);//Dark Purple
beginShape();
vertex (260, 372);
vertex (260, 297);
vertex (280, 305);
vertex (280, 382);
endShape(CLOSE);//C2

fill (hueChangeLav,25,lavBright);//Lavender
triangle(280, 320, 280, 360, 320, 336);//C3

fill (hueChangeLav,25,lavBright);//Lavender
triangle(340, 345, 380, 360, 360, 400);//C4

fill (hueChangeDark,39,darkBright);//Dark Purple
beginShape();
vertex (392, 365);
vertex (366, 425);
vertex (352, 418);
vertex (380, 360);
endShape(CLOSE);//C5

fill (hueChangeLight,23,lightBright);//Light Purple
beginShape();
vertex (120, 320);
vertex (110, 297);
vertex (366, 425);
vertex (360, 440);
endShape(CLOSE);//C6

fill (hueChangePurp,26,purpleBright);//Purple
beginShape();
vertex (280, 382);
vertex (280, 360);
vertex (297, 350);
vertex (310, 397);
endShape(CLOSE); //C7

fill (hueChangeDark,39,darkBright);//Dark Purple
beginShape();
vertex (297, 350);
vertex (320, 335);
vertex (340, 345);
vertex (353, 380);
vertex (320, 402);
vertex (310, 397);
endShape(CLOSE); //C8


fill (hueChangePurp,26,purpleBright);//Purple
beginShape();
vertex (320, 402);
vertex (353, 380);
vertex (360, 400);
vertex (352, 417);
endShape(CLOSE); //C9

fill (hueChangePurp,26,purpleBright);//Purple
triangle(260, 390, 360, 440, 320, 463);//C10

fill (hueChangeLav,25,lavBright);//Lavender
triangle(264, 492, 360, 440, 340, 480);//C11



//NOSE
fill (hueChangePurp,26,purpleBright);//Purple
triangle(400, 350, 400, 293, 421, 323);//N1

fill (hueChangeDark,39,darkBright);//Dark Purple
triangle(400, 350, 420, 360, 421, 323);//N2

fill (hueChangePurp,26,purpleBright);//Purple
triangle(410, 380, 400, 350, 420, 360);//N3

fill (hueChangeLight,23,lightBright);//Light Purple
triangle(410, 380, 420, 360, 430, 400);//N4

fill (hueChangeDark,39,darkBright);//Dark Purple
triangle(400, 405, 410, 380, 430, 400);//N5

fill (hueChangeLight,23,lightBright);//Light Purple
triangle(420, 360, 453, 370, 421, 323);//N6

fill (hueChangePurp,26,purpleBright);//Purple
triangle(430, 400, 420, 360, 453, 370);//N7

fill (hueChangeDark,39,darkBright);//Dark Purple
beginShape();
vertex (430, 400);
vertex (453, 370);
vertex (460, 380);
vertex (440, 400);
endShape(CLOSE); //N8

fill (hueChangePurp,26,purpleBright);//Purple
beginShape();
vertex (410, 380);
vertex (382, 389);
vertex (372, 412);
vertex (400, 405);
endShape(CLOSE); //N9

fill (hueChangeLav,25,lavBright);//Lavender
triangle(380, 390, 400, 350, 410, 380);//N10



//LIPS

fill (hueChangeDark,39,darkBright);//Dark Purple
beginShape();
vertex (440, 420);
vertex (430, 400);
vertex (425, 400);
vertex (372, 412);
vertex (380, 420);
vertex (420, 410);
vertex (438, 425);
endShape(CLOSE);//L1

fill (hueChangeDark,39,darkBright);//Dark Purple
triangle(370, 460, 380, 420, 400, 440);//L2

fill (hueChangePurp,26,purpleBright);//Purple
triangle(380, 420, 400, 440, 420, 410);//L3

fill (hueChangeDark,39,darkBright);//Dark Purple
triangle(400, 440, 420, 410, 430, 440);//L4

fill (hueChangeLight,23,lightBright);//Light Purple
triangle(420, 410, 430, 440, 437, 425);//L5

fill (hueChangeLav,25,lavBright);//Lavender
triangle(370, 460, 400, 440, 410, 480);//L6

fill (hueChangePurp,26,purpleBright);//Purple
beginShape();
vertex (400, 440);
vertex (430, 470);
vertex (420, 480);
vertex (410, 480);
endShape(CLOSE);//L7

fill (hueChangeLight,23,lightBright);//Light Purple
beginShape();
vertex (400, 440);
vertex (430, 470);
vertex (440, 460);
vertex (430, 440);
endShape(CLOSE);//L8



//CHIN
fill (hueChangeDark,39,darkBright);//Dark Purple
beginShape();
vertex (372, 412);
vertex (340, 480);
vertex (385, 548);
vertex (400, 540);
vertex (365, 480);
vertex (380, 420);
endShape(CLOSE);//H1

fill (hueChangePurp,26,purpleBright);//Purple
beginShape();
vertex (288, 530);
vertex (280, 520);
vertex (346, 490);
vertex (355, 503);
endShape(CLOSE);//H2

fill (hueChangeLav,25,lavBright);//Lavender
beginShape();
vertex (310, 520);
vertex (355, 502);
vertex (360, 510);
vertex (360, 520);
endShape(CLOSE);//H3

fill (hueChangeLav,25,lavBright);//Lavender
beginShape();
vertex (233, 560);
vertex (260, 520);
vertex (340, 480);
vertex (347, 490);
vertex (280, 520);
vertex (310, 560);
endShape(CLOSE); //H4

fill (hueChangeDark,39,darkBright);//Dark Purple
beginShape();
vertex (288, 530);
vertex (310, 520);
vertex (346, 567);
vertex (323, 578);
endShape(CLOSE);//H5

fill (hueChangePurp,26,purpleBright);//Purple
beginShape();
vertex (340, 560);
vertex (345, 567);
vertex (384, 548);
vertex (380, 540);
endShape(CLOSE);//H6

fill (hueChangeLight,23,lightBright);//Light Purple
triangle(360, 512, 360, 550, 380, 540);//H7

fill (hueChangePurp,26,purpleBright);//Purple
triangle(340, 520, 340, 540, 360, 540);//H8

fill (hueChangeLight,23,lightBright);//Light Purple
triangle(310, 520, 340, 520, 340, 560);//H9

fill (hueChangePurp,26,purpleBright);//Purple
beginShape();
vertex (190, 625);
vertex (200, 640);
vertex (324, 578);
vertex (310, 560);
endShape(CLOSE);//H10

fill (hueChangeDark,39,darkBright);//Dark Purple
triangle(380, 465, 380, 480, 410, 480);//H11

fill (hueChangeLav,25,lavBright);//Lavender
triangle(380, 480, 400, 500, 410, 480);//H12

fill (hueChangePurp,26,purpleBright);//Purple
beginShape();
vertex (365, 480);
vertex (370, 460);
vertex (380, 465);
vertex (380, 505);
endShape(CLOSE);//H13

fill (hueChangeLight,23,lightBright);//Light Purple
beginShape();
vertex (380, 505);
vertex (380, 480);
vertex (400, 500);
vertex (400, 540);
endShape(CLOSE);//H14



//OUTLYING SHAPES
fill (hueChangePurp,26,purpleBright);//Purple
beginShape();
vertex (400, 200);
vertex (440, 140);
vertex (480, 120);
vertex (480, 180);
vertex (420, 255);
endShape(CLOSE);//R1

fill (hueChangeLav,25,lavBright);//Lavender
triangle(380, 180, 400, 200, 440, 140);//R2

fill (hueChangeDark,39,darkBright);//Dark Purple
beginShape();
vertex (360, 160);
vertex (380, 100);
vertex (415, 156);
vertex (380, 180);
endShape(CLOSE);//R3

fill (hueChangeLav,25,lavBright);//Lavender
beginShape();
vertex (330, 200);
vertex (360, 160);
vertex (380, 180);
vertex (341, 215);
endShape(CLOSE);//R4

fill (hueChangePurp,26,purpleBright);//Purple
beginShape();
vertex (329, 200);
vertex (260, 100);
vertex (260, 60);
vertex (320, 80);
vertex (360, 160);
endShape(CLOSE);//R5

fill (hueChangeDark,39,darkBright);//Dark Purple
beginShape();
vertex (260, 187);
vertex (260, 100);
vertex (340, 215);
vertex (320, 235);
endShape(CLOSE);//R6


fill (hueChangeLav,25,lavBright);//Lavender
beginShape();
vertex (140, 220);
vertex (180, 220);
vertex (100, 180);
vertex (200, 140);
vertex (320, 235);
vertex (270, 280);
endShape(CLOSE);//R7

fill (hueChangePurp,26,purpleBright);//Purple
beginShape();
vertex (100, 240);
vertex (140, 220);
vertex (315, 301);
vertex (305, 314);
endShape(CLOSE);//R8

fill (hueChangePurp,26,purpleBright);//Purple
triangle(260, 330, 260, 372, 225, 354);//R9

fill (hueChangeLav,25,lavBright);//Lavender
beginShape();
vertex (160, 340);
vertex (260, 390);
vertex (320, 460);
vertex (200, 440);
vertex (120, 520);
vertex (240, 700);
vertex (180, 680);
vertex (60, 500);
vertex (160, 400);
vertex (240, 420);
vertex (260, 410);
vertex (180, 380);
endShape(CLOSE); //R10


fill (hueChangeDark,39,darkBright);//Dark Purple
beginShape();
vertex (120, 520);
vertex (200, 440);
vertex (322, 460);
vertex (240, 470);
vertex (147, 560);
endShape(CLOSE);//R11

fill (hueChangePurp,26,purpleBright);//Purple
beginShape();
vertex (147, 560);
vertex (240, 470);
vertex (322, 460);
vertex (264, 492);
vertex (220, 500);
vertex (167, 590);
endShape(CLOSE);//R12

fill (hueChangeLight,23,lightBright);//Light Purple
beginShape();
vertex (167, 590);
vertex (220, 500);
vertex (340, 480);
vertex (260, 520);
vertex (190, 625);
endShape(CLOSE);//R13

fill (hueChangeDark,39,darkBright);//Dark Purple
beginShape();
vertex (115, 683);
vertex (50, 580);
vertex (87, 540);
vertex (144, 626);
endShape(CLOSE);//R14

fill (hueChangeDark,39,darkBright);//Dark Purple
beginShape();
vertex (131, 710);
vertex (163, 655);
vertex (220, 740);
vertex (145, 730);
endShape(CLOSE);//R15




//make purple brightness change
purpleBright=map(mouseX, 0, width, 20, 62);

//make lavander brightness change
lavBright=map(mouseX, 0, width, 30, 75);

//make light purple brightness change
lightBright=map(mouseX, 0, width, 40, 94);

//make dark purple brightness change
darkBright=map(mouseX, 0, width, 15, 43);
 
 strokeOpac-- ;
}

void mouseClicked () {
  hueChangePurp= floor(random(250));
  hueChangeDark= floor(random(250));
  hueChangeLight= floor(random(250));
  hueChangeLav= floor(random(250));
}


