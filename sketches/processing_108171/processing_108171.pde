
//HW#2-11:30-13:20
//Angeline Chen, Processing 527, Pittsburgh, PA, September 3

size(400, 400);
background(76, 85, 85);

//variables
float x = 200; //X-HEIGHT
float y = 140; //Y-HEIGHT
float a = 60; //Width&heightRect <<RELATIVE-TO-THIS
float b = 90; //width2ndEllipse <<RELATIVE-TO-THIS
float r = 20; //glassesCurve
float d = 15; //2ndellipseValue
float i = 45; //glasses width
float n = 30; //nosewidth
float c = 65;
float sw = b*1.7; //signwidth
float sh = a*1.8; //signheight
float rr = radians(45);
float rr2 = radians(300);

//FACE
noStroke();
fill(247, 173, 97);

ellipseMode( CENTER );
ellipse(x, y-a*.35, a*2, b);

rectMode( CENTER );
rect(x, y, a*2, a, r);

ellipseMode( CENTER );
ellipse(x, y+d, b, b*.75);

//EARS
ellipseMode( CENTER );
ellipse(x-a, y, r*.75, r);
ellipse(x+a, y, r*.75, r);

//HAIR
stroke(196);
strokeWeight(4);
line(x, y-a*.35-b*.5, x+a*.5, y-a*.35-b*.43);
line(x, y-a*.35-b*.5, x+a*.4, y-a*.35-b*.32);
line(x, y-a*.35-b*.5, x+a*.2, y-a*.35-b*.28);
line(x, y-a*.35-b*.5, x-a*.2, y-a*.35-b*.28);
line(x, y-a*.35-b*.5, x-a*.4, y-a*.35-b*.32);
line(x, y-a*.35-b*.5, x-a*.5, y-a*.35-b*.43);

//GLASSES
stroke(137, 132, 127);
strokeWeight(3);
line(x-a, y-a*.25, x+a, y-a*.25);

fill(255);
rectMode( CENTER );
rect(x-a*.5, y-a*.15, i, i*.75, r/7, r/7, r, r);
rect(x+a*.5, y-a*.15, i, i*.75, r/7, r/7, r, r);

//NOSE&STACHE
stroke(152, 151, 150);
strokeWeight(1);
fill(196);
quad(x-n*.5, y+a*.1, x+n*.5, y+a*.1, x+n, y+a*.4, x-n, y+a*.4);

noStroke();
fill(247, 173, 97);
ellipseMode( CENTER );
ellipse(x, y+a*.1, n, n*.75);

//THUMBS
noStroke();
fill(247, 173, 97);
ellipseMode( CENTER );
ellipse(x-a*1.35, y+a*1.25, a*.2, a*.2);
ellipse(x+a*1.35, y+a*1.25, a*.2, a*.2);

//SIGN
stroke(255);
strokeWeight(3);
fill(183, 229, 32);
rectMode( CENTER );
rect(x, y+a*1.6, b*1.7, a*1.8);

//INITIALS-A
noFill();
noStroke();
line(x-sw*.4, y+a*1.6+sh*.3, x-sw*.4, y+a*.8);
line(x-sw*.1, y+a*1.6-sh*.5, x-sw*.1, y+a*1.6+sh*.3);
stroke(255);
strokeWeight(20);
bezier(x-sw*.4, y+a*1.6+sh*.3, x-sw*.4, y+a*.8, x-sw*.1, y+a*1.6-sh*.5, x-sw*.1, y+a*1.6+sh*.3);

line(x-sw*.5, y+a*1.6, x-sw*.15, y+a*1.6);

noFill();
noStroke();
line(x-sw*.4, y+a*1.6+sh*.3, x-sw*.4, y+a*.8);
line(x-sw*.1, y+a*1.6-sh*.5, x-sw*.1, y+a*1.6+sh*.3);
stroke(49, 46, 62);
strokeWeight(12);
bezier(x-sw*.4, y+a*1.6+sh*.3, x-sw*.4, y+a*.8, x-sw*.1, y+a*1.6-sh*.5, x-sw*.1, y+a*1.6+sh*.3);
//bezier(a*.3, y+a*.9, a*.7, a*1.3);

line(x-sw*.5, y+a*1.6, x-sw*.15, y+a*1.6);

//C
noFill();
stroke(49, 46, 62);
strokeWeight(22);
ellipseMode( CENTER );
arc(x+sh*.4, y+a*1.6, a*.8, a, rr, rr2);

noFill();
stroke(255);
strokeWeight(15);
ellipseMode( CENTER );
arc(x+sh*.4, y+a*1.6, a*.8, a, rr, rr2);
//bezier(a*.3, y+a*.9, a*.7, a*1.3);

//rectMode( CENTER );
//noStroke();
//noFill();
//rect(x, y+a*2.07, n, a*.4);
//stroke(255);
//strokeWeight(5);
//arc(x, y+a*2.07, n, a*.6, PI, 0);
//x-a*.1, y+a*1.65, x+a*.1, y-a*1.65,

//HANDS
noStroke();
fill(247, 173, 97);
ellipseMode( CENTER );
ellipse(x-b*.85, y+a*1.5, a*.7, a*.6);

ellipse(x+b*.85, y+a*1.5, a*.7, a*.6);



