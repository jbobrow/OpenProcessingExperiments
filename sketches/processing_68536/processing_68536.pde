
size(500, 450);
background(208, 160, 109);
noStroke();

//body
fill(35, 90, 60);
ellipse(250, 460, 351, 341);
ellipse(250, 320, 251, 201);

//teeth
fill(240, 227, 174);
triangle(225, 350, 235, 355, 230, 345);
triangle(229, 345, 239, 350, 234, 340);
triangle(232, 340, 242, 345, 237, 335);
triangle(235, 335, 245, 340, 240, 330);
triangle(238, 330, 248, 335, 243, 325);
//
triangle(275, 350, 265, 355, 270, 345);
triangle(271, 345, 261, 350, 266, 340);
triangle(268, 340, 258, 345, 263, 335);
triangle(265, 335, 255, 340, 260, 330);
triangle(262, 330, 252, 335, 257, 325);

//face
fill(42, 108, 65);
beginShape();
curveVertex(100, 200);
curveVertex(150, 100);
curveVertex(175, 125);
curveVertex(250, 100); //middle
curveVertex(325, 125);
curveVertex(350, 100);
curveVertex(400, 200);
//
curveVertex(300, 300);
curveVertex(275, 350);
curveVertex(250, 325); //middle
curveVertex(225, 350);
curveVertex(200, 300);
curveVertex(100, 200);
curveVertex(150, 100);
curveVertex(175, 125);
endShape();
//
fill(61, 135, 69);
beginShape();
curveVertex(250, 125);
curveVertex(275, 140);
curveVertex(340, 175);
curveVertex(250, 225);
curveVertex(160, 175);
curveVertex(225, 140);
curveVertex(250, 125);
curveVertex(275, 140);
curveVertex(340, 175);
endShape();

//eyes
fill(42, 108, 65);
ellipse(187, 180, 50, 35);
ellipse(313, 180, 50, 35);
fill(30);
ellipse(183, 182, 43, 30);
ellipse(317, 182, 43, 30);
fill(240, 227, 174);
ellipse(183, 182, 35, 13);
ellipse(317, 182, 35, 13);
fill(255, 250, 210);
ellipse(183, 182, 30, 9);
ellipse(317, 182, 30, 9);

//nose
fill(61, 135, 69);
beginShape();
curveVertex(250, 240);
curveVertex(275, 245);
curveVertex(285, 250);
curveVertex(250, 270);
curveVertex(215, 250);
curveVertex(225, 245);
curveVertex(250, 240);
endShape();
fill(35, 90, 60);
triangle(215, 250, 225, 280, 235, 270);
triangle(285, 250, 275, 280, 265, 270);

//ears
fill(35, 90, 60);
triangle(150, 110, 130, 130, 160, 125);
triangle(350, 110, 370, 130, 340, 125);

//bubble
fill(240, 227, 174);
ellipse(75, 88, 67, 75);
fill(208, 160, 109);
ellipse(90, 96, 61, 55);
fill(240, 227, 174);
ellipse(25, 25, 15, 15);
ellipse(25, 75, 15, 15);
ellipse(475, 25, 15, 15);
ellipse(475, 75, 15, 15);
rect(18, 25, 10, 50);
rect(473, 25, 10, 50);
rect(25, 18, 450, 10);
rect(25, 26, 450, 50);
rect(25, 73, 450, 10);
fill(30);
textFont(createFont("Georgia", 47));
textAlign(CENTER);
text("X3cRg!i**A.78Gpo#1", 250, 65);
