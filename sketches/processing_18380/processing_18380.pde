
/*
Adam Oaks
Assignment 2.1 - Figure
Computational Methods ARCH 6050
*/


size(400,400);
smooth();
background(112,166,255);

//grass
fill(88,153,34);
rect(0,372,400,28);

//ground line
stroke(0);
strokeWeight(2);
line(0,372,400,372);

//boots
fill(127,87,0);
noStroke();
beginShape();
vertex(65,371);
vertex(65,350);
vertex(90,350);
vertex(90,325);
vertex(155,325);
vertex(155,371);
endShape();

beginShape();
vertex(245,371);
vertex(245,325);
vertex(310,325);
vertex(310,350);
vertex(330,350);
vertex(330,371);
endShape();

//shirt
beginShape();
vertex(65,260);
vertex(65,215);
vertex(90,215);
vertex(90,195);
vertex(115,195);
vertex(115,175);
vertex(245,175);
vertex(245,195);
vertex(310,195);
vertex(310,215);
vertex(330,215);
vertex(330,260);
endShape();

//hair and eyes
beginShape();
vertex(310,150);
vertex(90,150);
vertex(90,85);
vertex(115,85);
vertex(115,65);
vertex(245,65);
vertex(245,105);
vertex(265,105);
vertex(265,130);
vertex(310,130);
endShape();

//hat
fill(255,6,0);
beginShape();
vertex(115,65);
vertex(115,40);
vertex(135,40);
vertex(135,20);
vertex(245,20);
vertex(245,40);
vertex(310,40);
vertex(310,65);
endShape();

//pants
beginShape();
vertex(115,325);
vertex(115,285);
vertex(135,285);
vertex(135,240);
vertex(155,240);
vertex(155,175);
vertex(180,175);
vertex(180,215);
vertex(220,215);
vertex(220,195);
vertex(245,195);
vertex(245,240);
vertex(265,240);
vertex(265,285);
vertex(285,285);
vertex(285,325);
vertex(220,325);
vertex(220,305);
vertex(175,305);
vertex(175,325);
endShape();

//skin
fill(255,159,28);

rect(115,85,20,45);
rect(155,240,20,20);
rect(225,240,20,20);

beginShape();
vertex(65,305);
vertex(65,240);
vertex(115,240);
vertex(115,260);
vertex(135,260);
vertex(135,285);
vertex(115,285);
vertex(115,305);
endShape();

beginShape();
vertex(285,240);
vertex(330,240);
vertex(330,305);
vertex(285,305);
vertex(285,285);
vertex(265,285);
vertex(265,260);
vertex(285,260);
endShape();

beginShape();
vertex(135,175);
vertex(135,130);
vertex(175,130);
vertex(175,105);
vertex(155,105);
vertex(155,85);
vertex(175,85);
vertex(175,65);
vertex(220,65);
vertex(220,105);
vertex(245,105);
vertex(245,130);
vertex(220,130);
vertex(220,150);
vertex(285,150);
vertex(285,175);
endShape();

beginShape();
vertex(245,105);
vertex(245,65);
vertex(265,65);
vertex(265,85);
vertex(310,85);
vertex(310,105);
vertex(330,105);
vertex(330,130);
vertex(265,130);
vertex(265,105);
endShape();

