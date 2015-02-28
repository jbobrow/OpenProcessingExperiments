
size(600, 600);
float x, y, w;
x = 200;
y = 13;
w = 255;

background(114, 172, 222);

//head
noStroke();
fill(255, 226, 167);
ellipse( 300, 300, 450, 490 );



//neck
rectMode(RADIUS);
fill(255, 226, 167);
rect(300, 600, 130, 130);

//face


//eyes
fill(w, w, w);
ellipse(200, 250, 75, 75);
ellipse(400, 250, 75, 75);
fill(79, 150, 211);
ellipse(200, 265, 35, 35);
ellipse(400, 265, 35, 35);
fill(0, 0, 0);
ellipse(200, 270, 25, 25);
ellipse(400, 270, 25, 25);

//nose

triangle(300, 300, 75, 75, 100, 130);
triangle(300, 300, 525, 75, 500, 130);
strokeWeight(14);
fill(222, 186, 114);
triangle(300, 250, 275, 380, 325, 380);
strokeWeight(8);
ellipse(300, 380, 70, 50);

//mouth
fill(222, 186, 114);
strokeWeight(6);
fill(0, 0, 0);
beginShape();
vertex(200, 450);
vertex(200, 480);
vertex(400, 450);
endShape();
vertex(400, 430);
line(200, 100, 400, 100);

//hair
beginShape();
vertex(250, 100);
vertex(300, 78);
vertex(400, 88);
vertex(150, 100);
endShape();

//ears
//couldn't figure out

//arc(100, 200, 150, 75, PI+QUARTER_PI, CHORD);
