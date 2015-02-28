
//Homework #1
//Melissa A. dela Merced mdm532@nyu.edu
//ICMRozinTue 9:30-12

size(500, 500);
smooth();
//placemat

rect(50, 50, 400, 400);

//bowl
fill(54, 37, 14);
strokeWeight(10);
ellipse(249, 249, 250, 250);
noStroke();
fill(80, 55, 23);
ellipse(249, 249, 225, 225);
fill(252, 200, 130);
ellipse(249, 249, 215, 215);
fill(242, 192, 127);
ellipse(249, 249, 200, 200);
fill(240, 176, 92);
ellipse(249, 249, 180, 180);
fill(211, 166, 107);
ellipse(249, 249, 160, 160);

//ramen
stroke(229, 219, 14);
strokeWeight(3);
noFill();
int x = 240;
int y = 250;
int d = 100;
ellipse(x, y, d, d);
ellipse(x+1, y+1, d, d);
ellipse(x+5, y-5, d, d);
ellipse(x-10, y+10, d, d);
ellipse(x+15, y+15, d, d);
ellipse(x+20, y-20, d, d);
ellipse(x-30, y+30, d, d);
ellipse(x+40, y-40, d, d);

//eggs
//strokeWeight(2);
noStroke();
fill(255);
ellipse(180, 230, 45, 65);
fill(255, 194, 70);
ellipse(180, 240, 35, 35);


//eggs
//strokeWeight(2);
noStroke();
fill(255);
ellipse(230, 280, 45, 65);
fill(255, 194, 70);
ellipse(230, 280, 35, 35);

//spring onions
fill(46, 180, 16);
stroke(46, 180, 16);
strokeWeight(1);
noFill();
int a = 225;
int b = 249;
int w = 20;
ellipse(a, b, w, w);
ellipse(a+1, b+1, w, w);
ellipse(a+2, b-2, w, w);
ellipse(a-3, b+3, w, w);
ellipse(a+4, b+4, w, w);
ellipse(a+5, b-5, w, w);
ellipse(a-6, b+6, w, w);
ellipse(a+7, b-7, w, w);

//fishcake


//chopstick left
stroke(0);
fill(0);
triangle(260, 80, 380, 350, 390, 360);

//chopstick right
fill(0);
triangle(265, 80, 390, 360, 400, 370);


