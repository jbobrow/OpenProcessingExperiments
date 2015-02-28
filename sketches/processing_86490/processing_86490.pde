
// Josh Newby jnewby@andrew.cmu.edu copyright Josh Newby 2013 Pittsburgh PA;
// Homework # 2 11:30 am

size(400, 400);
smooth( );
background(245, 215, 221);

float x, y, wd, ht;
x = 40;
y = 80;
wd = 320;
ht = 280;

noFill( );
strokeWeight(6);
stroke(0);

// 1/16 = .0625
// 15/16 = .9375
// 1/32 = .03125
// 1/7 = .1428
// 1/14 = .0714

// straigt lines on glasses
line(x + .0625 * wd, y, x + .9375 * wd, y);
line(x + 7 * .0625 * wd, y + .0714 * ht, x + 9 * .0625 * wd, y + .0714 * ht);
line(x + .0625 * wd, y, x + .0626 * wd, y + 2 * .0714 * ht);
line(x + 7 * .0625 * wd, y, x + 7 * .0626 * wd, y + 2 * .0714 * ht);
line(x + 9 * .0625 * wd, y, x + 9 * .0626 * wd, y + 2 * .0714 * ht);
line(x + 15 * .0625 * wd, y, x + 15 * .0626 * wd, y + 2 * .0714 * ht);

// left lens curve
beginShape();
curveVertex(x + .5 * .0625 * wd, y);
curveVertex(x + .0625 * wd, y + 2 * .0714 * ht);
curveVertex(x + 2 * .0625 * wd, y + 3.5 * .0714 * ht);
curveVertex(x + 4 * .0625 * wd, y + 4 * .0714 * ht);
curveVertex(x + 6 * .0625 * wd, y + 3.5 * .0714 * ht);
curveVertex(x + 7 * .0625 * wd, y + 2 * .0714 * ht);
curveVertex(x + 7.5 * .0625 * wd, y);
endShape();

// right lens curve
beginShape();
curveVertex(x + 8.5 * .0625 * wd, y);
curveVertex(x + 9 * .0625 * wd, y + 2 * .0714 * ht);
curveVertex(x + 10 * .0625 * wd, y + 3.5 * .0714 * ht);
curveVertex(x + 12 * .0625 * wd, y + 4 * .0714 * ht);
curveVertex(x + 14 * .0625 * wd, y + 3.5 * .0714 * ht);
curveVertex(x + 15 * .0625 * wd, y + 2 * .0714 * ht);
curveVertex(x + 15.5 * .0625 * wd, y);
endShape();

strokeWeight(6);

// nose curves
beginShape();
//curveVertex(x + 8 * .0625 * wd, y + 4 * .0714 * ht);
curveVertex(x + 7 * .0625 * wd, y + 5 * .0714 * ht);
curveVertex(x + 6 * .0625 * wd, y + 7 * .0714 * ht);
curveVertex(x + 8 * .0625 * wd, y + 8 * .0714 * ht);
curveVertex(x + 10 * .0625 * wd, y + 7 * .0714 * ht);
curveVertex(x + 9 * .0625 * wd, y + 5 * .0714 * ht);
//curveVertex(x + 8 * .0625 * wd, y + 4 * .0714 * ht);
endShape();

beginShape();
curveVertex(x + 7 * .0625 * wd, y + 5.5 * .0714 * ht);
curveVertex(x + 6 * .0625 * wd, y + 5 * .0714 * ht);
curveVertex(x + 5 * .0625 * wd, y + 6 * .0714 * ht);
curveVertex(x + 6 * .0625 * wd, y + 7 * .0714 * ht);
curveVertex(x + 7 * .0625 * wd, y + 7 * .0714 * ht);
endShape();

beginShape();
curveVertex(x + 9 * .0625 * wd, y + 5.5 * .0714 * ht);
curveVertex(x + 10 * .0625 * wd, y + 5 * .0714 * ht);
curveVertex(x + 11 * .0625 * wd, y + 6 * .0714 * ht);
curveVertex(x + 10 * .0625 * wd, y + 7 * .0714 * ht);
curveVertex(x + 8 * .0625 * wd, y + 7 * .0714 * ht);
endShape();

// mustache
line(x, y + 13 * .0714 * ht, x + wd, y + 13 * .0714 * ht);
beginShape();
curveVertex(x, y + 16 * .0714 * ht);
curveVertex(x, y + 13 * .0714 * ht);
curveVertex(x + 2 * .0625 * wd, y + 9 * .0714 * ht);
curveVertex(x + 6 * .0625 * wd, y + 7 * .0714 * ht);
curveVertex(x + 8 * .0625 * wd, y + 7 * .0714 * ht);
endShape();

beginShape();
curveVertex(x + wd, y + 16 * .0714 * ht);
curveVertex(x + wd, y + 13 * .0714 * ht);
curveVertex(x + 14 * .0625 * wd, y + 9 * .0714 * ht);
curveVertex(x + 10 * .0625 * wd, y + 7 * .0714 * ht);
curveVertex(x + 8 * .0625 * wd, y + 7 * .0714 * ht);
endShape();

strokeWeight(6);
stroke(150, 80, 90);

//mouth
beginShape();
curveVertex(x + 5 * .0625 * wd, y + 15 * .0714 * ht);
curveVertex(x + 6 * .0625 * wd, y + 14.5 * .0714 * ht);
curveVertex(x + 8 * .0625 * wd, y + 14 * .0714 * ht);
curveVertex(x + 10 * .0625 * wd, y + 14.5 * .0714 * ht);
curveVertex(x + 11 * .0625 * wd, y + 15 * .0714 * ht);
endShape();

// Initials
float a, b, diam;
a = 200;
b = 280;
diam = 100;

noFill( );
noStroke();

ellipse(a, b, diam, diam);

strokeWeight(4);
stroke(214, 145, 157);

// j
line(a - .2 * diam, b - .15 * diam, a - .2 * diam, b + .05 * diam);
beginShape();
curveVertex(a - .2 * diam, b);
curveVertex(a - .2 * diam, b + .05 * diam);
curveVertex(a - .2 * diam, b + .15 * diam);
curveVertex(a - .3 * diam, b + .25 * diam);
curveVertex(a - .4 * diam, b + .15 * diam);
curveVertex(a - .4 * diam, b + .05 * diam);
endShape();

stroke(150, 80, 90);

// s
beginShape();
curveVertex(a + .1 * diam, b - .05 * diam);
curveVertex(a + .1 * diam, b - .1 * diam);
curveVertex(a, b - .2 * diam);
curveVertex(a - .1 * diam, b - .1 * diam);
curveVertex(a, b + .04 * diam);
curveVertex(a + .1 * diam, b + .2 * diam);
curveVertex(a, b + .3 * diam);
curveVertex(a - .1 * diam, b + .2 * diam);
curveVertex(a - .1 * diam, b + .1 * diam);
endShape();

stroke(100, 30, 40);

//n
line(a + .2 * diam, b + .25 * diam, a + .2 * diam, b - .15 * diam);
line(a + .2 * diam, b - .15 * diam, a + .4 * diam, b + .25 * diam);
line(a + .4 * diam, b + .25 * diam, a + .4 * diam, b - .15 * diam);
