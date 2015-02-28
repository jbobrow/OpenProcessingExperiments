
size (500, 370);
smooth ();
background(255);


//Declare variables here

//mouth variable 
int mx;
int my;
mx = 150;
my = 210;

int mouthw;
int mouthh;
mouthw = 40;
mouthh = 20;

//music notes variables
int x1;
int y1;
x1 = 40;
y1 = 260;

int x2;
int y2;
x2 = 300;
y2 = 60;

int x3;
int y3;
x3 = 440;
y3 = 90;


//Draw code below here

PImage img;
img = loadImage ("dancing carrot.jpg");
image (img, 270, 135, 205, 205);

//horizon
strokeWeight (3);
stroke (77, 42, 9, 100);
line (20,338, 479,338);

//leaves 
noFill ();
strokeCap (SQUARE);
stroke (168, 209, 8);
strokeWeight (10);
arc (45, 160, 175, 175, radians(270), radians(340));
stroke (85,152,15);
strokeWeight (19);
arc (389, 160, 500, 500, radians(180), radians(210));
stroke (108, 201, 10);
strokeWeight (15);
arc (-100, 160, 475, 475, radians(320), radians(360));
stroke (168,209,8);
strokeWeight (12);
arc (235, 160, 175, 175, radians(200), radians(260));

//hands
noFill ();
stroke (72, 30, 5);
strokeWeight (7);
arc (148, 160, 130, 130, radians(0), radians(60));
arc (124, 166, 130, 130, radians(85), radians(145));

//legs
strokeWeight (5);
arc (173, 328, 55, 55, radians(170), radians(240));
arc (163, 280, 55, 55, radians(0), radians(70));

//feet
strokeWeight (2);
stroke (0);
fill (175, 98, 25);
ellipse (146,333, 12, 7);
ellipse (190,278, 12, 7);


//body-triangle
fill (255, 95, 3);
stroke (72, 30, 5, 200);
strokeWeight (3);
strokeJoin (ROUND);
triangle (90, 135, 190, 120, 170, 330);

stroke (72, 30, 5, 100);
line (115, 190, 180, 181);
line (127, 215, 177, 208);
line (137, 235, 174, 230);
line (145, 255, 172, 252);
line (155, 278, 169, 277);

//eyes-circles
fill (255);
stroke (0);
ellipse (120,170, 50, 50);
ellipse (170,160, 50, 50);

noStroke ();
fill(0);
ellipse (132,170, 10, 10);
ellipse (158,165, 10, 10);

quad (75, 150, 106,113, 116,125, 78, 153);
quad (175, 105, 208,127,205,131, 168, 118);

//mouth
fill (240, 195, 15);
stroke (72, 30, 5, 200);
ellipse (mx,my, mouthw, mouthh);
noFill ();
strokeWeight (4);
stroke (240, 63, 15);
ellipse (mx,my, mouthw-10, mouthh-10);

//music notes
stroke (0);
strokeWeight (7);
line (x2, y2, x2+40, y2+10);
strokeWeight (3);
line (x2+1, y2+11, x2+38, y2+20);
strokeWeight (4);
line (x2+1, y2-2, x2-5, y2+35);
line (x2+38, y2+10, x2+31, y2+44);
fill (0);
noStroke();
ellipse (x2-11,y2+35, 18, 10);
ellipse (x2+26,y2+44, 18, 10);

strokeWeight (5);
stroke (0);
line (x3, y3, x3+15, y3+40);
ellipse (x3+9,y3+43, 14, 7);

strokeWeight (7);
line (x1, y1, x1+65, y1-13);
strokeWeight (3);
line (x1+2, y1, x1+10, y1+40);
line (x1+30, y1-7, x1+39, y1+32);
line (x1+55, y1-14, x1+65, y1+26);
ellipse (x1+16,y1+40, 14, 7);
ellipse (x1+45,y1+32, 14, 7);
ellipse (x1+71,y1+26, 14, 7);






