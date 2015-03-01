
//canvas size set
size(550, 778);
background(255, 255, 255);
smooth();

// background image inserted

PImage img;
img = loadImage("background.gif");
background(img);

// Typo area
// T
fill(0);
beginShape();
vertex(20, 21);
vertex(48, 21);
vertex(48, 30);
vertex(40, 30);
vertex(40, 56);
vertex(29, 56);
vertex(29, 56);
vertex(29, 30);
vertex(20, 30);
endShape(CLOSE);

//Y
beginShape();
vertex(68, 21);
vertex(81, 21);
vertex(88, 32);
vertex(94, 21);
vertex(105, 21);
vertex(93, 41);
vertex(93, 56);
vertex(81, 56);
vertex(81, 41);
vertex(68, 21);
endShape();

//P
beginShape();
vertex(138, 43);
vertex(138, 56);
vertex(126, 56);
vertex(126, 21);
vertex(148, 21);
vertex(148, 43);
endShape(CLOSE);
arc(148, 32, 22, 22, PI+HALF_PI, HALF_PI+TWO_PI, CHORD);

fill(255);
beginShape();
vertex(138, 27);
vertex(144, 27);
vertex(144, 37);
vertex(138, 37);
endShape(CLOSE);
arc(144, 32, 14, 10, PI+HALF_PI, TWO_PI+HALF_PI);

//O
fill(0);
ellipse(198, 38, 36, 36);
fill(255);
ellipse(198, 38, 14, 20);

//J
fill(0);
beginShape();
vertex(248, 21);
vertex(260, 21);
vertex(260, 49);
vertex(245, 57);
vertex(240, 57);
vertex(240, 48);
vertex(245, 48);
vertex(248, 45);

endShape(CLOSE);
arc(245, 49, 30, 16, 0, HALF_PI);

fill(255);
arc(245, 45, 6, 6, 0, HALF_PI);


//A
fill(0);
beginShape();
vertex(293, 21);
vertex(306, 21);
vertex(318, 56);
vertex(307, 56);
vertex(304, 49);
vertex(294, 49);
vertex(291, 56);
vertex(281, 56);
endShape(CLOSE);

fill(255);
beginShape();
vertex(299, 32);
vertex(302, 42);
vertex(295, 42);
endShape(CLOSE);

//N
fill(0);
beginShape();
vertex(341, 21);
vertex(353, 21);
vertex(365, 39);
vertex(365, 21);
vertex(374, 21);
vertex(374, 56);
vertex(365, 56);
vertex(351, 35);
vertex(351, 56);
vertex(341, 56);
vertex(341, 21);
endShape(CLOSE);

//C
fill(0);
ellipse(416, 38, 36, 36);
fill(255);
ellipse(416, 38, 14, 20);

fill(255);
noStroke();
beginShape();
vertex(420, 35);
vertex(440, 35);
vertex(440, 43);
vertex(420, 43);
endShape(CLOSE);

//H
fill(0);
beginShape();
vertex(456, 21);
vertex(468, 21);
vertex(468, 34);
vertex(477, 34);
vertex(477, 21);
vertex(489, 21);
vertex(489, 56);
vertex(477, 56);
vertex(477, 43);
vertex(468, 43);
vertex(468, 43);
vertex(468, 56);
vertex(456, 56);
endShape(CLOSE);


//I
beginShape();
vertex(514, 21);
vertex(527, 21);
vertex(527, 56);
vertex(514, 56);
endShape(CLOSE);

// this is the main shape in center.
// 'di geut' shape
noStroke();
fill(17, 41, 142);
beginShape();
vertex(2, 395);
vertex(274, 122);
vertex(342, 191);
vertex(138, 395);
vertex(274, 531);
vertex(479, 327);
vertex(548, 395);
vertex(274, 668);
endShape(CLOSE);

// 'gi aeok' shape
noStroke();
fill(188, 22, 38);
beginShape();
vertex(206, 327);
vertex(342, 191);
vertex(479, 327);
vertex(411, 395);
vertex(342, 327);
vertex(274, 395);
endShape(CLOSE);

// 'ni eun' shape
noStroke();
fill(226, 220, 10);
beginShape();
vertex(206, 327);
vertex(274, 395);
vertex(342, 327);
vertex(411, 395);
vertex(274, 531);
vertex(138, 395);
endShape(CLOSE);


