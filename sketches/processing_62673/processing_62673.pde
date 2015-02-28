
size(600,600);
smooth();
noStroke();
background(255);

//base
fill(1);
ellipse(300,300,400,500);

//right eye
fill(255);
ellipse(170,230,15,15);
ellipse(200,230,15,15);
ellipse(230,230,15,15);

ellipse(200,260,20,20);
strokeWeight(2);
stroke(1);
line(180,260,230,260);

//left eye
ellipse(430,230,15,15);
ellipse(400,230,15,15);
ellipse(370,230,15,15);

ellipse(400,260,20,20);
strokeWeight(2);
stroke(1);
line(370,260,430,260);

//nose
quad(290,280,310,280,310,350,290,350);
beginShape(LINES);
stroke(255);
strokeWeight(3);
vertex(270, 280);
vertex(270, 350);
vertex(330, 280);
vertex(330, 350);
endShape();

ellipse(270,300,10,10);
ellipse(330,300,10,10);
ellipse(270,350,10,10);
ellipse(330,350,10,10);

//cheeks
quad(170,300,230,300,230,320,170,320);
quad(430,300,370,300,370,320,430,320);

//mouth
strokeWeight(2);
stroke(255);
line(200,400,400,400);

