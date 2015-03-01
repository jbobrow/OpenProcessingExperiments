
size(600,400);
background(113,74,10);
fill(255,246,229);
rect(0,0,600,250);
stroke(0);
strokeWeight(2);
line(0,250,600,250);


//mantell
fill(240,239,237);
stroke(167,167,167);
strokeWeight(1.5);
ellipse(300,300,500,80);

//poma
fill(54,162,60);
stroke(10,100,38);
beginShape();
curveVertex(110,260);
curveVertex(110,260);
curveVertex(140,300);
curveVertex(180,300);
curveVertex(210,260);
curveVertex(210,260);
endShape();
fill(54,162,60);
beginShape();
curveVertex(110,260);
curveVertex(110,260);
curveVertex(125,210);
curveVertex(195,210);
curveVertex(210,260);
curveVertex(210,260);
endShape();
noFill();
stroke(75,50,3);
strokeWeight(2.5);
curve(160,217,160,217,165,197,210,210);

//taronja
stroke(211,113,15);
fill(234,131,33);
ellipse(460,260,100,100);
fill(2,85,41);
stroke(2,52,25);
strokeWeight(1);
ellipse(460,225,5,5);

//elipse recipient
fill(157,156,156);
stroke(0,0,0);
strokeWeight(2);
ellipse(300,200,250,25);

//platan
fill(250,244,43);
stroke(0);
strokeWeight(1.5);
beginShape();
vertex(330, 170);
bezierVertex(380, 150, 380, 225, 330, 225);
bezierVertex(350, 230, 360, 175, 330, 170);
endShape();

//platan2
beginShape();
vertex(350, 160);
bezierVertex(400, 140, 400, 215, 350, 215);
bezierVertex(370, 220, 380, 165, 350, 160);
endShape();

//piña
fill(155,117,14);
stroke(0);
ellipse(230,185,70,110);
noFill();
stroke(0);
strokeWeight(0.5);
line(230,130,230,235);
line(220,133,220,235);
line(240,133,240,235);
line(210,141,210,200);
line(250,141,250,235);
line(200,158,200,200);
line(260,158,260,235);
fill(0,126,22);
stroke(2,85,16);
strokeWeight(1.5);
triangle(230,100,220,140,240,140);
triangle(210,105,220,140,240,140);
triangle(200,115,220,140,240,140);
triangle(250,105,220,140,240,140);
triangle(260,115,220,140,240,140);

//recipient
fill(157,156,156);
stroke(0);
strokeWeight(2);
triangle(300,200,260,320,340,320);
beginShape();
curveVertex(175,200);
curveVertex(175,200);
curveVertex(302,290);
curveVertex(425,200);
curveVertex(425,200);
endShape();


stroke(0);
strokeWeight(2);
line(175,200,425,200);


//raïm
noFill();
stroke(121,88,27);
strokeWeight(2);
curve(297,185,297,185,310,170,360,210);
stroke(0);
strokeWeight(1);
fill(88,27,121);
ellipse(315,190,17,20);
ellipse(300,192,16,19);
ellipse(285,191,17,20);
ellipse(300,200,17,19);
ellipse(315,205,17,20);
ellipse(290,205,17,20);
ellipse(280,200,17,19);
ellipse(300,215,17,19);
ellipse(300,225,17,20);
ellipse(317,214,16,18);
ellipse(313,220,17,19);
ellipse(275,215,17,19);
ellipse(277,222,17,19);
ellipse(286,224,16,19);
ellipse(287,232,17,19);

