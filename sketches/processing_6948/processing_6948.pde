


size(800, 602);
smooth();
background(222, 219, 214); //background



noStroke(); //upper right greenish shading
fill(208, 212, 188, 240);
quad(507, 0, 463, 162, 800, 163, 800, 0);



//grid colors

//row 1
fill(162, 178, 93); //small green quad
noStroke();
quad(92, 245, 58, 229, 98, 184, 124, 208);

noStroke(); //white quad
fill(255, 255,255);
quad(57, 225, 18, 207, 69, 155, 97, 183);

noStroke(); //light blue quad
fill(213, 227,234);
quad(19, 207, 7, 200, 48, 138, 68, 157);

noStroke(); //brown quad
fill(191, 120,42);
quad(6, 206, 0, 199, 0, 91, 48, 137);

//row 2
noStroke(); //white long quad
fill(240, 240, 240);
quad(69, 155, 0, 90, 0, 22, 82, 86);

noStroke(); //black quad
fill(0, 0, 0);
quad(69, 157, 48, 136, 83, 86, 114, 112);

noStroke(); //cream quad
fill(222, 213, 170, 200);
quad(97, 183, 70, 157, 113, 111, 144, 135);

noStroke(); //white quad
fill(255, 255,255);
quad(125, 207, 97, 183,  142, 132, 171, 154);

noStroke(); //white quad
fill(240, 240,240);
quad(169, 155, 142, 132, 196, 71, 227, 87);

//row 3
noStroke(); //white quad
fill(250, 250,250);
quad(141, 132, 113, 110, 166, 55, 197, 71);

noStroke(); //white quad
fill(250, 250,250);
quad(113, 110, 83, 87, 121, 30, 166, 55);

noStroke(); //green quad
fill(88, 104, 59, 230);
quad(83, 87, 0, 22, 64, 0, 120, 30);

noStroke(); //green quad extra triangle
fill(88, 104, 59, 230);
triangle(0, 23, 0, 0, 65, 0);

//row 4
noStroke(); //white triangle
fill(250, 250,250);
triangle(65, 0, 121, 30, 140, 0);

noStroke(); //blue quad
fill(73, 135, 173);
quad(167, 54, 121, 30, 141, 0, 201, 19);

noStroke(); //triangle for blue quad
fill(73, 135, 173);
triangle(140, 0, 174, 0, 201, 20); 

noStroke(); //white triangle
fill(250, 250,250);
triangle(173, 0, 219, 0, 202, 19);

noStroke(); //green quad
fill(92, 137, 108);
quad(229, 35, 201, 19, 219, 0, 251, 12);

noStroke(); //triangle for green quad
fill(92, 137, 108 );
triangle(217, 0, 238, 0, 250, 13);

noStroke(); //white triangle
fill(250, 250,250);
triangle(238, 0, 261, 0, 250, 12);

noStroke(); //black quad
fill(0, 0, 0);
quad(250, 13, 260, 0, 295, 9, 273, 35);

noStroke(); //triangle for black quad
fill(0, 0, 0);
triangle(260, 0, 285, 0, 295, 10);

noStroke(); //pink quad
fill(245, 190, 191, 200);
quad(227, 88, 197, 71, 230, 36, 256, 52);

noStroke(); //black lower long quad
fill(0, 0, 0);
quad(73, 272, 0, 227, 0, 198, 93, 245);


//light blue upper triangle
noStroke();
fill(201, 211, 232, 200);
triangle (276, 36, 305, 0, 469, 0);

stroke(0); //fourth vertical on grid
strokeCap(SQUARE);
strokeWeight(5);
line(72, 271, 303, -3);



//black lines on grid

stroke(0); //third vertical on grid 
strokeWeight(6);
line(53, 230, 262, 0);

stroke(0); //first horizontal on grid
strokeWeight(4);
line(125, 209, -3, 90);

stroke(0); //second horizontal on grid
strokeWeight(4);
line(170, 156, -3, 22);


stroke(0);  //third horizontal on grid
strokeWeight(4);
line(226, 87, 63, -3);


stroke(0); //fourth horizontal on grid
strokeCap(SQUARE);
strokeWeight(4);
line(258, 52, 169, -3);

stroke(0); //fourth horizontal on grid?
strokeWeight(4);
line(237, -3, 273, 32);

stroke(0); //second vertical on grid
strokeWeight(6);
line(219, -3, 18, 208);


stroke(0); //first vertical on grid
strokeWeight(4);
line(141, -3, 5, 203);



//red line group

stroke(200, 3, 35); //red line
strokeWeight(8);
line(112, 167, 679, 0);

stroke(0); //black line along red, top
strokeWeight(4);
line(669, -3, 115, 161);

stroke(0); //black line along red, bottom
strokeWeight(4);
line(688, 0, 106, 172);

stroke(0); //second diag line on grid from right
strokeWeight(4);
line(97, 181, 262, 0);



//loose lines

stroke(0); //thickest black line
strokeWeight(14);
strokeCap(SQUARE);
line(134, 82, 590, -7);



//superimposed circles

noStroke(); //yellow ellipse
fill(229, 189, 68);
ellipse(296, 447, 178, 178);

noStroke(); //pink ellipse
fill(249, 207, 202, 230);
ellipse(288, 449, 139, 139);


stroke(0, 80);//pink ellipse black outline
strokeWeight(1);
noFill();
ellipse(288, 449, 139, 139);

noStroke(); //blue ellipse
fill(44, 110, 147, 250);
ellipse(283, 444, 112, 112);


stroke(0, 160); //blue ellipse's black outline
strokeWeight(1);
noFill();
ellipse(283, 444, 112, 112);



//black lines in three's

//lower three lines
strokeCap(ROUND);
stroke(0); 
strokeWeight(5);
line(803, 260, 658, 416);

stroke(0); 
strokeWeight(3);
line(800, 275, 663, 422);

stroke(0); 
strokeWeight(4);
line(803, 285, 670, 427);


//upper right corner

noStroke(); //upper right fade to background color
fill(222, 219, 214);
triangle(683, 0, 800, 0, 800, 103);



//arcs

int arcY=160; //variable for arc' Y
int arcWidth=172;
int arcX=457;

//purple arc group
stroke(0);
strokeWeight(5);
arc(457, arcY, 170, 170, radians(181), TWO_PI); 
strokeWeight(5);
stroke(154, 152, 180);
arc(457, arcY, 160, 160, PI, TWO_PI); //purple arc
strokeWeight(3);

//yellow arc group
strokeWeight(3);
fill(240, 240, 240);
stroke(0);
arc(arcX + arcWidth, arcY, 170, 170, PI, TWO_PI); //yellow arc
strokeWeight(4);
stroke(229, 189, 68);
arc(629, arcY, 163, 163, PI, TWO_PI);

//red arc

noStroke();//red arc surface w/o stroke (stroke later)
fill(240, 240, 240);
arc(arcX + arcWidth + arcWidth, arcY, 170, 170, PI, TWO_PI);

//pink arc
stroke(216,186, 197); //pink part only
strokeWeight(9);
noFill();
arc(539, 254, 171, 174, radians(170), radians(340));


//thin arc on 3 lines
strokeWeight(2);
stroke(0);
noFill();
arc(808, 358, 185, 185, radians(173), TWO_PI - HALF_PI);

//triangle covering red arc surface
noStroke();
fill(222, 219, 214);
triangle(732, 160, 800, 110, 800, 162);



//upper three lines across vertical

strokeCap(ROUND);
stroke(0); 
strokeWeight(3);
line(800, 108, 623, 289);

stroke(0); 
strokeWeight(5);
line(800, 120, 631, 297);

stroke(0); 
strokeWeight(4);
line(800, 133, 640, 305);



//brown cigar group

stroke(0); //cigar black line
strokeWeight(17);
strokeCap(SQUARE);
line (805, 99, 594, 252);

stroke(129, 112, 99); //cigar brown line
strokeWeight(8);
strokeCap(SQUARE);
line (805, 99, 701, 174);

stroke(240, 240, 240, 220); //cream line on cigar
strokeWeight(8);
strokeCap(SQUARE);
line(656, 207, 625, 230);

stroke(240, 240, 240, 220); //cream line on cigar 1
strokeWeight(3.5);
strokeCap(ROUND);
line (659, 201, 662, 205);

stroke(240, 240, 240, 220); //cream line on cigar 2
strokeWeight(3.5);
strokeCap(ROUND);
line (666, 196, 669, 200);

stroke(240, 240, 240, 220); //cream line on cigar 3
strokeWeight(3.5);
strokeCap(ROUND);
line (673, 191, 676, 195);

stroke(240, 240, 240, 220); //cream line on cigar 4
strokeWeight(3.5);
strokeCap(ROUND);
line (680, 186, 683, 190);

stroke(240, 240, 240, 220); //cream line on cigar 5
strokeWeight(3.5);
strokeCap(ROUND);
line (687, 181, 690, 185);

stroke(240, 240, 240, 220); //cream line on cigar 6
strokeWeight(3.5);
strokeCap(ROUND);
line (694, 176, 697, 180);


//red edge on arc


strokeWeight(7);//red arc
noFill();
stroke(200, 25, 0, 230 );
arc(803, 162, 170, 170, radians(187), TWO_PI);



//other lines near circle

strokeCap(ROUND); //thick diagonal on circle
stroke(0 );
strokeWeight(3);
line(341, 337, 83, 589);

stroke(0); //thick diagonal above circle
strokeWeight(4);
line(387, 259, 19, 507);

strokeWeight(1);  //diagonal main line MOVE TO END
fill(0 );
triangle(498, 0, 505, 0, 386, 461);

stroke(0); //main horizontal black line MOVE TO END
strokeWeight(4);
line(130, 158, 800, 163);

stroke(0); //main vertical line MOVE TO END
strokeWeight(4);
line(708, 96, 708, 600);
 
 
 
//semicircles on cigar


stroke(0); //semicircle on cigar, thin
strokeWeight(2);
noFill();
arc(718, 257, 179, 179, radians(185), TWO_PI);

//pink arc
stroke(0); //semicircle on cigar with pink, black part
strokeWeight(3);
noFill();
arc(539, 254, 177, 179, radians(168), radians(357));




//toothpick upper right

strokeWeight(1); //right diagonal toothpick from red line
stroke(0, 200);
fill(0, 200);
triangle(677, 0, 681, 0, 749, 60);



//cross lines with variable

//triangle variables

int lineSpacing = 40;
int pointY = 325;
int triSpace = 2;

stroke(0);
strokeWeight(1);
fill(0);
triangle(420, pointY + 2, 420, pointY - 2, 530, pointY);
triangle(410, pointY + 2 + lineSpacing, 410, pointY - 2 + lineSpacing, 543, pointY + lineSpacing);
strokeWeight(2);
triangle(420, pointY + 2, 420, pointY - 2, 330, pointY);
triangle(410, pointY + 2 + lineSpacing, 410, pointY - 2 + lineSpacing, 335, pointY + lineSpacing);













