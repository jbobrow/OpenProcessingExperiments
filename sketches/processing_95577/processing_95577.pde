
background(0,35,121);
size(500,500);
noStroke();
fill(0,0,255);
ellipse(250,220,350,350);
fill(255,0,0);

noStroke();
beginShape(POLYGON);
vertex(150,150);
vertex(350,150);
vertex(400,200);
vertex(250,350);
vertex(100,200);
endShape( );

stroke(255,0,0);
fill(255,0,0);
beginShape();
curveVertex(150,150);
curveVertex(150,150);
curveVertex(250,140);
curveVertex(350,150);
curveVertex(350,150);
endShape();



fill(255,196,0);
beginShape(POLYGON);
vertex(335,165);
vertex(335,175);
vertex(320,165);
endShape();


fill(255,0,0);
noStroke();
beginShape();
curveVertex(335,175);
curveVertex(335,175);
curveVertex(325,170);
curveVertex(320,165);
curveVertex(320,165);
endShape();

fill(255,196,0);
beginShape(POLYGON);
vertex(355,175);
vertex(380,200);
vertex(325,255);
vertex(190,212);
vertex(180,195);
vertex(250,170);
vertex(325,205);
vertex(355,205);
endShape();

noStroke();
beginShape();
vertex(325,205);
bezierVertex(250,115,140,231,180,195);
endShape();

ellipse(190,202,20,20);

fill(255,0,0);
beginShape();
vertex(180,212);
vertex(180,212);
vertex(204,216);
vertex(270,210);
vertex(325,235);
vertex(325,265);
vertex(325,265);
vertex(335,255);
vertex(250,265);
endShape();

fill(255,196,0);
beginShape();
vertex(120,200);
vertex(155,165);
vertex(165,165);
//s'ha fet amb rectes perquè el javascript donava problemes amb les corves
vertex(165,165);
vertex(142,185);
vertex(135,215);

endShape();

beginShape();
vertex(170,250);
vertex(240,250);

vertex(240,250);
vertex(265,260);
vertex(280,275);
vertex(235,290);
vertex(200,270);

vertex(190,270);
endShape();

beginShape();
vertex(250,330);
vertex(265,315);
vertex(265,315);
vertex(265,315);
vertex(250,320);
vertex(235,315);
vertex(235,315);
endShape();











