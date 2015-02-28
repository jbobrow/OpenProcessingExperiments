

size(640, 480);
smooth();


//middle rect (background)
rectMode(CORNER);
noStroke();
fill(#cccdbe);
rect (0,120,640,160);

//bottom rect (background)
rectMode(CORNER);
noStroke();
fill(#d2d2ae);
rect (0, 280, 640,200);

//top right line
noFill();
stroke(#b4b3ab);
strokeWeight(2);
arc(660, 0, 780, 15, HALF_PI, PI);

//second arc line from top
stroke(#b4b3ab);
strokeWeight(2);
noFill();
bezier(0,120,85,125,90,125,640,135);

//Lines
//1st line from left
stroke(#b4b3ab);
strokeWeight(1.5);
noFill();
line(105,0,105,125);

//2nd line from left
stroke(#b4b3ab);
strokeWeight(1.5);
noFill();
line(300,0,300,125);

//3rd line from left
stroke(#b4b3ab);
strokeWeight(1.5);
noFill();
line(550,0,550,132);

//quads
fill(#a5a49e);
noStroke();
quad(29, 0, 50, 0, 0, 58, 0, 30);

fill(#a5a49e);
noStroke();
quad(285, 0, 302, 0, 110, 480, 75, 480);

fill(#a5a49e);
noStroke();
quad(515, 0, 532, 0, 725, 640, 680, 640);

//yellow ellipse
fill(#f8b834);
noStroke();
ellipse(464, 92, 300, 120);

//line over ellipse
stroke(0);
strokeWeight(3);
noFill();
line(498,0,527,162);

stroke(#b4b3ab);
strokeWeight(1.5);
noFill();
line(0,215,640,222);

stroke(0);
strokeWeight(7);
noFill();
line(0,215,640,195);

stroke(0);
strokeWeight(3);
noFill();
line(0,400,300,470);

stroke(0);
strokeWeight(4);
noFill();
line(30,481,300,470);

stroke(0);
strokeWeight(3);
noFill();
line(270,448,640,359);

//blue arc
stroke(#445464);
strokeWeight(5);
noFill();
bezier(162,0,140,105,150,290,640,359);



