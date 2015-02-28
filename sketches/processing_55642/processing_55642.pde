
size(800, 480);
smooth();
strokeWeight(2);
background(120, 20, 115);

stroke(0);
line(254, 257, 254, 162);
line(264, 257, 264, 162);
line(274, 257, 274, 162);

line(250, 155, 193, 225); // left arm
line(270, 155, 334, 225); // right arm

line(245, 370, 245, 260); // leg
line(280, 370, 280, 260); // leg

noStroke();
fill(240, 195, 237);
arc(234, 375, 33, 33, 3.14259, 3.14259*2); // foot
fill(240, 195, 237);
arc(294, 375, 33, 33, 3.14259, 3.14259*2); // foot
fill(37, 0, 255);
rect(234, 210, 60, 60); // main body
fill(102);
rect(230, 235, 67, 10); // grey rectangle
fill(240, 195, 237);
ellipse(264, 240, 45, 45); // ball

fill(240, 195, 237);
ellipse(265, 95, 40, 40); // little head on the top
fill(37, 0, 255);
ellipse(264, 155, 100, 100); // head
fill(240, 208, 160);
ellipse(264, 155, 80, 80); // face
fill(0);
rect(215, 130, 40, 6); // left eyebrows
fill(0);
rect(274, 130, 40, 6); // right eyebrows
fill(0);
ellipse(288, 150, 15, 15); // right eye
fill(255);
ellipse(286, 147, 7, 7); // right eye 1
fill(0);
ellipse(240, 150, 15, 15); // left eye
fill(255);
ellipse(238, 147, 7, 7); // left eye 1
fill(240, 195, 237);
ellipse(200, 220, 20, 20); // left hand
fill(240, 195, 237);
ellipse(330, 220, 20, 20); // right hand


