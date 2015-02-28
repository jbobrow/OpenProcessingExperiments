
size(186, 175);
background(236, 233, 214);
smooth();

//black skinny circle
noFill();
stroke(0, 0, 0);
ellipse(35, 35, 180, 100);

//top eyeball
//black eyelids
fill(0, 0, 0);
//top
bezier(0, 30, 21, -16, 87, 11, 119, 28);
//bottom
bezier(0, 31, 58, 81, 93, 47, 119, 28);

//eyelash left
noFill();
curve(17, 60, 17, 45, 5, 60, 128, 45);
//eyelash middle
curve(17, 60, 28, 5, 25, 65, 128, 45);
//eyelash right
curve(17, 60, 46, 60, 49, 70, 128, 45);

//green eye top
fill(132, 206, 117);
bezier(0, 31, 68, 2, 37, 21, 119, 28);
//green eye bottom
bezier(0, 31, 91, 69, 82, 26, 119, 28);

//pupil
//big red eye circle
fill(217, 101, 64);
noStroke();
bezier(27, 18, 32, 51, 64, 52, 72, 17);
//white circle
fill(253, 248, 244);
noStroke();
bezier(29, 17, 32, 44, 57, 55, 71, 15);
//inner black circle
fill(0, 0, 0);
ellipse(48, 29, 20, 20);
//inner red circle
fill(217, 101, 64);
ellipse(48, 29, 14, 14);
//black pupil
fill(0, 0, 0);
ellipse(48, 29, 4, 4);

//cover up the eyeball - black eyelid top repeat
noFill();
stroke(0, 0, 0);
strokeWeight(8);
bezier(0, 30, 21, -16, 87, 11, 119, 28);

//easy lines and circles

//left top star
strokeWeight(1);
//up down line
line(25, 90, 24, 110);
//left right line
line(10, 100, 35, 100);
//diagonal line down
line(15, 90, 30, 110); 
//diagonal line up
line(15, 105, 30, 95);

//left bottom part of star
//diagonal line up
line(0, 125, 4, 122);
//diagonal line down
line(0, 135, 5, 139);
//line left right
line(0, 130, 6, 129);

//right top star
//up down line
line(155, 50, 150, 80);
//left right line
line(140, 65, 165, 65);
//diagonal down line
line(140, 50, 165, 70);
//diagonal up line
line(140, 75, 170, 50);

//right bottom star
//up down line
line(115, 85, 115, 110);
//left right line
line(105, 100, 130, 100);
//diagonal down line
line(105, 90, 125, 110);
//diagonal up line
line(110, 110, 120, 90);

//left barbell
//line
line(20, 130, 33, 129);
//left circle
fill(0, 0, 0);
ellipse(17, 131, 8, 8);
//right circle
ellipse(36, 129, 7, 7);

//right barbell
//line
line(130, 55, 130, 75);
//top circle
ellipse(129, 55, 7, 7);
//bottom circle
ellipse(130, 75, 8, 8);

//long diagonal line
//segment 1
line(0, 165, 45, 150);
//segment 2
line(46, 149, 116, 131);
//segment 3
line(125, 130, 155, 120);
//segment 4
line(165, 116, 185, 110);

//curve at bottom middle
noFill();
curve(16, 279, 40, 174, 101, 174, 15, 273);

//circles on long diagonal line
//reds
//first circle red top
fill(217, 101, 64);
bezier(5, 162, 0, 142, 27, 150, 17, 158);
//second circle red bottom
bezier(37, 150, 40, 156, 45, 156, 45, 149);
//third circle red bottom
bezier(117, 130, 120, 137, 140, 132, 128, 129);
//fourth circle red top
bezier(155, 120, 155, 110, 162, 111, 165, 117);

//blacks
fill(0, 0, 0);
//first circle black bottom
bezier(7, 162, 10, 164, 15, 163, 18, 158);








