
size(600, 600);
smooth();
background(255);

noFill();
strokeWeight(4);

//hat-----------------
ellipse(300, 126, 30, 30);
arc(300, 248, 354, 214, radians(210), radians(330));
arc(300, 267, 416, 206, radians(221), radians(319));

line(142, 201, 147, 301);
line(457, 201, 452, 301);

arc(300, 345, 334, 221, radians(205), radians(335));

//eye-brow-------------------------
fill(255);
quad(248, 226, 260, 240, 167, 330, 157, 322);
quad(356, 226, 344, 240, 438, 330, 448, 322);


//eye--------------------
strokeWeight(8);
line(276, 295, 238, 287);
line(331, 295, 369, 287);

//mustache---------------
strokeWeight(4);

int x = 203;
int w = x-33; 
int y = 409;
int z = y+45;

int a = 7;

line(x, y, w, z);

x=x+a;
w=w+a;
line(x, y, w, z);
x=x+a;
w=w+a;
line(x, y, w, z);
x=x+a;
w=w+a;
line(x, y, w, z);
x=x+a;
w=w+a;
line(x, y, w, z);
x=x+a;
w=w+a;
line(x, y, w, z);
x=x+a;
w=w+a;
line(x, y, w, z);
x=x+a;
w=w+a;
line(x, y, w, z);
x=x+a;
w=w+a;
line(x, y, w, z);
x=x+a;
w=w+a;
line(x, y, w, z);
x=x+a;
w=w+a;
line(x, y, w, z);
x=x+a;
w=w+a;
line(x, y, w, z);
x=x+a;
w=w+a;
line(x, y, w, z);
x=x+a;
w=w+a;
line(x, y, w, z);
x=x+a;
w=w+a;
line(x, y, w, z);
x=x+a;
w=w+a;
line(x, y, w, z);

//the other direction of mustache------------
x=305;
w=x+33;

x=x+a;
w=w+a;
line(x, y, w, z);

x=x+a;
w=w+a;
line(x, y, w, z);

x=x+a;
w=w+a;
line(x, y, w, z);
x=x+a;
w=w+a;
line(x, y, w, z);
x=x+a;
w=w+a;
line(x, y, w, z);
x=x+a;
w=w+a;
line(x, y, w, z);
x=x+a;
w=w+a;
line(x, y, w, z);
x=x+a;
w=w+a;
line(x, y, w, z);
x=x+a;
w=w+a;
line(x, y, w, z);
x=x+a;
w=w+a;
line(x, y, w, z);
x=x+a;
w=w+a;
line(x, y, w, z);
x=x+a;
w=w+a;
line(x, y, w, z);
x=x+a;
w=w+a;
line(x, y, w, z);
x=x+a;
w=w+a;
line(x, y, w, z);
x=x+a;
w=w+a;
line(x, y, w, z);



//nose-------------------
strokeWeight(4);
ellipse(309, 364, 167, 124);

//cheeks-------------------
strokeWeight(2);
ellipse(191, 330, 11, 11);
ellipse(400, 330, 11, 11);

//mouth--------------------
ellipse(309, 443, 24, 24);

//pipe-------------------
 strokeWeight(4);
 line(307,464, 505,464);
 rect(505, 402, 62,62);
 
//air bubble-------------
strokeWeight(4);
ellipse(536, 373,44,44);

strokeWeight(3);
ellipse(536, 313,22,22);

strokeWeight(2);
ellipse(536, 273,11,11);





