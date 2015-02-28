

size(640,480);
int x = width;
int y = height;
int bg1 = 255;
int bg2 = 247;
int bg3 = 237;
background(bg1, bg2, bg3);
smooth();



//bottom right radiating circles ALL DONE
float triX1 = x*.985;
float triX2 = x*.77;
float triY2 = y*.54;
float midX = (triX1 + triX2)/2;
float midY = (y + triY2)/2;
//outer orange circle
float diameter = x * .25;
noStroke();
fill(237, 124, 72);
ellipse(midX, midY, diameter, diameter);
//background outer circle
stroke(0);
strokeWeight(0);
diameter = diameter - 13;
fill(bg1, bg2, bg3);
ellipse(midX, midY, diameter, diameter);
//inner yellow circle
noStroke();
int yellow1 = 240;
int yellow2 = 218;
int yellow3 = 19;
fill(yellow1, yellow2, yellow3);
diameter = diameter - 40;
ellipse(midX, midY, diameter, diameter);
//inner blue circle
stroke(0);
int blue1 = 242;
int blue2 = 253;
int blue3 = 255;
fill(blue1, blue2, blue3);
diameter = diameter - 13;
ellipse(midX, midY, diameter, diameter);
//inner black circle
fill(0);
diameter = diameter - 50;
ellipse(midX, midY, diameter, diameter);

//bottom blue tint ALL DONE
noStroke();
float blueY1 = y * .57;
float blueX2 = x * .36;
fill(blue1, blue2, blue3);
triangle(0, blueY1, blueX2, y, 0, y);

//big triangle bottom right ALL DONE
fill(198, 131, 6);
triangle(triX1, y, triX2, triY2, x*.26, y);

//green slice of triangle ALL DONE
float bottomX = x*.825;
fill(68, 103, 86);
quad(bottomX, y, x*.733, y*.575, triX2, triY2, triX1, y);

//little white semi-circle ALL DONE
fill(255);
stroke(0);
strokeWeight(1);
arc(midX, midY, diameter, diameter, PI/3, PI*4/3);

//top center circle ALL DONE
stroke(0);
fill(255);
diameter=diameter+20;
float radius = diameter/2;
float centX = x*.46;
float centY = y *.095;
ellipse(centX, centY, diameter, diameter);
 
for(int i = 0; i<90; i++)
{
  float randomRad = random(0, radius);
  float randomAng = random(0, TWO_PI);
  float randomX = cos(randomAng)*randomRad;
  float randomY = sin(randomAng)*randomRad;
  float randomStroke = random(1, 2);
  strokeWeight(randomStroke);
  if(randomRad < radius/3){
    point(centX+randomX, centY+randomY);
  }
 else{
    point(centX+randomX, centY+randomY);
    point(centX+randomX, centY-randomY);
    point(centX-randomX, centY+randomY);
    point(centX-randomX, centY-randomY);
 }
 
}


 

//top center circle dots
/*float spotX = centX;
float spotY = centY;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = x*.46;
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotY = spotY + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotY = spotY + 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotY = spotY + 4;
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotY = spotY + 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotY = spotY + 4;
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotY = spotY + 4;
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotY = spotY + 4;
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = centX;
spotY = centY;
spotY = spotY - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
spotX = centX;
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotY = spotY - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotY = spotY - 4;
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotY = spotY - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotY = spotY - 4;
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotY = spotY - 4;
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotX = spotX - 4;
point(spotX, spotY);
spotY = spotY - 4;
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);
spotX = spotX + 4;
point(spotX, spotY);*/

//points
strokeWeight(2);
point(637,211);
point(636,217);
strokeWeight(3);
point(632, 210);
point(638, 219);
point(637, 205);

//top left circles ALL DONE
centX = .14*x;
centY = .265*y;
//outer circle
strokeWeight(1);
diameter = diameter + 80;
ellipse(centX, centY, diameter, diameter);
//black inner circle
noStroke();
fill(0);
diameter = diameter - 48;
ellipse(centX, centY, diameter, diameter);
//inner red circle
int red1 = 183;
int red2 = 42;
int red3 = 42;
fill(red1, red2, red3);
diameter = diameter - 16;
ellipse(centX, centY, diameter, diameter);
//inner white circle
fill(255);
diameter = diameter - 6;
ellipse(centX, centY, diameter, diameter);
stroke(0);
point(centX, centY);



//green line/quad
noStroke();
fill(83, 106, 75);
quad(74, 410, 295, 109, 627, 309, 297, 138);

//right central line ALL DONE
stroke(0);
strokeWeight(5);
line(bottomX,y, x*.61, 0);

//left central line ALL DONE
line(x*.15, y, x*.34, 0);


//bottom left line ALL DONE
strokeWeight(2);
line(0, blueY1, blueX2, y);

//intersecting lines at top ALL DONE
strokeWeight(1);
float sectX = x*.735;
float sectY = y*.1;
line(x*.57, 0, sectX, sectY);
line(x*.635, 0, sectX, sectY);

//black/yellow line
strokeCap(SQUARE);
strokeWeight(5);
stroke(yellow1, yellow2, yellow3);
line(x*.573, y*.585, x*.845, y*.325);
stroke(0);
line(x*.57, y*.58, x*.84, y*.32);

//black/orange line
strokeCap(SQUARE);
strokeWeight(4);
line(x*.74, y*.19, x*.18, y*.585);
strokeWeight(5);
stroke(240, 126, 19);
line(x*.74, y*.182, x*.18, y*.578);




//black line/quad ALL DONE
fill(0);
noStroke();
quad(74, 410, 295, 109, 621, 303, 293, 125);


//descending arcs
strokeCap(SQUARE);
noFill();
diameter = 125;
stroke(red1,red2,red3, 150);
strokeWeight(9);
arc(x*.465, y*.66, diameter, diameter, radians(140), radians(320));//red opaque
diameter = diameter-2;
stroke(0);
strokeWeight(2);
arc(x*.465, y*.66, diameter, diameter, radians(140), radians(320));//first black
diameter = diameter - 30;
strokeWeight(8);
stroke(red1,red2,red3);
arc(x*.60, y*.51, diameter, diameter, radians(140), radians(310));//2nd red
arc(464, 185, diameter+9, diameter+9, radians(150), radians(310));
strokeWeight(7);
stroke(0);
arc(x*.61, y*.52, diameter, diameter, radians(150), radians(310));//2nd black
strokeWeight(2);
arc(464, 185, diameter, diameter, radians(150), radians(310));//3rd black
diameter=diameter/2;
strokeWeight(3);
arc(518, 135, diameter+8, diameter+8, radians(150), radians(310));//4th black
stroke(red1, red2, red3);
strokeWeight(6);
strokeCap(ROUND);
arc(518, 135, diameter+15, diameter+15, radians(164), radians(310));//4th red



strokeWeight(3);
stroke(0);
fill(250,53,23);
quad(560,38, 578,70, 606,54, 588,22);//red square
fill(255);
quad(578,70, 606,54, 623,84, 596,99);//cow square
strokeWeight(4);
point(589,70);
point(600, 74);
point(601,74);
point(600,85);
point(610,72);
point(598,87);
point(585, 71);
point(614, 81);
point(603, 62);
point(606, 63);
point(591, 80);
point(592, 84);
strokeWeight(5);
point(607, 87);
point(600, 77);
point(595,65);
point(602, 69);
point(608,77);
point(596, 84);
point(597, 66);
point(593, 74);
point(597, 92);
strokeWeight(3);
fill(255);
quad(596,99, 622,84, 638,115, 612,128);//white square
fill(0);
triangle(x, 174, x,115, 612,128);//black 
fill(139,77,18);
quad(588,22, 606,54, 637,36, 619,5);//brown
fill(255);
quad(606,54, 637,36, 1.04*x, .13*y, 622,84);//white
fill(250,55,48);
triangle(622,84, 638,115, x,72);//red triangle

fill(255);
quad(634,162, 608,180, 626,207, 1.02*x, 190);
quad(608,180, 626,207, 597,226, 580,199);
quad(626,207, 597,226, 614,253, x,234);
fill(0);
quad(614,253, x,234, 1.05*x, 263, 631,282);
line(631,282, x,297);

//top red rectangle
noStroke();
fill(red1, red2, red3, 150);
rect(x*.8, y*.01, x*.195, y*.2);

//long black line cutting through arc
stroke(0);
strokeWeight(2);
line(x*.37, y*.75, x*.87, y*.135);



//short black line cutting through arc
strokeWeight(3);
line(x*.475, y*.54, x*.835, y*.13);


//two parallel lines
strokeWeight(2);
stroke(0);
line(x*.215, y*.465, x*.56, y*.245);
line(x*.22, y*.48, x*.565, y*.26);



//circles inside of triangle and arcs inside of triangle
//big black circle
centX = x*.7;
centY = y*.78;
diameter=x*.2;
fill(0);
strokeWeight(4);
ellipse(centX, centY, diameter, diameter);
//top blue arc
fill(33,37,137);
arc(centX, centY, diameter, diameter, radians(235), radians(290));
//bottom blue arc
arc(centX, centY, diameter, diameter, radians(53), radians(148));
//side blue arc
fill(87, 91, 188);
arc(centX, centY, diameter, diameter, radians(350), radians(360));
arc(centX, centY, diameter, diameter, radians(0), radians(15));
//right side yellow arc
fill(250,235,66);
arc(centX, centY, diameter, diameter, radians(330), radians(340));
//left side yellow arc
arc(centX, centY, diameter, diameter, radians(170), radians(190));
//black base arc top/bottom
fill(0);
arc(centX, centY, diameter, diameter, radians(248), radians(260));
arc(centX, centY, diameter, diameter, radians(90), radians(120));
//white lines
fill(255);
arc(centX, centY, diameter, diameter, radians(251), radians(253));
arc(centX, centY, diameter, diameter, radians(256), radians(258));
arc(centX, centY, diameter, diameter, radians(93), radians(96));
arc(centX, centY, diameter, diameter, radians(113), radians(116));
arc(centX, centY, diameter, diameter, radians(99), radians(102));
arc(centX, centY, diameter, diameter, radians(106), radians(109));
//white circle
strokeWeight(1);
fill(228);
diameter = y*.22;
ellipse(centX, centY, diameter, diameter);
//little black circle
noStroke();
fill(0); 
diameter = x*.03;
ellipse(x*.72, y*.77, diameter, diameter);



//black and white rectangles on left ALL DONE
fill(0);
stroke(0);
strokeWeight(4);
fill(255);
quad(3,326, 23,343, 0,367, -10,343); //1st white from the left
fill(0);
quad(3,326, 29,298, 47,314, 23,343); //1st black
fill(255);
quad(29,298, 47,314, 73,283, 57,268);//2nd white
fill(0);
quad(57,268, 73,283, 90,262, 74,248);//2nd black
fill(255);
quad(90,262, 74,248, 95,225, 110,239);//3rd white
fill(0);
quad(95,225, 110,239, 133,214, 118,200);//3rd black

//triangular shape moving into circle from left ALL DONE
fill(250);
stroke(0);
strokeWeight(2);
quad(324, 306, 316, 327, 354, 339, 359, 322);//
noStroke();
int orange1 = 205;
int orange2= 62;
int orange3 = 41;
fill(orange1, orange2, orange3);
quad(367, 325, 375, 329, 371, 343, 362, 340);
fill(bg1,bg2,bg3);
quad(376,330,372,342,393,349,397,340);
fill(orange1,orange2,orange3);
triangle(393,349,398,339,442,360);
strokeWeight(3);
stroke(0);
line(378,329,376,344);
line(385,333,380,345);
line(385,347, 388,334);

//triangle shape coming from top right
noStroke();
fill(0);
quad(576,215, 587,229, 546,273, 536,266);
fill(orange1, orange2, orange3);
quad(529,275, 538,283, 511,309, 505,304);
fill(255);
quad(511,309, 505,304, 491,322, 495,326);
fill(orange1,orange2,orange3);
triangle(491,322, 495,326, 469,348);



//black circle stroke
diameter=x*.2;
noFill();
stroke(0);
strokeWeight(5.5);
ellipse(x*.7, y*.78, diameter, diameter);

//triangle shape from bottom right
noStroke();
fill(yellow1,yellow2,yellow3);
quad(550,464, 541,471, 547,480, 562,476);
fill(orange1, orange2, orange3);
triangle(504,412,499,418,476,384);
fill(blue1,blue2,blue3);
quad(549,461,539,469,499,418,504,412);
stroke(0);
strokeWeight(4);
line(549,461,539,469);
strokeWeight(5);
line(542,453,532,459);
strokeWeight(4);
line(526,452,534,445);

//red rectangle at the bottom of the screen
fill(242, 32, 24);
quad(549, y, 575, y, x, 433, x, 412); 

//lines inside of rectangle
strokeWeight(2);
line(585,195,601,223);
line(605,220,588,193);
line(592,189,609,217);
line(613,215,597,187);
line(600,185,617,213);
line(621,210,604,182);

//orange circle
fill(255,87,3,155);
stroke(0);
strokeWeight(6);
ellipse(660, -20, 148, 148);
fill(0);
quad(619,5, 598,18, 622,43, 636,37);

//little lines on left
strokeCap(ROUND);
strokeWeight(1.2);
line(0,183, 35,186);
line(0,200, 18,192);

//grid pattern
strokeWeight(.5);
//vertical
line(327,307, 320,329);
line(323, 330, 330,308);
line(333,309, 328, 331);
line(330,332, 335,311);
line(333,332,338,311);
line(341,313, 337,333);
line(341,334, 346, 315);
line(348,317,344,334);
line(348,336, 351,318);
line(355,319,351,336);
//horizontal
line(322,309, 358,322);
line(321,311, 357,325);
line(357,328,320,315);
line(318,319, 356,330);
line(355,334, 317,323);

//bottom black rectangle
fill(0);
noStroke();
quad(335,468,338,478,320,y,265,y);

