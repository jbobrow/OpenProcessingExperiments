
size(570, 530);
background(255, 250, 230);

smooth();
fill(0, 0, 0);
strokeWeight(4); //1 is default strokeweight

//asterisco
stroke(0);
strokeWeight(2);
line(300, 430, 355, 432);
line(310, 405, 345, 455);
line(300, 450, 355, 407);
line(330, 400, 325, 457);
//linea sx
line(200, 370, 195, 530);
//linea dx
line(540, 530, 540, 500);
line(446, 530, 447, 520);
line(350, 380, 353, 350);


//parabola
smooth();
stroke(0);
noFill();

beginShape();
curveVertex(530, 0);
curveVertex(530, 0);
curveVertex(260, 240);
curveVertex(550, 440);
curveVertex(570, 470);
curveVertex(570, 470);
curveVertex(570, 0);
curveVertex(570, 0);
endShape();

beginShape();
curveVertex(20, 265);
curveVertex(20, 265);
curveVertex(15, 235);
curveVertex(5, 205);
curveVertex(5, 205);
endShape();

beginShape();
curveVertex(0, 10);
curveVertex(0, 10);
curveVertex(20, 40);
curveVertex(30, 90);
curveVertex(0, 130);
curveVertex(0, 130);
endShape();

fill(0);
ellipseMode(CENTER);
ellipse(540, 490, 40, 30);

//ovale sx
fill(0);
ellipseMode(CENTER);
ellipse(200, 370, 55, 30);

//mezzo ovale
fill(0);
ellipseMode(RADIUS);
ellipse(300, 530, 30, 25);

//piccolino sopra asterisco
fill(0);
ellipseMode(CENTER);
ellipse(350, 380, 25, 20); 

//mezzo sx
fill(0);
ellipseMode(RADIUS);
ellipse(0, 190, 15, 15); 

//doppio blob
fill(0);
ellipseMode(RADIUS);
ellipse(450, 200, 35, 25);
ellipseMode(RADIUS);
ellipse(470, 240, 20, 20);

fill(0);
ellipseMode(RADIUS);
ellipse(570, 150, 25, 25);


/*beginShape();
curveVertex(60, 0);
curveVertex(60, 0);
curveVertex(70, 220);
curveVertex(280, 230);
curveVertex(280, 250);
curveVertex(120, 0);
curveVertex(120, 0);
endShape();
*/

triangle(440, 440, 460, 465, 480, 440 ); 
triangle(442, 485, 460, 465, 482, 490);
triangle(-40, 330, 20, 265, 20, 330);
triangle(520, 200, 550, 160, 570, 170);


fill(215, 65, 15);
ellipseMode(CENTER);
ellipse(530, 430, 25, 25);
ellipse(570, 160, 30, 30);
triangle(20, 265, 20, 330, 100, 350);

//bezier(x1, y1, cx1, cy1, cx2, cy2, x2, y2)
fill(0);
bezier(200, 420, 290, 410, 290, 540, 195, 520);

fill(215, 65, 15);
bezier(200, 420, 80, 410, 80, 510, 195, 520);

fill(30, 0, 135, 98);
noStroke();
beginShape();
curveVertex(0, 450);
curveVertex(0, 450);
curveVertex(40, 450);
curveVertex(40, 450);
curveVertex(80, 380);
curveVertex(86, 380);
curveVertex(90, 440);
curveVertex(90, 440);
curveVertex(165, 460);
curveVertex(175, 460);
curveVertex(100, 500);
curveVertex(100, 500);
curveVertex(90, 530);
curveVertex(75, 530);
curveVertex(70, 500);
curveVertex(70, 500);
curveVertex(0, 530);
curveVertex(0, 520);
curveVertex(45, 480);
curveVertex(45, 480);
curveVertex(0, 460);
curveVertex(0, 460);
endShape();

fill(0);
beginShape();
vertex(78.0, 0.0);
bezierVertex(78.0, 0.0, 50.0, 127.0, 85.0, 197.0);
bezierVertex(120.0, 267.0, 200.0, 292.0, 261.0, 276.0);
bezierVertex(322.0, 260.0, 316.0, 225.0, 310.0, 209.0);
bezierVertex(304.0, 193.0, 282.0, 196.0, 260.0, 197.0);
bezierVertex(238.0, 198.0, 208.0, 181.0, 205.0, 147.0);
bezierVertex(202.0, 113.0, 208.0, 45.0, 228.0, 1.0);
endShape();



