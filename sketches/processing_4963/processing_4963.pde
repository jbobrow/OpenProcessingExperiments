
size(480, 320);
smooth();
background(200);

//Left foot
fill(248, 149, 29);
stroke(248,149,29);
quad(175, 275, 165, 260, 90, 310, 150, 310);

//Right foot
fill(248, 149, 29);
stroke(248,149,29);
quad(175, 275, 185, 260, 260, 310, 200, 310);

//Left Arm
fill(145,53,148);
stroke(145,53,148);
beginShape(QUAD_STRIP);
vertex(70, 174);
vertex(66, 186);
vertex(93,190);
vertex(98,200);
vertex(110, 178);
vertex(110, 190);
endShape();

//Right Arm
beginShape(QUAD_STRIP);
vertex(240, 178);
vertex(240, 187);
vertex(260,187);
vertex(258,198);
vertex(285, 186);
vertex(282,200);
endShape();

//body
fill(155,79,159);
stroke(155,79,159);
ellipse(175,175,138,200);

//mouth
fill(0);
bezier(135,225,146,240, 173,237, 180,225);


//Stroke and Fill for Eyes
fill(255);
stroke(255);

//Rotate Left Eye
translate(146, 160);
rotate(-PI/8);
ellipse(0,0,35,50);

//Undo Rotation
rotate(PI/8);
translate(-146,-160);

//Rotate Right Eye
translate(173,159);
rotate(PI/16);
ellipse(0,0,35,50);

//Undo Rotation
rotate(-PI/16);
translate(-173,-159);

//Left Pupil
fill(0);
stroke(0);
ellipse(151,172, 15, 15);

//Right Pupil
ellipse(167,171,15,15);


//hair
fill(112,191,68);
stroke(112,191,68);
beginShape(TRIANGLE_FAN);
vertex(163,93);
vertex(135,50);
vertex(168,70);
vertex(177,52);
vertex(183,85);
vertex(202,55);
vertex(187,93);
endShape();






