
size(640,360);
smooth();
noStroke();
background(229,221,200);

int z=0;
int h=100;

//red bottom-left corner
fill(224,36,38);
quad(0,236, 54,205, 76,360, 0,360);

//top-right black rect
fill(36,32,33);
beginShape();
vertex(496, 17);
vertex(522, 11);
vertex(520, z);
vertex(547, z);
vertex(556, 35);
vertex(503, 48);
endShape(CLOSE);

//START 3D-T
int s= z+6;
//"top" plane
fill(173,149,140);
beginShape();
vertex(63, s);
vertex(67, z);
vertex(h+4, z);
vertex(130, h+7);
vertex(175, h-4);
vertex(184, 126);
vertex(130, 201);
endShape(CLOSE);

//black "top"
int hhalf= h/2-5;

fill(59,51,43);
quad(h/2,z, 67,z, 63,s, hhalf,s);

//yellow "T" plane
fill(226,209,126);
stroke(194,186,154);
strokeWeight(.75);
beginShape();
vertex(hhalf,s);
vertex(63, s);
vertex(130, 201);
vertex(116, 201);
vertex(h-4, 146);
vertex(20, 162);
vertex(17, 153);
vertex(h-8, 137);
endShape(CLOSE);

//"brown" triangle
fill(74,64,54);
noStroke();
triangle(71,79, 92,137, 17,153);
//END 3D-T

//blue rect
fill(109,155,204);
quad(h+3,z, 130,h+8, 522,11, 520,z);

//"black" line
noFill();
stroke(47,43,42);
strokeWeight(12);
strokeCap(PROJECT);
line(228,0, 310, height);

//"clear" line-rect
fill(229,221,200, 230);
stroke(188,176,143);
strokeWeight(.75);
quad(194,z, 207,z, 284,331, 272,333);

//"red" line-rect
fill(224,36,38, 230);
noStroke();
quad(188,z, 195,z, 272,334, 265,335);

//START small red and beige bar
//long beige rect
fill(229,221,200);
stroke(188,176,143);
strokeWeight(.75);
quad(146,133, 152,129, 185,254, 180,259);

//beige square
fill(229,221,200);
stroke(188,176,143);
strokeWeight(.75);
quad(147,128, 152,129, 149,133, 144,134);

//long red rect
fill(224,36,38, 230);
noStroke();
quad(144,135, 148,134, 180,260, 176,259);
//END small bar

//START off-center short bar
//black square
fill(36,32,33);
quad(337,227, 349,226, 345,235, 333,236);

//beige rect
fill(229,221,200);
stroke(188,176,143);
strokeWeight(.75);
quad(345,235, 349,226, 373,height, 366,height);

//red rect
fill(224,36,38, 230);
noStroke();
quad(333,236, 345,235, 366,height, 352,height);
//END off-center

//START plank
//beige side
fill(225,206,151);
quad(414,height, 478,282, 493,326, 466,height);

//black top
fill(61,55,47);
quad(478,282, 486,283, 501,326, 493,326);

//brown side
fill(163,132,68);
quad(493,326, 501,326, 476,height, 466,height);

//arcs
//blue
noFill();
stroke(109,155,204);
strokeWeight(80);
strokeCap(SQUARE);
arc(565,-35, 490,450, radians(100), radians(145));

//gray
noFill();
stroke(202,199,181);
strokeWeight(63);
strokeCap(SQUARE);
arc(630,-40, 630,450, radians(95), radians(138));

//red
noFill();
stroke(219,37,32);
strokeWeight(60);
strokeCap(SQUARE);
arc(630,-75, 630,450, radians(115), radians(270));

