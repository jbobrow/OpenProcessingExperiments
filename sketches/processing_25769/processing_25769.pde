
size(1200, 800);
smooth();
background(#FFFFFF);

//COLOR HEX CODES
//0099CC = grey blue
//6699FF = blue
//99FFCC = green
//CCCCCC = light grey
//FFFFCC = yellow
//FF9966 = peach
//CCFF33 = light green
//FF6699 = peach pink


// BEGIN RECTANGLE BACKGROUND - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//fill(#color, transparency)
//stroke(#color,transparency)
//rect(x, y, width, height)

fill(#CCCCCC, 100);
stroke(#000000, 0);
rect(0, 0, 100, 800);

fill(#0099CC, 50);
stroke(#000000, 0);
rect(100, 0, 160, 800);

fill(#CCFF33, 70);
stroke(#000000, 0);
rect(260, 0, 200, 800);

fill(#000000, 20);
stroke(#000000, 0);
rect(460, 0, 60, 800);

fill(#FF9966, 90);
stroke(#000000, 0);
rect(520, 0, 280, 800);

fill(#CCFF33, 0);
stroke(#000000, 0);
rect(800, 0, 60, 800);

fill(#0099CC, 50);
stroke(#000000, 0);
rect(830, 0, 200, 800);

fill(#99FFCC, 80);
stroke(#000000, 0);
rect(1030, 0, 200, 800);

//END RECTANGLE BACKGROUND- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

//BEGIN MIDDLE CIRCLE - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//fill (#hexcode, transparency)
//stroke (#hexcode, transparency)
//ellipse(x, y, width, height)


fill (#FFFF77);
stroke (#CCBB22, 60);
ellipse(600, 400, 70, 70);

fill (#66CC77, 70);
stroke (#66AABB, 0);
ellipse(598, 398, 30, 30);

fill (#66BBCC, 40);
stroke (#66AABB, 0);
ellipse(600, 400, 30, 30);

fill (#FFFFCC, 0);
stroke (#CC7799, 100);
ellipse(598, 397, 70, 70);

fill (#99FFCC, 70);
stroke (#66AABB, 0);
ellipse(602, 401, 30, 30);

fill (#FFFFCC, 0);
stroke (#99AADD, 100);
ellipse(602, 397, 70, 70);

fill (#FFFFCC, 0);
stroke (#99DD44, 100);
ellipse(604, 397, 70, 70);

fill (#FFFFCC, 0);
stroke (#FF0099, 90);
ellipse(601, 398, 70, 70);

fill (#FFFFCC, 0);
stroke (#99FFFF, 100);
ellipse(601, 402, 70, 70);

//END MIDDLE CIRCLE - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

//BEGIN TRIANGLES - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//            /2\
//           /   \
//          1_____3
//fill(#color, transparency)
//stroke(#color,transparency)
//triangle(x1, y1, x2, y2, x3, y3);

//left
fill(#CC1177, 100);
stroke(#FFFFFF,0);
triangle(500, 400, 570, 380, 570, 420);

//right
fill(#CC1177, 100);
stroke(#FFFFFF,0);
triangle(633, 420, 633, 380, 701, 400);

//up
fill(#CC1177, 100);
stroke(#FFFFFF,0);
triangle(580, 368, 600, 297, 618, 370);

//down
fill(#CC1177, 100);
stroke(#FFFFFF,0);
triangle(580, 430, 600, 500, 618, 430);

//END TRIANGLES - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

//BEGIN CIRCLES LEFT - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//fill (#hexcode, transparency)
//stroke (#hexcode, transparency)
//ellipse(x, y, width, height)


fill (#66AACC, 100);
stroke (#FFFFFF, 0);
ellipse(540, 400, 40, 40);

fill (#66FF66, 100);
stroke (#FFFFFF, 0);
ellipse(520, 400, 50, 50);

fill (#FF5577, 100);
stroke (#FFFFFF, 0);
ellipse(500, 400, 60, 60);

fill (#9988CC, 100);
stroke (#FFFFFF, 0);
ellipse(450, 400, 80, 80);

//MIDDLE
fill (#00DDFF, 100);
stroke (#FFFFFF, 0);
ellipse(380, 400, 100, 100);

fill (#9988CC, 100);
stroke (#FFFFFF, 0);
ellipse(310, 400, 80, 80);

fill (#FF5577, 100);
stroke (#FFFFFF, 0);
ellipse(260, 400, 60, 60);

fill (#66FF66, 100);
stroke (#FFFFFF, 0);
ellipse(220, 400, 50, 50);

fill (#66AACC, 100);
stroke (#FFFFFF, 0);
ellipse(190, 400, 40, 40);

//END CIRCLES LEFT - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


//BEGIN CIRCLES RIGHT - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//fill (#hexcode, transparency)
//stroke (#hexcode, transparency)
//ellipse(x, y, width, height)


fill (#66AACC, 100);
stroke (#FFFFFF, 0);
ellipse(665, 400, 40, 40);

fill (#66FF66, 100);
stroke (#FFFFFF, 0);
ellipse(685, 400, 50, 50);

fill (#FF5577, 100);
stroke (#FFFFFF, 0);
ellipse(705, 400, 60, 60);

fill (#9988CC, 100);
stroke (#FFFFFF, 0);
ellipse(755, 400, 80, 80);

//MIDDLE
fill (#00DDFF, 100);
stroke (#FFFFFF, 0);
ellipse(825, 400, 100, 100);

fill (#9988CC, 100);
stroke (#FFFFFF, 0);
ellipse(895, 400, 80, 80);

fill (#FF5577, 100);
stroke (#FFFFFF, 0);
ellipse(945, 400, 60, 60);

fill (#66FF66, 100);
stroke (#FFFFFF, 0);
ellipse(985, 400, 50, 50);

fill (#66AACC, 100);
stroke (#FFFFFF, 0);
ellipse(1015, 400, 40, 40);

//END CIRCLES RIGHT - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

