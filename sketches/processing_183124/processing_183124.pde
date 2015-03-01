
/* 

Robot.

Created 1/23/15
By Erin Folk
Art 3001
erinefolk44@gmail.com
01/27/2015 */

background(144, 255, 203);
size(600, 800);
smooth();

int x = 300;
int f = 40;

//light grey
int a = 191;
int b = 193;
int c = 192;

//dark grey
int d = 147;
int e = 144;

//red
int g = 255;



//neck
fill(a, b, c);
rect(280, 230, f, 50);

//head
fill(a, b, c);
beginShape();
curveVertex(185, 200);
curveVertex(185, 200);
curveVertex(x, 50);
curveVertex(415, 200);
curveVertex(415, 200);
endShape();


//mouth

fill(d, e, e);
ellipse(x, 200, x, 75);
fill(g, 0, 0);
ellipse(x, 200, 250, 60);
line(x, 170, x, 230);
line(x + 15, 171, x + 15, 229);
line(x + 30, 172, x + 30, 228);
line(x + (f + 5), 173, x + (f + 5), 227);
line(x + 60, 174, x + 60, 226);
line(x + 70, 175, x + 70, 225);
line(x + 80, 176, x + 80, 224);
line(x + 90, 179, x + 90, 221);
line(x + 100, 182, x + 100, 218);
line(x + 110, 185, x + 110, 215);
line(x + 115, 188, x + 115, 211);
line(x + 120, 191, x + 120, 208);
line(x + 123, 194, x + 123, 204);
line(x - 15, 171, x - 15, 229);
line(x - 30, 172, x - 30, 228);
line(x - (f + 5), 173, x - (f + 5), 227);
line(x - 60, 174, x - 60, 226);
line(x - 70, 175, x - 70, 225);
line(x - 80, 176, x - 80, 224);
line(x - 90, 179, x - 90, 221);
line(x - 100, 182, x - 100, 218);
line(x - 110, 185, x - 110, 215);
line(x - 115, 188, x - 115, 211);
line(x - 120, 191, x - 120, 208);
line(x - 123, 194, x - 123, 204);


//eyes
fill(0, 0, 0);
ellipse(x - 30, 125, f + 5, f + 5);
ellipse(x + 30, 125, f + 5, f + 5);

//left leg
fill(a, b, c);
rect(x - 85, 475, f + 5, 275);
fill(d, e, e);
ellipse(238, 625, 55, 55);
fill(d, e, e);
rect(160, 750, 100, 30);

//right leg
fill(a, b, c);
rect(x + 40, 475, f + 5, 275);
fill(d, e, e);
ellipse(x + 63, 625, 55, 55);
fill(d, e, e);
rect(x + 40, 750, 100, 30);


//body
fill(d, e, e);
rect(185, 265, 225, 225);


//right arm
fill(a, b, c);
rect(x + 110, 275, 125, 30);
rect(523, 155, 30, 145);
fill(d, e, e);
ellipse(535, 290, f + 5, f + 5);
ellipse(538, 155, f, 10);

//right hand
fill(a, b, c);
rect(515, 110, f + 5, f + 5);

rect(515, 65, 10, f);
fill(d, e, e);
ellipse(520, 105, 10, 10);
fill(a, b, c);
rect(527, 60, 10, f + 5);
fill(d, e, e);
ellipse(532, 105, 10, 10);
fill(a, b, c);
rect(538, 65, 10, f);
fill(d, e, e);
ellipse(543, 105, 10, 10);
fill(a, b, c);
rect(549, 70, 10, f - 5);
fill(d, e, e);
ellipse(554, 105, 10, 10);

fill(a, b, c);
rect(490, 135, 25, 10);
fill(d, e, e);
ellipse(515, 140, 10, 10);

//left arm
fill(a, b, c);
rect(x - 240, 275, 125, 30);
rect(52, 275, 30, 145);
fill(d, e, e);
ellipse(65, 290, f + 5, f + 5);
ellipse(67, 420, f, 10);

//left hand
fill(a, b, c);
rect(f + 5, 420, f + 5, f + 5);

rect(f + 5, 470, 10, f - 5);
fill(d, e, e);
ellipse(50, 470, 10, 10);
fill(a, b, c);
rect(58, 470, 10, f);
fill(d, e, e);
ellipse(62, 470, 10, 10);
fill(a, b, c);
rect(68, 470, 10, f + 5);
fill(d, e, e);
ellipse(73, 470, 10, 10);
fill(a, b, c);
rect(79, 470, 10, f);
fill(d, e, e);
ellipse(84, 470, 10, 10);

fill(a, b, c);
rect(90, 430, 25, 10);
fill(d, e, e);
ellipse(90, 435, 10, 10);



//buttons
fill(g, 0, 0);
ellipse(235, 330, 60, 60);
rectMode(CENTER);
fill(255, 255, 255);
rect(x, 310, 60, 15);
fill(0, 0, 0);
rect(x, 340, 60, f);
fill(g, 0, 0);
ellipse(345, 320, 20, 20);
fill(0, 255, 0);
ellipse(345, 345, 20, 20);
fill(0, 0, 255);
ellipse(367, 334, 20, 20); 






/* other shit
fill(RGB + alpha 255, 255, 255, 170);
stroke(255, 255, 255);
noFill();

int x = 500 or whatever value you are commonly using, replace instances in code
multiple integers will allow you to add and subtract them together, put at beginning
float y = 100 for coordinate points
*/




