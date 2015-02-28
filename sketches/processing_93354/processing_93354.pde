
background(255,127,182);
size(300,300);
smooth();
strokeWeight(2);
strokeJoin(ROUND);

//ear
fill(159,80,0);
arc(105,30,20,20,120,360);
arc(195,30,20,20,180,420);

// head
fill(159,80,0);
beginShape();
vertex(105,30);
vertex(195,30);
vertex(210,60);
vertex(195,90);
vertex(105,90);
vertex(90,60);
endShape(CLOSE);

//eyes
fill(0);
ellipse(126,48,9,9);
ellipse(174,48,9,9);

//mouth area
fill(255,205,127);
beginShape();
vertex(132,54);
vertex(168,54);
vertex(180,69);
vertex(168,84);
vertex(132,84);
vertex(120,69);
endShape(CLOSE);

//nose
fill(0);
triangle(144,63,156,63,150,69);
line(150,69,150,75);
line(150,75,144,81);
line(150,75,156,81);

//body
fill(159,80,0);
beginShape();
vertex(105,90);
vertex(195,90);
vertex(210,180);
vertex(150,210);
vertex(90,180);
endShape(CLOSE);

//arms
quad(105,90,99,126,60,141,60,120);
rect(45,120,15,21);
quad(195,90,240,120,240,141,201,126);
rect(240,120,15,21);

//left leg
beginShape();
vertex(90,180);
vertex(138,204);
vertex(135,285);
vertex(81,285);
vertex(75,261);
vertex(105,255);
endShape(CLOSE);
line(105,255,135,285);

//belly
fill(255,205,127);
beginShape();
vertex(120,105);
vertex(180,105);
vertex(195,165);
vertex(150,195);
vertex(105,165);
endShape(CLOSE);

//right leg
fill(159,80,0);
beginShape();
vertex(210,180);
vertex(195,255);
vertex(225,261);
vertex(219,285);
vertex(165,285);
vertex(162,204);
endShape(CLOSE);
line(165,285,195,255);

