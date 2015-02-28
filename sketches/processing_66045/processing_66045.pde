
size(271, 300);

background(255, 255, 255);

noStroke();
fill(203, 29, 4); //red
rectMode(CORNER);
rect(0, 0, 16, 68);

beginShape(); //red box
vertex(0, 160);
vertex(19, 160);
vertex(19, 180);
vertex(0, 180);
endShape(CLOSE);

fill(29, 71, 171); //first blue box
beginShape();
vertex(78, 0);
vertex(110, 0);
vertex(110, 31);
vertex(78, 31);
endShape(CLOSE);

fill(249, 191, 9); //yellow box
beginShape();
vertex(78, 108);
vertex(110, 108);
vertex(110, 181);
vertex(78, 181);
endShape(CLOSE);

noStroke();
fill(203, 29, 4); //red
beginShape();
vertex(220, 135);
vertex(265, 135);
vertex(265, 160);
vertex(220, 160);
endShape(CLOSE);

noStroke();
fill(29, 71, 171); //blue
beginShape();
vertex(225, 290);
vertex(315, 290);
vertex(315, 360);
vertex(225, 360);
endShape(CLOSE);

stroke(0);
strokeWeight(7);
line(19, 0, 19, 180);
line(0, 31, 258, 31);
line(78, 0, 78, 300);
line(19, 108, 258, 108);
line(0, 180, 300, 180);
line(110, 0, 110, 180);
line(177, 0, 177, 300);
line(187, 0, 187, 300);
line(200, 0, 200, 290);
line(222, 0, 222, 300);
line(263, 0, 263, 180);
line(78, 290, 300, 290);
line(178, 232, 300, 232);



