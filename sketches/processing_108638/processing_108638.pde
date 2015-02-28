
//color pallette: Let it Fall

size (600,600);
background(148,118,92);

noStroke();

//backhair
fill(41,32,23);
ellipse(300,200,375,375);
quad(112,200,488,200,498,600,112,600);
triangle(165,70,90,200,112,500);
strokeWeight(200);
stroke(41,32,23);
line(210,388,150,525);
line(300,300,460,525);

//face
noStroke();
fill(123,91,76);
rect(300,300,100,600);
fill(192,125,99);

beginShape();
vertex(135,200);
vertex(130,400);
vertex(280,500);
vertex(425,400);
vertex(450,425);
vertex(520,350);
//vertex(499,300);
vertex(500,250);
vertex(425,275);
vertex(200,120);
endShape(CLOSE);
/*
noFill();
beginShape();
curveVertex(135,200);
curveVertex(130,400);
curveVertex(280,500);
curveVertex(425,400);
curveVertex(450,425);
curveVertex(520,350);
//vertex(499,300);
curveVertex(500,250);
curveVertex(425,275);
curveVertex(200,120);
endShape(CLOSE);
stroke(28,13,8);
strokeWeight(100);
line(250,120,420,215);
*/

//eyes
smooth();
fill(0,0,0);
arc(190,285,100,100,0,PI);

smooth();
fill(0,0,0);
arc(340,285,100,100,0,PI);

smooth();
fill(255,255,255);
arc(190,280,100,100,0,PI);

smooth();
fill(255,255,255);
arc(340,280,100,100,0,PI);

smooth();
fill(0,0,0);
arc(360,280,25,25,0,PI);

smooth();
fill(0,0,0);
arc(210,280,25,25,0,PI);

//eyebrows
strokeWeight(4);
stroke(41,32,23);
line(140,240,240,240);
line(300,240,400,240);

//nose
noStroke();
fill(123,91,76);
triangle(275,275,275,375,250,375);

//mouth
smooth();
fill(178,79,77);
arc(280,420,65,65,0,PI);



