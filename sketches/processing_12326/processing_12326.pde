
//structure
size(400,400);
smooth();

//canvas
background(225,240,240);

//UNDERPAINTING
noStroke();

// UNDER midshift drop
fill(232);
quad(290, 90, 160, 170, 145, 40, -10, -20);
ellipse(-10, 65, 100, 100);
fill(213,214,216,100);
quad(410, 290, 300, 190, 270, 380, 400, 500);


// UNDER bottom left shapes
fill(205,204,188);
arc(96,205,215,108,radians(180), radians(360));
ellipse(48,150,60,60);
quad(45, 170, 57, 350, 61, 350, 75, 170);//drip
bezier(0, 205, 60, 350, 100, 210, 210, 205);
ellipse(100,390,100,60);

fill(199,181,181);
ellipse(220,290, 120, 65);

fill(217,219,200,200);
arc(96,205,215,108,radians(0), radians(180));
fill(230,235,218,100);
ellipse(100,310,300,300);
ellipse(220,245,100,100);
//bezier(247, 205, 350, 180, 355, 160, 260, 250);
fill(230,235,218,200);
ellipse(20,350,250,250);

fill(199,181,181, 100);
ellipse(240, 330, 80, 35);
fill(205,204,188,100);
ellipse(10, 390, 140, 120);



// UNDER top right shapes
fill(184,177,165);
ellipse(322, 80, 170, 155);
bezier(275, 28, 20, 53, 105, 55, 290, 85);
bezier(110, 50, 160, 170, 220, 30, 280, 80);

fill(86,82,74);//DARKEST
ellipse(390, 0, 250, 250);
bezier(355, 80, 380, 420, 375, 200, 400, 80);
fill(106,102,95);
ellipse(290, 0, 230, 70);
ellipse(335, 30, 100, 60);
ellipse(345, 50, 40, 40);
quad(0, 30, 230, 40, 255, 25, 185, 10);
quad(220, 60, 320, 65, 330, 60, 310, 55);

fill(155,150,140,100);
bezier(275, 0, 330, 45, 335, 400, 355, 0);
fill(106,102,95);
bezier(290, 0, 320, 35, 322, 60, 331, 0);
bezier(331, 0, 338, 20, 338, 35, 345, 0);
// UNDER bottom right meet-up
//bezier(320, 400, 390, 205, 385, 260, 400, 400);
beginShape();
curveVertex(290, 400);
curveVertex(230, 450);
curveVertex(330, 380);
curveVertex(370, 270);
curveVertex(390, 320);
curveVertex(425, 420);
curveVertex(420, 400);
endShape();


//UNDER topleft bezier drips
fill(230,235,218,190);
bezier(200, 200, 208, 90, 210, -200, 248, 205);
fill(210,236,240); //softBLUE
bezier(10, 40, 40, 20, 30, 15, 80, 30);
bezier(70, 30, 90, 15, 120, 18, 160, 50);
bezier(10, 40, 50, 50, 50, 400, 60, 72);
bezier(60, 72, 69, 88, 77, 580, 82, 65);
bezier(82, 65, 94, 95, 120, 180, 140, 72);
bezier(140, 72, 146, 92, 159, 85, 160, 50);
//UNDER top bezier closer-quad
beginShape();
vertex(10, 40);
vertex(60, 75);
vertex(140, 74);
vertex(160, 50);
vertex(72, 26);
endShape(CLOSE);



//UNDER quads and arcs
fill(210,175,175);
quad(225, 300, 275, 330, 375, 290, 245, 245);
fill(230,202,202);//softPINK
quad(220, 290, 270, 320, 375, 290, 240, 235);
fill(197,187,195);
//arc(165,310,155,80,radians(180), radians(360));
fill(220,211,218);//softPurple;
arc(170,305,155,80,radians(180), radians(360));
fill(175,191,198);
//arc(98,312,155,80,radians(0), radians(180));
fill(210,236,240); //softBLUE
arc(100,305,155,80,radians(0), radians(180));
quad(-40, 280, 28, 355, 117, 286, 65, 270);
quad(90, 300, 140, 340, 145, 310, 117, 286);
bezier(45, 340, 95, 380, 75, 600, 92, 325);
fill(220,211,218);//softPurple;
quad(-20, 240, 80, 325, 105, 300, 15, 200);
quad(80, 325, 104, 300, 140, 280, 110, 335);
bezier(200, 305, 245, 575, 200, 325, 248, 305);


//TOP black shapes
noFill();
stroke(100, 128, 98);
strokeWeight(1);
triangle(120, -10, 40, 30, 58, 60);
triangle(58, 60, 180, 35, 98, 15);
line(98, 15, 103, 51);
triangle(103, 51, 140, 80, 130, 45);
triangle(180, 35, 120, 20, 150, -20);
line(140, 80, 45, 80);
line(45, 80, 40, 30);
line(140, 80, 180, 35);

stroke(195, 175, 160);
beginShape();
curveVertex(25, 300);
curveVertex(80, 250);
curveVertex(150, 330);
curveVertex(200, 340);
curveVertex(180, 370);
curveVertex(40, 450);
curveVertex(-5, 410);
curveVertex(5, 310);
curveVertex(25, 300);
curveVertex(80, 250);
curveVertex(100, 300);
curveVertex(115, 300);
curveVertex(100, 350);
curveVertex(140, 320);
curveVertex(200, 320);
endShape();
bezier(80, 250, 55, 310, 55, 450, 93, 275);
bezier(80, 250, 45, 350, 40, 320, 36, 289);
bezier(68, 360, 82, 410, 85, 450, 140, 320);
bezier(140, 320, 150, 450, 156, 310, 165, 360);
bezier(165, 360, 175, 380, 180, 345, 200, 340);
bezier(68, 360, 82, 410, 85, 450, 140, 320);
bezier(68, 360, 50, 420, 27, 250, -5, 380);
bezier(-5, 380, 25, 300, 45, 550, 68, 360);

bezier(218, 344, 270, 390, 290, 335, 255, 340);
bezier(255, 340, 230, 348, 226, 350, 218, 344);



//BURSTS!!!
translate(35,-40);

noStroke();
fill(243,245,195,80);
beginShape();
vertex(400, 220);
vertex(140, 110);
vertex(110, 215);
vertex(170, 150);
vertex(400, 238);
endShape(CLOSE);

fill(245,202,195,80);
beginShape();
vertex(400, 238);
vertex(170, 150);
vertex(120, 225);
vertex(200, 180);
vertex(400, 250);
endShape(CLOSE);

fill(245,195,236,80);
beginShape();
vertex(400, 250);
vertex(200, 180);
vertex(125, 240);
vertex(125, 240);
vertex(400, 250);
endShape(CLOSE);

fill(204,195,245,80);
beginShape();
vertex(400, 250);
vertex(125, 240);
vertex(120, 270);
vertex(200, 290);
vertex(400, 250);
endShape(CLOSE);

fill(195,235,245,60);
beginShape();
vertex(400, 250);
vertex(200, 290);
vertex(120, 270);
vertex(170, 320);
vertex(400, 262);
endShape(CLOSE);

fill(195,435,199,80);
beginShape();
vertex(400, 262);
vertex(170, 320);
vertex(110, 285);
vertex(140, 360);
vertex(400, 280);
endShape(CLOSE);


//BURST OutLine
noFill();
stroke(240);
strokeWeight(2.5);
beginShape();
vertex(400, 220);
vertex(140, 110);
vertex(110, 215);
vertex(170, 150);
vertex(120, 225);
vertex(200, 180);
vertex(125, 240);
vertex(210, 240);
vertex(125, 255);
vertex(200, 290);
vertex(120, 270);
vertex(170, 320);
vertex(110, 285);
vertex(140, 360);
vertex(400, 280);
endShape();


line(170, 150, 400, 238);
line(200, 180, 400, 250);
line(210, 240, 400, 250);
line(200, 290, 400, 250);
line(170, 320, 400, 262);

//end translate
translate(0,0);


