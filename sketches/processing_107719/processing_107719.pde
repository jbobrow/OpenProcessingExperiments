
//Lauren Hartman
//lmhartma@andrew.cmu.edu
//© Lauren Hartman, August 2013

//composition
size(400, 400);

//color
background(48, 140, 200);

//circle_1
fill(255, 255, 255, 50);
stroke(255);
ellipse(180,200,280,280);

//circle_2
fill(255, 255, 255, 50);
stroke(255);
ellipse(200,180,280,280);

//circle_3
fill(255, 255, 255, 50);
stroke(255);
ellipse(220,200,280,280);

//circle_4//
fill(255, 255, 255, 50);
stroke(255);
ellipse(200,220,280,280);

//l
strokeWeight(3);
line(132, 160, 136, 160);
strokeWeight(3);
line(138, 160, 138, 220);
noFill();
strokeWeight(3);
arc(148, 220, 20, 20, HALF_PI, PI);

//m
strokeWeight(3);
line(162, 190, 166, 190);
strokeWeight(3);
line(168, 190, 168, 230);
strokeWeight(3);
line(192, 200, 192, 230);
arc(180, 206, 24, 24, -PI, 0);
arc(204, 206, 24, 24, -PI, 0);
strokeWeight(3);
line(216, 206, 216, 230);

//h
strokeWeight(3);
line(227, 160, 231, 160);
strokeWeight(3);
line(233, 160, 233, 230);
arc(247, 206, 27, 27, -PI, 0);
strokeWeight(3);
line(260, 206, 260, 224);
noFill();
strokeWeight(3);
arc(267, 225, 14, 14, HALF_PI, PI);

//saveFrame("hw1.jpg");
