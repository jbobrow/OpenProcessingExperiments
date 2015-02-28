
//Pauline Woo
//01/19/2012
size(640, 360);
background(227, 220, 201);
smooth();

//RED
int r1 = 217;
int r2 = 44;
int r3 = 40;

//GREY LINES
int g = 150;

//grey quad
noStroke();
fill(220, 213, 194);
quad(130, 0,  240, 0,  240, 6,  102, 39);

//line
stroke(g);
line(130, 0, 102, 39);

//dark blue rectangle
noStroke();
fill(39, 53, 82);
quad(240, 6,  249, 44,  113, 78,  102, 39);

//brown quad
noStroke();
fill(173, 145, 141);
quad(533, 169,  579, 200,  width, 180,  width, 142);

//dar grey side
noStroke();
fill(64, 60, 59);
quad(515, 173,  579, 218,  579, 200,  533, 169);

//yellow side
noStroke();
fill(225, 213, 153);
quad(579, 200,  579, 218,  width, 196,  width, 180);
//line
stroke(g);
line(width, 196,  579, 218);

//blue rectangle
noStroke();
fill(101, 146, 187);
quad(height*.66, 0,  width, 0,  width, 143,  288, 230);

//red rectangle
noStroke();
fill(r1, r2, r3);
quad(420, 0,  443, 89,  0, 201,  0, 106);

//skinny black rectangle
noStroke();
fill(32, 32, 32);
quad(496, 50,  width, 18,  width, 30,  500, 62);

//almost black ellipse
noStroke();
fill(40, 44, 41);
ellipse(324, 218,  260, 260);

//skinny white rectangle
noStroke();
fill(211, 211, 211);
quad(323, 117,  326, 129,  width, 56, width, 43);

//skinny red stripe
noStroke();
fill(r1, r2, r3);
quad(327, 129,  328, 133,  width, 61, width, 56);

//red side of white block
noStroke();
fill(r1, r2, r3);
quad(255, 145,  271, 153,  189, height,  167, height);

//white block side
noStroke();
fill(227, 220, 202);
quad(271, 153,  310, 139, 222, height,  189, height);

//lines
stroke(g);
line(310, 139,  222, height);
line(310, 139,  271, 153);

//whiteblocktop
noStroke();
fill(227, 220, 202);
quad(255, 145,  271, 153,  310, 139,  292, 130);

//grey rectangle
noStroke();
fill(177, 177, 175);
quad(143, 274,  383, 217, 391, 244,  150, 300);

//yellow L shape
noStroke();
fill(225, 195, 85);
beginShape();
vertex(175, 233);
vertex(324, 199);
vertex(341, 265);
vertex(306, 273);
vertex(297, 238);
vertex(182, 265);
endShape();



