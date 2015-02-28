
size(640, 360);
smooth();
background(227, 220, 200);
noStroke();
fill(237, 42, 29);
//red quad in back
quad(0,0, 0, 150, 280, 70, 340, 0);
fill(0);
//black circle
ellipse(480, 280, 655, 655);
//red side of block
fill(237, 42, 29);
quad(320, 103,  370, 125,   250, 420,    185, 420);
//gray box in bottom right corner
fill(173, 179, 170);
triangle(400, 370, 650, 318, 650, 360);
fill(227, 220, 200);
//larger white side of box
quad(370, 125,   480, 80,   360, 360,  263, 360);
//top side of box
quad(320, 103, 428, 59, 480, 80, 370, 125);
//white top of box in top right corner
fill(229, 198, 102);
quad(82, 345,  510, 245,  550, 416,  100, 460);
//red bottom of box in right corner
fill(229, 28, 26);
quad(507, 50, 515, 58, 683, 25, 659, -8);
//yellow box
fill(215, 215, 206);
quad(500, 14, 507, 50, 675, 17, 651, -16);

