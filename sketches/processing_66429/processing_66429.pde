
size(400,400);
background(255,250,231);
smooth();
line(70,0,190,400);
//draw an curve
smooth();
fill(231,90,34);
strokeWeight(1);
stroke(0);

beginShape();
curveVertex(120,120);
curveVertex(100,100);
curveVertex(50,200);
curveVertex(80,250);
curveVertex(130,200);
curveVertex(110,180);
vertex(100,100);
endShape();

//draw second curve
smooth();
fill(0);
strokeWeight(1);
stroke(0);

beginShape();
curveVertex(120,120);
curveVertex(100,100);
curveVertex(150,60);
curveVertex(200,50);
curveVertex(210,60);
curveVertex(180,100);
curveVertex(180,110);
endShape();

//draw an eye
fill(129,200,104);//green eye
strokeWeight(4);
beginShape();
curveVertex(110,80);
curveVertex(110,90);
curveVertex(160,50);
curveVertex(200,40);
curveVertex(210,45);
endShape();
fill(129,200,104);//green eye
strokeWeight(1);
beginShape();
curveVertex(205,43);
curveVertex(195,41.5);
curveVertex(180,60);
curveVertex(160,80);
curveVertex(110,90);
curveVertex(110,90);
endShape();
smooth();
strokeWeight(5);
fill(255,255,255);
ellipse(170,60,30,30);
strokeWeight(1);
fill(231,90,34);
ellipse(170,60,20,20);
fill(0);
ellipse(170,60,10,10);

//ball1
smooth();
fill(0);
arc(250,300,35,30,0,PI);
fill(231,90,34);
arc(250,300,35,30,PI,TWO_PI);
//ball2
smooth();
fill(0);
arc(200,250,15,28,0,PI);
fill(231,90,34);
arc(200,250,15,28,PI,TWO_PI);
ellipse(50,380,15,10);
ellipse(350,80,15,10);

//*1
line(150,130,180,160);
line(180,130,150,160);
line(165,130,165,190);
line(150,145,180,145);
//line2
line(220,180,250,210);
line(250,180,220,210);
line(235,180,235,220);
line(220,195,245,195);

