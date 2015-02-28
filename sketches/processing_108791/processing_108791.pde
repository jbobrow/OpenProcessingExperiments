
//Copyright William Aldrich, September 5 2013, Pittsburgh, PA

size(400,400);
background(255,0,0);

noStroke();
fill(240,196,121);
ellipse(100,190,30,40);
ellipse(300,190,30,40);

stroke(0);
strokeWeight(2);
line(90,170,120,180);
line(310,170,280,180);

noStroke();
fill(240,196,121);
ellipse(200,200,200,170);

stroke(0);
strokeWeight(2);
line(90,170,310,170);

noFill();
beginShape();
curveVertex(125,165);
curveVertex(130,170);
curveVertex(140,200);
curveVertex(180,200);
curveVertex(190,170);
curveVertex(195,165);
endShape();

beginShape();
curveVertex(275,165);
curveVertex(270,170);
curveVertex(260,200);
curveVertex(220,200);
curveVertex(210,170);
curveVertex(205,165);
endShape();

stroke(130);
line(155,105,175,140);
line(175,140,200,105);
line(200,105,225,140);
line(225,140,245,105);

fill(255);
noStroke();
ellipse(160,185,30,20);
ellipse(240,185,30,20);

fill(120,255,120);
stroke(0);
strokeWeight(2);
ellipse(160,185,10,10);
ellipse(240,185,10,10);

noStroke();
fill(130);
beginShape();
curveVertex(155,245);
curveVertex(160,240);
curveVertex(180,220);
curveVertex(200,210);
curveVertex(220,220);
curveVertex(240,240);
curveVertex(245,245);
endShape();

fill(240,196,121);
stroke(0);
strokeWeight(1);
beginShape();
curveVertex(175,200);
curveVertex(180,205);
curveVertex(190,215);
curveVertex(210,215);
curveVertex(220,205);
curveVertex(225,200);
endShape();


