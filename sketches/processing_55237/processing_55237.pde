
size(320, 320);
background(255);
smooth();

//body
fill(255, 228, 188);
rect(120, 160, 60, 40);

fill(35, 191, 203);
rect(130, 160, 5, 40);
rect(165, 160, 5, 40);

//ears
fill(255, 228, 188);
triangle(160, 70, 215, 60, 200, 110);
triangle(140, 70, 97, 45, 100, 110);

//antennae
fill(245, 147, 0);
line(215, 60, 230, 50);
line(97, 45, 90, 30);

ellipse(235, 47, 10, 10);
ellipse(88, 25, 10, 10);

//face
fill(245, 147, 0);
ellipse(150, 120, 100, 100);

//eyes
fill(255);
ellipse(130, 120, 30, 30);
ellipse(165, 120, 40, 40);

fill(35, 191, 203);
ellipse(130, 120, 8, 8);
ellipse(165, 120, 8, 8);

//nose
fill(255);
ellipse(145, 140, 10, 5);

//whiskers
line(120, 145, 80, 155);
line(125, 150, 90, 170);
line(180, 145, 220, 155);
line(175, 150, 210, 170);

//bottom
//fill(45, 110, 120);
fill(35, 191, 203);
rect(147, 230, 6, 30);
arc(150, 201, 60, 60, 0, PI);

beginShape();
vertex(130, 260);
vertex(170, 260);
vertex(170, 270);
vertex(165, 270);
vertex(165, 265);
vertex(135, 265);
vertex(135, 270);
vertex(130, 270);
endShape(CLOSE);

//wheels
fill(15, 70, 80);
ellipse(132, 280, 20, 20);
ellipse(168, 280, 20, 20);
fill(255);
ellipse(132, 280, 10, 10);
ellipse(168, 280, 10, 10);

