
void setup() {
  size(640, 480);
}
void draw() {
background(#f0fbf7);
smooth ();

//left line
stroke(#b5c0bc);
strokeWeight(3);
line(0,450,249,0);
noStroke();

//right line
stroke(#b5c0bc);
strokeWeight(3);
line(32,479,297,4);
noStroke();

//thick red rectangle upper left
beginShape();
smooth();
fill(#da001a);
stroke(#da001a);
rect(26,101,28,86);
endShape(CLOSE);

//little grey piece next to small black square
beginShape();
smooth();
fill(#a3a7c8);
stroke(#a3a7c8);
vertex(0,162);
vertex(4,162);
vertex(1.5,222);
vertex(0,222);
endShape(CLOSE);

//little black sqaure
beginShape();
smooth();
fill(#02010c);
stroke(#02010c);
vertex(9,175);
vertex(17,175);
vertex(17,183);
vertex(9,183);
endShape(CLOSE);

//large red shape located upper right
beginShape();
smooth();
fill(#da001a);
stroke(#da001a);
vertex(639,0);
vertex(639,55);
vertex(619,53);
vertex(618,75);
vertex(609,74);
vertex(609,87);
vertex(593,86);
vertex(593,90);
vertex(551,87);
vertex(551,79);
vertex(577,80);
vertex(577,72);
vertex(579,70);
vertex(498,64);
vertex(499,51);
vertex(344,36);
vertex(344,40);
vertex(326,39);
vertex(326,34);
vertex(315,33);
vertex(314,42);
vertex(294,40);
vertex(297,0);
endShape(CLOSE);

//large black shape located middle left
beginShape();
smooth();
fill(#02010c);
stroke(#02010c);
vertex(183,0);
vertex(222,83);
vertex(239,76);
vertex(258,118);
vertex(265,115);
vertex(282,152);
vertex(299,144);
vertex(304,154);
vertex(311,150);
vertex(315,159);
vertex(309,163);
vertex(311,169);
vertex(318,165);
vertex(337,203);
vertex(327,208);
vertex(336,228);
vertex(348,222);
vertex(363,255);
vertex(314,277);
vertex(312,271);
vertex(270,290);
vertex(257,264);
vertex(239,273);
vertex(234,263);
vertex(225,268);
vertex(219,256);
vertex(213,258);
vertex(194,220);
vertex(201,215);
vertex(213,238);
vertex(220,234);
vertex(187,163);
vertex(201,153);
vertex(137,15);
vertex(131,17);
vertex(123,0);
endShape(CLOSE);

//blue rectangle middle left on first line
beginShape();
smooth();
fill(#2f486d);
stroke(#2f486d);
vertex(90,206);
vertex(158,176);
vertex(166,194);
vertex(99,225);
endShape(CLOSE);

//upper left most point black number1  
beginShape();
smooth();
fill(#02010c);
stroke(#02010c);
quad(0,1,20,25,11,33,0,18);

//upper left triangle number2
smooth();
fill(#334863);
stroke(#334863);
triangle(0,18,18,40,0,57);

//upper left black rectangle under triangle number3
smooth();
fill(#02010c);
stroke(#02010c);
quad(0,59,19,42,25,50,0,70);

//upper left L shape number6
beginShape();
smooth();
fill(#718baa);
stroke(#718baa);
vertex(30,46);
vertex(35,43);
vertex(55,69);
vertex(16,100);
vertex(12,94);
vertex(41,71);
vertex(30,53);
vertex(35,53);
vertex(31,46);
endShape(CLOSE);

//upper left dark thin blue rectangle number4
smooth();
fill(#334863);
stroke(#334863);
quad(0,71,30,46,35,53,0,83);

//upper left blue rectangle number5
smooth();
fill(#4c6197);
stroke(#4c6197);
quad(0,83,33,58,41,70,0,104);

//middle left black rectangle with red stripe and blue square
beginShape();
smooth();
fill(#1b1d32);
stroke(#1b1d32);
vertex(57,154);
vertex(74,138);
vertex(86,152);
vertex(60,174);
vertex(57,169);
vertex(57,154);
endShape();

//red stripe in rectangle
smooth();
fill(#da001a);
stroke(#da001a);
quad(65,147,66,146,77,159,76,160);

//blue square
beginShape();
smooth();
fill(#6682b5);
stroke(#6682b5);
vertex(57,164);
vertex(62,159);
vertex(69,167);
vertex(60,174);
vertex(57,169);
vertex(57,163);
endShape(CLOSE);

//black square with red thin line
smooth();
fill(#1b1d32);
stroke(#1b1d32);
rect(53,220,19,19);

//thin red line in black square
smooth();
fill(#da001a);
stroke(#da001a);
rect(67,228,9,1);

//rectangles and squares clockwise starting with red tiny square number1
smooth();
fill(#c60016);
stroke(#c60016);
rect(90,269,9,9);

//clockwise red rectangle number3
smooth();
fill(#da001a);
stroke(#da001a);
rect(69,325,79,13);

//clockwise black thin rectangle number2
smooth();
stroke(#02010c);
fill(#02010c);
quad(113,277,119,275,132,325,127,326);

//clockwise big black rectangle number4
smooth();
fill(#02010c);
stroke(#02010c);
quad(123,385,236,348,246,379,133,414);

//clockwise tiny red rectangle number5
smooth();
fill(#da001a);
stroke(#da001a);
quad(103,368,113,364,116,371,106,375);

//clockwise blue rectangle on second line number6
smooth(); 
fill(#7d8db5);
stroke(#7d8db5);
quad(69,361,80,357,101,408,90,413);

//clockwise red rectangle on second line number7
smooth();
fill(#da001a);
stroke(#da001a);
rect(63,404,9,15);

//clockwise tiny blue square in tiny red rectangle on second line
smooth();
fill(#000011);
stroke(#000011);
rect(63,409,7,5);

//clockwise large darker blue rectangle on first line number8
beginShape();
smooth();
fill(#2f486d);
stroke(#2f486d);
vertex(0,397);
vertex(19,372);
vertex(45,393);
vertex(19,429);
vertex(0,415);
vertex(0,397);
endShape(CLOSE);

//clockwise dark thin blue rectangle number9
smooth();
fill(#222b44);
stroke(#222b44);
quad(2,331,39,351,35,359,0,339);

//clockwise black thin rectangle number10
smooth();
fill(#02010c);
stroke(#02010c);
quad(0,285,104,290,104,298,0,293);

//tiny black square middle bottom
smooth();
fill(#02010c);
stroke(#02010c);
quad(260,361,265,353,272,357,268,365);

//red rectangle middle bottom
smooth();
fill(#da001a);
stroke(#da001a);
quad(287,334,298,341,260,405,249,397);

//blue rectangle middle bottom
smooth();
fill(#2f486d);
stroke(#2f486d);
quad(310,325,334,339,275,440,250,425);


}


