
background(205, 148, 192);

int v = 30;
int x = 50;
int y = 250;
int b = 0;

size(500,500);

//fro
fill(b);
ellipse(y, x*2, 100+x, 100+x);

//face
fill(177, 106, 62);
ellipse(y, 140, 100, 100);

fill(b);
//right eye
ellipse(225, 135, 8, 8);
//left eye
ellipse(225+x, 135, 8, 8);
//nose
triangle(y, 145, 255, 155, 245, 155);

fill(244, 42, 42);
arc(240, 165, v, v, 0, PI+QUARTER_PI, CHORD);

//body
fill(89, 80, 80);
rectMode(CENTER);
rect(y, 255, 100+v, 100+v);
//shoulders
//left shoulder
fill(136, 124, 124);
ellipse(180, 185, v, v);
//right shoulder
ellipse(320, 185, v, v);
//skirt
quad(200, 320, 300,  320, 320, 380, 180,  380);

//armsandlegs
//rightleg
stroke(177, 106, 62);
fill(177, 106, 62);
line(210, 380,  210,  495);
//leftleg
line(285, 380,  285,  495);
//leftarm
line(175, 200 ,  100+x,  300);
//rightarm
line(320, 200 ,  350,  300);

//hands
//lefthand
rect(135, 310, v, 20);
//righthand
rect(365, 310, v, 20);

//feet
//leftfoot 
fill(b);
rectMode(CENTER);
rect(185, 490, x, v);
//rightfoot
rect(310, 490, x, v);
