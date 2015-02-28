
// Dan Sztanga
// dsztanga@andrew.cmu.edu
// dan.sztanga@gmail.com
// (C) 2012 by Dan Sztanga. All Rights Reserved.

size(400,400);
smooth();
background(255,255,255);

noStroke();
fill(6,84,142);
rect(0,0,400,400);

translate(5,-10);

//S.Top
noStroke();
fill(255,255,255,155);
rect(200,125,125,50);
rect(300,150,50,50);
//Round
noStroke();
fill(6,84,142);
ellipse(200,150, 50,50);
//S.Middle
strokeCap(SQUARE);
stroke(255,255,255,105);
strokeWeight(40);
line(150,210,323,355);
//Round
strokeCap(ROUND);
stroke(6,84,142);
strokeWeight(41);
line(150,210,165,222);
//S.Bottom
noStroke();
fill(255,255,255,155);
triangle(310,385,360,325,360,385);
rect(150,350,200,25);
translate(-170,0);
triangle(310,385,310,325,360,385);
translate(170,0);

translate(-5,-5);
//S.Top.1
noStroke();
fill(255,255,255,155);
rect(200,125,125,50);
//Round
noStroke();
fill(6,84,142);
ellipse(200,150, 50,50);
//S.Bottom.1
noStroke();
fill(255,255,255,155);
rect(150,350,200,25);
translate(5,5);

//S.Top.2
noStroke();
fill(37,200,227,155);
rect(295,145,50,50);
//S.Bottom.2
noStroke();
fill(247,37,220,155);
triangle(305,380,355,320,355,380);
translate(-175,-5);
fill(247,247,37,155);
triangle(310,385,310,325,360,385);
translate(175,5);

// D.Line
noStroke();
fill(255,255,255,255);
ellipse(50,50,20,20);
fill(255,255,255,205);
ellipse(50,100,30,30);
fill(255,255,255,155);
ellipse(50,150,40,40);
fill(255,255,255,105);
ellipse(50,200,30,30);
fill(255,255,255,025);
ellipse(50,250,20,20);
// D.Curve
noStroke();
fill(255,255,255,255);
ellipse(100,65,30,30);
fill(255,255,255,205);
ellipse(150,90,40,40);
fill(255,255,255,155);
ellipse(175,150,50,50);
fill(255,255,255,105);
ellipse(150,210,40,40);
fill(255,255,255,105);
ellipse(100,235,30,30);

// D.Line.1
noStroke();
fill(72,169,216,255);
ellipse(55,55,20,20);
fill(72,169,216,205);
ellipse(55,105,30,30);
fill(72,169,216,155);
ellipse(55,155,40,40);
fill(72,169,216,105);
ellipse(55,205,30,30);
fill(72,169,216,025);
ellipse(55,255,20,20);
// D.Curve.1
noStroke();
fill(72,169,216,255);
ellipse(105,70,30,30);
fill(72,169,216,205);
ellipse(155,95,40,40);
fill(72,169,216,155);
ellipse(180,155,50,50);
fill(72,169,216,105);
ellipse(155,215,40,40);
fill(72,169,216,105);
ellipse(105,240,30,30);

// D.Line.2
translate(5,5);
noStroke();
//fill(72,169,216,255);
//ellipse(55,55,20,20);
//fill(72,169,216,205);
//ellipse(55,105,30,30);
fill(247,37,220,155);
ellipse(55,155,40,40);
fill(247,247,37,105);
ellipse(55,205,30,30);
//fill(72,169,216,025);
//ellipse(55,255,20,20);
// D.Curve.2
noStroke();
fill(37,200,227,255);
ellipse(105,70,30,30);
//fill(72,169,216,205);
//ellipse(155,95,40,40);
fill(247,247,37,155);
ellipse(180,155,50,50);
//fill(72,169,216,105);
//ellipse(155,215,40,40);
fill(37,200,227,105);
ellipse(105,240,30,30);





