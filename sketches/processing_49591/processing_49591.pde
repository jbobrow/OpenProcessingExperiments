
//Ayako Matsuda
//Interactivity (DESMA 28)

background(238, 222, 197);
size (640, 360);

int p= 0;
int q=360;
int r=640;
smooth();

//brown quad
fill (80,60,57);
quad(181,281,342,222,368, q, 283,q);

//tan rectangle
noStroke();
fill (185,155,140);
quad( p,p, 339, p, 516, 121, p, 298);

//blue rectangle
fill(97,160,213);
quad (p,p,232,p, 262, 120, p, 184);

//white vertical line
stroke(0);
line (367,214, 395, q);

//white horizontal line
stroke(100);
fill(238, 222, 197);
quad(316,60,555,p,611,p,333,69);

//white box
noStroke();
quad(316, 60, 333,69, 335, 82, 317, 73);

//yellow rectangle
stroke(100);
fill (235, 219, 179);
quad(p-5, 298, 516, 120, 518, 159, p-5, 347);

//red triangle
fill(255,68,54);
quad(528,328, r, 313, r,q, 545,q);

//red line
quad(333,69,335,82, r+15,3,630,p-5);







