
size(640, 480);
//background(148, 174, 209);
fill(255);
noStroke();
smooth();
strokeCap(SQUARE);

//bg up bottom
noStroke();
fill(234, 232, 194);
beginShape();
vertex(-1, 410);
vertex(-1, 344);
vertex(551, 244);
vertex(505, 424);
endShape();

//bg right side
fill(207, 216, 151);
quad(505, 424, 641, 422, 641, 117, 595, 77);

//purple circle
fill(0);
noStroke();
ellipse(485, 420, 206, 202);
fill(154, 157, 203);
ellipse(485, 420, 197, 193);
fill(240, 239, 237);
ellipse(485, 420, 182, 178);

//yellow circle
fill(0);
noStroke();
ellipse(698, 416, 206, 206);
fill(245, 192, 57);
ellipse(698, 416, 200, 200);
fill(240, 239, 237);
ellipse(698, 416, 193, 193);

fill(234, 232, 194);
//bg down bottom
quad(-1, 410, -1, 481, 641, 481, 641, 424);

//bg top right
triangle(506, -2, 641, -2, 641, 117);


//bg blue
fill(215, 230, 242);
beginShape();
vertex(-1, 344);
vertex(551, 241);
vertex(596, 77);
vertex(510, -2);
vertex(-2, -2);
endShape();

//rainbow 1
fill(237, 228, 163);
ellipse(155, 127, 117, 154);
fill(210, 181, 227);
ellipse(155, 127, 108, 145);
fill(240, 239, 237);
ellipse(155, 127, 96, 131);
fill (29, 31, 28);
ellipse(155, 127, 76, 111);
fill(43, 54, 39);
ellipse(155, 127, 72, 107);
fill(13, 15, 13);
ellipse(155, 127, 52, 87); 
fill(240, 239, 237);
ellipse(155, 127, 46, 81);

//rainbow 2
fill(247, 203, 80);
ellipse(313, 132, 117, 156);
fill(245, 235, 240);
ellipse(313, 132, 112, 147);
fill(240, 239, 237);
ellipse(313, 132, 102, 137);
fill(183, 176, 229);
stroke(65, 63, 80);
strokeWeight(.5);
ellipse(313, 132, 72, 107);
fill(240, 239, 237);
stroke(65, 63, 80);
strokeWeight(.5);
ellipse(313, 132, 57, 87);
fill(240, 239, 237);
stroke(32, 31, 39);
strokeWeight(1);
ellipse(313, 132, 37, 67);

//yellow outline
stroke(247, 203, 80);
strokeWeight(7);
strokeCap(ROUND);
line(-2, 113, 30, 33);
line(30, 33, 98, 95);
line(205, 87, 229, 53);
line(229, 53, 261, 86);

noStroke();
// 4 white quads
fill(255);
quad(470, -2, 510, -2, 100, 481, 25, 500);
quad(440, -2, 470, -2, 25, 500, -30, 470);
quad(-3, 450, -3, 410, 230, 55, 303, 135);
quad(-3, 410, -2, 125, 32, 38, 160, 160);

// black quads over white
fill(0);
noStroke();
quad(457, 12, 470, -2, 515, -2, 483, 35);
quad(445, -2, 410, 33, 428, 50, 459, 14);
quad(428, 50, 448, 70, 410, 117, 387, 94);
quad(250, 193, 275, 170, 297, 192, 277, 214);
quad(252, 244, 275, 214, 305, 241, 277, 270);
quad(205, 100, 230, 60, 305, 135, 275, 170);
quad(162, 164, 185, 131, 250, 193, 225, 218);
quad(-2, 130, 32, 38, 162, 164, 130, 213);
quad(11, 391, 53, 330, 88, 358, 32, 415);

//orange
fill(180, 93, 53);
quad(328, 159, 354, 186, 324, 215, 295, 190);

//dark green
fill(43, 54, 39);
quad(225, 218, 252, 244, 226, 271, 192, 250);

//blue
fill(122, 160, 209);
quad(130, 213, 192, 250, 151, 292, 96, 265);

//medium green
fill(94, 118, 78);
quad(-2, 210, 96, 265, 54, 331, -2, 280);

//pink
fill(250, 169, 169);
quad(190, 313, 225, 335, 260, 290, 226, 271);

//cream
fill(245, 241, 218);
quad(32, 415, 68, 446, 120, 387, 86, 360);

//light blue
fill(206, 225, 232);
quad(-2, 410, 11, 391, 32, 415, -2, 450);

//light green
fill(189, 203, 123);
triangle(40, 480, 68, 446, 102, 480);

//light orange
fill(180, 93, 53);
triangle(-2, 380, 11, 391, -2, 410);

// black lines over quads, left to right
stroke(0);
strokeWeight(5);
strokeCap(ROUND);
line(445, -2, 480, 34);
line(410, 30, 447, 70);
line(370, 74, 410, 117);
line(230, 57, 352, 185);
line(202, 100, 322, 216);
line(182, 130, 304, 241);
line(32, 38, 277, 270);
line(-2, 130, 260, 290);
line(-2, 210, 224, 334);
line(-2, 280, 156, 415);
line(-2, 380, 101, 481);

//black lines right to left
stroke(0);
line(-2, 130, 32, 38);
line(-2, 410, 230, 57);
line(442, -2, -2, 450);
line(470, -2, 40, 481);
line(100, 481, 511, -2);


//thick black
strokeWeight(15);
line(114, 329, 641, 225);

//thick red/black
stroke(0);
strokeWeight(15);
line(85, 429, 641, 263);

stroke(170, 21, 26);
strokeWeight(6);
line(85, 429, 641, 263);

stroke(0);
strokeWeight(5);
line(119, 416, 641, 424);
strokeWeight(6);
line(617, -2, 490, 482);
strokeWeight(5);
line(627, -2, 543, 120);
strokeWeight(4);
line(515, -2, 641, 117);


//bottom right circles
//fill(0);
//ellipse(245, 241, 210, 200);
stroke(0);
strokeWeight(3);
fill(250, 184, 184, 200);
ellipse(596, 505, 186, 146);
noStroke();
fill(255, 246, 214);
ellipse(596, 505, 172, 132);




