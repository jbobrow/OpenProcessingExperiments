
/*Kandinsky
 by Mickey Goese
 */

// Variables
//checkerboard


int L1X1 = 499;
int L1Y1 = 4;
int L1X2 = L1X1 + 89;
int L1Y2 = L1Y1 - 54;
int L2X1 = 509;
int L2Y1 = 2;
int L2X2 = L2X1 + 27;
int L2Y2 = L2Y1 + 45;
//right rings
int C1X1 = 469;
int C1Y1 = 287;

//racket
int x1 = 75;
int y1 = 184;
int x2 = 63;
int y2 = 221;
int x3 = 134;
int y3 = 210;
int x4 = 127;
int y4 = 237;

float s1 = .167;
float s2 = .091;


size(640, 480);
smooth();

L1X1 = 499;
L1Y1 = 4;
L1X2 = L1X1 + 89;
L1Y2 = L1Y1 - 54;
L2X1 = 509;
L2Y1 = 2;
L2X2 = L2X1 + 27;
L2Y2 = L2Y1 + 45;
background(238, 231, 219);


// -------------------------------------Checkerboard
//Vertical lines
strokeCap(ROUND);
stroke(27, 24, 29);
strokeWeight(7);
line(L1X1, L1Y1, L1X2, L1Y2);
line(L1X1, L1Y1, L1X1 + 141, L1Y1 + 230);
L1X1 = 560;
L1Y1 = -2;
strokeWeight(6);
line(L1X1, L1Y1, L1X1 + 141, L1Y1 + 230);
L1X1 = 617;
L1Y1 = -2;
strokeWeight(9);
line(L1X1, L1Y1, L1X1 + 141, L1Y1 + 230);
//horizontal lines
L1X1 = 528;
L1Y1 = 54;
L1X2 = L1X1 + 89;
L1Y2 = L1Y1 - 54;
strokeWeight(7);
line(L1X1, L1Y1, L1X2, L1Y2);
L1X1 = 557;
L1Y1 = 97;
L1X2 = L1X1 + 89;
L1Y2 = L1Y1 - 54;
strokeWeight(6);
line(L1X1, L1Y1, L1X2, L1Y2);
//black square
fill(27, 24, 29);
quad(L1X1, L1Y1, L1X1 + 45, L1Y1 - 25, L1X1 + 70, L1Y1 + 18, L1X1 + 28, L1Y1 + 45);
L1X1 = 633;
L1Y1 = 116;
quad(L1X1, L1Y1, L1X1 + 45, L1Y1 - 25, L1X1 + 70, L1Y1 + 18, L1X1 + 28, L1Y1 + 45);
noFill();
L1X1 = 587;
L1Y1 = 145;
L1X2 = L1X1 + 89;
L1Y2 = L1Y1 - 54;
strokeWeight(6);
line(L1X1, L1Y1, L1X2, L1Y2);
L1X1 = 617;
L1Y1 = 195;
L1X2 = L1X1 + 89;
L1Y2 = L1Y1 - 54;
line(L1X1, L1Y1, L1X2, L1Y2);

//6 small lines
strokeWeight(5);
line(L2X1, L2Y1, L2X2, L2Y2);
L2X1 = L2X1 + 6;
L2Y1 = L2Y1 - 4;
L2X2 = L2X1 + 27;
L2Y2 = L2Y1 + 45;
line(L2X1, L2Y1, L2X2, L2Y2);
L2X1 = L2X1 + 7;
L2Y1 = L2Y1 - 4;
L2X2 = L2X1 + 27;
L2Y2 = L2Y1 + 45;
line(L2X1, L2Y1, L2X2, L2Y2);
L2X1 = L2X1 + 7;
L2Y1 = L2Y1 - 4;
L2X2 = L2X1 + 27;
L2Y2 = L2Y1 + 45;
line(L2X1, L2Y1, L2X2, L2Y2);
L2X1 = L2X1 + 6;
L2Y1 = L2Y1 - 4;
L2X2 = L2X1 + 27;
L2Y2 = L2Y1 + 45;
line(L2X1, L2Y1, L2X2, L2Y2);
L2X1 = L2X1 + 6;
L2Y1 = L2Y1 - 4;
L2X2 = L2X1 + 27;
L2Y2 = L2Y1 + 45;
line(L2X1, L2Y1, L2X2, L2Y2);

//dots
strokeWeight(5);
point(585, 24);
point(594, 18);
point(590, 26);
point(585, 30);
point(589, 34);
point(590, 41);
point(596, 23);
point(596, 29);
point(597, 34);
point(602, 39);
point(601, 46);
point(602, 51);
point(612, 46);
point(611, 52);
point(617, 49);
point(621, 44);
point(595, 44);
point(606, 56);
point(600, 58);
point(596, 52);
point(605, 62);
point(614, 57);
point(594, 36);
point(608, 40);
point(603, 31);
point(615, 40);
point(607, 35);
point(603, 24);
point(611, 23);
point(607, 27);
point(617, 24);
point(613, 30);
point(627, 48);
point(622, 54);
point(600, 15);
point(609, 20);
point(617, 9);
point(612, 4);
point(609, 12);
point(603, 15);
point(616, 17);
point(620, 19);
point(617, 34);
point(622, 30);
point(624, 35);
point(632, 43);
point(632, 36);
point(625, 43);
point(630, 30);
point(626, 26);
point(639, 43);





//right rings
//center 469, 289

strokeWeight(10);
stroke(201, 93, 67);
ellipse(C1X1, C1Y1+3, 255, 255);
stroke(234, 186, 45);
ellipse(C1X1, C1Y1, 165, 165);
strokeWeight(1);
stroke(27, 24, 29);
fill(216, 220, 232);
ellipse(C1X1, C1Y1, 154, 154);

//top X
strokeWeight(3);
stroke(128, 137, 79);
fill(128, 137, 79);
quad(220, 0, 253, 0, 576, 188, 535, 169);
stroke(230, 187, 24);
strokeCap(SQUARE);
strokeWeight(10);
line(358, -6, 141, 151);
stroke(27, 24, 29);
strokeWeight(7);
line(345, -4, 140, 148);
strokeCap(ROUND);
strokeWeight(3);
fill(27, 24, 29);
triangle(238, 0, 557, 175, 261, 0);

//giant triangle
noStroke();
fill(49, 81, 74);
quad(354, 107, 594, 480, 405, 480, 311, 138);
fill(180, 126, 62);
quad(311, 138, 405, 480, 0, 480, 0, 349);
strokeWeight(7);
stroke(27, 24, 29);
line(405, 480, 271, 0);

//big circle------------------------
fill(27, 24, 29);
ellipse(286, 297, 210, 210);
//arcs
strokeCap(SQUARE);
strokeWeight(15);
stroke(39, 84, 162);
arc(286, 297, 190, 190, 4.51, 5);
arc(286, 297, 190, 190, 4.1, 4.305);
arc(286, 297, 190, 190, 1, PI/2);
arc(286, 297, 190, 190, 2.05, 2.54);

stroke(210);
arc(286, 297, 190, 190, 1.615, 1.66);
arc(286, 297, 190, 190, 1.719, 1.77);
arc(286, 297, 190, 190, 1.83, 1.87);
arc(286, 297, 190, 190, 1.94, 1.983);

arc(286, 297, 190, 190, 4.35, 4.38);
arc(286, 297, 190, 190, 4.43, 4.46);

stroke(237, 208, 100);
arc(286, 297, 190, 190, 2.89, 3.28);
arc(286, 297, 190, 190, 5.75, 5.9);
stroke(93, 124, 186);
arc(286, 297, 190, 190, 6.1, 6.52);
stroke(27, 24, 29);
strokeWeight(3);
fill(220, 220, 226);
ellipse(286, 297, 170, 170);

fill(27, 24, 29);
ellipse(300, 291, 31, 31);




//top left-----arcs and lines
noFill();
stroke(205, 69, 72);
strokeWeight(8);
line(-2, 5, 15, -5);
strokeWeight(6);
fill(205, 69, 72);
arc(181, 90, 178, 178, 2.48, 5.58);
noFill();
strokeWeight(10);
arc(317, -21, 178, 178, 2.48, 5.58);
strokeWeight(4);
stroke(27, 24, 29);
line(166, -2, 43, 107);
stroke(205, 69, 72);
strokeWeight(12);
arc(44, 213, 200, 200, 2.48, 5.53);
stroke(27, 24, 29);
fill(238, 231, 219);
strokeWeight(9);
arc(185, 92, 165, 165, 2.48, 5.53);
strokeWeight(4);

arc(44, 212, 195, 195, 2.48, 5.53);

line(238, -2, -1, 220);

line(-2, 10, 20, -2);


//clock hands
strokeWeight(3);
fill(240, 239, 245);
stroke(240, 239, 245);
triangle(319, 253, 430, 145, 417, 133);
triangle(267, 274, 153, 245, 159, 221);
triangle(330, 320, 431, 451, 444, 441);


fill(213, 67, 46);
stroke(213, 67, 46);
triangle(319, 253, 350, 215, 355, 220);
quad(378, 180, 386, 189, 430, 145, 417, 135);

triangle(267, 274, 201, 241, 193, 256);
quad(153, 245, 159, 223, 147, 217, 141, 241);

triangle(330, 320, 371, 362, 366, 369);
quad(485, 485, 645, 362, 645, 329, 446, 485);
noStroke();
fill(218, 188, 73);
quad(433, 456, 448, 444, 470, 469, 451, 480);


fill(220, 220, 226);
ellipse(276, 280, 20, 20);

noFill();
stroke(27, 24, 29);
strokeWeight(5);
line(166, 225, 161, 249);
strokeWeight(4);
line(174, 228, 169, 251);
line(181, 230, 176, 251);
//-----racket
strokeWeight(3);
noFill();
quad(x1, y1, x2, y2, x4, y4, x3, y3);

strokeWeight(2);
s1 = .167;
line(lerp(x1, x2, s1), lerp(y1, y2, s1), lerp(x3, x4, s1), lerp(y3, y4, s1));
s1 += .167;
line(lerp(x1, x2, s1), lerp(y1, y2, s1), lerp(x3, x4, s1), lerp(y3, y4, s1));
s1 += .167;
line(lerp(x1, x2, s1), lerp(y1, y2, s1), lerp(x3, x4, s1), lerp(y3, y4, s1));
s1 += .167;
line(lerp(x1, x2, s1), lerp(y1, y2, s1), lerp(x3, x4, s1), lerp(y3, y4, s1));
s1 += .18;
line(lerp(x1, x2, s1), lerp(y1, y2, s1), lerp(x3, x4, s1), lerp(y3, y4, s1));

s2 = .091;
line(lerp(x1, x3, s2), lerp(y1, y3, s2), lerp(x2, x4, s2), lerp(y2, y4, s2));
s2 += .091;
line(lerp(x1, x3, s2), lerp(y1, y3, s2), lerp(x2, x4, s2), lerp(y2, y4, s2));
s2 += .091;
line(lerp(x1, x3, s2), lerp(y1, y3, s2), lerp(x2, x4, s2), lerp(y2, y4, s2));
s2 += .091;
line(lerp(x1, x3, s2), lerp(y1, y3, s2), lerp(x2, x4, s2), lerp(y2, y4, s2));
s2 += .091;
line(lerp(x1, x3, s2), lerp(y1, y3, s2), lerp(x2, x4, s2), lerp(y2, y4, s2));
s2 += .091;
line(lerp(x1, x3, s2), lerp(y1, y3, s2), lerp(x2, x4, s2), lerp(y2, y4, s2));
s2 += .091;
line(lerp(x1, x3, s2), lerp(y1, y3, s2), lerp(x2, x4, s2), lerp(y2, y4, s2));
s2 += .091;
line(lerp(x1, x3, s2), lerp(y1, y3, s2), lerp(x2, x4, s2), lerp(y2, y4, s2));
s2 += .091;
line(lerp(x1, x3, s2), lerp(y1, y3, s2), lerp(x2, x4, s2), lerp(y2, y4, s2));
s2 += .091;
line(lerp(x1, x3, s2), lerp(y1, y3, s2), lerp(x2, x4, s2), lerp(y2, y4, s2)); 

strokeWeight(7);
arc(286, 297, 210, 210, .8, 6.8);
fill(27, 24, 29);
line(409, 425, 422, 415);
strokeWeight(3);
quad(430, 119, 445, 129, 512, 59, 493, 36);

strokeWeight(10);
line(420, 440, 435, 428);
line(433, 456, 448, 444);


//bottom right and left lines
line(485, 485, 645, 362);
strokeWeight(7);
line(446, 485, 645, 325);
strokeWeight(18);
line(595, 336, 650, 352);
line(94, 462, -5, 480);

//right circle
noStroke();
ellipse(469, 289, 71, 71);
fill(233, 234, 238);
arc(469, 289, 65, 65, .97, 4.18);







