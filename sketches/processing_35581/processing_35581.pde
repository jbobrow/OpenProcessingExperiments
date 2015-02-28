
size(500,500);
background(255);
smooth();

float x,y;
x=1;
y=1;
fill(0);
ellipse(235,395,45*x,35*y);
ellipse(265,395,45*x,35*y);
noFill();
arc(200,300,150*x,300*y,5*PI/3,13*PI/6);
fill(255);
ellipse(250,400,50*x,50*y);


line(235,420,220,450);
line(265,420,280,450);

 //eybrows
fill(0);
rect(100,250,100,25);
rect(300,250,100,25);

//hat
arc(250,200,350*x,350*y,PI,2*PI);
rect(25,200,450,25);

//flower
noFill();
stroke(0);
strokeWeight(3);
beginShape();
curveVertex(435,220);
curveVertex(425,200);
curveVertex(435,185);
curveVertex(445,170);
curveVertex(455,165);
curveVertex(465,160);
endShape();

strokeWeight(1);
fill(0);
ellipse(455,165,10,10);
fill(255);
ellipse(445,165,10,10);
ellipse(465,165,10,10);
ellipse(450,155,10,10);
ellipse(450,175,10,10);
ellipse(460,155,10,10);
ellipse(460,175,10,10);

//jowls
quad(220,450,280,450,265,465,235,465);
noFill();
beginShape();
curveVertex(90,175);
curveVertex(75,200);
curveVertex(90,300);
curveVertex(120,400);
curveVertex(183,437);
curveVertex(220,450);
//curveVertex(240,450);
endShape();
beginShape();
curveVertex(410,175);
curveVertex(425,200);
curveVertex(410,300);
curveVertex(380,400);
curveVertex(317,437);
curveVertex(280,450);
//curveVertex(260,450);
endShape();

//glasses
strokeWeight(3);
ellipse(150,310,60,60);
ellipse(350,310,60,60);

//mouth
noFill();
strokeWeight(1);
arc(250,400,150,150,PI/6,5*PI/6);

//eyes
triangle(185,300,185,320,200,310);
triangle(315,300,315,320,300,310);
triangle(115,300,115,320,100,310);
triangle(385,300,385,320,400,310);
fill(0);
ellipse(150,310,20,20);
ellipse(350,310,20,20);

//ears
noFill();
beginShape();
curveVertex(100,320);
curveVertex(90,300);
curveVertex(80,280);
curveVertex(75,290);
curveVertex(85,350);
curveVertex(95,375);
curveVertex(100,380);
curveVertex(110,375);
curveVertex(130,350);
endShape();
beginShape();
curveVertex(400,320);
curveVertex(410,300);
curveVertex(420,280);
curveVertex(425,290);
curveVertex(415,350);
curveVertex(405,375);
curveVertex(400,380);
curveVertex(390,375);
curveVertex(370,350);
endShape();

