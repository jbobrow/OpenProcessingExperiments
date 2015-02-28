
//Sarah Anderson, seanders
//EMS hw4 Face

size(400,400);

//background
noStroke();
fill(20);
rect(0,350,400,50);
fill(32);
rect(0,300,400,50);
fill(64);
rect(0,250,400,50);
fill(96);
rect(0,200,400,50);
fill(128);
rect(0,150,400,50);
fill(160);
rect(0,100,400,50);
fill(192);
rect(0,50,400,50);
fill(225);
rect(0,0,400,50);

//upper body
noStroke();
fill(0);
strokeJoin(ROUND);
beginShape();
vertex(150,290);
vertex(250,290);
vertex(250,310);
vertex(260,330);
vertex(300,340);
vertex(360,350);
vertex(400,400);
vertex(0,400);
vertex(40,350);
vertex(100,340);
vertex(140,330);
vertex(150,310);
endShape(CLOSE);

//head
fill(255);
ellipse(200,150,220,220);
quad(90,150,310,150, 260,280,140,280);
quad(140,280,260,280, 230, 310, 170,310);

//lips
fill(255,0,0);
triangle(180,270,220,270,200,280);
triangle(180,270,190,260,200,270);
triangle(200,270,210,260,220,270);

//lip line
stroke(0);
line(180,270,220,270);

//upper eyelid
fill(0,150);
stroke(0);
strokeWeight(4);
arc(250,170,60,60,PI,2*PI);
arc(150,170,60,60,PI,2*PI);

//lower eyelid
stroke(0);
beginShape();
curveVertex(110,160);
curveVertex(120,170);
curveVertex(130,180);
curveVertex(150,190);
curveVertex(170,180);
curveVertex(180,170);
curveVertex(190,160);
endShape();


beginShape();
curveVertex(210,160);
curveVertex(220,170);
curveVertex(230,180);
curveVertex(250,190);
curveVertex(270,180);
curveVertex(280,170);
curveVertex(290,160);
endShape();

//irises
noStroke();
fill(0,0,255,150);
ellipse(150,170,40,40);
ellipse(250,170,40,40);

//pupils
fill(0,200);
ellipse(150,170,20,20);
ellipse(250,170,20,20);

//nose
noFill();
stroke(0);
strokeWeight(4);
beginShape();
vertex(180,230);
vertex(180,240);
vertex(220,240);
vertex(220,230);
endShape();

//cheeks&chin;
fill(0,0,60,100);
noStroke();
triangle(120,220,160,240,140,280);
triangle(280,220,240,240,260,280);
triangle(170,310,200,290,230,310);
