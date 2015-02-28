
size(400,450);
background(255);

/*cap blau*/
strokeWeight(3);
fill(60,145,230);
ellipse(200,130,280,240);

/*cap blanc*/
fill(255);
ellipse(200,140,210,180);

/*boca*/
fill(245,173,173);
ellipse(200,140,130,120);

noStroke();
fill(255);
rect(130,78,140,62);

fill(0);
stroke(3);
line(135,140,265,140);
fill(0);
line(203,115,203,140);

/*ulls*/
fill(255);
stroke(3);
ellipse(175,60,55,65);
ellipse(230,60,55,65);
fill(0);
ellipse(190,70,5,6);
ellipse(215,70,5,6);


/*bigotis*/
line(130,95,170,100);
line(127,110,170,110);
line(130,125,170,120);

line(233,100,270,95);
line(233,110,273,110);
line(233,120,270,125);

/*nas*/
fill(255,0,0);
ellipse(203,100,25,25);
noStroke();
fill(255);
ellipse(200,95,7,7);

/*braç esq*/
stroke(0);
fill(60,145,230);
beginShape();
vertex(100,225);
vertex(40,300);
vertex(50,320);
vertex(100,270);
endShape();

fill(255);
ellipse(45,310,35,35);

/*braç dret*/
fill(60,145,230);
beginShape();
vertex(300,225);
vertex(350,300);
vertex(340,320);
vertex(300,270);
endShape();

fill(255);
ellipse(345,310,35,35);

/*recangle blau baix*/
noStroke();
fill(60,145,230);
rect(100,225,200,175);
stroke(0);
strokeWeight(3);
line(100,250,100,400);
line(300,250,300,400);
line(100,400,300,400);

/*peu esq*/
fill(255);
beginShape();
curveVertex(100,400);
curveVertex(100,400);
curveVertex(90,410);
curveVertex(90,430);
curveVertex(100,440);
curveVertex(100,440);
endShape();

/*mig peus*/
line(100,440,300,440);
beginShape();
curveVertex(200,400);
curveVertex(200,400);
curveVertex(190,410);
curveVertex(190,430);
curveVertex(200,440);
curveVertex(200,440);
endShape();
line(200,400,200,380);

/*peu dreta*/
beginShape();
curveVertex(300,400);
curveVertex(300,400);
curveVertex(310,410);
curveVertex(310,430);
curveVertex(300,440);
curveVertex(300,440);
endShape();

/*bossa panxa*/
stroke(3);
fill(255);
ellipse(200,280,140,130);

noStroke();
fill(60,145,230);
rect(125,220,150,60);

fill(0);
stroke(3);
line(130,280,270,280);

/*rectangle vermell*/
stroke(3);
fill(255,0,0);
rect(100,215,200,10);

/*escallarin*/
fill(255,255,0);
ellipse(200,235,30,30);
ellipse(200,240,10,10);




